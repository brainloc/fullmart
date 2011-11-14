<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IPagedList<MNews.Models.UploadFile>>" %>

<%@ Import Namespace="MNews.Helpers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ManagerUpload
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script src="<%= Url.Content("~/Scripts/jquery-1.4.1.js") %>" type="text/javascript"></script>
    <script src="../../Scripts/jquery-1.4.1.js" type="text/javascript"></script>
    <script type="text/javascript">
        var i = 1;
        function GetFiles() {
            $.get($(this).attr("href"), function (response) {
                $("#divfiles").replaceWith($("#divfiles", response));
            });
            return false;
        }

        $(function () {
            $("#lnkMoreUpload").live("click", function () {
                $("#divFiles").append('<div style="padding:4px;"><a href="#">Xóa</a> <input type="file" name="file' + i + '' + '" /></div>');
                i = i + 1;
            });

            $(".pager a").live("click", GetFiles);
            $(".delete").live("click", GetFiles);
        });


    </script>
    <div style="padding: 10px">
        <div id="divfiles">
            <table style="width:100%">
                <tr>
                    <th>
                    </th>
                    <th>
                        Tên file
                    </th>
                    <th>
                        Loại
                    </th>
                    <th>
                        Đường dẫn
                    </th>
                </tr>
                <% foreach (var item in Model)
                   { %>
                <tr>
                    <td style="width:80px">
                          <%= Html.ActionLink("Xóa", "DeleteFile", new { file = item.FileName }, new { @class = "delete" })%>
                    </td>
                    <td style="text-align:center">
                        <%: item.FileName %>
                    </td>
                    <td style="width:80px;text-align:center">
                        <%: item.Type %>
                    </td>
                    <td style="text-align:center">
                        <%: item.Path %>
                    </td>
                </tr>
                <% } %>
            </table>
            <div class="pager">
                Trang:<%= Html.Pager("page",ViewData.Model.PageSize, ViewData.Model.PageNumber, ViewData.Model.TotalItemCount) %>
            </div>
        </div>
        <div id="uploadPic">
            <% using (Html.BeginForm("UploadImage", "Home", FormMethod.Post, new { enctype = "multipart/form-data" }))
               {%>
            <div id="divFiles">
                <div style="padding: 4px;">
                    <a href="#">Xóa</a>
                    <input type="file" name="file" id="fileUpload" />
                </div>
            </div>
            <div style="padding: 5px">
                <input type="submit" value="Cập nhật" />
            </div>
            <% } %>
        </div>
        <div>
            <a id="lnkMoreUpload" href="#">Thêm</a>
        </div>
    </div>
</asp:Content>
