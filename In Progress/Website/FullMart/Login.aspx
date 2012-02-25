<%@ Page Title="" Language="C#" MasterPageFile="~/OneColumn.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="FullMart.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="formPanel" runat="server">
   <div class="center b loginform" >
        <asp:Login ID="loginPanel" CssClass="center b bgwt" OnAuthenticate="loginPanel_Authenticate" DestinationPageUrl="~/Default.aspx" runat="server">
            <LayoutTemplate>
                <table cellpadding="0" style="padding:0px 20px">
                                <tr>
                                    <td align="center" colspan="2">Log In</td>
                                    
                                </tr>
                                <tr>
                                    <td align="right">
                                        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                            ControlToValidate="UserName" ErrorMessage="User Name is required." 
                                            ToolTip="User Name is required." ValidationGroup="loginPanel">* Please input your Username</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                            ControlToValidate="Password" ErrorMessage="Password is required." 
                                            ToolTip="Password is required." ValidationGroup="loginPanel">* Please input your Password</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:CheckBox ID="RememberMe" runat="server" Text="" /> Remember me next time.
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2" style="color:Red;">
                                        <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" colspan="2">
                                        <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" 
                                            ValidationGroup="loginPanel" />
                                    </td>
                                </tr>
                                <tr>
                                    <td><a href=" "</td>
                                </tr>
                            </table>
                            Administrator: vunam4; Shop: vunam2; Member:vunam, vunam1, vunam3<br />
                                    pass : qweqwe1
            </LayoutTemplate>
        </asp:Login>
    </div>
</asp:Content>
