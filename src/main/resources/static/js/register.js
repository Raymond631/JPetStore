function newVerification() {
    let image = document.getElementById("verificationCode");
    image.src = "/jpetstore/verificationCode?" + new Date().getMilliseconds();
}

$(function () {
    $('#username').on('blur', function (e) {
        e.preventDefault();
        var FormData = $('#registerForm').serialize();
        $.ajax({
            type: 'POST',
            url: '../User/UsernameExist',
            data: FormData,
            success: function (data) {
                document.getElementById("name_repeat").textContent = data;
            }
        })
    })
});