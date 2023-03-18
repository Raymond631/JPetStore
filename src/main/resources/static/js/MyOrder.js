var myOrder = {
    start() {
        this.getData();
    },
    getData() {
        $.ajax({
            url: "/jpetstore/Order/list",
            type: "get",
            dataType: "json",
            success: function (obj) {
                if (obj.length > 0) {
                    let str = '';
                    for (var key in obj) {
                        str += `<div class="list-body myclear" data-checked="false" style="padding-left: 20px">
                                    <div class="col col-price" style="width: 300px"><a href="/jpetstore/Order/OrderDetails.html?orderId=${obj[key].orderId}">${obj[key].orderId}</a></div>
                                    <div class="col col-name" style="padding-left: 20px;width: 300px">${obj[key].orderTime}</div>
                                    <div class="col col-price" style="width: 180px">${obj[key].receiverName}</div>
                                    <div class="col col-total" style="margin-left: 80px">${obj[key].orderCost}</div>
                                </div>`;
                    }
                    document.getElementById('wapper').innerHTML = str;
                }
            }
        })
    }
}
// 加载事件
window.onload = function () {
    myOrder.start();
}