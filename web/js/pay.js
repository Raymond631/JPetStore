//打开弹窗
var button = document.getElementById("pay");
button.onclick = function () {
    var modal = document.querySelector(".modal");
    modal.style.display = "block";
    WhichPay();
}

//支付成功
var determine = document.querySelector(".determine");
determine.onclick = function () {
    document.getElementById("PayForm").submit();
}

//取消支付
var cancel = document.querySelector(".cancel");
cancel.onclick = function () {
    var modal = document.querySelector(".modal");
    modal.style.display = "none";
}

function WhichPay() {
    var myselect = document.getElementById("Payment");
    var index = myselect.selectedIndex; // selectedIndex代表的是你所选中项的index
    var name = myselect.options[index].value;
    if (name == "Alipay") {
        document.getElementById('Pic').src = "../images/Alipay.jpg";
    } else {
        document.getElementById('Pic').src = "../images/WeChatPay.png";
    }
}