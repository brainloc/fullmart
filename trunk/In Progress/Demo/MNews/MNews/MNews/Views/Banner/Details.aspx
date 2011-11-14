<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MNews.Models.Banner>" %>
<%@ Import Namespace="MNews.Helpers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Xem chi tiết banner
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <fieldset>
        <legend>Thông tin</legend>
                
        <div class="display-label">Địa chỉ</div>
        <div class="display-field"><%: Model.bLink %></div>
        
        <div class="display-label">Tiêu đề</div>
        <div class="display-field"><%: Model.bTitle %></div>
        
        <div class="display-label">Nội dung</div>
        <div class="display-field"><%: Html.Decode(Model.bContent) %></div>
        
        <div class="display-label">Page</div>
        <div class="display-field"><%: Model.bPage %></div>
        
    </fieldset>
    <p>
    </p>

</asp:Content>

