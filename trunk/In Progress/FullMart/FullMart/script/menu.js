function initMenu() {
    $('#Lmenu ul').hide();
	$('#Lmenu').append('<p id="pbottom">.</p>');
    $('#Lmenu > li').hover(function (e) {
        $(this).children("ul").show();
        var mar = $("#pbottom").position().top - ($(this).position().top + $(this).children("ul").height());
        if (mar<0) {
            $("ul#Lmenu li ul").css("margin-top",(mar-10)+'px');
        }
    }, function () {
        $(this).children("ul").hide();
        $("ul#Lmenu li ul").css("margin-top",'-27px');
    });
}
$(document).ready(function () { initMenu(); });