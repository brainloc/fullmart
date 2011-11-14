function fixbottom() {
    $('body').append('<span id=stfooter>.</span>');
    if ($('#stfooter').position().top <= $(window).height()) {
        $('#footer').css('position', 'fixed');
        $('#footer').css('bottom', '0px');
        $('#stfooter').remove();
    } else {
        $('#footer').css('position', 'initial');
        $('#stfooter').remove();
    }
}
$(document).ready(function () {
    $("img").preload({ onFinish: fixbottom });
});
$('a').click(function () {
    $("img").preload({ onFinish: fixbottom });
});
