function AccountCheck() {
    var whetherFull = true;
    var receiver = document.getElementById("receiverInfo");
    if (receiver.value.trim() == "") {//没有输入用户名是显示提示
        console.log("receiverIn");
        var findNodes = document.getElementById("receiverNull");
        findNodes.innerText = "Receiver can not be null";
        whetherFull = false;
    } else {//输入了内容后清除节点内容
        document.getElementById("receiverNull").textContent = "";
        if (whetherFull)
            whetherFull = true;
    }

    var email = document.getElementById("emailInfo");
    if (email.value.trim() == "") {
        var findNodes2 = document.getElementById("emailNull");
        findNodes2.innerText = "Email can not be null";
        whetherFull = false;
    } else {
        document.getElementById("emailNull").innerText = "";
        if (whetherFull)
            whetherFull = true;
    }

    var phone = document.getElementById("phoneInfo");
    if (phone.value.trim() == "") {
        var findNodes3 = document.getElementById("phoneNull");
        findNodes3.innerText = "Phone can not be null";
        whetherFull = false;
    } else {
        document.getElementById("phoneNull").innerText = "";
        if (whetherFull)
            whetherFull = true;
    }

    var country = document.getElementById("countryInfo");
    if (country.value.trim() == "") {
        var findNodes4 = document.getElementById("countryNull");
        findNodes4.innerText = "Country can not be null";
        whetherFull = false;
    } else {
        document.getElementById("countryNull").innerText = "";
        if (whetherFull)
            whetherFull = true;
    }

    var province = document.getElementById("provinceInfo");
    if (province.value.trim() == "") {
        var findNodes5 = document.getElementById("provinceNull");
        findNodes5.innerText = "Province can not be null";
        whetherFull = false;
    } else {
        document.getElementById("provinceNull").innerText = "";
        if (whetherFull)
            whetherFull = true;
    }

    var city = document.getElementById("cityInfo");
    if (city.value.trim() == "") {
        var findNodes6 = document.getElementById("cityNull");
        findNodes6.innerText = "City can not be null";
        whetherFull = false;
    } else {
        document.getElementById("cityNull").innerText = "";
        if (whetherFull)
            whetherFull = true;
    }

    var district = document.getElementById("districtInfo");
    if (district.value.trim() == "") {
        var findNodes7 = document.getElementById("districtNull");
        findNodes7.innerText = "District can not be null";
        whetherFull = false;
    } else {
        document.getElementById("districtNull").innerText = "";
        if (whetherFull)
            whetherFull = true;
    }

    var detailedAddress = document.getElementById("detailedAddressInfo");
    if (detailedAddress.value.trim() == "") {
        var findNodes8 = document.getElementById("detailedAddressNull");
        findNodes8.innerText = "DetailedAddress can not be null";
        whetherFull = false;
    } else {
        document.getElementById("detailedAddressNull").innerText = "";
        if (whetherFull)
            whetherFull = true;
    }

    return whetherFull;
}