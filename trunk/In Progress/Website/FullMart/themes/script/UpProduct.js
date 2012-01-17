$(document).ready(function () {
    $("#imageProduct").click(function () {
        var finder = new CKFinder();
        finder.basePath = '../'; // The path for the installation of CKFinder (default = "/ckfinder/").
        finder.selectActionFunction = SetFileField;
        finder.popup();
    });
});
function SetFileField(fileUrl) {
    $("#imageProduct").val(fileUrl);
}