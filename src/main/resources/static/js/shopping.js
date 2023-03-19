var cart_data;
var index_set = [];
var money = 0;
var isEmpty = true;

var xiaomi = {
    // 初始化方法
    start() {
        let J_userInfo = document.getElementById('J_userInfo');
        let J_cartListGoods = document.getElementById('J_cartListGoods');
        //购物车不为空
        J_userInfo.style.display = 'block';
        J_cartListGoods.style.display = 'block';
        this.ajaxFun();
    },

    // 数据请求
    ajaxFun() {
        //TODO 前端json解析标准格式
        $.ajax({
            url: "/jpetstore/Cart/selectCartList",
            type: "get",
            dataType: "json",
            success: function (obj) {
                cart_data = obj;
                if (obj.length > 0) {
                    isEmpty = false;
                    let str = '',
                        index = [],
                        proc = [],
                        cartItemId = [];
                    let total_cost;
                    for (let key in obj) {
                        total_cost = math.multiply(math.bignumber(obj[key].petItem.itemPrice), math.bignumber(obj[key].quantity))
                        str +=
                            `<div class="list-body myclear" data-checked = "false">
								<div class="col col-check"><i class="iconfont icon-checkbox J_select">√</i></div>
								<div class="col col-img"><a href="javascript:;"><img src="${obj[key].petProduct.productImage}" alt=""></a></div>
								<div class="col col-name">${obj[key].petProduct.productNameChinese}:${obj[key].petItem.itemSpecification}</div>
								<div class="col col-price">${obj[key].petItem.itemPrice}</div>
								<div class="col col-num">
									<div class="change-goods-num myclear J_changeGoodsNum">
										<a href="javascript:void(0)" class="J_minus"><i class="iconfont">-</i></a>
										<input tyep="text" value="${obj[key].quantity}" class="goods-num J_goodsNum">
										<a href="javascript:void(0)" class="J_plus"><i class="iconfont">+</i></a>
									</div>
								</div>
								<div class="col col-total">${total_cost}</div>
								<div class="col col-action">×</div>
							</div>`;
                        index.push(obj[key].petItem.itemStock);
                        proc.push(obj[key].petItem.itemPrice);
                        cartItemId.push(obj[key].cartItemId)
                    }
                    document.getElementById('wapper').innerHTML = str;
                    xiaomi.updata(index, proc, cartItemId);
                } else {
                    isEmpty = true;
                }
            }
        })
    },

    // 操作数据
    updata(index, proc, cartItemId) {
        // 减加
        let J_minus = document.getElementsByClassName('J_minus');
        let J_plus = document.getElementsByClassName('J_plus');
        // 数量
        let J_goodsNum = document.getElementsByClassName('J_goodsNum');
        // 小计
        let colTotal = document.getElementsByClassName('col-total');
        // 合计
        let J_cartTotalPrice = document.getElementById('J_cartTotalPrice');
        let colAction = document.getElementsByClassName('col-action');
        // 选项框
        let J_selectAll = document.getElementById('J_selectAll');
        let check = document.getElementsByClassName('J_select');

        let J_noSelectTip = document.getElementById('J_noSelectTip');
        let J_goCheckout = document.getElementById('J_goCheckout');

        // 加/减
        for (let i = 0; i < J_plus.length; i++) {
            J_plus[i].onclick = function () {
                if (J_goodsNum[i].value < index[i]) {
                    let quantity = ++J_goodsNum[i].value;
                    colTotal[i + 1].innerHTML = math.multiply(math.bignumber(proc[i]), math.bignumber(J_goodsNum[i].value));
                    sum();

                    //TODO 前端json-post标准格式
                    let data = {
                        cartItemId: cartItemId[i],
                        quantity: quantity
                    };
                    $.ajax({
                        url: "/jpetstore/Cart/updateItemQuantity",
                        type: "put",
                        contentType: 'application/json',
                        data: JSON.stringify(data),
                        success: function () {
                            console.log("+1");
                        }
                    });
                } else {
                    alert("您购买的商品超过了限制的数量");
                }
            }
            J_minus[i].onclick = function () {
                if (J_goodsNum[i].value > 1) {
                    let quantity = --J_goodsNum[i].value;
                    colTotal[i + 1].innerHTML = math.multiply(math.bignumber(proc[i]), math.bignumber(J_goodsNum[i].value));
                    sum();

                    let data = {
                        cartItemId: cartItemId[i],
                        quantity: quantity
                    };
                    $.ajax({
                        url: "/jpetstore/Cart/updateItemQuantity",
                        type: "put",
                        contentType: 'application/json',
                        data: JSON.stringify(data),
                        success: function () {
                            console.log("+1");
                        }
                    });
                } else {
                    alert("您购买的商品数量不能再低了哦");
                }
            }
        }

        // 求和
        function sum() {
            if (isSelectAll() && !isEmpty) {
                J_noSelectTip.style.display = 'none';
                J_goCheckout.classList.remove('btn-disabled');
            } else {
                J_noSelectTip.style.display = 'block';
                J_goCheckout.classList.add('btn-disabled');
            }

            let colTotal = document.getElementsByClassName('col-total');
            let total = 0;
            for (let i = 1, len = check.length; i < len; i++) {
                if (check[i].parentNode.parentNode.dataset.checked == 'true') {
                    total = math.add(math.bignumber(total), math.bignumber(colTotal[i].innerText))
                }
            }
            J_cartTotalPrice.innerText = total;
            money = parseFloat(J_cartTotalPrice.innerText);
            Select();
        }

        // 删除
        for (let i = 1, len = colAction.length; i < len; i++) {
            colAction[i].onclick = function () {
                if (confirm('是否删除')) {
                    this.parentElement.remove();
                    check.length--;
                    document.getElementById('J_cartTotalNum').innerHTML = check.length - 1;
                    sum();
                    $.ajax({
                        url: "/jpetstore/Cart/removeCartItem?cartItemId=" + cartItemId[i - 1],
                        type: "delete",
                        success: function () {
                            console.log("delete");
                        }
                    });
                }
            }
        }

        // 单个选中、取消选中
        for (let i = 1, len = check.length; i < len; i++) {
            check[i].onclick = function () {
                if (this.parentNode.parentNode.dataset.checked == 'false') {
                    check[i].parentNode.parentNode.dataset.checked = 'true';
                    check[i].style.color = '#000';
                } else {
                    check[i].parentNode.parentNode.dataset.checked = 'false';
                    check[i].style.color = '#fff';
                }
                if (isSelect()) {
                    J_selectAll.parentNode.parentNode.dataset.checked = 'false';
                    J_selectAll.style.color = '#fff';
                } else {
                    J_selectAll.parentNode.parentNode.dataset.checked = 'true';
                    J_selectAll.style.color = '#000';
                }
                sum();
            }
        }
        // 全选
        J_selectAll.onclick = function () {
            if (this.parentNode.parentNode.dataset.checked == 'false') {
                for (let i = 0, len = check.length; i < len; i++) {
                    check[i].parentNode.parentNode.dataset.checked = 'true';
                    check[i].style.color = '#000';
                }
            } else {
                for (let i = 0, len = check.length; i < len; i++) {
                    check[i].parentNode.parentNode.dataset.checked = 'false';
                    check[i].style.color = '#fff';
                }
            }
            sum();
        }

        // 商品件数
        document.getElementById('J_cartTotalNum').innerHTML = check.length - 1;

        // 选中个数
        function Select() {
            var index = 0;
            for (let i = 1; i < check.length; i++) {
                if (check[i].parentNode.parentNode.dataset.checked == 'true') {
                    index++;
                }
            }
            document.getElementById('J_selTotalNum').innerHTML = index;
        }

        // 判断只要有一个选中返回true
        function isSelectAll() {
            for (let i = 0, len = check.length; i < len; i++) {
                if (check[i].parentNode.parentNode.dataset.checked == 'true') {
                    return true;
                }
            }
            return false;
        }

        // 判断只要有一个没有选中返回true
        function isSelect() {
            for (let i = 1, len = check.length; i < len; i++) {
                if (check[i].parentNode.parentNode.dataset.checked == 'false') {
                    return true;
                }
            }
            return false;
        }

        J_goCheckout.onclick = function CheckOut() {
            index_set.length = 0;//清空
            for (let i = 1, len = check.length; i < len; i++) {
                if (check[i].parentNode.parentNode.dataset.checked != 'false') {
                    index_set.push(i - 1);
                }
            }
            let data = {
                cart_info: cart_data,
                item_index: index_set,
                cost: money
            };
            sessionStorage.setItem("cart_data", JSON.stringify(data))
            window.location.href = "/jpetstore/Order/OrderSubmit.html"
            // $.ajax({
            //     url: "../Cart/CheckOut",
            //     type: "post",
            //     data: JSON.stringify(data),
            //     success: function () {
            //         window.location.href = "../Order/showOrderSubmit"
            //     }
            // });
        }
    },
}

// 加载事件
window.onload = function () {
    xiaomi.start();
}
