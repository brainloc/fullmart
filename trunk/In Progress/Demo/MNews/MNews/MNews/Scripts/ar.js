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
$(document).ready(function () {if (querySt("m") != null) {var a = querySt("m");if (a.length < 10) {$('a').each(function () {if ($(this).attr('href').indexOf('?') != -1) {$(this).attr('href', $(this).attr('href') + '&m=' + a);} else { $(this).attr('href', $(this).attr('href') + '?m=' + a); }});}}});