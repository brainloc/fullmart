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
                username: $.trim(a.parents(".viewU").find(".tUser").text()),
                email: a.parents(".viewU").find(".VUEmail").val(),
                pass: a.parents(".viewU").find(".VUPass").val(),
                fname: a.parents(".viewU").find(".VUFName").val(),
                lname: a.parents(".viewU").find(".VULName").val(),
                birthday: a.parents(".viewU").find(".VUBday").val(),
                state: a.parents(".viewU").find(".VUState").val(), /*location*/
                CU: a.parents(".viewU").find(".VUCU").val(), /*university*/
                cls: a.parents(".viewU").find(".VUClass").val(),
                yahoo: a.parents(".viewU").find(".VUYahoo").val(),
                mobile: a.parents(".viewU").find(".VUMobile").val(),
                /*shopname: a.parents(".viewU").find(".VUShopName").val(),*/
                web: a.parents(".viewU").find(".VUWeb").val(),
                role: a.parents(".viewU").find(".VURole").val(),
                wishlist: a.parents(".viewU").find(".VUWishlist").val()
            }
            });
    
    }
    return false;
}
function btshop(a) {
    if ($.trim(a.text()) != "SAVE") {
        $.modal.close();
    } else {
        $.ajax({
            url: "/Code/Business/AjaxUltilities.ashx?",
            type: "POST",
            dataType: "script",
            data: {
                action: "EditUser",
                username: $.trim(a.parents(".viewU").find(".tUser").text()),
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
function catUpdate(ID, Name, Order) {
    $("#waitloader").show();
    $.ajax({
        url: "/Code/Business/AjaxUltilities.ashx?",
        type: "POST",
        dataType: "script",
        data: {
            action: "CatsUpdate",
            ID: ID,
            Name: Name,
            Order: Order
        }
    });
    $(".insertNameCates").val("Press 'Enter' to insert");
    $(".insertOrderCates").val("...");
    $(".insertOrderCates,.insertNameCates").css("color", "silver");
    $("#waitloader").hide();
}
function stateUpdate(ID, Name, Order) {
    $("#waitloader").show();
    $.ajax({
        url: "/Code/Business/AjaxUltilities.ashx?",
        type: "POST",
        dataType: "script",
        data: {
            action: "StateUpdate",
            ID: ID,
            Name: Name,
            Order: Order
        }
    });
    $(".insertNameCates").val("Press 'Enter' to insert");
    $(".insertOrderCates").val("...");
    $(".insertOrderCates,.insertNameCates").css("color", "silver");
    $("#waitloader").hide();
}
function subStateUpdate(ID, Name, Order) {
    $("#waitloader").show();
    $.ajax({
        url: "/Code/Business/AjaxUltilities.ashx?",
        type: "POST",
        dataType: "script",
        data: {
            action: "subStateUpdate",
            ID: ID,
            Name: Name,
            Order: Order
        }
    });
    $(".insertNameCates").val("Press 'Enter' to insert");
    $(".insertOrderCates").val("...");
    $(".insertOrderCates,.insertNameCates").css("color", "silver");
    $("#waitloader").hide();
}
function subCatsUpdate(ID, Name, Order) {
    $("#waitloader").show();
    $.ajax({
        url: "/Code/Business/AjaxUltilities.ashx?",
        type: "POST",
        dataType: "script",
        data: {
            action: "subCatsUpdate",
            ID: ID,
            Name: Name,
            Order: Order
        }
    });
    $(".insertNameCates").val("Press 'Enter' to insert");
    $(".insertOrderCates").val("...");
    $(".insertOrderCates,.insertNameCates").css("color", "silver");
    $("#waitloader").hide();
}
$(document).ready(function () {
    //    $(".mmsh").click(function () {
    //        $(this).parent().find(".subM").slideToggle("normal");
    //        return false;
    //    });

    //    $("#lUser").tablesorter();
    $(".tbcates .insertNameCates").change(function () {
        if ($.trim($(this).val()) != "Press 'Enter' to insert" && $.trim($(this).val()) != "") {
            $(".tbcates .insertOrderCates").val($("table.tbcates tbody tr").length + 1);
            $(".tbcates .insertOrderCates").css("color", "black");
        }
    });
    $(".tbstates .insertNameCates").change(function () {
        if ($.trim($(this).val()) != "Press 'Enter' to insert" && $.trim($(this).val()) != "") {
            $(".tbstates .insertOrderCates").val($("table.tbstates tbody tr").length + 1);
            $(".tbstates .insertOrderCates").css("color", "black");
        }
    });
    $(".MProduct table input:checkbox").change(function () {
        $("#waitloader").show();
        var ID = $(this).attr("ref");
        var OS = false;
        if ($(this).is(':checked')) {
            OS = true;
        }
        $.ajax({
            url: "/Code/Business/AjaxUltilities.ashx?",
            type: "POST",
            dataType: "script",
            data: {
                action: "OutstandProduct",
                ID: ID,
                OS: OS
            }
        });
        $("#waitloader").hide();
    });
    $(".tbcates .insertNameCates").keydown(function (data) {
        var charCode = (data.which) ? data.which : data.keyCode
        if ($.trim($(this).val()) != "Press 'Enter' to insert" && $.trim($(this).val()) != "") {
            $(".tbcates .insertOrderCates").val($("table.tbcates tbody tr").length + 1);
            $(".tbcates .insertOrderCates").css("color", "black");
        }
        if (charCode == 13) {
            if ($.trim($(".tbcates .insertNameCates").val()) != "Press 'Enter' to insert" && $.trim($(".tbcates .insertNameCates").val()) != "") {
                var name = $.trim($(".tbcates .insertNameCates").val());
                var order = $("table.tbcates tbody tr").length + 1;
                if ($(".tbcates .insertOrderCates").val() == "..." || $(".tbcates .insertOrderCates").val() == "") {
                    $(".tbcates .insertOrderCates").val(order);
                } else {
                    order = $(".tbcates .insertOrderCates").val();
                }
                $(".tbcates .insertOrderCates").css("color", "black");
                $("#waitloader").show();
                $.ajax({
                    url: "/Code/Business/AjaxUltilities.ashx?",
                    type: "POST",
                    dataType: "script",
                    data: {
                        action: "InsertCategories",
                        Name: name,
                        Order: order
                    }
                });
                $("#waitloader").hide();
            } else {
                $(".insertOrderCates").val("...");
                $(".insertOrderCates").css("color", "silver");
            }
            return false;
        }
    });
    $(".tbstates .insertNameCates").keydown(function (data) {
        var charCode = (data.which) ? data.which : data.keyCode
        if ($.trim($(this).val()) != "Press 'Enter' to insert" && $.trim($(this).val()) != "") {
            $(".tbstates .insertOrderCates").val($("table.tbstates tbody tr").length + 1);
            $(".tbstates .insertOrderCates").css("color", "black");
        }
        if (charCode == 13) {
            if ($.trim($(".tbstates .insertNameCates").val()) != "Press 'Enter' to insert" && $.trim($(".tbstates .insertNameCates").val()) != "") {
                var name = $.trim($(".tbstates .insertNameCates").val());
                var order = $("table.tbstates tbody tr").length + 1;
                if ($(".tbstates .insertOrderCates").val() == "..." || $(".tbstates .insertOrderCates").val() == "") {
                    $(".tbstates .insertOrderCates").val(order);
                } else {
                    order = $(".tbstates .insertOrderCates").val();
                }
                $(".tbstates .insertOrderCates").css("color", "black");
                $("#waitloader").show();
                $.ajax({
                    url: "/Code/Business/AjaxUltilities.ashx?",
                    type: "POST",
                    dataType: "script",
                    data: {
                        action: "InsertState",
                        Name: name,
                        Order: order
                    }
                });
                $("#waitloader").hide();
            } else {
                $(".insertOrderCates").val("...");
                $(".insertOrderCates").css("color", "silver");
            }
            return false;
        }
    });
    $(".tbcates tbody").delegate("tr td:nth-child(2) input", "keydown", function (data) {
        var charCode = (data.which) ? data.which : data.keyCode
        if (charCode == 13) {
            var id = $(this).attr("ref");
            var Order = $(this).val();
            var Name = $(this).parents("tr").find("td:nth-child(1) input").val();
            catUpdate(id, Name, Order);
            return false;
        }
        else {
            if (charCode > 31 && (charCode < 48 || charCode > 57)) { return false; } else { return true; }
        }
        return false;
    });
    $(".tbstates tbody").delegate("tr td:nth-child(2) input", "keydown", function (data) {
        var charCode = (data.which) ? data.which : data.keyCode
        if (charCode == 13) {
            var id = $(this).attr("ref");
            var Order = $(this).val();
            var Name = $(this).parents("tr").find("td:nth-child(1) input").val();
            stateUpdate(id, Name, Order);
            return false;
        }
        else {
            if (charCode > 31 && (charCode < 48 || charCode > 57)) { return false; } else { return true; }
        }
        return false;
    });
    $(".tbcates tbody").delegate("tr td:nth-child(1) input", "keydown", function (data) {
        var charCode = (data.which) ? data.which : data.keyCode
        if (charCode == 13) {
            var id = $(this).attr("ref");
            var Name = $(this).val();
            var Order = $(this).parents("tr").find("td:nth-child(2) input").val();
            catUpdate(id, Name, Order);
            return false;
        }
    });
    $(".tbstates tbody").delegate("tr td:nth-child(1) input", "keydown", function (data) {
        var charCode = (data.which) ? data.which : data.keyCode
        if (charCode == 13) {
            var id = $(this).attr("ref");
            var Name = $(this).val();
            var Order = $(this).parents("tr").find("td:nth-child(2) input").val();
            stateUpdate(id, Name, Order);
            return false;
        }
    });
    $(".tbcates tbody").delegate(".catDel", "click", function () {
        var idc = $(this).attr("ref");
        if (confirm("Do you want to delete : " + $(this).parents("tr").find("td:nth-child(1) input").val())) {
            $("#waitloader").show();
            $.ajax({
                url: "/Code/Business/AjaxUltilities.ashx?",
                type: "POST",
                dataType: "script",
                data: {
                    action: "CatsDel",
                    ID: idc
                }
            });
            $("#waitloader").hide();
            $(this).parents("tr").remove();
        }
        return false;
    });
    $(".tbstates tbody").delegate(".sDel", "click", function () {
        var idc = $(this).attr("ref");
        if (confirm("Do you want to delete : " + $(this).parents("tr").find("td:nth-child(1) input").val())) {
            $("#waitloader").show();
            $.ajax({
                url: "/Code/Business/AjaxUltilities.ashx?",
                type: "POST",
                dataType: "script",
                data: {
                    action: "StateDel",
                    ID: idc
                }
            });
            $("#waitloader").hide();
            $(this).parents("tr").remove();
        }
        return false;
    });
    $(".tbcates tbody").delegate(".bindSubCate", "click", function () {
        var idc = $(this).attr("ref");
        $("#waitloader").show();
        $('.tbsubcates tbody').empty();
        $.ajax({
            url: "/Code/Business/AjaxUltilities.ashx?",
            type: "POST",
            dataType: "script",
            data: {
                action: "GetSubCategoriesByCatID1",
                ID: idc,
                Target: ".tbsubcates tbody"
            }
        });
        $("#waitloader").hide();
        return false;
    });
    $(".tbstates tbody").delegate(".bindSubCate", "click", function () {
        var idc = $(this).attr("ref");
        $("#waitloader").show();
        $('.tbsubstates tbody').empty();
        $.ajax({
            url: "/Code/Business/AjaxUltilities.ashx?",
            type: "POST",
            dataType: "script",
            data: {
                action: "GetSubStateByID",
                ID: idc,
                Target: ".tbsubstates tbody"
            }
        });
        $("#waitloader").hide();
        return false;
    });
    $(".tbsubcates .insertNameCates").change(function () {
        if ($.trim($(this).val()) != "Press 'Enter' to insert" && $.trim($(this).val()) != "") {
            $(".tbsubcates .insertOrderCates").val($("table.tbsubcates tbody tr").length + 1);
            $(".tbsubcates .insertOrderCates").css("color", "black");
        }
    });
    $(".tbsubstates .insertNameCates").change(function () {
        if ($.trim($(this).val()) != "Press 'Enter' to insert" && $.trim($(this).val()) != "") {
            $(".tbsubstates .insertOrderCates").val($("table.tbsubstates tbody tr").length + 1);
            $(".tbsubstates .insertOrderCates").css("color", "black");
        }
    });
    $(".tbsubcates .insertNameCates,.tbsubcates .insertOrderCates").keydown(function (data) {
        var charCode = (data.which) ? data.which : data.keyCode
        if (charCode == 13) {
            if ($.trim($(".tbsubcates .insertNameCates").val()) != "Press 'Enter' to insert" && $.trim($(".tbsubcates .insertNameCates").val()) != "") {
                var name = $.trim($(".tbsubcates .insertNameCates").val());
                var order = $("table.tbsubcates tbody tr").length + 1;
                var CatID = -1;
                if ($(".tbsubcates tbody").attr("ref") > 0) {
                    CatID = $(".tbsubcates tbody").attr("ref");
                } else {
                    alert("Please Select Category you want to insert!");
                    $(".insertNameCates").val("Press 'Enter' to insert");
                    $(".insertOrderCates").val("...");
                    $(".insertOrderCates,.insertNameCates").css("color", "silver");
                    return false;
                }
                if ($(".tbsubcates .insertOrderCates").val() == "..." || $(".tbsubcates .insertOrderCates").val() == "") {
                    $(".tbsubcates .insertOrderCates").val(order);
                } else {
                    order = $(".tbsubcates .insertOrderCates").val();
                }
                $(".tbsubcates .insertOrderCates").css("color", "black");
                $("#waitloader").show();
                $.ajax({
                    url: "/Code/Business/AjaxUltilities.ashx?",
                    type: "POST",
                    dataType: "script",
                    data: {
                        action: "InsertSubCategories",
                        CatID: CatID,
                        Name: name,
                        Order: order
                    }
                });
                $(".insertNameCates").val("Press 'Enter' to insert");
                $(".insertOrderCates").val("...");
                $(".insertOrderCates,.insertNameCates").css("color", "silver");
                $("#waitloader").hide();
            } else {
                $(".insertNameCates").val("Press 'Enter' to insert");
                $(".insertOrderCates").val("...");
                $(".insertOrderCates,.insertNameCates").css("color", "silver");
            }
            return false;
        }
    });
    $(".tbsubstates .insertNameCates,.tbsubstates .insertOrderCates").keydown(function (data) {
        var charCode = (data.which) ? data.which : data.keyCode
        if (charCode == 13) {
            if ($.trim($(".tbsubstates .insertNameCates").val()) != "Press 'Enter' to insert" && $.trim($(".tbsubstates .insertNameCates").val()) != "") {
                var name = $.trim($(".tbsubstates .insertNameCates").val());
                var order = $("table.tbsubstates tbody tr").length + 1;
                var CatID = -1;
                if ($(".tbsubstates tbody").attr("ref") > 0) {
                    CatID = $(".tbsubstates tbody").attr("ref");
                } else {
                    alert("Please Select Category you want to insert!");
                    $(".insertNameCates").val("Press 'Enter' to insert");
                    $(".insertOrderCates").val("...");
                    $(".insertOrderCates,.insertNameCates").css("color", "silver");
                    return false;
                }
                if ($(".tbsubstates .insertOrderCates").val() == "..." || $(".tbsubstates .insertOrderCates").val() == "") {
                    $(".tbsubstates .insertOrderCates").val(order);
                } else {
                    order = $(".tbsubstates .insertOrderCates").val();
                }
                $(".tbsubstates .insertOrderCates").css("color", "black");
                $("#waitloader").show();
                $.ajax({
                    url: "/Code/Business/AjaxUltilities.ashx?",
                    type: "POST",
                    dataType: "script",
                    data: {
                        action: "InsertSubState",
                        ID: CatID,
                        Name: name,
                        Order: order
                    }
                });
                $(".insertNameCates").val("Press 'Enter' to insert");
                $(".insertOrderCates").val("...");
                $(".insertOrderCates,.insertNameCates").css("color", "silver");
                $("#waitloader").hide();
            } else {
                $(".insertNameCates").val("Press 'Enter' to insert");
                $(".insertOrderCates").val("...");
                $(".insertOrderCates,.insertNameCates").css("color", "silver");
            }
            return false;
        }
    });
    $(".tbsubcates tbody").delegate("tr td:nth-child(2) input", "keydown", function (data) {
        var charCode = (data.which) ? data.which : data.keyCode
        if (charCode == 13) {
            var id = $(this).attr("ref");
            var Order = $(this).val();
            var Name = $(this).parents("tr").find("td:nth-child(1) input").val();
            subCatsUpdate(id, Name, Order);
            return false;
        }
        else {
            if (charCode > 31 && (charCode < 48 || charCode > 57)) { return false; } else { return true; }
        }
        return false;
    });
    $(".tbsubstates tbody").delegate("tr td:nth-child(2) input", "keydown", function (data) {
        var charCode = (data.which) ? data.which : data.keyCode
        if (charCode == 13) {
            var id = $(this).attr("ref");
            var Order = $(this).val();
            var Name = $(this).parents("tr").find("td:nth-child(1) input").val();
            subStateUpdate(id, Name, Order);
            return false;
        }
        else {
            if (charCode > 31 && (charCode < 48 || charCode > 57)) { return false; } else { return true; }
        }
        return false;
    });
    $(".tbsubcates tbody").delegate("tr td:nth-child(1) input", "keydown", function (data) {
        var charCode = (data.which) ? data.which : data.keyCode
        if (charCode == 13) {
            var id = $(this).attr("ref");
            var Name = $(this).val();
            var Order = $(this).parents("tr").find("td:nth-child(2) input").val();
            subcatUpdate(id, Name, Order);
            return false;
        }
    });
    $(".tbsubstates tbody").delegate("tr td:nth-child(1) input", "keydown", function (data) {
        var charCode = (data.which) ? data.which : data.keyCode
        if (charCode == 13) {
            var id = $(this).attr("ref");
            var Name = $(this).val();
            var Order = $(this).parents("tr").find("td:nth-child(2) input").val();
            subStateUpdate(id, Name, Order);
            return false;
        }
    });
    $(".tbsubcates tbody").delegate(".catDel", "click", function () {
        var idc = $(this).attr("ref");
        if (confirm("Do you want to delete : " + $(this).parents("tr").find("td:nth-child(1) input").val())) {
            $("#waitloader").show();
            $.ajax({
                url: "/Code/Business/AjaxUltilities.ashx?",
                type: "POST",
                dataType: "script",
                data: {
                    action: "SubCatsDel",
                    ID: idc
                }
            });
            $("#waitloader").hide();
            $(this).parents("tr").remove();
        }
        return false;
    });
    $(".tbsubstates tbody").delegate(".sDel", "click", function () {
        var idc = $(this).attr("ref");
        if (confirm("Do you want to delete : " + $(this).parents("tr").find("td:nth-child(1) input").val())) {
            $("#waitloader").show();
            $.ajax({
                url: "/Code/Business/AjaxUltilities.ashx?",
                type: "POST",
                dataType: "script",
                data: {
                    action: "SubStateDel",
                    ID: idc
                }
            });
            $("#waitloader").hide();
            $(this).parents("tr").remove();
        }
        return false;
    });
    $("table.tbcates tbody").delegate("tr td:nth-child(2) input", "blur", function () {
        var trl = $("table.tbcates tbody tr");
        var num = trl.length;
        var id = $(this).attr("ref");
        var order = $(this).val();
        for (var i = 0; i <= num; i++) {
            if ($(trl[i]).find("td:nth-child(2) input").val() == order && $(trl[i]).find("td:nth-child(2) input").attr("ref") != id) {
                $(trl[i]).find("td:nth-child(2) input").select();
                i = 0;
                break;
            }
        }
    });
    $("table.tbstates tbody").delegate("tr td:nth-child(2) input", "blur", function () {
        var trl = $("table.tbstates tbody tr");
        var num = trl.length;
        var id = $(this).attr("ref");
        var order = $(this).val();
        for (var i = 0; i <= num; i++) {
            if ($(trl[i]).find("td:nth-child(2) input").val() == order && $(trl[i]).find("td:nth-child(2) input").attr("ref") != id) {
                $(trl[i]).find("td:nth-child(2) input").select();
                i = 0;
                break;
            }
        }
    });
    focusoutc("table.tbcates tr.insertCates input");
    focusoutc("table.tbsubcates tr.insertCates input");
    focusoutc("table.tbstates tr.insertCates input");
    focusoutc("table.tbsubstates tr.insertCates input");
    $(".BrowseServer").click(function () {
        var finder = new CKFinder();
        finder.basePath = '/ckfinder/'; // The path for the installation of CKFinder (default = "/ckfinder/").
        finder.selectActionFunction = SetFileField;
        finder.popup();
        return false;
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
    $(".shopS td .Uedit").click(function () {
        $(this).parents("td").find(".viewU tfoot center button").text("SAVE");
        $(this).parents("td").find(".shoprate select").val($(this).parents("td").find(".shoprate select").attr("ref"));
        showdialog($(this).parents("td").find(".detailU").html(), 800, 180, "", true);
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
    //    $("#INSState").keypress(function (data) {
    //        if (data.which == 13) {
    //            alert('gọi ajax insert');
    //            insertSC("insertState", $("#INSState").val());
    //            //$(".state").prepend("<li><span>" + $("#INSState").val() + "</span><button onclick=\"delSC('delState','" + $("#INSState").val() + "')\" class='delState' title='Delete' title='Delete'></button></li>");
    //            $("#INSState").val("");
    //            return false;
    //        }
    //    });
    //    $("#INSCAT").keypress(function (data) {
    //        if (data.which == 13) {
    //            var tmp = $("#INSCAT").val();
    //            alert(tmp);
    //            //insertSC("insertcat", tmp);
    //            $(".maincat").prepend("<li><span>" + tmp + "</span><button onclick=\"delSC('delMainCat','" + tmp + "');$(this).parent().remove();\" class='delState' title='Delete' title='Delete'></button></li>");
    //            $("#INSCAT").val("");
    //            return false;
    //        }
    //    });
    //    $("#INSSUBCAT").keypress(function (data) {
    //        if (data.which == 13) {
    //            if ($("#INSCAT").val() != "" && $("#INSCAT").val() != "Press 'Enter' to insert") {
    //                alert('gọi ajax insert');
    //                $.ajax({
    //                    url: "/Code/Business/AjaxUltilities.ashx?",
    //                    type: "POST",
    //                    dataType: "script",
    //                    data: {
    //                        action: "insertsubcat",
    //                        maincategory: $("#INSCAT").val(),
    //                        subcategory: $("#INSSUBCAT").val()
    //                    }
    //                });
    //                //$(".subcat").prepend("<li><span>" + $("#INSState").val() + "</span><button onclick=\"delSC('delSubCat','" + $("#INSSUBCAT").val() + "')\" class='delState' title='Delete' title='Delete'></button></li>");
    //                $("#INSSUBCAT").val("");
    //                return false;
    //            } else {
    //                alert("Please Input or select main categories");
    //            }
    //            return false;
    //        }
    //    });
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