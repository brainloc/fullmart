<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MNews.Models.Page>" %>
<%@ Import Namespace="MNews.Helpers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Xem chi tiết page
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="padding: 10px">
        <h2>
            Xem chi tiết</h2>
        <fieldset>
            <div class="display-label">
                Tên</div>
            <div class="display-field">
                <%: Model.pName %></div>
            <div class="display-label">
                Nội dung</div>
            <div class="display-field">
                <%= Html.Decode(Model.pContent) %></div>
            <div class="display-label">
                Page cha</div>
            <div class="display-field">
                <%: Model.pSpage %></div>
        </fieldset>
        
    </div>
</asp:Content>
