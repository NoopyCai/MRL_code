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
     * @var array
     * 儲存處理後的訂單數據
     */
    protected $ordersData;

    /**
     * 構造函數
     * 
     * @param Template\Context 
     * @param OrderRepositoryInterface
     * @param SearchCriteriaBuilder 
     * @param FormKey 
     * @param Serializer 
     * @param SortOrderBuilder 
     * @param array 
     */
    public function __construct(
        Template\Context $context,
        OrderRepositoryInterface $orderRepository,
        SearchCriteriaBuilder $searchCriteriaBuilder,
        FormKey $formKey,
        Serializer $serializer,
        SortOrderBuilder $sortOrderBuilder,
        array $data = []
    ) {
        parent::__construct($context, $data);
        $this->orderRepository = $orderRepository;
        $this->searchCriteriaBuilder = $searchCriteriaBuilder;
        $this->sortOrderBuilder = $sortOrderBuilder;
        $this->formKey = $formKey;
        $this->serializer = $serializer;
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
     * 批次載入以減少前端載入時間
     * 
     * @param int $page 頁碼，默認為1
     * @param int $pageSize 每頁數量，默認為100
     * @return string JSON格式的訂單數據
     */
    public function getOrders($page = null, $pageSize = null)
    {
        // 如果指定了開始和結束日期，則進行訂單篩選
        if (!empty($this->_request->getParam('start_at')) && !empty($this->_request->getParam('end_at'))) {
            // 獲取請求中的分頁參數，如果沒有則使用默認值
            $page = $page ?? $this->_request->getParam('page', 1);
            $pageSize = $pageSize ?? 100; // 固定每頁載入100筆
            
            // 設置必要的字段過濾
            $this->searchCriteriaBuilder->addFilter('created_at', $this->_request->getParam('start_at') . ' 00:00:00', 'from');
            $this->searchCriteriaBuilder->addFilter('created_at', $this->_request->getParam('end_at') . ' 23:59:59', 'to');
            
            if (!empty($this->_request->getParam('status'))) {
                $this->searchCriteriaBuilder->addFilter('status', $this->_request->getParam('status'), 'in');
            }
            
            // 設置分頁和排序
            $this->searchCriteriaBuilder->setPageSize($pageSize);
            $this->searchCriteriaBuilder->setCurrentPage($page);
            $this->searchCriteriaBuilder->setSortOrders([
                $this->sortOrderBuilder->setField(OrderInterface::ENTITY_ID)->setDirection(SortOrder::SORT_ASC)->create()
            ]);
            
            // 獲取訂單集合
            $searchCriteria = $this->searchCriteriaBuilder->create();
            $orders = $this->orderRepository->getList($searchCriteria);

            // 獲取訂單總數，用於前端分頁
            $totalCount = $orders->getTotalCount();
            
            $result = [];
            // 處理每個訂單並提取所需數據
            foreach ($orders->getItems() as $order) {
                $_params = [
                    'order_id' => $order->getData('entity_id'),
                    'order_number' => $order->getData('increment_id'),
                    'order_grand_total' => $order->getData('grand_total'),
                    'order_shipping_incl_tax' => $order->getData('shipping_incl_tax'),
                    'store_id' => $order->getData('store_id'),
                    'customer_id' => $order->getData('customer_id'),
                    'coupon_code' => $order->getData('coupon_code') ? explode(',', $order->getData('coupon_code')) : [],
                    'order_applied_rule_ids' => $order->getData('applied_rule_ids'),
                    'item' => []
                ];
                
                // 處理訂單中的每個商品項目，跳過子項目
                foreach ($order->getItems() as $item) {
                    // 跳過子項目，減少處理量
                    if ($item->getParentItemId()) {
                        continue; 
                    }
                    
                    $_key = $item->getData('item_id');
                    $_params['item'][$_key] = [
                        'item_id' => $_key,
                        'item_type' => 'order',
                        'product_sku' => $item->getData('sku'),
                        'product_id' => $item->getData('product_id'),
                        'product_type' => $item->getData('product_type'),
                        'price' => $item->getData('price'),
                        'price_incl_tax' => $item->getData('price_incl_tax'),
                        'fact_qty' => $item->getData('qty_ordered'),
                        'subtotal' => $item->getData('row_total'),
                        'subtotal_incl_tax' => $item->getData('row_total_incl_tax'),
                        'tax_amount' => $item->getData('tax_amount'),
                        'tax_percent' => $item->getData('tax_percent'),
                        'discount_amount' => $item->getData('discount_amount'),
                        'discount_percent' => $item->getData('discount_percent'),
                        'row_total' => $item->getData('row_total'),
                        // 保留可能在計算中需要的字段
                        'discount_tax_compensation_amount' => $item->getData('discount_tax_compensation_amount'),
                        'weee_tax_applied_row_amount' => $item->getData('weee_tax_applied_row_amount'),
                        'from_date_1' => $item->getData('from_date_1'),
                        'to_date_2' => $item->getData('to_date_2'),
                        'free_text' => $item->getData('free_text'),
                        're_calc' => 1,  // 標記需要重新計算
                        'action' => null,
                    ];
                }
                $result[] = $_params;
            }
            
            // 添加分頁信息到返回結果
            $this->ordersData = [
                'items' => $result,
                'total_count' => $totalCount,
                'current_page' => (int)$page,
                'page_size' => (int)$pageSize,
                'total_pages' => ceil($totalCount / $pageSize)
            ];
            
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
}
