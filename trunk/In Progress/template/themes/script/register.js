$(function () {
    var cy = 2011;// lay nam he thong tra vao day
    for (var i = cy; i > cy - 40; i--) {
        $("#freguserclass").append("<option>"+i+"</option>");
    }
    $('form').jqTransform({ imgPath: 'themes/images/' });
});
$(function () {
    $("#ubirthday").datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'dd/mm/yy',
        yearRange: 'c-50:c'
    });

});
function CreateUser() {
    $.ajax({
        url: "Code/Business/AjaxUltilities.ashx?",
        type: "POST",
        dataType: "script",
        data: {
            action: "CreateUser",
            ufname:$("#ufname").val(),
            ulname:$("#ulname").val(),
            uemail:$("#uemail").val(),
            upass:$("#upass").val(),
            ubirthday:$("#ubirthday").val(),
            freguserstate:$("#freguserstate").val(),
            freguserCU:$("#freguserCU").val(),
            freguserclass:$("#freguserclass").val(),

        }
    });
}
function CheckUser() {
    $.ajax({
        url: "Code/Business/AjaxUltilities.ashx?",
        type: "POST",
        dataType: "script",
        data: {
            action: "CheckUser",
            uemail:$("#semail").val()
        }
    });
}
function ckcap(field, rules, i, options) {
    if ($("#veryu").text() != field.val()) {
        return options.allrules.ckcap.alertText;
    }
}
function ckcaps(field, rules, i, options) {
    if ($("#verys").text() != field.val()) {
        return options.allrules.ckcap.alertText;
    }
}
function ckmk(field, rules, i, options) {
    if ($("#upass").val() != field.val()) {
        return options.allrules.cfpass.alertText;
    }
}
function cksmk(field, rules, i, options) {
    if ($("#spass").val() != field.val()) {
        return options.allrules.cfpass.alertText;
    }
}
function cksm(field, rules, i, options) {
    if ($("#semail").val() != field.val()) {
        return options.allrules.cfemail.alertText;
    }
}

$(document).ready(function () {

    $('#veryu').text(genr(6));
    $('#veryu').css('background-position', 'left ' + Math.random() * 500 + 'px');
    $('#veryu').click(function () {
        $('#veryu').text(genr(6));
        $('#veryu').css('background-position', 'left ' + Math.random() * 500 + 'px');
    });
    $('#verys').text(genr(6));
    $('#verys').css('background-position', 'left ' + Math.random() * 500 + 'px');
    $('#verys').click(function () {
        $('#verys').text(genr(6));
        $('#verys').css('background-position', 'left ' + Math.random() * 500 + 'px');
    });
    var type = querySt("type");
    if (type == "shop") {
        $("#reguser").remove();
        $("#fregshop").validationEngine('attach', { promptPosition: "centerRight", autoPositionUpdate: true,ajaxFormValidation:true, });
        $("#policyshop").modal({
            opacity: 40,
            close: false,
            autoPosition: true,
            onClose: function (dialog) {
                if ($("#policyshop button.agree").parent().find("input[type=checkbox]").attr("checked")) {
                    dialog.data.fadeOut('slow', function () {
                        dialog.container.slideUp('normal', function () {
                            dialog.overlay.fadeOut('normal', function () {
                                $.modal.close();
                            });
                        });
                    });
                } else {
                    alert("Please agree with our term condition to register !");
                    if (!this.dialog.data) {
                        return false;
                    }
                }
            }
        });
        $("#simplemodal-container").css("height", 350 + "px");
        $("#simplemodal-container").css("width", 700 + "px");
        var t1 = ($(window).width() - $("#simplemodal-container").width()) / 2;
        var t2 = ($(window).height() - $("#simplemodal-container").height()) / 2;
        $("#simplemodal-container").css("top", t2);
        $("#simplemodal-container").css("left", t1);
    }
    else {
        $("#regshop").remove();
        $("#freguser").validationEngine('attach', { promptPosition: "centerRight", autoPositionUpdate: true });
        $("#policyuser").modal({
            opacity: 40,
            close: false,
            autoPosition: true,
            onClose: function (dialog) {
                if ($("#policyuser button.agree").parent().find("input[type=checkbox]").attr("checked")) {
                    dialog.data.fadeOut('slow', function () {
                        dialog.container.slideUp('normal', function () {
                            dialog.overlay.fadeOut('normal', function () {
                                $.modal.close();
                            });
                        });
                    });
                } else {
                    alert("Please agree with our term condition to register !");
                    if (!this.dialog.data) {
                        return false;
                    }
                }
            }
        });
        $("#simplemodal-container").css("height", 350 + "px");
        $("#simplemodal-container").css("width", 700 + "px");
        var t1 = ($(window).width() - $("#simplemodal-container").width()) / 2;
        var t2 = ($(window).height() - $("#simplemodal-container").height()) / 2;
        $("#simplemodal-container").css("top", t2);
        $("#simplemodal-container").css("left", t1);
    }
    $("button.agree").click(function () {
        if ($(this).parent().find("input[type=checkbox]").attr("checked")||$(this).parent().find("center strong").text()=="Conguration!") {
            $.modal.close();
        } else {
            alert("Please agree with our term condition to register !");
        }
    });


});