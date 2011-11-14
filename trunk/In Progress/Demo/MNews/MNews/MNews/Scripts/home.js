
function genr(len, charSet) {
    charSet = charSet || 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    var rs = '';
    for (var i = 0; i < len; i++) {
        var randomPoz = Math.floor(Math.random() * charSet.length);
        rs += charSet.substring(randomPoz, randomPoz + 1);
    }
    return rs;
}
$(document).ready(function () {
    $('#very').text(genr(4));
    $('#very').css('background-position', 'left ' + Math.random() * 500 + 'px');
    //    $('.list-news li:even').css('background-color', '#ddfcd8');
    $('#msinfo').hide();
    $('#very').focus(function () {
        $('#msvery').focus();
        $('#msvery').select();
    });
    $('#very').select(function () {
        $('#msvery').focus();
        $('#msvery').select();
    });
    $('#very').click(function () {
        $('#msvery').focus();
        $('#msvery').select();
    });
    $('#slidercontent').bxSlider({
        mode:'fade',
        auto: true,
        pager: true,
        speed: 500,
        pause: 5000
    });
    $('#mscontent').val('Hãy đóng góp ý kiến của bạn cho chúng tôi...!');
    $('#mscontent').focus(function () {
        if ($('#mscontent').val() == '' || $('#mscontent').val() == 'Hãy đóng góp ý kiến của bạn cho chúng tôi...!') {
            $('#mstext').animate({ width: '70%' }, 200, function () {
                $('#msinfo').css('width', '28%');
                $('#msinfo').fadeIn(200);
                $('#mscontent').val('');
            });
        }
    });
    $('#mscontent').blur(function () {
        if ($('#mscontent').val() == '' || $('#mscontent').val() == 'Hãy đóng góp ý kiến của bạn cho chúng tôi...!') {
            $('#msinfo').fadeOut(200, function () {
                $('#msinfo').width(0);
                $('#mstext').animate({ width: '100%' }, 200, function () {
                    $('#mscontent').val('Hãy đóng góp ý kiến của bạn cho chúng tôi...!');
                });
            });
        }
    });
    $('#mspost').click(function () {
        if ($('#very').text() != $('#msvery').val()) {
            alert('Hãy nhập chính xác mã xác nhận !');
            $('#very').text(genr(4));
            $('#very').css('background-position', 'left ' + Math.random() * 500 + 'px');
            $('#msvery').focus();
            $('#msvery').select();
            return false;
        }
    });
    var list = $('#mslide ul li');
    $('#mslide ul').width(list.length * 186 + 5);
    var i = 0;
    $("img").preload({ onFinish: sl });
    function ckl() {
        t = 0;
        $('#mslide ul li').each(function () {
            t += $(this).width();
        });
        if (t > ($('#mslide').width() * 3 / 4)) { return true; }
        return false;
    }
    function sl() {
        if (ckl()) {
            $(list[i]).delay(2000).animate({ width: '0px' }, 2000, function () {
                i++;
                sl();
            });
            if (i == list.length) { i--; rl(); }
        } else { i--; rl(); }
    }
    function rl() {

        $(list[i]).animate({ width: '186px' }, 50, function () {
            i--;
            rl();
        });
        if (i == 0) { sl(); }
    }
});
