﻿function fillviewUser(email, fname, lname, birthday, state, CU, cls, createdate, yahoo, mobile, shopname, web, role, wishlist) {
    $("#tUser").text(email); $("#VUEmail").val(email); $("#VUFName").val(fname); $("#VULName").val(lname); $("#VUBday").val(birthday); $("#VUState").val(state); $("#VUCU").val(CU); $("#VUClass").val(cls);
    $("#VUCreatedate").val(createdate); $("#VUYahoo").val(yahoo); $("#VUMobile").val(mobile); $("#VUShopName").val(shopname); $("#VUWeb").val(web); $("#VUWishlist").val(wishlist);
    $("#VURole").val(role);
}
$(document).ready(function () {
    //    $(".mmsh").click(function () {
    //        $(this).parent().find(".subM").slideToggle("normal");
    //        return false;
    //    });

    //    $("#lUser").tablesorter();
    $("td .Udelete").click(function () {
        $("#cfdelete span").text($.trim($(this).parents("tr").find("td").first().text()));
        showdialog("", 500, 100, "#cfdelete", true);
        return false;
    });
    $("#cfdelete button").click(function () {
        if ($(this).text() == "Yes") {
            $.ajax({
                url: "Code/Business/AjaxUltilities.ashx?",
                type: "GET",
                dataType: "script",
                data: {
                    action: "delUser",
                    email: $.trim($("#cfdelete span").text())
                }
            });
        }
        //this line code use to return
        $("#cfdelete").hide(); $(".simplemodal-wrap").append("<div class='simplemodal-data'><center>User Deleted !</center></div>");

        resizeDA(250, 30);
        return false;
    });
    $("#viewU tfoot center button").click(function () {
        if ($(this).text() != "SAVE") {
            $.modal.close();
            return false;
        } else {
            $.ajax({
                url: "Code/Business/AjaxUltilities.ashx?",
                type: "POST",
                dataType: "script",
                data: {
                    action: "updateUserInfor",
                    email: $("#VUEmail").val(),
                    fname: $("#VUFName").val(),
                    lname: $("#VULName").val(),
                    birthday: $("#VUBday").val(),
                    state: $("#VUState").val(),
                    CU: $("#VUCU").val(),
                    cls: $("#VUClass").val(),
                    createdate: $("#VUCreatedate").val(),
                    yahoo: $("#VUYahoo").val(),
                    mobile: $("#VUMobile").val(),
                    shopname: $("#VUShopName").val(),
                    web: $("#VUWeb").val(),
                    role: $("#VURole").val()
                }
            });
            //this line code use to return
            $("#viewU").hide(); $(".simplemodal-wrap").append("<div class='simplemodal-data'>User's Information Update Successfully !</div>");

            resizeDA(250, 30);
            return false;
        }
    });
    $("td .Uedit").click(function () {
        $("#viewU tfoot center button").text("SAVE");
        $.ajax({
            url: "Code/Business/AjaxUltilities.ashx?",
            type: "GET",
            dataType: "script",
            data: {
                action: "getUserInfor",
                email: $.trim($(this).parents("tr").find("td").first().text())
            }
        });

        //this function use when return user's data
        fillviewUser($.trim($(this).parents("tr").find("td").first().text()), "", "", "", "", "", "", "", "", "", "", "", "Adminitrator", "");
        $("#VUPass").removeAttr("disabled"); $("#VUFName").removeAttr("disabled"); $("#VULName").removeAttr("disabled"); $("#VUBday").removeAttr("disabled"); $("#VUState").removeAttr("disabled"); $("#VUCU").removeAttr("disabled"); $("#VUClass").removeAttr("disabled");
        $("#VUCreatedate").removeAttr("disabled"); $("#VUYahoo").removeAttr("disabled"); $("#VUMobile").removeAttr("disabled"); $("#VUShopName").removeAttr("disabled"); $("#VUWeb").removeAttr("disabled");
        $("#VURole").removeAttr("disabled");
        showdialog("", 800, 480, "#viewU", true);
    });
    $("td .Uview").click(function () {
        $("#viewU tfoot center button").text("CLOSE");
        $.ajax({
            url: "Code/Business/AjaxUltilities.ashx?",
            type: "GET",
            dataType: "script",
            data: {
                action: "getUserInfor",
                email: $.trim($(this).parents("tr").find("td").first().text())
            }
        });
        //this function use when return user's data
        fillviewUser($.trim($(this).parents("tr").find("td").first().text()), "", "", "", "", "", "", "", "", "", "", "", "Adminitrator", "");
        //disabled element
        $("#VUPass").attr('disabled', 'disabled'); $("#VUFName").attr('disabled', 'disabled'); $("#VULName").attr('disabled', 'disabled'); $("#VUBday").attr('disabled', 'disabled'); $("#VUState").attr('disabled', 'disabled'); $("#VUCU").attr('disabled', 'disabled'); $("#VUClass").attr('disabled', 'disabled');
        $("#VUCreatedate").attr('disabled', 'disabled'); $("#VUYahoo").attr('disabled', 'disabled'); $("#VUMobile").attr('disabled', 'disabled'); $("#VUShopName").attr('disabled', 'disabled'); $("#VUWeb").attr('disabled', 'disabled');
        $("#VURole").attr('disabled', 'disabled');
        showdialog("", 800, 480, "#viewU", true);
    });
    $("#Usertab").tabs();
    $(".slobox").click(function () {
        $(this).parent().find("ul").slideToggle("normal");
        return false;
    });
    $(".insstate").mouseleave(function () {
        $(this).find("ul").slideUp();
    });
    $("#INSState").focus(function () {
        if ($(this).val() == "Press 'Enter' to insert") {
            $(this).val("");
            $(this).css("color", "black");
        }
    });
    $("#INSState").blur(function () {
        if ($(this).val() == "Press 'Enter' to insert" || $(this).val() == "") {
            $(this).val("Press 'Enter' to insert");
            $(this).css("color", "silver");
        }
    });
    $("#SUser").focus(function () {
        if ($(this).val() == "Enter Email to search user") {
            $(this).val("");
            $(this).css("color", "black");
        }
    });
    $("#SUser").blur(function () {
        if ($(this).val() == "Enter Email to search user" || $(this).val() == "") {
            $(this).val("Enter Email to search user");
            $(this).css("color", "silver");
        }
    });
    $("#INSState").keypress(function (data) {
        if (data.which == 13) {
            alert('gọi ajax insert');
            $("#INSState").val("");
        }
    });
    $(".delState").click(function () {
        alert("delete ajax state : " + $(this).parent().find("span").text());
    });
});