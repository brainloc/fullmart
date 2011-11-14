<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MNews.Models.MenuNode>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	EditMenu
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>EditMenu</h2>

    <% using (Html.BeginForm()) {%>
        
        <fieldset>
            <legend>Fields</legend>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Title) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Title) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Url) %>
            </div>
            <div class="editor-field">
                <input name="Url" value= "<%: Model.Url %>" />
            </div>
            
            <p>
                <input type="submit" value="Save" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%: Html.ActionLink("Back to List", "Index") %>
    </div>

</asp:Content>

