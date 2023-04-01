$(document).ready(function () {
    getAddress();
    getData();
})

let pay_index = 0;
let cartList = [];

function getAddress() {
    $.ajax({
        url: "/jpetstore/user/info",
        type: "get",
        dataType: "json",
        success: function (res) {
            let data = res.data;
            let str = '<p class="order_box_p"><label for="receiver_name">姓名</label><input type="text" id="receiver_name" name="receiver_name" value="' + data.receiverName + '" disabled></p>' +
                '<p class="order_box_p"><label for="receiver_tel">联系方式</label><input type="tel" id="receiver_tel" name="receiver_tel" value="' + data.receiverPhone + '" disabled></p>' +
                '<p class="order_box_p"><label for="receiver_adr">收货地址</label><input type="text" id="receiver_adr" name="receiver_adr" value="' + data.receiverAddress + '" disabled></p>';
            $("#address_box").html(str);
            chooseAddress();
            choosePay();
        }
    });
}

function getData() {
    let data = JSON.parse(sessionStorage.getItem("cart_data"))
    console.log(data)
    cartList = data.cartList;
    $("#cost").html(data.cost)
    let str = "";
    for (let i = 0; i < cartList.length; i++) {
        str += `<div class="order_line order_line_bordtr">
                    <div class="order_lien_in">
                        <img class="order_price_tv" style="height: 40px;margin-right: 100px" src="/jpetstore/image/look/${cartList[i].productImage}" alt="">
                    </div>
                    <div class="order_lien_in">
                        <p class="order_price" style="margin-top: 20px;width: 300px">${cartList[i].productNameChinese}/${cartList[i].itemSpecification}</p>
                    </div>
                    <div class="order_lien_in">
                        <p class="order_price_1" style="margin-top: 20px">${cartList[i].itemPrice} x ${cartList[i].quantity}</p>
                    </div>
                </div>`;
    }
    $("#order_item").html(str);
}


function chooseAddress() {
    let address_box = $("#address_box");

    //双击修改、新增
    address_box.dblclick(function () {
        address_box.find("input").each(function () {
            $(this).removeAttr("disabled")
        })

        //用if判断是为了防止多次点击后添加多个按钮
        if ($("#adr_save_div").length === 0) {
            let button_save = '<div class="pay" id="adr_save_div"><a href="javascript:save()" class="pay_a" id="adr_save" hidden>保存</a></div>'
            $("#adr_list").append(button_save)
        }
    })
}

function save() {
    $("#adr_list").find("input").each(function () {
        $(this).attr("disabled", true)
    })
    let input_set = $("#address_box").find("input");
    let data = {
        receiverName: input_set[0].value,
        receiverPhone: input_set[1].value,
        receiverAddress: input_set[2].value
    }
    if (data.receiverName != null && data.receiverName != "" && data.receiverPhone != null && data.receiverPhone != "" && data.receiverAddress != null && data.receiverAddress != "") {
        $.ajax({
            url: "/jpetstore/user/info",
            type: "put",
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: function (res) {
                let btn = $("#adr_save_div")
                btn.text(res.data)
                setTimeout(function () {
                    btn.remove();
                }, 1000)
            }
        });
    }
}

function choosePay() {
    let pay = $(".order_PStime");
    for (let i = 0; i < pay.length; i++) {
        pay.eq(0).css("border", "1px solid #ff6700")
        pay.eq(i).click(function () {
            pay.eq(i).css("border-color", "#ff6700")
            pay_index = i;
            for (let j = 0; j < pay.length; j++) {
                if (j !== i) {
                    pay.eq(j).css("border-color", "#e0e0e0")
                }
            }
        })
    }
}

function newOrder() {
    let input_set = $("#address_box").find("input");
    let data = {
        receiverName: input_set[0].value,
        receiverPhone: input_set[1].value,
        receiverAddress: input_set[2].value,
        cartList: cartList
    }
    switch (pay_index) {
        case 0:
            data.orderPayment = "微信支付";
            break;
        case 1:
            data.orderPayment = "支付宝";
            break;
        case 2:
            data.orderPayment = "货到付款";
            break;
    }
    console.log(data)


    if (data.receiverName != null && data.receiverName != "" && data.receiverPhone != null && data.receiverPhone != "" && data.receiverAddress != null && data.receiverAddress != "") {
        $.ajax({
            url: "/jpetstore/order",
            type: "post",
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: function (res) {
                if (res.code === 200) {
                    window.location.href = "/jpetstore/MyOrder.html"
                }
            }
        });
    } else {
        //地址为空
        let btn = $("#order_submit")
        btn.text("地址不能为空！")
        btn.css("background", "red")
        setTimeout(function () {
            let btn2 = $("#order_submit")
            btn2.text("结算")
            btn2.css("background", "#ff6700")
        }, 2000)
    }
}