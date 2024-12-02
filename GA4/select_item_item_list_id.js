function() {
    if ({{js - pagetype}} === 'category-page') {
        return {{dom - category code}};
    } else {
        var parentElement = {{Click Element}}.closest('.ga-parent-item-list');
        if (parentElement) {
            return parentElement.getAttribute('data-ga-item-list-id')
        } else {
            var selectItemElement = {{Click Element}}.closest('.select-item');
            if (selectItemElement) {
                return selectItemElement.getAttribute('data-ga-item-list-id');
            } else {
                return null;
            }
        }
    }
}