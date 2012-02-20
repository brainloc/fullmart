$(document).ready(function () {
    focusout(".viewproduct .headproduct .Posterinfo .buy .nump", "1");
    $(".buy button").click(function () {
        showdialog("", 625, 410, "div.getCart", true);
        return false;
    });
});