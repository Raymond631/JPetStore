function check() {
    let result = true;
    var username = document.getElementById("username");
    let name = loginForm.username.value;
    if (username.value.trim() == "") {//没有输入用户名是显示提示
        var findNodes = document.getElementById("nameNull");
        findNodes.innerText = "用户名不能为空";
        result = false;
    } else {//输入了内容后清除节点内容
        document.getElementById("nameNull").textContent = "";
        if (result)
            result = true;
    }

    var password = document.getElementById("password");
    let pass = loginForm.password.value;
    if (password.value.trim() == "") {
        var findNodes2 = document.getElementById("passwordNull");
        findNodes2.innerText = "密码不能为空";
        result = false;
    } else {
        document.getElementById("passwordNull").innerText = "";
        if (result)
            result = true;
    }
    console.log(result);
    // return false;
    return result;
}

function newVerification() {
    let image = document.getElementById("verificationCode");
    image.src = "../User/verificationCode?" + new Date().getMilliseconds();
}