$(document).ready(function () {
    focusout(".viewproduct .headproduct .Posterinfo .buy .nump", "1");
    $(".viewproduct .headproduct .Posterinfo .buy button").click(function () {
        showdialogt("<center>Product's added to cart</center>", 160, 50, "", 3000)
    });
});