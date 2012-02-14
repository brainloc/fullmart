function btUser(a) {
    if ($.trim(a.text()) != "SAVE") {
        $.modal.close();
    } else {
        $.ajax({
            url: "/Code/Business/AjaxUltilities.ashx?",
            type: "POST",
            dataType: "script",
            data: {
                action: "EditUser",
                email: a.parents(".viewU").find(".VUEmail").val(),
                pass: a.parents(".viewU").find(".VUPass").val(),
                fname: a.parents(".viewU").find(".VUFName").val(),
                lname: a.parents(".viewU").find(".VULName").val(),
                birthday: a.parents(".viewU").find(".VUBday").val(),
                state: a.parents(".viewU").find(".VUState").val(),
                CU: a.parents(".viewU").find(".VUCU").val(),
                cls: a.parents(".viewU").find(".VUClass").val(),
                yahoo: a.parents(".viewU").find(".VUYahoo").val(),
                mobile: a.parents(".viewU").find(".VUMobile").val(),
                shopname: a.parents(".viewU").find(".VUShopName").val(),
                web: a.parents(".viewU").find(".VUWeb").val(),
                role: a.parents(".viewU").find(".VURole").val(),
                wishlist: a.parents(".viewU").find(".VUWishlist").val()
            }
        });
    }
    return false;
}
function SetFileField(fileUrl) {
    $("input.imgthumb").val(fileUrl);
    $("img.imgthumbN").attr("src", fileUrl);
}
$(document).ready(function () {
    //    $(".mmsh").click(function () {
    //        $(this).parent().find(".subM").slideToggle("normal");
    //        return false;
    //    });

    //    $("#lUser").tablesorter();
    $(".BrowseServer").click(function () {
        var finder = new CKFinder();
        finder.basePath = '/ckfinder/'; // The path for the installation of CKFinder (default = "/ckfinder/").
        finder.selectActionFunction = SetFileField;
        finder.popup();
        return false;
    });
    $(".outstanding").change(function () {
        $.ajax({
            url: "/Code/Business/AjaxUltilities.ashx?",
            type: "POST",
            dataType: "script",
            data: {
                action: "ProductOutStanding",
                productID: $(this).parents("tr").find("td").first().text()
            }
        });
        $("#nmes").fadeIn().delay(3000).fadeOut();
    });
    $(".usereven td .Udelete").click(function () {
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
    $(".MNews table td .cmdUser .Udelete").click(function () {
        $("#cfdeleten span").html($.trim($(this).parents("tr").find("td:nth-child(2)").text()) + " Post date : " + $(this).parents("tr").find("td:nth-child(3)").text() + "<br /> By : " + $(this).parents("tr").find("td:nth-child(4)").text());
        $("#cfdeleten input[type=hidden]").val($.trim($(this).parents("tr").find("td:nth-child(1)").text()));
        showdialog("", 500, 100, "#cfdeleten", true);
        return false;
    });
    $("#cfdelete button").click(function () {
        if ($.trim($(this).text()) == "Yes") {
            $.ajax({
                url: "/Code/Business/AjaxUltilities.ashx?",
                type: "POST",
                dataType: "script",
                data: {
                    action: "delUser",
                    email: $.trim($("#cfdelete span").text())
                }
            });
        } else {
            $.modal.close();
        }
        return false;
    });
    $("#cfdeleten button").click(function () {
        if ($.trim($(this).text()) == "Yes") {
            $.ajax({
                url: "/Code/Business/AjaxUltilities.ashx?",
                type: "POST",
                dataType: "script",
                data: {
                    action: "delNews",
                    ID: $("#cfdeleten input[type=hidden]").val()
                }
            });
        } else {
            $.modal.close();
        }
        return false;
    });
    $("#cfdeletep button").click(function () {
        if ($(this).text() == "Yes") {
            $.ajax({
                url: "/Code/Business/AjaxUltilities.ashx?",
                type: "POST",
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
    $(".usereven td .Uedit").click(function () {
        $(this).parents("td").find(".viewU tfoot center button").text("SAVE");
        showdialog($(this).parents("td").find(".detailU").html(), 800, 480, "", true);
        return false;
    });
    $(".usereven td .Uview").click(function () {
        showdialog($(this).parents("td").find(".detailU").html(), 800, 480, "", true);
        $("#modal .viewU input,.viewU select").attr('disabled', 'disabled');
        return false;
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
    focusoutc(".aip");
    //    focusout("#INSState", "Press 'Enter' to insert");
    //    focusout("#INSCAT", "Press 'Enter' to insert");
    //    focusout("#INSSUBCAT", "Press 'Enter' to insert");
    //    focusout("#SUser", "Enter Email to search user");
    //    focusout("#SProduct", "Enter Email to search user's product");
    focusout("#searchPID", "Search by Product's ID");

    function insertSC(type, content) {
        $.ajax({
            url: "/Code/Business/AjaxUltilities.ashx?",
            type: "POST",
            dataType: "script",
            data: {
                action: type,
                arg: content
            }
        });
    }
    function delSC(type, content) {
        $.ajax({
            url: "/Code/Business/AjaxUltilities.ashx?",
            type: "POST",
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
            return false;
        }
    });
    $("#INSCAT").keypress(function (data) {
        if (data.which == 13) {
            var tmp = $("#INSCAT").val();
            alert(tmp);
            //insertSC("insertcat", tmp);
            $(".maincat").prepend("<li><span>" + tmp + "</span><button onclick=\"delSC('delMainCat','" + tmp + "');$(this).parent().remove();\" class='delState' title='Delete' title='Delete'></button></li>");
            $("#INSCAT").val("");
            return false;
        }
    });
    $("#INSSUBCAT").keypress(function (data) {
        if (data.which == 13) {
            if ($("#INSCAT").val() != "" && $("#INSCAT").val() != "Press 'Enter' to insert") {
                alert('gọi ajax insert');
                $.ajax({
                    url: "/Code/Business/AjaxUltilities.ashx?",
                    type: "POST",
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
            return false;
        }
    });
    $(".state .delState").click(function () {
        alert("delete ajax state : " + $(this).parent().find("span").text());
        delSC("delState", $(this).parent().find("span").text());
        $(this).parents("li").remove();
    });
    //    $(".maincat .delState").click(function () {
    //        alert("delete ajax state : " + $(this).parent().find("span").text());
    //        delSC("delMainCat", $(this).parent().find("span").text());
    //        $(this).parents("li").remove();
    //    });
    //    $(".subcat .delState").click(function () {
    //        alert("delete ajax state : " + $(this).parent().find("span").text());
    //        delSC("delSubCat", $(this).parent().find("span").text());
    //        $(this).parents("li").remove();
    //    });
});