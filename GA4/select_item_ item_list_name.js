function() {
    if ({{js - pagetype}} === 'category-page') {
        return {{dom - category name}};
    } else {
        var parentElement = {{Click Element}}.closest('.ga-parent-item-list');
        if (parentElement) {
            return parentElement.getAttribute('data-ga-item-list-name')
        } else {
            var selectItemElement = {{Click Element}}.closest('.select-item');
            if (selectItemElement) {
                return selectItemElement.getAttribute('data-ga-item-list-name');
            } else {
                return null;
            }
        }
    }
}