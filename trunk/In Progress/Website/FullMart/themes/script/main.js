var maxtitle = 35; //max lenght of title hotnew
var maxtext = 100; //max lenght of content preview hotnew
function genr(len, charSet) {
    charSet = charSet || 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    var rs = '';
    for (var i = 0; i < len; i++) {
        var randomPoz = Math.floor(Math.random() * charSet.length);
        rs += charSet.substring(randomPoz, randomPoz + 1);
    }
    return rs;
}
function querySt(ji) {
    hu = window.location.search.substring(1);
    gy = hu.split("&");
    for (i = 0; i < gy.length; i++) {
        ft = gy[i].split("=");
        if (ft[0] == ji) {
            return ft[1];
        }
    }
}
function isUrl(s) {
    var regexp = /(ftp|http|https):\/\/(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/
    return regexp.test(s);
}
function mashmoney(data) {
    var tmp = "";
    tmp = data.replace(/,/g, "");
    tmp = tmp.split("")[0].split("");
    var tmp1 = tmp[tmp.length - 1];
    for (i = 1; i < tmp.length; i++) {
        if (i % 3 == 0) {
            tmp1 = tmp[tmp.length - i - 1] + "," + tmp1;
        } else {
            tmp1 = tmp[tmp.length - i - 1] + "" + tmp1;
        }
    }
    return tmp1;
}
function search() {
    var key = $("#search").val();
    var url1 = window.location.origin;
    if ($("#slcats dt a span").text() != "Please select the category") {
        var catID = $("#slcats dt a span").attr('id');
        url1 = url1 + "/list_by_subcate_search.aspx?cat=" + id + "&title=" + key;
    } else {
        url1 = url1 + "/list_by_subcate_search.aspx?title=" + key;
    }
    $(location).attr('href', url1);
}
function focusout(element, content) {
    $(element).focus(function () {
        if ($(this).val() == content) {
            $(this).val("");
            $(this).css("color", "black");
        }
    });
    $(element).blur(function () {
        if ($(this).val() == content || $(this).val() == "") {
            $(this).val(content);
            $(this).css("color", "silver");
        }
    });
}
function focusoutc(element) {
    $(element).each(function () {
        $(this).focus(function () {
            if ($(this).val() == $(this).attr("title")) {
                $(this).val("");
                $(this).css("color", "black");
            }
        });
        $(this).blur(function () {
            if ($(this).val() == $(this).attr("title") || $(this).val() == "") {
                $(this).val($(this).attr("title"));
                $(this).css("color", "silver");
            }
        });
    });
}
function formatCurrency(num) {
    num = num.toString().replace(/\$|\,/g, '');
    if (isNaN(num))
        num = "0";
    sign = (num == (num = Math.abs(num)));
    num = Math.floor(num * 100 + 0.50000000001);
    num = Math.floor(num / 100).toString();
    for (var i = 0; i < Math.floor((num.length - (1 + i)) / 3); i++)
        num = num.substring(0, num.length - (4 * i + 3)) + ',' +
    num.substring(num.length - (4 * i + 3));
    return (((sign) ? '' : '-') + num);
}
function calcart() {
    $("div.fcart tbody tr td:nth-child(5)").calc(
	            "qty * price",
	            {
	                qty: $("div.fcart tbody tr td .nump"),
	                price: $("div.fcart tbody tr td:nth-child(4)")
	            },
	            function (s) {
	                return formatCurrency(s.toFixed(0)) + " VND";
	            },
	            function ($this) {
	                var sum = $this.sum();

	                $(".totalp").text(
			            formatCurrency(sum.toFixed(0)) + " VND"
		            );
	            }
            );
}

function setCookie(c_name, value, exdays) {
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var c_value = escape(value) + ((exdays == null) ? "" : "; expires=" + exdate.toUTCString());
    document.cookie = c_name + "=" + c_value;
}
$(document).ready(function () {
    if ($.browser.msie && $.browser.version < 9) {
        $(".lsubcat").removeClass("b");
        if ($.browser.version < 8) {
            alert("We don't support internet explorer 7 or lower browser, if you intereted with us, please come back with another better browser!\n Thanks for your interested!");
            window.location("https://www.google.com/chrome?hl=en");
        }
    }
    $(".rate").each(function () {
        var nr = $(this).text();
        var nums = "";
        for (i = 0; i < nr; i++) {
            nums += "<img src=\"/themes/images/favs.png\" alt=\"rate\" />";
        }
        $(this).html(nums);
    });
    $("#unote").click(function () {
        var t1 = ($(window).width() - $("#viewnote").width()) / 2;
        var t2 = ($(window).height() - $("#viewnote").height()) / 2;
        $("#viewnote").css("top", t2);
        $("#viewnote").css("left", t1);
        $("#waitloader").show();
        $("#viewnote").fadeIn();
        return false;
    });
    $("a.modalclose").click(function () {
        $(this).parent().fadeOut();
        $("#waitloader").hide();
        return false;
    });
    $(".ndialog").delegate("button", "click", function () {
        $(".ndialog").fadeOut();
        $("#waitloader").hide();
    });
    //    $("#unote").click(function () {
    //        showdialog($("#viewnote").html(), 800, 423, "#viewnote", true);
    //        $(".delms").click(function () {
    //            $(this).parents("tr").hide();
    //            return false;
    //        });
    //        return false;
    //    });    
    $("#sbsearch").click(function () {
        search();
        return false;
    });
    focusout("#search", "Search me");
    $("div.nameproduct").each(function () {
        var str1 = $.trim($(this).text());
        var str2 = $.trim($(this).find("p").text());
        var strc = str1.length - str2.length;
        if (strc > 33) {
            var strtmp = str1.substring(0, 30) + "..."
            $(this).attr("title", str1.substring(0, strc));
            $(this).html(strtmp + "<p>" + str2 + "</p>");
        }
    });


    //Cart script
    $("#ucart").click(function () {
        calcart();
        var t1 = ($(window).width() - $("div.fcart").width()) / 2;
        var t2 = ($(window).height() - $("div.fcart").height()) / 2;
        $("div.fcart").css("top", t2);
        $("div.fcart").css("left", t1);
        $("#waitloader").show();
        $("div.fcart").fadeIn();
        return false;
    });
    $("div.fcart tbody tr td .nump").keyup(function () {
        calcart();
    });
    $("div.fcart tbody tr td:nth-child(7) button").click(function () {
        $(this).parents("tr").remove();
        calcart();
        return false;
    });

    //listcats menu
    $("#listcats .lplist li").hover(function () {
        $(this).find(".ap").addClass("active");
        $(this).find(".lsubcat").delay(200).show();
    }, function () {
        $(this).find(".lsubcat").hide();
        $(this).find(".ap").removeClass("active");
    });
    $("#listcats .lsubcat").each(function () {
        if ($(this).find("li").length == 0) {
            $(this).remove();
        }
    });
    $("#Lmenu .lplist li").hover(function () {
        $(this).find(".ap").addClass("active");
        $(this).find(".lsubcat").delay(200).show();
    }, function () {
        $(this).find(".lsubcat").hide();
        $(this).find(".ap").removeClass("active");
    });
    $("#Lmenu .lsubcat").each(function () {
        if ($(this).find("li").length == 0) {
            $(this).remove();
        }
    });
    // gcats
    $(".gtitle a").click(function () {
        $(this).parent().find(".maincat").removeClass("maincat").addClass("subcat");
        $(this).removeClass("subcat").addClass("maincat");
        return false;
    });

    //preview news
    $("#hotnew .listitem .item").each(function () {
        var title = $(this).find("p a").text();
        var text = $(this).find("span").text();
        if (text.length > maxtext) {
            $(this).find("span").text(text.substring(0, maxtext - 3) + "...");
        }
        if (title.length > maxtitle) {
            $(this).find("p a").text(text.substring(0, maxtitle - 3) + "...");
        }
    });
    // pages
    //    $(".Apages a").click(function () {
    //        $(this).parent().find(".active").removeClass("active");
    //        $(this).addClass("active");
    //        return false;
    //    });
    //tabs
    $("#tabs li").click(function () {
        var des = $(this).find("a").attr("href");
        $("#tabs .active").removeClass("active");
        $(this).addClass("active");
        $(".advc div.active").slideUp("normal", function () {
            $(this).removeClass("active");
            $(des).slideDown("normal", function () { $(des).addClass("active"); });
        });
        return false;
    });

    $("div#viewnote").delegate("li.orderItem", "click", function () {
        var orderItemID = $(this).attr("id");
        if (!orderItemID == false) {
            $("#waitloader").show();
            $.ajax({
                url: "/Code/Business/AjaxUltilities.ashx?",
                async: false,
                type: "POST",
                dataType: "script",
                data: {
                    orderInfoID: orderItemID,
                    action: "loadOrderInfo"
                }
            });
            $(".vlistletter").hide();
            $(".vletter").show();
            $(this).find(".noread").removeClass("noread");
            $("#unote strong").text($(".noread").length);
            return false;
        }
        else {
            $('#VUEmail').val("");
            $('#Text1').val("");
            $('#VUCU').val("");
            $('#VUClass').val("");
            $('#VUWishlist').val("");
        }
    });

    $(".vletter").delegate("table tfoot button", "click", function () {
        $(".vlistletter").slideDown("normal", function () {
            $(".viewnote").css("height", "418px");
            $('#VUEmail').val("");
            $('#Text1').val("");
            $('#VUCU').val("");
            $('#VUClass').val("");
            $('#VUWishlist').val("");
        });
        $(".vletter").hide();
        return false;
    });
    $("#unote strong").text($(".noread").length);
    $(".SetEngByDefault").click(function () {
        setCookie("lang", "en", 1);
    });

    $(".SetViByDefault").click(function () {
        setCookie("lang", "vi", 1);
    });
    $("#unote strong").text($(".noread").length);
    $("#ucart strong").text($(".fcart table tbody tr").length);
    $(".fcart table tbody tr").delegate("input[type=submit]", "click", function () {
        setInterval("", 200);
        $("#ucart strong").text($(".fcart table tbody tr").length);
    });
    $(".fcart table tfoot tr").delegate("button", "click", function () {
        setInterval("", 200);
        $("#ucart strong").text($(".fcart table tbody tr").length);
    });
    $(".getCart table tbody").delegate("button", "click", function () {
        $("#ucart strong").text($(".fcart table tbody tr").length);
    });
    $(".SetEngByDefault").click(function () {
        setCookie("lang", "en", 1);
    });

    $(".SetViByDefault").click(function () {
        setCookie("lang", "vi", 1);
    });
});