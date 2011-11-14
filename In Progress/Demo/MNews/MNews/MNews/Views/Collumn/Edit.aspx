<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MNews.Models.Collumn>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Quản lý tiêu đề - Chỉnh sửa tiêu đề
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <% using (Html.BeginForm()) {%>
        
        <fieldset>
            <legend>Thông tin chỉnh sửa</legend>
                    
            <div class="editor-label">
                Nội dung
            </div>
            <div class="editor-field">
                <%: Html.TextAreaFor(model => model.cText) %>
            </div>
            
            <div class="editor-label">
                Địa chỉ
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
                Thứ tự sắp xếp:
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.cindex) %>
            </div>
            
            <p>
                <input type="submit" value="Cập nhật" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%: Html.ActionLink("Trở về danh sách", "Index") %>
    </div>

</asp:Content>

