<?php
/**
 * MageWorx OrderEditor 模組
 * 用於訂單測試的管理員界面區塊
 */
namespace MageWorx\OrderEditor\Block\Adminhtml\Test;

use Magento\Backend\Block\Template;
use Magento\Framework\Api\SearchCriteriaBuilder;
use Magento\Framework\Api\SortOrderBuilder;
use Magento\Framework\Serialize\Serializer\Json as Serializer;
use Magento\Sales\Api\Data\OrderInterface;
use Magento\Framework\Api\SortOrder;
use Magento\Sales\Api\OrderRepositoryInterface;
use Magento\Framework\Data\Form\FormKey;
use Magento\Framework\App\ResourceConnection;
use Magento\Framework\DB\Select;

/**
 * 訂單測試頁面區塊類
 * 提供獲取訂單數據和處理相關參數的功能
 */
class Index extends Template
{
    /**
     * @var OrderRepositoryInterface
     * 訂單儲存庫接口，用於獲取訂單數據
     */
    protected $orderRepository;

    /**
     * @var SearchCriteriaBuilder
     * 搜尋條件生成器，用於構建訂單篩選條件
     */
    protected $searchCriteriaBuilder;

    /**
     * @var SortOrderBuilder
     * 排序生成器，用於設置訂單排序方式
     */
    protected $sortOrderBuilder;

    /**
     * @var FormKey
     * 表單金鑰，用於CSRF保護
     */
    protected $formKey;

    /**
     * @var Serializer
     * JSON序列化工具，用於將訂單數據轉換為JSON格式
     */
    protected $serializer;

    /**
     * @var ResourceConnection
     * 資源連接，用於直接進行SQL查詢
     */
    protected $resourceConnection;

    /**
     * @var array
     * 儲存處理後的訂單數據
     */
    protected $ordersData;

    /**
     * @var array
     * 緩存查詢結果，避免重複查詢
     */
    protected $cachedOrdersData = [];

    /**
     * 構造函數
     * 
     * @param Template\Context $context
     * @param OrderRepositoryInterface $orderRepository
     * @param SearchCriteriaBuilder $searchCriteriaBuilder
     * @param FormKey $formKey
     * @param Serializer $serializer
     * @param SortOrderBuilder $sortOrderBuilder
     * @param ResourceConnection $resourceConnection
     * @param array $data
     */
    public function __construct(
        Template\Context $context,
        OrderRepositoryInterface $orderRepository,
        SearchCriteriaBuilder $searchCriteriaBuilder,
        FormKey $formKey,
        Serializer $serializer,
        SortOrderBuilder $sortOrderBuilder,
        ResourceConnection $resourceConnection,
        array $data = []
    ) {
        parent::__construct($context, $data);
        $this->orderRepository = $orderRepository;
        $this->searchCriteriaBuilder = $searchCriteriaBuilder;
        $this->sortOrderBuilder = $sortOrderBuilder;
        $this->formKey = $formKey;
        $this->serializer = $serializer;
        $this->resourceConnection = $resourceConnection;
    }

    /**
     * 獲取表單金鑰
     * 用於CSRF保護
     * 
     * @return string 表單金鑰
     */
    public function getFormKey()
    {
        return $this->formKey->getFormKey();
    }

