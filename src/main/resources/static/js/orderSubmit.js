$(document).ready(function () {
    getAddress();
    getData();
})

var adr_num = 0;
var adr_index = 0;
var pay_index = 0;

function getAddress() {
    $.ajax({
        url: "../Order/getAddress",
        type: "get",
        dataType: "json",
        success: function (data) {
            adr_num = data.length > 3 ? 3 : data.length;
            for (let i = 0; i < adr_num; i++) {
                let str = '<p class="order_box_p"><label for="receiver_name">姓名</label><input type="text" id="receiver_name" name="receiver_name" value="' + data[i].receiverName + '" disabled></p>' +
                    '<p class="order_box_p"><label for="receiver_tel">联系方式</label><input type="tel" id="receiver_tel" name="receiver_tel" value="' + data[i].phoneNumber + '" disabled></p>' +
                    '<p class="order_box_p"><label for="receiver_adr">收货地址</label><input type="text" id="receiver_adr" name="receiver_adr" value="' + data[i].address + '" disabled></p>';
                //TODO class选择器取第几个（语法）
                $(".address_box").eq(i).html(str);
            }
            chooseAddress();
            choosePay();
        }
    });
}

function getData() {
    $.ajax({
        url: "../Order/getData",
        type: "get",
        dataType: "json",
        success: function (data) {
            let cart_info = data.cart_info;
            let item_index = data.item_index;
            $("#cost").html(data.cost)
            let str = "";
            for (let i = 0; i < item_index.length; i++) {
                let item_cost = cart_info[item_index[i]].proc * cart_info[item_index[i]].number;
                str += '<div class="order_line order_line_bordtr">' +
                    '<div class="order_lien_in"><img class="order_price_tv" style="height: 40px" src="' + cart_info[item_index[i]].img + '" alt=""><p class="order_price" style="margin-top: 20px;width: 635px">' + cart_info[item_index[i]].name + '</p></div>' +
                    '<div class="order_lien_in"><p class="order_price_1" style="margin-top: 20px">' + cart_info[item_index[i]].proc + ' x ' + cart_info[item_index[i]].number + '</p></div>' +
                    '<div class="order_price1"><p class="order_price_2" style="margin-top: 20px">' + item_cost + '</p></div>' +
                    '<div class="order_lien_in"></div>' + '</div>';
            }
            $("#order_item").html(str);
        }
    });
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
            name: input_set[0].value,
            tel: input_set[1].value,
            adr: input_set[2].value
        }
        if (adrs.name != null && adrs.name != "" && adrs.tel != null && adrs.tel != "" && adrs.adr != null && adrs.adr != "") {
            data.push(adrs)
        }
    }
    $.ajax({
        url: "../User/updateReceiver",
        type: "post",
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
    if (adr_index < adr_num) {
        let input_set = $(".address_box").eq(adr_index).find("input");
        let data = {
            name: input_set[0].value,
            tel: input_set[1].value,
            adr: input_set[2].value
        }
        switch (pay_index) {
            case 0:
                data.pay = "微信支付";
                break;
            case 1:
                data.pay = "支付宝";
                break;
            case 2:
                data.pay = "货到付款";
                break;
        }
        if (data.name != null && data.name != "" && data.tel != null && data.tel != "" && data.adr != null && data.adr != "") {
            $.ajax({
                url: "../Order/newOrder",
                type: "post",
                data: JSON.stringify(data),
                success: function () {
                    window.location.href = "../Order/showMyOrder"
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