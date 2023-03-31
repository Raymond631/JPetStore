function newVerification() {
    let image = document.getElementById("verificationCode");
    image.src = "/jpetstore/verificationCode?" + new Date().getMilliseconds();
}

function register(){

    let username = $('#username').val();
    let password = $('#pwd').val();
    let rePassword = $('#password_repeat').val();
    let code = $('#code').val();
    let id = getCookie('CaptchaCode');
    RemoveCookie('CaptchaCode');
    let settings = {
        "url": "/jpetstore/user",
        "method": "POST",
        "timeout": 0,
        "headers": {
            "Content-Type": "application/json"
        },
        "data": JSON.stringify({
            "username": username,
            "password": password,
            "rePassword": rePassword,
            "id": id,
            "code": code
        }),
    };

    $.ajax(settings).done(function (response) {

        if(response.code===200) {
            $('#errorMessage').text('');
            window.location.href="http://localhost:8080/jpetstore/Index.html"
        }
        else if(response.code=== 400){
            newVerification();
            $('#code').val('');
            $('#errorMessage').text(response.data);
            // window.location.href="http://localhost:8888/jpetstore/Login.html"
        }
    });
}

function getCookie(cname) {
    let name = cname + "=";
    let ca = document.cookie.split(";");
    for (let i = 0; i < ca.length; i++) {
        let c = ca[i].trim();
        if (c.indexOf(name) == 0) {
            return c.substring(name.length, c.length);
        }
    }
}

function RemoveCookie(cookieName) {
    let cookies = document.cookie.split(";");//将所有cookie键值对通过分号分割为数组
    //循环遍历所有cookie键值对
    for (let i = 0; i < cookies.length; i++) {
        //有些cookie键值对前面会莫名其妙产生一个空格，将空格去掉
        if (cookies[i].indexOf(" ") == 0) {
            cookies[i] = cookies[i].substring(1);
        }
        //比较每个cookie的名称，找到要删除的那个cookie键值对
        if (cookies[i].indexOf(cookieName) == 0) {
            let exp = new Date();//获取客户端本地当前系统时间
            exp.setTime(exp.getTime() - 60 * 1000);//将exp设置为客户端本地时间1分钟以前，将exp赋值给cookie作为过期时间后，就表示该cookie已经过期了, 那么浏览器就会将其立刻删除掉
            document.cookie = cookies[i] + ";expires=" + exp.toUTCString();//设置要删除的cookie的过期时间，即在该cookie的键值对后面再添加一个expires键值对，并将上面的exp赋给expires作为值(注意expires的值必须为UTC或者GMT时间，不能用本地时间），那么浏览器就会将该cookie立刻删除掉
            //注意document.cookie的用法很巧妙，在对其进行赋值的时候是设置单个cookie的信息，但是获取document.cookie的值的时候是返回所有cookie的信息
            break;//要删除的cookie已经在客户端被删除掉，跳出循环
        }
    }
}
