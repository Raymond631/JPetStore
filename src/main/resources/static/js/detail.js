window.addEventListener('load', function () {
    isLogin();
    getDetails();
})

var productID;
var itemID_list = [];
let stock_list = [];
let price_list = [];
var index = 0;

function isLogin(){
    if(document.cookie.indexOf('token')===-1){
        $('#notLogin').show();
        $('#logined').hide();
        $('#userButton').hide();
    }else{
        $('#notLogin').hide();
        $('#logined').show();
        $('#userButton').show();
    }
}

function getDetails() {
    let productId = getQueryVariable("productId");
    $.ajax({
        url: "/jpetstore/pets/" + productId,
        type: "get",
        dataType: "json",
        success: function (res) {
            let data = res.data;
            productID=data.productId;
            $("#product_name_Chinese").html(data.productNameChinese);
            $("#product_name_English").html(data.productNameEnglish);
            $("#product_character").html(data.productCharacter);
            $("#product_ancestry").html(data.productAncestry);
            $("#product_disease").html(data.productDisease);
            $("#product_life").html(data.productLife);
            $("#product_introduce").html(data.productIntroduce);
            $("#petImage").attr("src", "/jpetstore/image/look/"+data.productImage);

            let itemList = data.petItemList;
            let str = "";
            for (let key in itemList) {
                str+=`<a class="list_item">${itemList[key].itemSpecification}</a><br>`
                itemID_list.push(itemList[key].itemId);
                stock_list.push(itemList[key].itemStock);
                price_list.push(itemList[key].itemPrice);
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
    let item_list = document.getElementsByClassName('list_item');
    for (let i = 0; i < item_list.length; i++) {
        item_list[0].classList.add("current");
        $("#pet_price").html(price_list[0]+"元");

        item_list[i].onclick = function () {
            item_list[i].classList.add("current");
            index = i;
            for (let j = 0; j < item_list.length; j++) {
                if (j !== i) {
                    item_list[j].classList.remove("current");
                }
            }
            $("#pet_price").html(price_list[i]+"元");
        }
    }
}

function num_up() {
    let num = Number($("#item_num").val());
    if (num + 1 <= stock_list[index]) {
        $("#item_num").val(num + 1);
        $("#pet_price").html(math.multiply(math.bignumber(price_list[index]),math.bignumber(num+1))+"元");
    } else {
        alert("您购买的商品超过了限制的数量");
    }
}

function num_down() {
    let num = Number($("#item_num").val());
    if (num - 1 > 0) {
        $("#item_num").val(num - 1);
        $("#pet_price").html(math.multiply(math.bignumber(price_list[index]),math.bignumber(num-1))+"元");
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
            productId:productID,
            itemId: itemID_list[index],
            quantity: num
        };
        $.ajax({
            url: "/jpetstore/cart",
            type: "post",
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: function (res) {
                $("#addToCart").after('<span id="msg">' + res.data + '</span>');
                $("#msg").fadeOut(3000);
            }
        });
    }
}