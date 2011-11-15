<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CKEditorNet.aspx.cs" Inherits="Demo.CKEditorNet" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <CKEditor:CKEditorControl ID="CKENet" runat="server" Height="200" DefaultLanguage="Vi"></CKEditor:CKEditorControl>
        <br />
        <asp:Button ID="btnPostData" runat="server" Text="Post Data" 
            onclick="btnPostData_Click" />
    </div>
    </form>
</body>
</html>
