<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IPagedList<MNews.Models.Slide>>" %>

<%@ Import Namespace="MNews.Helpers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Quản lý slide
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script src="<%= Url.Content("~/Scripts/jquery-1.4.1.js") %>" type="text/javascript"></script>
    <script type="text/javascript">
        function GetSlides() {
            $.get($(this).attr("href"), function (response) {
                $("#slides").replaceWith($("#slides", response));
            });
            return false;
        }

        $(function () {
            $(".pager a").live("click", GetSlides);
            $(".delete").live("click", GetSlides);
        });


    </script>
    <div style="padding: 10px">
        <h2>
            Quản lý slide</h2>
        <div id="slides">
            <table>
                <tr>
                    <th>
                    </th>
                    <th>
                        Địa chỉ ảnh
                    </th>
                    <th>
                        Địa chỉ web
                    </th>
                    <th>
                        Nội dung
                    </th>
                </tr>
                <% foreach (var item in Model)
                   { %>
                <tr>
                    <td>
                        <%: Html.ActionLink("Sửa", "Edit", new { id=item.slID }) %>
                        |
                        <%: Html.ActionLink("Xem", "Details", new { id=item.slID })%>
                        |
                        <%: Html.ActionLink("Xóa", "Delete", new { id=item.slID })%>
                    </td>
                    <td style="text-align: center">
                        <%: item.slImage %>
                    </td>
                    <td style="text-align: center">
                        <%: item.slLink %>
                    </td>
                    <td style="text-align: center">
                        <%: item.slText %>
                    </td>
                </tr>
                <% } %>
            </table>
            <div class="pager">
                Trang:<%= Html.Pager("page", ViewData.Model.PageSize, ViewData.Model.PageNumber, ViewData.Model.TotalItemCount) %>
            </div>
        </div>
        <p>
            <%: Html.ActionLink("Tạo mới", "Create") %>
        </p>
    </div>
</asp:Content>
