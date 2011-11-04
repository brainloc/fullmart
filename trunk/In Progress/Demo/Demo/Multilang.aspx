﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Multilang.aspx.cs" Inherits="Demo.Multilang" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label><br />
        <asp:Button ID="Button1" runat="server" 
            Text="<%$ Resources:LocalizedText, Label1 %>" />
            <br />
            <table><tr><td><a href="?lang=en"><img src="img/ca.jpg" /></a></td><td><a href="?lang=vi"><img src="img/cv.jpg" /></a></td></tr></table>
    </div>
    </form>
</body>
</html>
