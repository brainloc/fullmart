$(document).ready(function () {
    focusoutc(".imgmpreview");
    var iplus = 1;
    $("#imgplus").click(function () {
        if (iplus == 1) {
            $(".imgmpreview").first().fadeIn();
            iplus++;
        } else {
            if (iplus == 2) {
                $(".imgmpreview").first().next().show();
                $(".imgmpreview").first().next().next().fadeIn();
                iplus++;
            } else {
                $(".imgmpreview").last().prev().show();
                $(".imgmpreview").last().fadeIn();
                $(this).hide();
            }
        }
    });
    $(".imgmpreview").change(function () {
        if (!isUrl($(this).val())) {
            $(this).focus();
            $(this).val("");
            alert("Wrong format url");
        }
    });
    $(".tprice").keydown(function (data) {
        var charCode = (data.which) ? data.which : data.keyCode
        if ((charCode > 33 && charCode < 58) || (charCode > 90 && charCode < 106) || (charCode > 111 && charCode < 124)) { return true; } else { return false; }
    });
    $(".tprice").keyup(function (data) {
        var charCode = (data.which) ? data.which : data.keyCode
        if ((charCode >= 33 && charCode <= 40)) {
            return false;
        } else {
            var tmp = "";
            tmp = $(this).val().replace(/,/g, "").split("");
            var tmp1 = tmp[tmp.length - 1];
            if (tmp.length <= 12) {
                for (i = 1; i < tmp.length; i++) {
                    if (i % 3 == 0) {
                        tmp1 = tmp[tmp.length - i - 1] + "," + tmp1;
                    } else {
                        tmp1 = tmp[tmp.length - i - 1] + "" + tmp1;
                    }
                }
                $(this).val(tmp1);
            } else {
                alert("Your product too expensive to buy!");
            }
        }
    });
});