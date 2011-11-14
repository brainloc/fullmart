<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IPagedList<MNews.Models.Banner>>" %>

<%@ Import Namespace="MNews.Helpers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Quản lý banner
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script src="<%= Url.Content("~/Scripts/jquery-1.4.1.js") %>" type="text/javascript"></script>
    <script type="text/javascript">
        function GetBanners() {
            $.get($(this).attr("href"), function (response) {
                $("#banners").replaceWith($("#banners", response));
            });
            return false;
        }

        $(function () {
            $(".pager a").live("click", GetBanners);
            $(".delete").live("click", GetBanners);
        });


    </script>
    <div style="padding: 10px">
        <h2>
            Quản lý banner</h2>
        <div id="banners">
            <table style="width: 100%">
                <tr>
                    <th>
                    </th>
                    <th>
                        Địa chỉ
                    </th>
                    <th>
                        Tiêu đề
                    </th>
                    <th>
                        bPage
                    </th>
                </tr>
                <% foreach (var item in Model)
                   { %>
                <tr>
                    <td style="width: 140px">
                        <%: Html.ActionLink("Sửa", "Edit", new { id=item.bID }) %>
                        |
                        <%: Html.ActionLink("Xem", "Details", new { id=item.bID })%>
                        |
                        <%: Html.ActionLink("Xóa", "Delete", new { id=item.bID })%>
                    </td>
                    <td style="text-align: center">
                        <%: item.bLink %>
                    </td>
                    <td style="text-align: center">
                        <%: item.bTitle %>
                    </td>
                    <td style="text-align: center">
                        <%: item.bPage %>
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
