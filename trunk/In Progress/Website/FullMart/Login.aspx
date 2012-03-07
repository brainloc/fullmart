<%@ Page Title="" Language="C#" MasterPageFile="~/OneColumn.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="FullMart.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/themes/style/loginpage.css" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="formPanel" runat="server">
    <div class="center b loginform">
        <div class="lgform">
        <p class="ftitle"><%=FullMart.Code.DAO.BindingUltilities.GetResourceValue("login") %></p>
            <asp:Login ID="loginPanel" CssClass="center b loginform" OnAuthenticate="loginPanel_Authenticate"
                DestinationPageUrl="~/Default.aspx" runat="server">
                <LayoutTemplate>
                    <table cellpadding="0" style="width: 390px; padding: 0px 30px;">
                        <tr>
                            <td>
                                <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName"><%=FullMart.Code.DAO.BindingUltilities.GetResourceValue("username") %>:</asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password"><%=FullMart.Code.DAO.BindingUltilities.GetResourceValue("password") %>:</asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox ID="RememberMe" runat="server" Text="<%$ Resources:LocalizedText, rememberme %>" />
                            </td>
                        </tr>
                        
                        <tr>
                            <td>
                                <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" ValidationGroup="loginPanel" />
                            </td>
                        </tr>
                        <tr>
                            <td class="errorl">
                            <span>
                                <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                </span>
                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                    ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="loginPanel"><%=FullMart.Code.DAO.BindingUltilities.GetResourceValue("pleaseuser") %></asp:RequiredFieldValidator>
                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                    ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="loginPanel"><%=FullMart.Code.DAO.BindingUltilities.GetResourceValue("pleasepass") %></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td> <span><a href="?forget=password"><asp:Label ID="Label1" runat="server" Text="<%$ Resources:LocalizedText, forgotpassword %>"></asp:Label></a></span></td>
                        </tr>
                    </table>
                </LayoutTemplate>
            </asp:Login>
        </div>
    </div>
</asp:Content>
