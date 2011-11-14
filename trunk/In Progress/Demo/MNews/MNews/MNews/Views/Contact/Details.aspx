<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MNews.Models.Contact>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Details</h2>

    <fieldset>
        <legend>Fields</legend>
        
        <div class="display-label">cID</div>
        <div class="display-field"><%: Model.cID %></div>
        
        <div class="display-label">cEmail</div>
        <div class="display-field"><%: Model.cEmail %></div>
        
        <div class="display-label">cTel</div>
        <div class="display-field"><%: Model.cTel %></div>
        
        <div class="display-label">cContent</div>
        <div class="display-field"><%: Model.cContent %></div>
        
    </fieldset>
    <p>

        <%: Html.ActionLink("Edit", "Edit", new { id=Model.cID }) %> |
        <%: Html.ActionLink("Back to List", "Index") %>
    </p>

</asp:Content>

