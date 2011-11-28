<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AjaxUpdate._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            var imageTab = $("#imageTable");
            var imageArr = new Array();
            imageArr[0] = "Sushi";
            imageArr[1] = "Circle";

            for (var i = 0; i < imageArr.length; i++) {
                imageTab.append(String.format("<tr><td><img src='ImageLoader.ashx?file={0}' /></td></tr>",imageArr[i]));
            }
        });

        String.format = function (text) {
            if (arguments.length <= 1) {                
                return text;
            }            
            var tokenCount = arguments.length - 2;
            for (var token = 0; token <= tokenCount; token++) {                
                text = text.replace(new RegExp("\\{" + token + "\\}", "gi"), arguments[token + 1]);
            }
            return text;
        };
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table id="imageTable">            
        </table>
    </div>
    </form>
</body>
</html>
