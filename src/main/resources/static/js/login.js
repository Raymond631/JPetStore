function newVerification() {
    let image = document.getElementById("verificationCode");
    image.src = "../User/verificationCode?" + new Date().getMilliseconds();
}
