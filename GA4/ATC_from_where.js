function() {
    var clickElement = {{Click Element}};
    var lastClickText = {{dlv - lastClickText}};

    if (clickElement.matches('#CTA_Add2Cart') || clickElement.matches('cta-tocart')) {
      return '產品包裝CTA';
    }else if (clickElement.matches('.homecard-CTA-1')) {
      return '成家卡CTA-1';
    }else if (clickElement.matches('.homecard-CTA-2')) {
      return '成家卡CTA-2';
    }else if (clickElement.matches('.homecard-CTA-3')) {
      return '成家卡CTA-3';
    }else if (lastClickText === '立即購買') {
      return '立即購買';
    }else {
      return '加入購物車';
    }
  }