    /**
     * 獲取訂單數據
     * 根據請求參數過濾訂單並序列化為JSON格式
     * 使用SQL查詢直接從數據庫獲取訂單數據
     * 實現緩存機制避免重複查詢
     * 
     * @param int $page 頁碼，默認為1
     * @param int $pageSize 每頁數量，默認為無限制
     * @return string JSON格式的訂單數據
     */
    public function getOrders($page = null, $pageSize = null)
    {
        if (!empty($this->_request->getParam('start_at')) && !empty($this->_request->getParam('end_at'))) {
            $page = $page ?? $this->_request->getParam('page', 1);
            $pageSize = $pageSize ?? PHP_INT_MAX;
            
            $cacheKey = md5(
                $this->_request->getParam('start_at') .
                $this->_request->getParam('end_at') .
                ($this->_request->getParam('status') ?? '') .
                json_encode($this->getOrderLabels()) .
                $page . 
                $pageSize
            );
            
            // 檢查緩存中是否已有數據
            if (isset($this->cachedOrdersData[$cacheKey])) {
                $this->ordersData = $this->cachedOrdersData[$cacheKey];
                return $this->serializer->serialize($this->ordersData);
            }
            
            // 獲取數據庫連接
            $connection = $this->resourceConnection->getConnection();
            
            // 訂單表名
            $orderTable = $this->resourceConnection->getTableName('sales_order');
            $orderItemTable = $this->resourceConnection->getTableName('sales_order_item');
            
            // 構建訂單查詢
            $select = $connection->select()
                ->from(['main_table' => $orderTable])
                ->where('created_at >= ?', $this->_request->getParam('start_at') . ' 00:00:00')
                ->where('created_at <= ?', $this->_request->getParam('end_at') . ' 23:59:59')
                ->order('entity_id ASC');
            
            $orderLabels = $this->getOrderLabels();
            
            // 如果有指定狀態，則添加狀態過濾條件
            if (!empty($this->_request->getParam('status'))) {
                $statuses = explode(',', $this->_request->getParam('status'));
                $select->where('status IN (?)', $statuses);
            }
            
            $select->limitPage($page, $pageSize);
            
            // 獲取訂單總數的查詢
            $countSelect = clone $select;
            $countSelect->reset(Select::COLUMNS)
                ->reset(Select::LIMIT_COUNT)
                ->reset(Select::LIMIT_OFFSET)
                ->columns('COUNT(DISTINCT main_table.entity_id)');
            
            // 執行查詢
            $orders = $connection->fetchAll($select);
            $totalCount = $connection->fetchOne($countSelect);
            
            if (empty($orders)) {
                $this->ordersData = ['items' => [], 'total_count' => 0, 'current_page' => (int)$page, 'page_size' => (int)$pageSize, 'total_pages' => 0];
                return $this->serializer->serialize($this->ordersData);
            }
            
            // 批量獲取訂單項目，減少數據庫查詢次數
            $orderIds = array_column($orders, 'entity_id');
            $itemsSelect = $connection->select()
                ->from($orderItemTable)
                ->where('order_id IN (?)', $orderIds);
            
            $orderItems = $connection->fetchAll($itemsSelect);
            
            $itemsByOrderId = [];
            foreach ($orderItems as $item) {
                $itemsByOrderId[$item['order_id']][] = $item;
            }
            
            $orderLabelsByOrderId = [];

            try {
                $sql = "SELECT parent_id, order_labels FROM amasty_order_attribute_grid_flat WHERE parent_id IN (" . implode(',', $orderIds) . ")";
                $attributes = $connection->fetchAll($sql);
                foreach ($attributes as $attribute) {
                    if (isset($attribute['parent_id']) && isset($attribute['order_labels'])) {
                        $orderId = $attribute['parent_id'];
                        $labelsValue = $attribute['order_labels'];
                        $orderLabelsByOrderId[$orderId] = array_map('trim', explode(',', $labelsValue));
                    }
                }
            } catch (\Exception $e) {
                // 查詢失敗時繼續執行
            }
            
            $result = [];
            // 處理每個訂單並提取所需數據
            foreach ($orders as $order) {
                $orderId = $order['entity_id'];
                $includeOrder = true;
                
                if (!empty($orderLabels) && !empty($orderLabelsByOrderId)) {
                    $orderLabelsArray = $orderLabelsByOrderId[$orderId] ?? [];
                    
                    // 檢查是否匹配使用者選擇的標籤 - 匹配則過濾掉
                    if (!empty($orderLabelsArray)) {
                        $hasMatchingLabel = false;
                        foreach ($orderLabels as $requestedLabel) {
                            $requestedLabelStr = (string)$requestedLabel;
                            
                            foreach ($orderLabelsArray as $orderLabel) {
                                $orderLabelStr = (string)$orderLabel;
                                
                                if ($requestedLabelStr === $orderLabelStr || (int)$requestedLabelStr === (int)$orderLabelStr) {
                                    $hasMatchingLabel = true;
                                    break 2; 
                                }
                            }
                        }
                        
                        if ($hasMatchingLabel) {
                            $includeOrder = false;
                        }
                    }
                }
                
                if (!$includeOrder) {
                    continue;
                }
                
                $items = $itemsByOrderId[$orderId] ?? [];
                
                $_params = [
                    'order_id' => $orderId,
                    'order_number' => $order['increment_id'],
                    'order_grand_total' => $order['grand_total'],
                    'order_shipping_incl_tax' => $order['shipping_incl_tax'],
                    'store_id' => $order['store_id'],
                    'customer_id' => $order['customer_id'],
                    'coupon_code' => $order['coupon_code'] ? explode(',', $order['coupon_code']) : [],
                    'order_applied_rule_ids' => $order['applied_rule_ids'],
                    'item' => []
                ];
                
                // 處理訂單中的每個商品項目
                foreach ($items as $item) {
                    // 跳過子項目，減少處理量
                    if (!empty($item['parent_item_id'])) {
                        continue; 
                    }
                    
                    $_key = $item['item_id'];
                    $_params['item'][$_key] = [
                        'item_id' => $_key,
                        'item_type' => 'order',
                        'product_sku' => $item['sku'],
                        'product_id' => $item['product_id'],
                        'product_type' => $item['product_type'],
                        'price' => $item['price'],
                        'price_incl_tax' => $item['price_incl_tax'],
                        'fact_qty' => $item['qty_ordered'],
                        'subtotal' => $item['row_total'],
                        'subtotal_incl_tax' => $item['row_total_incl_tax'],
                        'tax_amount' => $item['tax_amount'],
                        'tax_percent' => $item['tax_percent'],
                        'discount_amount' => $item['discount_amount'],
                        'discount_percent' => $item['discount_percent'],
                        'row_total' => $item['row_total'],
                        // 保留可能在計算中需要的字段
                        'discount_tax_compensation_amount' => $item['discount_tax_compensation_amount'],
                        'weee_tax_applied_row_amount' => $item['weee_tax_applied_row_amount'],
                        'from_date_1' => $item['from_date_1'] ?? null,
                        'to_date_2' => $item['to_date_2'] ?? null,
                        'free_text' => $item['free_text'] ?? null,
                        're_calc' => 1,
                        'action' => null,
                    ];
                }
                $result[] = $_params;
            }
            
            $this->ordersData = [
                'items' => $result,
                'total_count' => count($result), // 更新為過濾後的實際數量
                'current_page' => (int)$page,
                'page_size' => (int)$pageSize,
                'total_pages' => ceil(count($result) / $pageSize)
            ];
            
            // 將結果保存到緩存
            $this->cachedOrdersData[$cacheKey] = $this->ordersData;
            
            return $this->serializer->serialize($this->ordersData);
        }

        $this->ordersData = ['items' => [], 'total_count' => 0, 'current_page' => 1, 'page_size' => 20, 'total_pages' => 0];
        return $this->serializer->serialize($this->ordersData);
    }

