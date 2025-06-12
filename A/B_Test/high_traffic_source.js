function(){
    var nantuTests = localStorage.getItem('nantu_tests');
    if(nantuTests){
        if(nantuTests.includes('[1:v1]')){
            return 'High Traffic';
        }else if(nantuTests.includes('[1:v2]')){
            return 'High Sales';
        }
    }else{
        return 'Not in Test';
    }
}
