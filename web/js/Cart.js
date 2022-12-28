$(function () {
    $('.itemQuantity').on('blur', function () {
        let that = $(this);
        let number = $(this).val();
        let name = $(this).attr("name");
        console.log(number);
        console.log(name)
        $.ajax({
            type: 'GET',
            url: '../Cart/InNumber?name=' + name,
            success: function (data) {
                console.log("The max number: " + data);
                //这里我还不清楚传过来的是不是boolean

                if (number <= data) {
                    //do nothing
                    console.log("do nothing");
                } else {
                    console.log("out of bounds");
                    let newData = data.replace(/[\r\n]/g, "");
                    //首先肯定是不能修改，要不直接给他改成已有最大值吧。。
                    that.val(newData);
                }
            },
            error: function (error) {
                console.log("error" + error)
            }
        })
    })
});

$(document).ready(function () {
    $("#updateCart").on("click", function () {
        let dataArr = [];
        $(".itemQuantity").each(function () {
            let item = {};
            item.itemID = $(this).val();
            console.log($(this).val());
            item.quantity = $(this).attr("name");
            console.log(item.quantity);
            dataArr.push(item);
        })
        $.ajax({
            url: "../Cart/updateCart",
            type: "post",
            data: {
                jsonObj: JSON.stringify(dataArr)
            },
            success: function () {
                console.log("updateSucceed");
            },
            error: function (error) {
                console.log("error" + error)
            }
        })
    })
});