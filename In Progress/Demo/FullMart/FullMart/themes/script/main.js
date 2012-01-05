var maxtitle = 35;//max lenght of title hotnew
var maxtext = 100; //max lenght of content preview hotnew

$(document).ready(function () {
    if ($.browser.msie && $.browser.version < 9) {
        $(".lsubcat").removeClass("b");
    }
    // Run Slider
    $('#mslider').bxSlider({
        mode: 'fade',
        controls: false,
        auto: true,
        pager: true,
        pause: 5000,
        speed: 2000
    });

    //listcats menu
    $("#listcats .lplist li").hover(function () {
        $(this).find(".ap").addClass("active");
        $(this).find(".lsubcat").show();
    }, function () {
        $(this).find(".lsubcat").hide();
        $(this).find(".ap").removeClass("active");
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
            $(this).find("span").text(text.substring(0, maxtext-3) + "...");
        }
        if (title.length > maxtitle) {
            $(this).find("p a").text(text.substring(0, maxtitle-3) + "...");
        }

        // pages
        $(".Apages a").click(function () {
            $(this).parent().find(".active").removeClass("active");
            $(this).addClass("active");
            return false;
        });
    });

    //fix menu with empty child
    $("#listcats .lsubcat").each(function () {
        if ($(this).find("li").length == 0) {
            $(this).remove();
        }
    });
});