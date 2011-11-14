<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IPagedList<MNews.Models.Slider>>" %>

<%@ Import Namespace="MNews.Helpers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Quản lý Sliders
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script src="<%= Url.Content("~/Scripts/jquery-1.4.1.js") %>" type="text/javascript"></script>
    <script type="text/javascript">
        function GetSliders() {
            $.get($(this).attr("href"), function (response) {
                $("#sliders").replaceWith($("#sliders", response));
            });
            return false;
        }

        $(function () {
            $(".pager a").live("click", GetSliders);
            $(".delete").live("click", GetSliders);
        });


    </script>
    <div style="padding: 10px">
        <h2>
            Quản lý Sliders</h2>
        <div id="sliders">
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
                    <td style="width: 150px">
                        <%: Html.ActionLink("Sửa", "Edit", new { id=item.sID }) %>
                        |
                        <%: Html.ActionLink("Xem", "Details", new { id=item.sID })%>
                        |
                        <%: Html.ActionLink("Xóa", "Delete", new { id=item.sID })%>
                    </td>
                    <td style="text-align: center">
                        <%: item.stitle %>
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
