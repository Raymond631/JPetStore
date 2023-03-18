$(document).ready(function () {
    getDetails();
})

var orderItemIdList = [];

function getDetails() {
    let orderId = getQueryVariable("orderId");
    $.ajax({
        url: "/jpetstore/Order/details?orderId=" + orderId,
        type: "get",
        dataType: "json",
        success: function (data) {
            $("#orderId").html(data.orderId)
            $("#payMethod").html(data.orderPayment);
            $("#cost").html(data.orderCost);

            let str = '<p class="order_box_p"><label for="receiver_name">姓名</label><input type="text" id="receiver_name" name="receiver_name" value="' + data.receiverName + '" disabled></p>' +
                '<p class="order_box_p"><label for="receiver_tel">联系方式</label><input type="tel" id="receiver_tel" name="receiver_tel" value="' + data.receiverPhone + '" disabled></p>' +
                '<p class="order_box_p"><label for="receiver_adr">收货地址</label><input type="text" id="receiver_adr" name="receiver_adr" value="' + data.receiverAddress + '" disabled></p>';
            $(".address_box").eq(0).html(str);

            let orderItem = data.orderItemList;
            let str2 = "";
            let temp = "";
            for (let i = 0; i < orderItem.length; i++) {
                orderItemIdList.push(orderItem[i].orderItemId);
                if(orderItem[i].whetherShip==='已发货'){
                    temp = `<button class="confirm_receipt">确认收货</button>`;
                }else{
                    temp = `<button class="confirm_receipt" hidden="hidden">确认收货</button>`;
                }
                str2 += `<div class="order_line order_line_bordtr">
                             <div class="order_lien_in">
                                <img class="order_price_tv" style="height: 40px" src="${orderItem[i].itemImage}" alt="">
                                <p class="order_price" style="margin-top: 20px;width: 300px">${orderItem[i].productNameChinese} : ${orderItem[i].itemSpecification}</p>
                             </div>
                             <div class="order_lien_in">
                                <p class="order_price_1" style="margin-top: 20px">${orderItem[i].itemPrice} x ${orderItem[i].itemQuantity}</p>
                             </div>
                             <div class="order_lien_in" style="width: 300px;margin-top: 20px">
                                <p class="order_price_1 orderStatus">${orderItem[i].whetherShip}</p>
                                ${temp}
                             </div>
                         </div>`;
            }
            $("#order_item").html(str2);
            confirmReceipt();
        }
    });
}

function confirmReceipt() {
    let buttons = document.getElementsByClassName("confirm_receipt");
    let orderStatus=document.getElementsByClassName("orderStatus");
    let length = buttons.length;
    for(let i = 0;i<length;i++){
        buttons[i].onclick=function () {
            $.ajax({
                url: "/jpetstore/Order/confirmReceipt",
                data: {
                    "orderItemId":orderItemIdList[i]
                },
                type: "put",
                success: function () {
                    orderStatus[i].innerHTML='已接收';
                    buttons[i].setAttribute("hidden","hidden");
                }
            })
        }
    }
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