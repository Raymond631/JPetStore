function newVerification() {
    let image = document.getElementById("verificationCode");
    image.src = "/jpetstore/verificationCode?" + new Date().getMilliseconds();
}
