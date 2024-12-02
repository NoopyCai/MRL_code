function() {
    var clickElement = {{Click Element}};
    var contentType = {{Click Element}}.getAttribute('ga-content-type') || clickElement.closest('[ga-content-type]').getAttribute('ga-content-type');
    return contentType;
}