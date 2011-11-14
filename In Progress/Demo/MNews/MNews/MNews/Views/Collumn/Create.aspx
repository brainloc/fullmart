<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MNews.Models.Collumn>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Quản lý tiêu đề - Tạo mới tiêu đề
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="width: 100%; padding: 10px">
        <h2>
            Tạo mới tiêu đề</h2>
        <% using (Html.BeginForm())
           {%>
        <fieldset>
            <legend>Thông tin</legend>
            <div class="editor-label">
                Nội dung
            </div>
            <div class="editor-field">
                <%: Html.TextAreaFor(model => model.cText) %>
            </div>
            <div class="editor-label">
                Địa chỉ liên kết
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.cLink) %>
            </div>
            <div class="editor-label">
                Phân loại
            </div>
            <div class="editor-field">
                <select name="cCo">
                    <% foreach (var t in ViewData["Titles"] as List<string>)
                       {
                           %>
                              <option value="<%= t %>"><%= t %></option>
                           <%
                       } %>    
                </select>
            </div>
            <div class="editor-label">
                Thứ tự sắp xếp
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.cindex) %>
            </div>
            <p>
                <input type="submit" value="Tạo mới" />
            </p>
        </fieldset>
        <% } %>
        <div>
            <%: Html.ActionLink("Trở về danh sách", "Index") %>
        </div>
    </div>
</asp:Content>
