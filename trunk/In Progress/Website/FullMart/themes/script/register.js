$(function () {
    var cy = 2011;// lay nam he thong tra vao day
    for (var i = cy; i > cy - 40; i--) {
        $("#freguserclass").append("<option>"+i+"</option>");
    }
    $('form').jqTransform({ imgPath: 'themes/images/' });
});
$(function () {
    $("#birthday").datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'dd/mm/yy',
        yearRange: 'c-50:c-10'
    });

});
function ckcap(field, rules, i, options) {
    if ($("#very").text() == field.val()) {
        return options.allrules.validate2fields.alertText;
    }
}
function ckmk(field, rules, i, options) {
    if ($("#upass").text() != field.val()) {
        return options.allrules.cfpass.alertText;
    }
}
$(document).ready(function () {

    $('#very').text(genr(6));
    $('#very').css('background-position', 'left ' + Math.random() * 500 + 'px');
    $('#very').click(function () {
        $('#very').text(genr(6));
        $('#very').css('background-position', 'left ' + Math.random() * 500 + 'px');
    });
    var type = querySt("type");
//    if (type == "shop") {
//        $("#policyshop").modal({
//            opacity: 40,
//            close: false,
//            autoPosition: true,
//            onClose: function (dialog) {
//                if ($("#policyshop button.agree").parent().find("input[type=checkbox]").attr("checked")) {
//                    dialog.data.fadeOut('slow', function () {
//                        dialog.container.slideUp('normal', function () {
//                            dialog.overlay.fadeOut('normal', function () {
//                                $.modal.close();
//                            });
//                        });
//                    });
//                } else {
//                    alert("Please agree with our term condition to register !");
//                    if (!this.dialog.data) {
//                        return false;
//                    }
//                }
//            }
//        });
//        $("#simplemodal-container").css("height", 350 + "px");
//        $("#simplemodal-container").css("width", 700 + "px");
//        var t1 = ($(window).width() - $("#simplemodal-container").width()) / 2;
//        var t2 = ($(window).height() - $("#simplemodal-container").height()) / 2;
//        $("#simplemodal-container").css("top", t2);
//        $("#simplemodal-container").css("left", t1);
//    }
//    else {
//        $("#policyuser").modal({
//            opacity: 40,
//            close: false,
//            autoPosition: true,
//            onClose: function (dialog) {
//                if ($("#policyuser button.agree").parent().find("input[type=checkbox]").attr("checked")) {
//                    dialog.data.fadeOut('slow', function () {
//                        dialog.container.slideUp('normal', function () {
//                            dialog.overlay.fadeOut('normal', function () {
//                                $.modal.close();
//                            });
//                        });
//                    });
//                } else {
//                    alert("Please agree with our term condition to register !");
//                    if (!this.dialog.data) {
//                        return false;
//                    }
//                }
//            }
//        });
//        $("#simplemodal-container").css("height", 350 + "px");
//        $("#simplemodal-container").css("width", 700 + "px");
//        var t1 = ($(window).width() - $("#simplemodal-container").width()) / 2;
//        var t2 = ($(window).height() - $("#simplemodal-container").height()) / 2;
//        $("#simplemodal-container").css("top", t2);
//        $("#simplemodal-container").css("left", t1);
//    }
//    $("button.agree").click(function () {
//        if ($(this).parent().find("input[type=checkbox]").attr("checked")) {
//            $.modal.close();
//        } else {
//            alert("Please agree with our term condition to register !");
//        }
//    });


});