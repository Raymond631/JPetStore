$(document).ready(function () {
    $("#updateCart").on("click", function () {
        let dataArr = [];
        $(".itemQuantity").each(function () {
            let item = {};
            item.itemID = $(this).val();
            item.quantity = $(this).getAttribute("name");
            dataArr.push(item);
        })
        $.ajax({
            url: "../Cart/updateCart",
            type: "post",
            data: {
                jsonObj: JSON.stringify(dataArr)
            },
            success: function () {
                console.log("successful");
            }
        })
    })
});