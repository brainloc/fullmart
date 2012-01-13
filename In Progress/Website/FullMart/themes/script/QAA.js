$(document).ready(function () {
    $(".very").each(function () {
        $(this).text(genr(4));
        $(this).css('background-position', 'left ' + Math.random() * 500 + 'px');
        $(this).click(function () {
            $(this).text(genr(4));
            $(this).css('background-position', 'left ' + Math.random() * 500 + 'px');
        });
    });
    $(".msvery").focus(function () {
        if ($(this).val() == "Nhập mã xác nhận") {
            $(this).val("");
            $(this).css("color", "black");
        }
    });
    $(".msvery").blur(function () {
        if ($(this).val() == "Nhập mã xác nhận" || $(this).val() == "") {
            $(this).val("Nhập mã xác nhận");
            $(this).css("color", "silver");
        }
    });
    $(".numc,.Acontent").click(function () {
        $(this).parent().find(".subcomment").slideToggle("normal");
        return false;
    });
});