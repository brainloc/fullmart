function fillviewUser(email, fname, lname, birthday, state, CU, cls, createdate, yahoo, mobile, shopname, web, role, wishlist) {
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
   
    $(".outstanding").change(function () {
        $.ajax({
            url: "Code/Business/AjaxUltilities.ashx?",
            type: "GET",
            dataType: "script",
            data: {
                action: "ProductOutStanding",
                productID: $(this).parents("tr").find("td").first().text()
            }
        });
        $("#nmes").fadeIn().delay(3000).fadeOut();
    });
    $("#Usert td .Udelete").click(function () {
        $("#cfdelete span").text($.trim($(this).parents("tr").find("td").first().text()));
        showdialog("", 500, 100, "#cfdelete", true);
        return false;
    });
    $(".MProduct table td .cmdUser .Udelete").click(function () {
        $("#cfdeletep span").html($.trim($(this).parents("tr").find("td:nth-child(2)").text()) + " Post date : " + $(this).parents("tr").find("td:nth-child(3)").text() + "<br /> By : " + $(this).parents("tr").find("td:nth-child(4)").text());
        $("#cfdeletep input[type=hidden]").val($.trim($(this).parents("tr").find("td:nth-child(1)").text()));
        showdialog("", 500, 100, "#cfdeletep", true);
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
            //this line code use to return
            $("#cfdelete").hide(); $(".simplemodal-wrap").append("<div class='simplemodal-data'><center>User Deleted !</center></div>");
            resizeDA(250, 30);
        } else {
            $.modal.close();
        }
        return false;
    });
    $("#cfdeletep button").click(function () {
        if ($(this).text() == "Yes") {
            $.ajax({
                url: "Code/Business/AjaxUltilities.ashx?",
                type: "GET",
                dataType: "script",
                data: {
                    action: "delproduct",
                    ID: $("#cfdeletep input[type=hidden]").val()
                }
            });
            //this line code use to return
            $("#cfdelete").hide(); $(".simplemodal-wrap").append("<div class='simplemodal-data'><center>Product Deleted !</center></div>");
            resizeDA(250, 30);
        } else {
            $.modal.close();
        }
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
    $("#Usert td .Uedit").click(function () {
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
    $("#Usert td .Uview").click(function () {
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
        $(this).find("ul").delay(600).slideUp();
    });
    $(".insstate ul li span").click(function () {
        $(this).parents(".insstate").find("input:text").val($(this).text());
        $(this).parents(".insstate").find("input:text").css("color", "#000");
        $(".insstate ul").slideUp("normal");
    });

    focusout("#INSState", "Press 'Enter' to insert");
    focusout("#INSCAT", "Press 'Enter' to insert");
    focusout("#INSSUBCAT", "Press 'Enter' to insert");
    focusout("#SUser", "Enter Email to search user");
    focusout("#SProduct", "Enter Email to search user's product");
    focusout("#searchPID", "Search by Product's ID");

    function insertSC(type, content) {
        $.ajax({
            url: "Code/Business/AjaxUltilities.ashx?",
            type: "GET",
            dataType: "script",
            data: {
                action: type,
                arg: content
            }
        });
    }
    function delSC(type, content) {
        $.ajax({
            url: "Code/Business/AjaxUltilities.ashx?",
            type: "GET",
            dataType: "script",
            data: {
                action: type,
                arg: content
            }
        });
    }
    $("#INSState").keypress(function (data) {
        if (data.which == 13) {
            alert('gọi ajax insert');
            insertSC("insertState", $("#INSState").val());
            //$(".state").prepend("<li><span>" + $("#INSState").val() + "</span><button onclick=\"delSC('delState','" + $("#INSState").val() + "')\" class='delState' title='Delete' title='Delete'></button></li>");
            $("#INSState").val("");
        }
    });
    $("#INSCAT").keypress(function (data) {
        var tmp = $("#INSCAT").val();
        if (data.which == 13) {
            alert('gọi ajax insert');
            insertSC("insertcat", tmp);
            //$(".maincat").prepend("<li><span>" + tmp + "</span><button onclick=\"delSC('delMainCat','" + tmp + "');$(this).parent().remove();\" class='delState' title='Delete' title='Delete'></button></li>");
            $("#INSCAT").val("");
        }
    });
    $("#INSSUBCAT").keypress(function (data) {
        if (data.which == 13) {
            if ($("#INSCAT").val() != "" && $("#INSCAT").val() != "Press 'Enter' to insert") {
                alert('gọi ajax insert');
                $.ajax({
                    url: "Code/Business/AjaxUltilities.ashx?",
                    type: "GET",
                    dataType: "script",
                    data: {
                        action: "insertsubcat",
                        maincategory: $("#INSCAT").val(),
                        subcategory: $("#INSSUBCAT").val()
                    }
                });
                //$(".subcat").prepend("<li><span>" + $("#INSState").val() + "</span><button onclick=\"delSC('delSubCat','" + $("#INSSUBCAT").val() + "')\" class='delState' title='Delete' title='Delete'></button></li>");
                $("#INSSUBCAT").val("");
                return false;
            } else {
                alert("Please Input or select main categories");
            }
        }
    });
    $(".state .delState").click(function () {
        alert("delete ajax state : " + $(this).parent().find("span").text());
        delSC("delState", $(this).parent().find("span").text());
        $(this).parents("li").remove();
    });
    $(".maincat .delState").click(function () {
        alert("delete ajax state : " + $(this).parent().find("span").text());
        delSC("delMainCat", $(this).parent().find("span").text());
        $(this).parents("li").remove();
    });
    $(".subcat .delState").click(function () {
        alert("delete ajax state : " + $(this).parent().find("span").text());
        delSC("delSubCat", $(this).parent().find("span").text());
        $(this).parents("li").remove();
    });
});