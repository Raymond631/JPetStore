$(document).ready(function () {
    getDetails();
})

var adr_num = 0;
var adr_index = 0;
var pay_index = 0;

function getDetails() {
    let orderID = getQueryVariable("orderID");
    $.ajax({
        url: "../Order/getDetails?orderID=" + orderID,
        type: "get",
        dataType: "json",
        success: function (data) {
            let str = '<p class="order_box_p"><label for="receiver_name">姓名</label><input type="text" id="receiver_name" name="receiver_name" value="' + data.receiver.receiverName + '" disabled></p>' +
                '<p class="order_box_p"><label for="receiver_tel">联系方式</label><input type="tel" id="receiver_tel" name="receiver_tel" value="' + data.receiver.phoneNumber + '" disabled></p>' +
                '<p class="order_box_p"><label for="receiver_adr">收货地址</label><input type="text" id="receiver_adr" name="receiver_adr" value="' + data.receiver.address + '" disabled></p>';
            $(".address_box").eq(0).html(str);

            let payMethod = '<p class="order_PStime">' + data.payMethod + '</p>';
            $("#payMethod").after(payMethod);
            $("#cost").html(data.totalPrice);

            let items = data.cartItemList;
            let str2 = "";
            for (let i = 0; i < items.length; i++) {
                let item_cost = items[i].listPrice * items[i].quantity;
                str2 += '<div class="order_line order_line_bordtr">' +
                    '<div class="order_lien_in"><img class="order_price_tv" style="height: 40px" src="' + items[i].img + '" alt=""><p class="order_price" style="margin-top: 20px;width: 635px">' + items[i].description + '</p></div>' +
                    '<div class="order_lien_in"><p class="order_price_1" style="margin-top: 20px">' + items[i].listPrice + ' x ' + items[i].quantity + '</p></div>' +
                    '<div class="order_price1"><p class="order_price_2" style="margin-top: 20px">' + item_cost + '</p></div>' +
                    '<div class="order_lien_in"></div>' + '</div>';
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