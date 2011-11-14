<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MNews.Models.Slide>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Xem chi tiết thông tin slide
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="padding: 10px">
        <fieldset>
            <legend>Thông tin </legend>
            <div class="display-label">
                Địa chỉ ảnh</div>
            <div class="display-field">
                <%: Model.slImage %></div>
            <div class="display-label">
                Địa chỉ web</div>
            <div class="display-field">
                <%: Model.slLink %></div>
            <div class="display-label">
                Nội dung</div>
            <div class="display-field">
                <%: Model.slText %></div>
        </fieldset>
        <p>
            <%: Html.ActionLink("Sửa", "Edit", new { id=Model.slID }) %>
            |
            <%: Html.ActionLink("Trở về danh sách", "Index") %>
        </p>
    </div>
</asp:Content>
