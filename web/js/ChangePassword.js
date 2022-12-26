// var button = document.getElementById("changePassword");
function Change() {
    var modal = document.querySelector(".modal");
    modal.style.display = "block";
}

function savePassword() {
    let originWrite = document.getElementById("origin").value;
    let originTrue = "${sessionScope.user.getPassword()}";
    let newPassword = document.getElementById("newPassword").value;
    let param = 'newPassword=' + newPassword;
    console.log(param);
    let confirmNewPassword = document.getElementById("confirmNewPassword").value;
    console.log(originWrite);
    console.log(originTrue);
    console.log(newPassword);
    console.log(confirmNewPassword);
    let originFalse = document.getElementById("originFalse");
    if (originWrite == originTrue) {
        originFalse.innerText = "";
        console.log("ok");
        if (newPassword == confirmNewPassword && newPassword != null) {
            console.log("ajax");
            const xhr = new XMLHttpRequest();
            //初始化，设置请求方法和url
            xhr.open("post", "../User/changePassword", true);
            xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            //发送
            xhr.send(param);
            console(cancel());
        } else {

        }
    } else {
        originFalse.innerText = "Password is wrong";
    }

}

function cancel() {
    var modal = document.querySelector(".modal");
    modal.style.display = "none";
}