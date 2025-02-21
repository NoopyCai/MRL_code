const log = require('logToConsole');
const JSON = require('JSON');
const sendHttpRequest = require('sendHttpRequest');
const logToConsole = require('logToConsole');
const setResponseHeader = require('setResponseHeader');
const setResponseBody = require('setResponseBody');

// 設定 CORS (確保前端可以存取)
setResponseHeader('Access-Control-Allow-Origin', 'https://dev-static.mrliving.tw');
setResponseHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS');
setResponseHeader('Access-Control-Allow-Headers', 'Content-Type');
setResponseHeader('Content-Type', 'application/json');

// 取得查詢參數
// const requestBody = data.reqBody;
// const domain_ = requestBody.domain; 
// const customerID_ = requestBody.customerID;

const domain_ = 'https://dev-m2v243.mrliving.tw';
const customerID_ = '9716';
// https://dev-m2v243.mrliving.tw/rest/V1/amgcard/account/customer/9716

// 設定要請求的 API URL
const apiUrl = domain_ + '/rest/V1/amgcard/account/customer/' + customerID_;
// const token = 'zm7lhgnrummsdkbun9hy7uub0smyk14i';
// const token = '8yda5iij2lyjwxu57znp41ja2dwyriri';

// 設定 Fetch API 選項
const requestOptions = {
  method: 'GET',
  headers: {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer 8yda5iij2lyjwxu57znp41ja2dwyriri'
  },
  //   body: JSON.stringify({
  //     domain: domain_,
  //     customerID: customerID_
  //   })
};


const postBody = JSON.stringify({
  domain: domain_,
  customerID: customerID_
});

// 執行 API 請求
sendHttpRequest(apiUrl, (statusCode, responseHeaders, responseBody) => {
  logToConsole(JSON.stringify({
    'Name': 'JsonRequest',
    'Type': 'Response',
    'ResponseStatusCode': statusCode,
    'ResponseHeaders': responseHeaders,
    'ResponseBody': responseBody,
  }));

  if (statusCode >= 200 && statusCode < 300) {
    let responseData = null;
    
    // **GTM 不支援 try/catch，所以用條件判斷**
    if (typeof JSON.parse === 'function') {
      responseData = JSON.parse(responseBody);
    } else {
      logToConsole(JSON.stringify({ error: "JSON 解析錯誤", responseBody: responseBody }));
      setResponseBody(JSON.stringify({
        success: false,
        message: "API 回應格式錯誤",
        data: null
      }));
      data.gtmOnFailure();
      return;
    }

    // 成功回應
    setResponseBody(JSON.stringify({
      success: true,
      message: "資料獲取成功",
      data: responseData
    }));

    logToConsole(JSON.stringify(responseData));
    data.gtmOnSuccess();


  } else {
    logToConsole(JSON.stringify({
      error: "API 請求失敗",
      statusCode: statusCode,
      responseHeaders: responseHeaders,
      responseBody: responseBody
    }));

    // 回應錯誤資訊
    setResponseBody(JSON.stringify({
      success: false,
      message: 'API 請求失敗，HTTP 狀態碼: ' + statusCode,
      statusCode: statusCode,
      data: null
    }));

    data.gtmOnFailure();
  }
}, requestOptions);


//   // client side
  fetch('https://dev-static.mrliving.tw/g/collect', {
    method: 'GET',
    headers: {
      'Content-Type': 'application/json'
    },
    // body: JSON.stringify({
    // //   domain: 'http://dev-release-m2v243.mrliving.tw',
    //     domain: 'https://dev-m2v243.mrliving.tw/',
    //     customerID: '9716'
    // })
  })
    .then(response => response.json())
    .then(data => console.log('Response:', data))
    .catch(error => console.error('Error:', error));

    fetch('https://dev-static.mrliving.tw/ownedCodes', {
      method: 'POST',  // 也可以用 'GET'，但 POST 可以傳遞更複雜的數據
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        event_name: 'custom_event',
        client_id: '1234567890',  // 訪客識別碼
        user_id: 'user_001',  // 如果有登入系統
        parameters: {
          key1: 'value1',
          key2: 'value2'
        }
      })
    })
    .then(response => response.json())
    .then(data => console.log('SGTM Response:', data))
    .catch(error => console.error('SGTM Error:', error));
    