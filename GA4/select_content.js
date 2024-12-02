function() {
    var contentTypes = {
        "designer": "好設計不將就",
        "inspireSpace": "空間佈置靈感"
    };

    var contentType = {{Click Element}}.getAttribute('ga-content-type');
    return contentTypes[contentType] || null;
}