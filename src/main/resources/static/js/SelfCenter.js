function newVerification() {
    let image = document.getElementById("verificationCode");
    image.src = "../User/verificationCode?" + new Date().getMilliseconds();
}

$(function () {
    $('#password_old').on('blur', function () {
        let pwd = {
            password: $(this).val()
        }
        $.ajax({
            type: 'post',
            url: '../User/checkPassword',
            data: JSON.stringify(pwd),
            success: function (data) {
                document.getElementById("name_repeat").textContent = data;
            }
        })
    })
});