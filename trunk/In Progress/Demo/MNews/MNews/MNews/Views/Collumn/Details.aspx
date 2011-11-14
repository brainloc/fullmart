<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MNews.Models.Collumn>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Thông tin chi tiết tiêu đề
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <fieldset>
        <legend>Thông tin chi tiết</legend>
                
        <div class="display-label">Nội dung:</div>
        <div class="display-field"><%: Model.cText %></div>
        
        <div class="display-label">Địa chỉ</div>
        <div class="display-field"><%: Model.cLink %></div>
        
        <div class="display-label">Phân loại</div>
        <div class="display-field"><%: Model.cCo %></div>
        
        <div class="display-label">Thứ tự</div>
        <div class="display-field"><%: Model.cindex %></div>
        
    </fieldset>
    <p>

        <%: Html.ActionLink("Chỉnh sửa", "Edit", new { id=Model.cID }) %> |
        <%: Html.ActionLink("Trở về danh sách", "Index") %>
    </p>

</asp:Content>

