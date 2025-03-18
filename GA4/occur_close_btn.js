function() {
    var clickElement = {{Click Element}};
    if(clickElement.classList.contains('fancybox-close-small')){
        return '空間指南跳窗';
    }else{
        return '登入/註冊跳窗';
    }
}