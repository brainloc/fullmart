<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MNews.Models.Slider>" %>

<%@ Import Namespace="MNews.Helpers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Xem chi tiết slider
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="padding: 10px">
        <h2>
            Thông tin chi tiết</h2>
        <fieldset>
            <div class="display-label">
                Tiêu đề</div>
            <div class="display-field">
                <%= Model.stitle %></div>
            <div class="display-label">
                Nội dung</div>
            <div class="display-field">
                <%= Html.Decode(Model.scontent) %></div>
        </fieldset>
        <p>
            <%: Html.ActionLink("Chỉnh sửa", "Edit", new { id=Model.sID }) %>
            |
            <%: Html.ActionLink("Trở về danh sách", "Index") %>
        </p>
    </div>
</asp:Content>