    /**
     * 獲取處理後的訂單數據
     * 用於在模板中顯示訂單信息
     * 
     * @return array 訂單數據陣列
     */
    public function getOrdersData()
    {
        return $this->ordersData['items'] ?? [];
    }

    /**
     * 獲取訂單總數
     * 
     * @return int 訂單總數
     */
    public function getOrdersTotalCount()
    {
        return $this->ordersData['total_count'] ?? 0;
    }

    /**
     * 獲取當前頁碼
     * 
     * @return int 當前頁碼
     */
    public function getCurrentPage()
    {
        return $this->ordersData['current_page'] ?? 1;
    }

    /**
     * 獲取每頁數量
     * 
     * @return int 每頁數量
     */
    public function getPageSize()
    {
        return $this->ordersData['page_size'] ?? 20;
    }

    /**
     * 獲取總頁數
     * 
     * @return int 總頁數
     */
    public function getTotalPages()
    {
        return $this->ordersData['total_pages'] ?? 0;
    }

    /**
     * 獲取加載更多訂單的URL
     * 
     * @return string URL
     */
    public function getLoadMoreUrl()
    {
        return $this->_urlBuilder->getUrl('ordereditor/ajax/orders');
    }

    /**
     * 獲取表單提交URL
     * 用於重新計算訂單金額
     * 
     * @return string 表單提交URL
     */
    public function getFormUrl()
    {
        return $this->_urlBuilder->getUrl('ordereditor/form/reCalculation');
    }

    /**
     * 獲取開始訂單編號
     * 從請求參數中獲取
     * 
     * @return string|null 開始訂單編號
     */
    public function getStartNumber()
    {
        return $this->_request->getParam('start');
    }

    /**
     * 獲取結束訂單編號
     * 從請求參數中獲取
     * 
     * @return string|null 結束訂單編號
     */
    public function getEndNumber()
    {
        return $this->_request->getParam('end');
    }

    /**
     * 獲取開始日期
     * 從請求參數中獲取
     * 
     * @return string|null 開始日期
     */
    public function getStartDate()
    {
        return $this->_request->getParam('start_at');
    }

    /**
     * 獲取結束日期
     * 從請求參數中獲取
     * 
     * @return string|null 結束日期
     */
    public function getEndDate()
    {
        return $this->_request->getParam('end_at');
    }

    /**
     * 獲取訂單狀態
     * 從請求參數中獲取，如果未指定則默認為'processing,complete'
     * 
     * @return string 訂單狀態
     */
    public function getStatus()
    {
        return $this->_request->getParam('status') ?? 'processing,complete';
    }

    /**
     * 獲取訂單標籤
     * 從請求參數中獲取選擇的訂單標籤
     * 
     * @return array 訂單標籤數組
     */
    public function getOrderLabels()
    {
        $labels = $this->_request->getParam('order_labels');
        
        if (!is_array($labels)) {
            $getAllParams = $this->_request->getParams();
            if (isset($getAllParams['order_labels']) && is_array($getAllParams['order_labels'])) {
                $labels = $getAllParams['order_labels'];
            } else {
                $labels = [];
            }
        }
        
        return $labels;
    }
}
