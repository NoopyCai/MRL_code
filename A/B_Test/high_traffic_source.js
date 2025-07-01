function(){
    var nantuTests = localStorage.getItem('nantu_tests');
    var pathName = window.location.pathname;

    if(nantuTests){
        if(nantuTests.includes('1:v1') && pathName.includes('checkout/cart')){
            return 'High Traffic';
        }else if(nantuTests.includes('1:c') && pathName.includes('checkout/cart')){
            return 'High Sales';
        }else if(nantuTests.includes('2:c') && pathName === '/'){
            return '首頁_HS床寢_優惠版(限時加贈)';
        }else if(nantuTests.includes('2:v1') && pathName === '/'){
            return '首頁_HS床寢_人群版(親子推薦)';
        }
    }else{
        return 'Not in Test';
    }
}
