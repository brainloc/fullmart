<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IPagedList<MNews.Models.Page>>" %>

<%@ Import Namespace="MNews.Helpers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Quản lý bài viết
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script src="<%= Url.Content("~/Scripts/jquery-1.4.1.js") %>" type="text/javascript"></script>
    <script type="text/javascript">
        function GetPages() {
            $.get($(this).attr("href"), function (response) {
                $("#pages").replaceWith($("#pages", response));
            });
            return false;
        }

        $(function () {
            $(".pager a").live("click", GetPages);
            $(".delete").live("click", GetPages);
        });
    </script>
    <h2>Danh sách bài viết</h2>
    <div id="pages">
        <table>
            <tr>
                <th>
                </th>
                <th>
                    Tiêu đề
                </th>
            </tr>
            <% foreach (var item in Model)
               { %>
            <tr>
                <td>
                    <%: Html.ActionLink("Sửa", "Edit", new { id=item.pID }) %>
                    |
                    <a href="/page/?id=<%= item.pID  %>">Xem</a>
                    |
                    <%: Html.ActionLink("Xóa", "Delete", new { id=item.pID })%>
                </td>
                <td>
                    <%: item.pName %>
                </td>
            </tr>
            <% } %>
        </table>
        <div class="pager">
            Trang:<%= Html.Pager("page",ViewData.Model.PageSize, ViewData.Model.PageNumber, ViewData.Model.TotalItemCount) %>
        </div>
    </div>
    <p>
        <%: Html.ActionLink("Tạo mới", "Create") %>
    </p>
</asp:Content>
