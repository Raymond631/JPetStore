$(document).ready(function () {
    getAddress();
    getData();
})

var adr_num = 0;
var adr_index = 0;
var pay_index = 0;

function getAddress() {
    $.ajax({
        url: "/jpetstore/Order/getAddress",
        type: "get",
        dataType: "json",
        success: function (data) {
            adr_num = data.length > 3 ? 3 : data.length;
            for (let i = 0; i < adr_num; i++) {
                let str = '<p class="order_box_p"><label for="receiver_name">姓名</label><input type="text" id="receiver_name" name="receiver_name" value="' + data[i].receiverName + '" disabled></p>' +
                    '<p class="order_box_p"><label for="receiver_tel">联系方式</label><input type="tel" id="receiver_tel" name="receiver_tel" value="' + data[i].receiverPhone + '" disabled></p>' +
                    '<p class="order_box_p"><label for="receiver_adr">收货地址</label><input type="text" id="receiver_adr" name="receiver_adr" value="' + data[i].receiverAddress + '" disabled></p>';
                //TODO class选择器取第几个（语法）
                $(".address_box").eq(i).html(str);
            }
            chooseAddress();
            choosePay();
        }
    });
}

function getData() {
    let data = JSON.parse(sessionStorage.getItem("cart_data"))
    console.log(data)
    let cart_info = data.cart_info;
    let item_index = data.item_index;
    $("#cost").html(data.cost)
    let str = "";
    for (let i = 0; i < item_index.length; i++) {
        str += `<div class="order_line order_line_bordtr">
                    <div class="order_lien_in">
                        <img class="order_price_tv" style="height: 40px" src="${cart_info[item_index[i]].petProduct.productImage}" alt="">
                        <p class="order_price" style="margin-top: 20px;width: 300px">${cart_info[item_index[i]].petProduct.productNameChinese}:${cart_info[item_index[i]].petItem.itemSpecification}</p>
                    </div>
                    <div class="order_lien_in">
                        <p class="order_price_1" style="margin-top: 20px">${cart_info[item_index[i]].petItem.itemPrice} x ${cart_info[item_index[i]].quantity}</p>
                    </div>
                </div>`;
    }
    $("#order_item").html(str);
}


function chooseAddress() {
    let address_box = $(".address_box");
    for (let i = 0; i < address_box.length; i++) {
        if (adr_num > 0 && i === 0) {
            address_box.eq(0).css("border", "1px solid #ff6700")
        } else {
            address_box.eq(i).css("border", "1px solid #e0e0e0")
        }

        address_box.eq(i).click(function () {
            address_box.eq(i).css("border-color", "#ff6700")
            //TODO 提交时判断是否大于number(还要判空)
            adr_index = i;
            for (let j = 0; j < address_box.length; j++) {
                if (j !== i) {
                    address_box.eq(j).css("border-color", "#e0e0e0")
                }
            }
        })

        //双击修改、新增
        address_box.eq(i).dblclick(function () {
            if (i >= adr_num) {
                let str = '<p class="order_box_p"><label for="receiver_name">姓名</label><input type="text" id="receiver_name" name="receiver_name"></p>' +
                    '<p class="order_box_p"><label for="receiver_tel">联系方式</label><input type="tel" id="receiver_tel" name="receiver_tel"></p>' +
                    '<p class="order_box_p"><label for="receiver_adr">收货地址</label><input type="text" id="receiver_adr" name="receiver_adr"></p>';
                $(this).html(str);
                adr_num++;
            } else {
                address_box.eq(i).find("input").each(function () {
                    $(this).removeAttr("disabled")
                })
            }
            if ($("#adr_save_div").length == 0) {
                let button_save = '<div class="pay" id="adr_save_div"><a href="javascript:save()" class="pay_a" id="adr_save" hidden>保存</a></div>'
                $("#adr_list").append(button_save)
            }
        })
    }
}

function save() {
    $("#adr_list").find("input").each(function () {
        $(this).attr("disabled", true)
    })
    let data = [];
    for (let i = 0; i < adr_num; i++) {
        let input_set = $(".address_box").eq(i).find("input");
        let adrs = {
            receiverName: input_set[0].value,
            receiverPhone: input_set[1].value,
            receiverAddress: input_set[2].value
        }
        if (adrs.receiverName != null && adrs.receiverName != "" && adrs.receiverPhone != null && adrs.receiverPhone != "" && adrs.receiverAddress != null && adrs.receiverAddress != "") {
            data.push(adrs)
        }
    }
    $.ajax({
        url: "/jpetstore/User/updateReceiver",
        type: "post",
        contentType: 'application/json',
        data: JSON.stringify(data),
        success: function () {
            let btn = $("#adr_save_div")
            btn.text("保存成功")
            setTimeout(function () {
                btn.remove();
            }, 1000)
        }
    });
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
    //商品信息后端直接从session获取
    let cart_data = JSON.parse(sessionStorage.getItem("cart_data"))
    if (adr_index < adr_num) {
        let input_set = $(".address_box").eq(adr_index).find("input");
        let data = {
            receiverName: input_set[0].value,
            receiverPhone: input_set[1].value,
            receiverAddress: input_set[2].value,
            orderCost: cart_data.cost,
            orderTime: getCurrentTime(),
            orderItemList: chooseItem(cart_data.cart_info, cart_data.item_index)
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
                url: "/jpetstore/Order/newOrder",
                type: "post",
                contentType: 'application/json',
                data: JSON.stringify(data),
                success: function () {
                    window.location.href = "/jpetstore/Order/MyOrder.html"
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
    } else {
        //选择了空地址
        let btn = $("#order_submit")
        btn.text("请先选择地址！")
        btn.css("background", "red")
        setTimeout(function () {
            let btn2 = $("#order_submit")
            btn2.text("结算")
            btn2.css("background", "#ff6700")
        }, 2000)
    }
}

function chooseItem(cart_info, item_index) {
    let orderItemList = [];
    for (let i = 0; i < item_index.length; i++) {
        let tempObj = {};
        tempObj.itemId = cart_info[item_index[i]].itemId;
        tempObj.productId = cart_info[item_index[i]].productId;
        tempObj.itemImage = cart_info[item_index[i]].petProduct.productImage;
        tempObj.productNameChinese = cart_info[item_index[i]].petProduct.productNameChinese;
        tempObj.itemSpecification = cart_info[item_index[i]].petItem.itemSpecification;
        tempObj.itemPrice = cart_info[item_index[i]].petItem.itemPrice;
        tempObj.itemQuantity = cart_info[item_index[i]].quantity;
        tempObj.whetherShip = '未发货';
        tempObj.supplier = cart_info[item_index[i]].petProduct.productSupplier;
        orderItemList.push(tempObj);
    }
    return orderItemList;
}

/**
 * 获取当前时间 格式：yyyy-MM-dd HH:MM:SS
 */
function getCurrentTime() {
    var date = new Date();//当前时间
    var month = zeroFill(date.getMonth() + 1);//月
    var day = zeroFill(date.getDate());//日
    var hour = zeroFill(date.getHours());//时
    var minute = zeroFill(date.getMinutes());//分
    var second = zeroFill(date.getSeconds());//秒

    //当前时间
    var curTime = date.getFullYear() + "-" + month + "-" + day
        + " " + hour + ":" + minute + ":" + second;

    return curTime;
}

/**
 * 补零
 */
function zeroFill(i) {
    if (i >= 0 && i <= 9) {
        return "0" + i;
    } else {
        return i;
    }
}