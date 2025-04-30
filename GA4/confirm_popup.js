function() {
    var popupContent = document.querySelector('.old-customer-popup p');
    if(popupContent.innerText.includes('請先登入')){
        return '老客戶限定請先登入';
    }else if(popupContent.innerText.includes('此帳戶無法選購')){
        return '此帳戶無法選購';
    }
  }
  