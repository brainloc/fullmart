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
    $(".listitem").delegate(".mcomment .Acontent", "click", function () {
        $(this).parent().find(".subcomment").slideToggle("normal");
        return false;
    });

    $(".msinfo input[type=submit]").click(function () {
        var $prtmp = $(this).parent();
        if ($prtmp.find(".very").text() != $prtmp.find(".msvery").val()) {
            alert("Please enter captcha correctly !");
            return false;
        }
        return false;
    });
    $("body").delegate(".mcomment .Acontent button", "click", function () {
        var r = confirm("Do you want to delete this question ?");
        if (r) {
            //$(this).parent().parent().parent().remove();

            var tmp = $(this).parents(".subcomment").parent().find(".numc").text();
            tmp = eval(tmp);
            tmp--;
            $(this).parents(".subcomment").parent().find(".numc").text(tmp);
            $(this).parents(".Acontent").parent().remove();
        }
        return false;
    });
});