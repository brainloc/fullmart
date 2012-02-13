$(document).ready(function () {
    $(".dropdown dt a").click(function () {
        var $parent = $(this).parent().parent();
        $parent.find("dd ul").slideToggle();
        return false;
    });
    $(".dropdown dd ul li a").click(function () {
        var text = $(this).html();
        var id = $(this).attr('id');
        var $parent = $(this).parents(".dropdown");
        $parent.find("dt a span").html(text);
        $parent.find("dt a span").attr('id',id);
        $(".dropdown dd ul").slideUp();
        return false;
    });
    $(".dropdown").mouseleave(function () {
        $(".dropdown dd ul").hide();
    });
    //    $(document).bind('click', function (e) {
    //        var $clicked = $(e.target);
    //        if (!$clicked.parents().hasClass("dropdown"))
    //            $(".dropdown dd ul").hide();
    //            return false;
    //    });
});