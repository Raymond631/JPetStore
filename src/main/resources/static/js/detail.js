window.addEventListener('load', function () {
    getDetails();
})

var itemID_list = [];
let stock_list = [];
let price_list = [];
var index = 0;

function getDetails() {
    //TODO 前端json-get标准格式
    let name = getQueryVariable("name");
    $.ajax({
        url: "../Pet/getDetails?name=" + name,
        type: "get",
        dataType: "json",
        success: function (data) {
            //TODO js修改标签属性、文本
            $("#pet_img").attr("src", data.img);
            $("#pet_name").html("（" + data.productID + "）" + data.name + "----------" + data.introduce);
            $("#pet_price").html("$" + data.itemList[0].listPrice);
            let itemList = data.itemList;
            let str = "";
            for (var key in itemList) {
                str += '<a class="item_list">' + "（" + itemList[key].itemID + "）" + itemList[key].description + '</a><br>'
                itemID_list.push(itemList[key].itemID);
                stock_list.push(itemList[key].stock);
                price_list.push(itemList[key].listPrice);
            }
            $("#pet_list").html(str);
            chooseItem();
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

function chooseItem() {
    let item_list = document.getElementsByClassName('item_list');
    for (let i = 0; i < item_list.length; i++) {
        item_list[0].classList.add("current");
        $("#pet_price").html("$" + price_list[i]);

        item_list[i].onclick = function () {
            item_list[i].classList.add("current");
            index = i;
            for (let j = 0; j < item_list.length; j++) {
                if (j !== i) {
                    item_list[j].classList.remove("current");
                }
            }
        }
    }
}

function num_up() {
    let num = Number($("#item_num").val());
    if (num + 1 <= stock_list[index]) {
        $("#item_num").val(num + 1);
    } else {
        alert("您购买的商品超过了限制的数量");
    }
}

function num_down() {
    let num = Number($("#item_num").val());
    if (num - 1 > 0) {
        $("#item_num").val(num - 1);
    } else {
        alert("不能再少了哦");
    }
}

function addToCart() {
    let num = Number($("#item_num").val());
    if (num <= 0) {
        alert("至少购买1件");
    } else if (num > stock_list[index]) {
        alert("您购买的商品超过了限制的数量");
    } else {
        let data = {
            itemID: itemID_list[index],
            quantity: num
        };
        $.ajax({
            url: "../Cart/addCartItem",
            type: "post",
            data: JSON.stringify(data),
            success: function (data) {
                $("#addToCart").after('<span id="msg">' + data + '</span>');
                $("#msg").fadeOut(3000);
            }
        });
    }
}