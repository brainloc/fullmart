<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<table cellpadding="0">
    <%
        if (Request.IsAuthenticated)
        {
    %>
    <tr>
        <td>
            Xin chào: <span id='username'>
                <%: Page.User.Identity.Name %></span>
        </td>
        <td>
            <%: Html.ActionLink("Đăng xuất", "LogOff", "Account") %>
        </td>
    </tr>
    <tr>
        <td><a href="/Admin" title='admin'>Quản lý</a></td>
        <td></td>
    </tr>
    <%
        }
        else
        {
    %>
    <% using (Html.BeginForm("LogOn", "Account", FormMethod.Post, "runat=\"server\""))
       {                                         
    %>
    <tr>
        <td style="width: 40px">
            Tài khoản
        </td>
        <td>
            <input type="text" name="UserName" value="" style="width:100%" />
        </td>
    </tr>
    <tr>
        <td style="width: 40px">
            Mật khẩu
        </td>
        <td>
            <input type="password" name="Password" value="" style="width:100%" />
        </td>
    </tr>
    <tr>
        <td colspan="2" style="text-align:right">
            <%: Html.CheckBox("RememberMe")%>
            <%: Html.Label("Ghi nhớ")%>
        </td>
    </tr>
    <tr>
        <td>
            <input type="submit" value="Đăng nhập" />
        </td>
        <td>
            <%: Html.ActionLink("Đăng ký", "Register", "Account")%>
            |
            <%: Html.ActionLink("Quên mật khẩu", "LosePassword", "Account")%>
        </td>
    </tr>
    <% 
        } 
    %>
    <%
        }
    %>
</table>
