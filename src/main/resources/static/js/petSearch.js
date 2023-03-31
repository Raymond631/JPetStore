$(document).ready(function () {
    getData();
})

function getData() {
    let keyword = getQueryVariable("keyword");
    $.ajax({
        url: "../Pet/getSearchData?keyword=" + keyword,
        type: "get",
        dataType: "json",
        success: function (obj) {
            if (obj.length > 0) {
                let str = '';
                for (var key in obj) {
                    str += `<div class="list-body myclear" data-checked = "false">
								<div class="col col-name" style="padding-left: 100px;width: 250px"><img src="${obj[key].img}" style="height: 80px"></img></div>
								<div class="col col-price" style="width: 200px"><a href="../Pet/showDetails?name=${obj[key].name}">${obj[key].name}</a></div>
								<div class="col col-total" >${obj[key].price}</div>
								<div class="col col-price" style="width: 600px">${obj[key].introduce}</div>
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