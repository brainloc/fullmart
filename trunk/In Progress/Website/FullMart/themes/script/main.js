var maxtitle = 35;//max lenght of title hotnew
var maxtext = 100; //max lenght of content preview hotnew
function genr(len, charSet) {
    charSet = charSet || 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
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
$(document).ready(function () {
    if ($.browser.msie && $.browser.version < 9) {
        $(".lsubcat").removeClass("b");
        if ($.browser.version < 8) {
            alert("We don't support internet explorer 7 or lower browser, if you intereted with us, please come back with another better browser!\n Thanks for your interested!");
            window.location("https://www.google.com/chrome?hl=en");
        }
    }
    focusout("#search", "Search me");
    CKFinder.setupCKEditor(null, '/ckfinder/');
    $("#treg").click(function () {
        showdialog("<Center style='margin-right: 15px;'><strong><a href='RegisterN.aspx?type=shop' title='Register your shop'><img alt='Register your shop' src='themes/images/signup-your-store1.png' /></a></strong><br /><strong><a href='RegisterN.aspx' title='Register User'><img alt='Register User' src='themes/images/signup-your-store2.png' /></a></strong></center>", 250, 180, "", true);
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
    $(".Apages a").click(function () {
        $(this).parent().find(".active").removeClass("active");
        $(this).addClass("active");
        return false;
    });
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
});