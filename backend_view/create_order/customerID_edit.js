function() {
    //  取得 customerID
    var customerID = updateCustomerIDfromEditOfEditForm() || updateCustomerIDfromInfo() || updateCustomerIDfromList() || updateCustomerIDfromCreateOfEditForm();
    if (!customerID) {
        return null;
    }else{
        return customerID;
    }

    //更新 customerID from edit form
    function updateCustomerIDfromEditOfEditForm() {
        var editFormElem = document.querySelector('#order_items_edit_form');
        if (!editFormElem) return;

        var orderConfig = editFormElem.getAttribute('data-order-config');
        var orderConfigObj = JSON.parse(orderConfig);
        var customerID = orderConfigObj.customer_id;

        return customerID;
    }

    //更新 customerID from Info
    function updateCustomerIDfromInfo() {
        var accountEditElem = document.querySelector('.order-account-information-table tbody tr:first-child td > a');
        if (!accountEditElem) return;

        var accountEditLink = accountEditElem.href;
        var customerIDMatch = accountEditLink.match(/\/id\/(\d+)\//);
        if (customerIDMatch) {
            var customerID = customerIDMatch[1];

            return customerID;
        } else {
            return null;
        }
    }

    //更新 customerID from list
    function updateCustomerIDfromList() {
        var emailInput = document.querySelector('#email');
        var userEmailOnList = document.querySelectorAll('#sales_order_create_customer_grid_table tbody .col-email')
        var matchCustomerIdWithEmail = null;

        userEmailOnList.forEach(function (email) {
            if (email.innerText === emailInput.value) {
                matchCustomerIdWithEmail = email.closest('tr').querySelector('[data-column="entity_id"]');
            }
        });

        if (!matchCustomerIdWithEmail) return;
        return matchCustomerIdWithEmail.innerText;
    }

    //更新 customerID from edit form
    function updateCustomerIDfromCreateOfEditForm() {
        var editFormElem = document.querySelector('#edit_form');
        if (!editFormElem) return;

        var orderConfig = editFormElem.getAttribute('data-order-config');
        var orderConfigObj = JSON.parse(orderConfig);
        var customerID = orderConfigObj.customer_id;

        return customerID;
    }
}
