function check() {
    let result = true;
    var username = document.getElementById("username");
    let name = registerForm.username.value;
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
    let pass = registerForm.password.value;
    if (password.value.trim() == "") {
        var findNodes2 = document.getElementById("passwordNull");
        findNodes2.innerText = "密码不能为空";
        result = false;
    } else {
        document.getElementById("passwordNull").innerText = "";
        if (result)
            result = true;
    }

    var confirm = document.getElementById("confirm");
    let com = registerForm.password.value;
    if (confirm.value.trim() == "") {
        var findNodes3 = document.getElementById("confirmNull");
        findNodes3.innerText = "确认密码不能为空";
        result = false;
    } else {
        document.getElementById("confirmNull").innerText = "";
        if (password.value.trim() != "" && confirm.value != password.value) {
            document.getElementById("confirmNull").innerText = "两次输入不相同";
            result = false;
        } else if (password.value.trim() != "" && confirm.value == password.value) {
            if (result)
                result = true;
        } else {
            document.getElementById("confirmNull").innerText = "两次输入不相同";
            result = false;
        }
    }

    console.log(result);
    return result;
}

function newVerification() {
    let image = document.getElementById("verificationCode");
    image.src = "../User/verificationCode?" + new Date().getMilliseconds();
}

$(function () {
    $('#username').on('blur', function (e) {
        e.preventDefault();
        var FormData = $('#registerForm').serialize();
        console.log(FormData)
        $.ajax({
            type: 'POST',
            url: '../User/UsernameExist',
            data: FormData,
            success: function (data) {
                console.log(data);
                document.getElementById("nameNull").textContent = data;
            },
            error: function (error) {
                console.log("error" + error)
            }
        })
    })
});