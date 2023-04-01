$(document).ready(function () {
    getData();
})

function getData() {
    let keyword = getQueryVariable("keyword");
    $.ajax({
        url: "/jpetstore/pets/search?keyword=" + encodeURIComponent(keyword),
        type: "get",
        dataType: "json",
        success: function (res) {
            console.log(res)
            let obj = res.data;
            if (obj.length > 0) {
                let str = '';
                for (var key in obj) {
                    str += `<div class="list-body myclear" data-checked = "false">
                                <a href="/jpetstore/Details.html?productId=${obj[key].productId}">
								    <div class="col col-name" style="padding-left: 100px;width: 250px">${obj[key].productId}</div>
								    <div class="col col-price" style="width: 200px"><img src="/jpetstore/image/look/${obj[key].productImage}" style="height: 80px"></div>
								    <div class="col col-total" >${obj[key].productNameChinese}</div>
								    <div class="col col-price" style="width: 450px">${obj[key].productNameEnglish}</div>
								</a>
							</div>`;
                }
                document.getElementById('wapper').innerHTML = str;
            } else {
            }
        }
    })
}

function getQueryVariable(variable) {
    var query = window.location.search.substring(1);
    var vars = query.split("&");
    for (var i = 0; i < vars.length; i++) {
        var pair = vars[i].split("=");
        if (pair[0] == variable) {
            return pair[1];
        }
    }
    return false;
}