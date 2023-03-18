$(document).ready(function () {
    getDetails();
})

// var adr_num = 0;
// var adr_index = 0;
// var pay_index = 0;

function getDetails() {
    let orderID = getQueryVariable("orderID");
    $.ajax({
        url: "../Order/getDetails?orderID=" + orderID,
        type: "get",
        dataType: "json",
        success: function (data) {
            let str = '' +
                '' +
                '';
            $(".address_box").eq(0).html(str);

            let payMethod = '';
            $("#payMethod").after(payMethod);
            $("#cost").html();

            let items = data.cartItemList;
            let str2 = "";
            for (let i = 0; i < items.length; i++) {
                let item_cost = items[i].listPrice * items[i].quantity;
                str2 += '' +
                    '' +
                    '' +
                    '' +
                    '';
            }
            $("#order_item").html(str2);
        }
    });
}

function getQueryVariable(variable) {
    var query = window.location.search.substring(1);
    var vars = query.split("&");
    for (var i = 0; i < vars.length; i++) {
        var pair = vars[i].split("=");
        if (pair[0] == variable) {
            return pair[1];
        }
    }
    return false;
}