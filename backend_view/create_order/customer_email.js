function() {
   //取得email
   var emailInput = document.querySelector('#email');
   if(emailInput){
    var email = emailInput.value;
    return email;
   }else{
    return null;
   }
}