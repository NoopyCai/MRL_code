function() {
    //點擊時更新 customerID
    var customerID = updateCustomerIDfromEditForm();
    if (!customerID) {
        customerID = updateCustomerIDfromList();
        if(!customerID){
            return null;
        }
        return customerID;
    }else{
        return customerID;
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
    function updateCustomerIDfromEditForm() {
        var editFormElem = document.querySelector('#edit_form');
        if (!editFormElem) return;

        var orderConfig = editFormElem.getAttribute('data-order-config');
        var orderConfigObj = JSON.parse(orderConfig);
        var customerID = orderConfigObj.customer_id;

        return customerID;
    }
}