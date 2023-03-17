var ids = [];

var myOrder = {
    start() {
        this.getData();
    },
    getData() {
        $.ajax({
            url: "../Order/getOrder",
            type: "get",
            dataType: "json",
            success: function (obj) {
                if (obj.length > 0) {
                    let str = '';
                    for (var key in obj) {
                        ids.push(obj[key].orderID);
                        str += `<div class="list-body myclear" data-checked = "false" style="padding-left: 20px">
								<div class="col col-name" style="padding-left: 20px;width: 300px">${obj[key].orderTime}</div>
								<div class="col col-price" style="width: 300px;color: "><a href="../Order/showOrderDetails?orderID=${obj[key].orderID}">#${obj[key].orderID}</a></div>
								<div class="col col-price" style="width: 180px">${obj[key].receiver.receiverName}</div>
								<div class="col col-total" style="margin-left: 80px">${obj[key].totalPrice}</div>
								<div class="col col-action" style="margin-left: 120px">x</div>
							</div>`;
                    }
                    document.getElementById('wapper').innerHTML = str;
                    myOrder.operateData();
                }
            }
        })
    },
    operateData() {
        let colAction = document.getElementsByClassName('col-action');
        for (let i = 1, len = colAction.length; i < len; i++) {
            colAction[i].onclick = function () {
                if (confirm('是否删除')) {
                    this.parentElement.remove();
                    let order = {
                        orderID: ids[i - 1]
                    }
                    $.ajax({
                        url: "../Order/deleteOrder",
                        type: "post",
                        data: JSON.stringify(order),
                        success: function () {
                            console.log("deleteOrder")
                        }
                    });
                }
            }
        }
    }
}
// 加载事件
window.onload = function () {
    myOrder.start();
}