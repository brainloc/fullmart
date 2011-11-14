<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MNews.Models.LogOnModel>" %>

<asp:Content ID="loginTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Log On
</asp:Content>

<asp:Content ID="loginContent" ContentPlaceHolderID="MainContent" runat="server">
    
  <div style="text-align:center; background-color:White; border: 2px solid blue"> 
   

    <% using (Html.BeginForm()) { %>
        <%: Html.ValidationSummary(true, "Đăng nhập không thành công. ") %>
        <div >
            <fieldset>
                
                <div class="editor-label">
                    Tài khoản
                    <%: Html.TextBoxFor(m => m.UserName) %>
                    <%: Html.ValidationMessageFor(m => m.UserName) %>
                </div>
                
                <div class="editor-label">
                    Mật khẩu
                    <%: Html.PasswordFor(m => m.Password) %>
                    <%: Html.ValidationMessageFor(m => m.Password) %>
                </div>
                
                <div class="editor-label">
                    <%: Html.CheckBoxFor(m => m.RememberMe) %>
                    Ghi nhớ
                </div>
                
                <p>
                    <input type="submit" value="Đăng nhập" />
                </p>
            </fieldset>
        </div>
    <% } %>
    </div>
</asp:Content>
