﻿$(document).ready(function () {
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
        if ($prtmp.find(".very").text() != $prtmp.find(".msvery").val()) {
            alert("Please enter captcha correctly !");
            return false;
        }
    });
    $(".listitem").delegate(".mcomment .Acontent button", "click", function () {
        var r = confirm("Do you want to delete this question ?");
        if (r) {
            if ($(this).find(".subcomment") == null) {

                var tmp = $(this).parents(".subcomment").parent().find(".numc").text();
                tmp = eval(tmp);
                tmp--;
                $(this).closest(".subcomment").parent().find(".numc").text(tmp);
                $(this).closest("li").remove();
            } else {
                $(this).closest("li").remove();
            }
        }
        return false;
    });
});