<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MNews.Models.MenuViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    MNON - Quản lý menu, thêm xóa sửa thông menu.
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script src="<%= Url.Content("~/Scripts/jquery-1.4.1.js") %>" type="text/javascript"></script>
    <script type="text/javascript" src="<%= Url.Content("~/Scripts/jquery.validate.js") %>"> </script>
    
    <script type="text/javascript">
        $(document).ready(function () {
            $("#frmNewMenu").validate({
                rules: {
                    Title: "required",
                    Url: "required"
                },
                messages: {
                    Title: " Chưa có dữ liệu",
                    Url: " Chưa có dữ liệu"
                }
            });
        });
    </script>
    <div style="padding: 10px">
        <h2>
            Quản lý menu</h2>
        <table style="width: 100%">
            <tr>
                <th>
                </th>
                <th>
                    Thứ tự
                </th>
                <th>
                    Tiêu đề
                </th>
                <th>
                    Liên kết
                </th>
            </tr>
            <% 
                int i = 0;
                foreach (var item in Model.Menus)
                { 
                
            %>
            <tr>
                <td>
                    <%: Html.ActionLink("Sửa", "EditMenu", new { url = HttpUtility.UrlEncode(item.Url) })%>
                    |
                    <%: Html.ActionLink("Xóa", "DeleteMenu", new { url = HttpUtility.UrlEncode(item.Url) })%>
                </td>
                <td style="text-align: center">
                    <%= i %>
                </td>
                <td style="text-align: center">
                    <%= item.Title %>
                </td>
                <td style="text-align: center">
                    <%= item.Url %>
                </td>
            </tr>
            <% 
i++;
                } 
            %>
        </table>
        <div id="divNewMenu">
            <% using (Html.BeginForm("CreateMenu", "Home", FormMethod.Post, new { id = "frmNewMenu" }))
               {%>
            <fieldset>
                <% if (ViewData["Validate"] != null)
                   {
                %>
                <p style="color: Red">
                    <%=ViewData["Validate"].ToString()%></p>
                <%
                    }
                %>
                <div class="editor-label">
                    Tiêu đề hiển thị:
                    <input name="Title" id="Title" />
                </div>
                <div class="editor-label">
                    Url, địa chỉ liên kết:
                    <input name="Url" id="Url" />
                </div>
                <p>
                    <input type="submit" value="Tạo" />
                </p>
            </fieldset>
            <% } %>
        </div>
    </div>
</asp:Content>
