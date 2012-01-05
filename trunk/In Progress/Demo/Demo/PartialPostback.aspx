<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PartialPostback.aspx.cs" Inherits="Demo.PartialPostback" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server">            
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:FileUpload ID="FileUpload1" runat="server" />
                <asp:Button ID="Button1" runat="server" Text="Button" onclick="Button1_Click"/>                
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:Label ID="StatusLabel" runat="server" Text="ádasđ"></asp:Label>
        <asp:Button ID="Button2" runat="server" Text="Page postback" />


        <div>
            <asp:FileUpload ID="FileUpload2" runat="server" />
            <asp:Button ID="Button3" runat="server" Text="Button" onclick="Button3_Click" />
        </div>
    </div>
    </form>
</body>
</html>
