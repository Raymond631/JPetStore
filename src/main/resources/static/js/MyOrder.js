var myOrder = {
    start() {
        this.getData();
    },
    getData() {
        $.ajax({
            url: "/jpetstore/orders",
            type: "get",
            dataType: "json",
            success: function (res) {
                let obj = res.data;
                if (obj.length > 0) {
                    let str = '';
                    for (var key in obj) {
                        let temp = '';
                        if (obj[key].status === 2) {
                            temp = `<div class="col col-price" style="width: 180px">
                                        <button onclick="confirmReceipt(this)" value="${obj[key].orderId}">${statusTransfer(obj[key].status)}</button>
                                    </div>`
                        } else {
                            temp = `<div class="col col-price" style="width: 180px">${statusTransfer(obj[key].status)}</div>`
                        }
                        str += `<div class="list-body myclear" data-checked="false" style="padding-left: 20px">
                                    <div class="col col-price" style="width: 300px"><a href="/jpetstore/OrderDetails.html?orderId=${obj[key].orderId}">${obj[key].orderId}</a></div>
                                    <div class="col col-name" style="padding-left: 20px;width: 300px">${obj[key].orderTime}</div>
                                    <div class="col col-total" style="margin-left: 80px">${obj[key].orderCost}</div>
                                    <div class="orderStatus">${temp}</div>
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

function statusTransfer(status) {
    switch (status) {
        case 1:
            return '<span style="color: blue">未发货</span>';
        case 2:
            return '确认收货';
        case 3:
            return '<span style="color: forestgreen">未发货</span>';
        case 5:
            return '<span style="color: forestgreen">未发货</span>';
    }
}

function confirmReceipt(confirmButton) {
    let orderId = $(confirmButton).val()
    console.log(orderId)
    $.ajax({
        url: "/jpetstore/orders/" + orderId,
        type: "put",
        success: function (res) {
            if (res.code === 200) {
                $(confirmButton).parent().parent().html('<div class="col col-price" style="width: 180px">已接收</div>')
            } else {
                console.log(res.data)
            }
        }
    })
}