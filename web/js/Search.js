$(function () {
    $('#keyword').on('keyup', function () {
        var keyword = $(this).val();
        console.log(keyword);
        if (keyword !== null && keyword !== '') {
            $.ajax({
                type: 'GET',
                url: '../Pet/searchTips?keyword=' + keyword,
                success: function (data) {
                    console.log(data);
                    let productListHtml = '';
                    for (var i = 0; i < data.length; i++) {
                        productListHtml += '<li class=\"productAutoItem\">';
                        productListHtml += data[i].category;
                        productListHtml += ": ";
                        productListHtml += data[i].name;
                        productListHtml += '</li>';
                    }
                    $('#productAutoList').html(productListHtml);
                    $('#productAutoComplete').show();
                },
                error: function (error) {
                    console.log("error" + error)
                }
            })
        } else {
            //do nothing?
        }
    })
});