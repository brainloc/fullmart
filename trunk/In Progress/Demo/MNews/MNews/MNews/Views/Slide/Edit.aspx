<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MNews.Models.Slide>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Quản lý Slide - Chỉnh sửa thông tin slide
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="padding: 10px">
        <h2>
            Chỉnh sửa thông tin slide</h2>
        <% using (Html.BeginForm())
           {%>
        <fieldset>
            <legend>Chỉnh sửa thông tin slide</legend>
            <div class="editor-label">
                Địa chỉ ảnh
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.slImage) %>
            </div>
            <div class="editor-label">
                Địa chỉ web
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.slLink) %>
            </div>
            <div class="editor-label">
                Nội dung
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.slText) %>
            </div>
            <p>
                <input type="submit" value="Cập nhật" />
            </p>
        </fieldset>
        <% } %>
        <div>
            <%: Html.ActionLink("Trở về danh sách", "Index") %>
        </div>
    </div>
</asp:Content>
