$(document).ready(function () {
    focusout(".viewproduct .headproduct .Posterinfo .buy .nump", "1");
    $(".buy button").click(function () {
        var t1 = ($(window).width() - $("div.getCart").width()) / 2;
        var t2 = ($(window).height() - $("div.getCart").height()) / 2;
        $("div.getCart").css("top", t2);
        $("div.getCart").css("left", t1);
        $("#waitloader").show();
        $("div.getCart").fadeIn();
        return false;
    });
    $("a.modalclose").click(function () {
        $("div.getCart").fadeOut();
        $("#waitloader").hide();
    });
});