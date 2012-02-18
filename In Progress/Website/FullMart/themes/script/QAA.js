$(document).ready(function () {
    //    $(".very").each(function () {
    //        $(this).text(genr(4));
    //        $(this).css('background-position', 'left ' + Math.random() * 500 + 'px');
    //        $(this).click(function () {
    //            $(this).text(genr(4));
    //            $(this).css('background-position', 'left ' + Math.random() * 500 + 'px');
    //        });
    //    });
    $(".listitem").delegate(".very", "click", function () {
        $(this).text(genr(4));
        $(this).css('background-position', 'left ' + Math.random() * 500 + 'px');
    });
    $(".listitem").delegate(".msvery", "focus", function () {
        if ($(this).val() == "Captcha") {
            $(this).val("");
            $(this).css("color", "black");
        }
    });
    $(".listitem").delegate(".msvery", "blur", function () {
        if ($(this).val() == "Captcha" || $(this).val() == "") {
            $(this).val("Captcha");
            $(this).css("color", "silver");
        }
    });
    $(".listitem").delegate(".mcomment .Acontent", "click", function () {
        $(this).parent().find(".subcomment").slideToggle("normal");
        return false;
    });

    $(".msinfo input[type=submit]").click(function () {
        var $prtmp = $(this).parent();
        if ($.trim($prtmp.find(".very").text()) != $.trim($prtmp.find(".msvery").val())) {
            alert("Please enter captcha correctly !");
            return false;
        }
    });
});