//设置高亮
$(".addColor").on('click', function () {
    $(".addColor").css("backgroundColor", "#282B33");
    $(this).css("backgroundColor", "#009688");
})
//设置滑动
$(".list_one").click(function () {
    $(this).siblings(".list_two").slideToggle("1s");
    $(this).parent().siblings().children(".list_two").slideUp("1s");
});

$(".List_two").click(function () {
    let nexUrl = $(this).attr("value");
    console.log(" next" + nexUrl)
});