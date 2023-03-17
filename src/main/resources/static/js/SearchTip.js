$(function () {
    $("#search").on("input", function () {
        $("#tips").empty();
        let keyword = $(this).val();
        if (keyword !== null && keyword !== "") {
            $.ajax({
                type: 'GET',
                url: "Pet/searchTips?keyword=" + keyword,
                dataType: "json",
                success: function (data) {
                    if (data.length > 0) {
                        let str = '';
                        for (let i = 0, len = data.length; i < len; i++) {
                            str += '<li><a href="Pet/searchPet?keyword=' + data[i] + '">' + data[i] + '</a></li>';
                        }
                        $("#tips").html(str);
                    }
                }
            })
        }
    })
});