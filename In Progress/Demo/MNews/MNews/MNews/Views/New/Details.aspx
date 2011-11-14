<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MNews.Models.New>" %>

<%@ Import Namespace="MNews.Helpers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Model.ntitle %>
    - MON JSC
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <link href="/Content/news.css" rel="stylesheet" type="text/css" />
    <div id='mleft'>
        <div class='newsitem'>
            <img id='monnews' src="/images/monnews.png" /><span class='d_date'>
                <%: String.Format("{0:dddd, dd/MM/yyyy HH:mm:ss}", Model.nDate)%></span> 
            <hr />
                <span class='d_title'><%: Model.ntitle %></span>
            <div class='d_content'>
                <%= Html.Decode(Model.nContent) %></div>
            <p>
                <%: Html.ActionLink("Trở lại danh sách", "Index") %>
            </p>
        </div>
    </div>
    <div id='mright'>
        <img src="/images/logo-mscd.jpg" /><img src="/images/logo-mscd.jpg" /><img src="/images/logo-mscd.jpg" />
    </div>
</asp:Content>

