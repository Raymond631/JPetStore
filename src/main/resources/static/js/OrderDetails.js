$(document).ready(function () {
    getDetails();
})

function getDetails() {
    let orderId = getQueryVariable("orderId");
    $.ajax({
        url: "/jpetstore/orders/" + orderId,
        type: "get",
        dataType: "json",
        success: function (res) {
            let data = res.data;
            $("#orderId").html(data.orderId)
            $("#payMethod").html(data.orderPayment);
            $("#cost").html(data.orderCost);
            $('#orderTime').html(data.orderTime);
            $('#supplierId').html(data.supplierId);

            let str = '<p class="order_box_p"><label for="receiver_name">姓名</label><input style="text-align: center" type="text" id="receiver_name" name="receiver_name" value="' + data.receiverName + '" disabled></p>' +
                '<p class="order_box_p"><label for="receiver_tel">联系方式</label><input style="text-align: center" type="tel" id="receiver_tel" name="receiver_tel" value="' + data.receiverPhone + '" disabled></p>' +
                '<p class="order_box_p"><label for="receiver_adr">收货地址</label><input style="text-align: center" type="text" id="receiver_adr" name="receiver_adr" value="' + data.receiverAddress + '" disabled></p>';
            $("#address_box").html(str);

            let orderItem = data.orderItemDOList;
            let str2 = "";
            for (let i = 0; i < orderItem.length; i++) {
                str2 += `<div class="order_line order_line_bordtr">
                             <div class="order_lien_in">
                                <img class="order_price_tv" style="height: 40px" src="/jpetstore/image/look/${orderItem[i].itemImage}" alt="">
                                <p class="order_price" style="margin-top: 20px;width: 300px">${orderItem[i].productNameChinese}/${orderItem[i].itemSpecification}</p>
                             </div>
                             <div class="order_lien_in">
                                <p class="order_price_1" style="margin-top: 20px">${orderItem[i].itemPrice} x ${orderItem[i].itemQuantity}</p>
                             </div>
                         </div>`;
            }
            $("#order_item").html(str2);
        }
    });
}

// 获取url参数
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