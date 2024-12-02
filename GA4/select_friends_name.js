function() {
    var clickElement = {{Click Element}};
    var selectContentPara = {{Click Element}}.getAttribute('ga-click-text')|| clickElement.closest('[ga-click-text]').getAttribute('ga-click-text');
   
    return selectContentPara;
}
