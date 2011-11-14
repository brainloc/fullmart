<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IPagedList<MNews.Models.Collumn>>" %>

<%@ Import Namespace="MNews.Helpers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Quản lý tiêu đề
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script src="<%= Url.Content("~/Scripts/jquery-1.4.1.js") %>" type="text/javascript"></script>
    <script type="text/javascript">
        function GetCollumns() {
            $.get($(this).attr("href"), function (response) {
                $("#collumns").replaceWith($("#collumns", response));
            });
            return false;
        }

        $(function () {
            $(".pager a").live("click", GetCollumns);
            $(".delete").live("click", GetCollumns);
        });


    </script>
    <div style="padding: 10px">
        <h2>
            Danh sách tiêu đề</h2>
        <div id="collumns">
            <table style="width: 100%">
                <tr>
                    <th>
                    </th>
                    <th style="width: 80px">
                        Nội dung
                    </th>
                    <th>
                        Địa chỉ
                    </th>
                    <th>
                        Phân loại
                    </th>
                    <th>
                        Thứ tự
                    </th>
                </tr>
                <% foreach (var item in Model)
                   { %>
                <tr>
                    <td>
                        <%: Html.ActionLink("Sửa", "Edit", new { id=item.cID }) %>
                        |
                        <%: Html.ActionLink("Xem", "Details", new { id=item.cID })%>
                        |
                        <%: Html.ActionLink("Xóa", "Delete", new { id=item.cID })%>
                    </td>
                    <td style="text-align: center">
                        <%: item.cText %>
                    </td>
                    <td style="text-align: center">
                        <%: item.cLink %>
                    </td>
                    <td style="text-align: center">
                        <%: item.cCo %>
                    </td>
                    <td style="text-align: center">
                        <%: item.cindex %>
                    </td>
                </tr>
                <% } %>
            </table>
            <div class="pager">
                Trang:<%= Html.Pager("page", ViewData.Model.PageSize, ViewData.Model.PageNumber, ViewData.Model.TotalItemCount) %>
            </div>
        </div>
    </div>
    <p>
        <%: Html.ActionLink("Tạo mới", "Create") %>
    </p>
</asp:Content>
