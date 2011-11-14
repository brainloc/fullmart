<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IPagedList<MNews.Models.New>>" %>

<%@ Import Namespace="MNews.Helpers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Danh sách tin tức
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script src="<%= Url.Content("~/Scripts/jquery-1.4.1.js") %>" type="text/javascript"></script>
    <script type="text/javascript">
        function GetNews() {
            $.get($(this).attr("href"), function (response) {
                $("#news").replaceWith($("#news", response));
            });
            return false;
        }

        $(function () {
            $(".pager a").live("click", GetNews);
            $(".delete").live("click", GetNews);
        });


    </script>
    <div style="padding: 10px;">
        <h2>
            Danh sách tin tức
        </h2>
        <br />
        <div id="news">
            <table>
                <tr>
                    <th>
                    </th>
                    <th>
                        Tiêu đề
                    </th>
                    <th>
                        Tóm lược
                    </th>
                    <th>
                        Ngày tạo
                    </th>
                </tr>
                <% foreach (var item in Model)
                   { %>
                <tr>
                    <td style="width: 70px">
                        <%= Html.ActionLink("Sửa", "Edit", new { id=item.nID }) %>
                        |
                        <%= Html.ActionLink("Xóa", "Delete", new { id = item.nID }, new { @class="delete" })%>
                    </td>
                    <td>
                        <%= Html.Encode(item.ntitle) %>
                    </td>
                    <td>
                        <%= Html.Decode(item.npreview) %>
                    </td>
                    <td style="text-align: center">
                        <%= Html.Encode(String.Format("{0:g}", item.nDate)) %>
                    </td>
                </tr>
                <% } %>
            </table>
            <div class="pager">
                Trang:<%= Html.Pager("page",ViewData.Model.PageSize, ViewData.Model.PageNumber, ViewData.Model.TotalItemCount) %>
            </div>
        </div>
        <p>
            <%= Html.ActionLink("Tạo mới", "Create") %>
        </p>
    </div>
</asp:Content>
