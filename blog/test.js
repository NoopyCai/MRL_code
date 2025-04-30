function(){
    if({{Click Element}}.matches('.outbounceLink')){
        if({{Click Element}}.alt){
            return {{Click Element}}.alt;
        }else{
            return {{Click Element}}.innerText;
        }
    }
  }