
$(document).ready(function () {
    focusoutc(".imgmpreview");
    var iplus = 0;
    $("#imgplus").click(function () {
        var sl = ".imgmpreview:eq(" + iplus + ")";
        $(sl).fadeIn();
        $(sl).next().fadeIn();
        iplus++;
    });
    //    $(".imgmpreview").change(function () {
    //        if (!isUrl($(this).val())) {
    //            $(this).focus();
    //            $(this).val("");
    //            alert("Wrong format url");
    //        }
    //    });
    $(".imgmpreview").click(function () {
        $(this).attr("ref", "active");
        var finder = new CKFinder();
        finder.basePath = '../'; // The path for the installation of CKFinder (default = "/ckfinder/").
        finder.selectActionFunction = SetFileField;
        finder.popup();
    });
    function SetFileField(fileUrl) {
        $(".imgmpreview[ref=active]").val(fileUrl);
        $(".imgmpreview[ref=active]").removeAttr("ref");
    }
});