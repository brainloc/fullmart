<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MNews.Models.PageViewModel>" %>

<%@ Import Namespace="MNews.Helpers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%= Model.CurrentPage.pName %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <link href="/Content/pages.css" rel="stylesheet" type="text/css" />
    <script src="<%= Url.Content("~/Scripts/jquery-1.4.1.js") %>" type="text/javascript"></script>
    <script type="text/javascript">
        function GetPage() {
            $.get($(this).attr("href"), function (response) {
                $("#mpage").replaceWith($("#mpage", response));
            });
            return false;
        }

        $(function () {
            $("#list-pages ul a").live("click", function () {

                $(".active").attr("class", "");
                var id = $(this).attr('id');
                var a = document.getElementById(id);
                if (a != null)
                    a.className = "active";

                $.get($(this).attr("href"), function (response) {
                    $("#mpage").replaceWith($("#mpage", response));
                });
                return false;
            });
        });


    </script>
    <div id='mright'>
        <div id='mpage'>
            <span id='titlepage'>
                <%= Model.CurrentPage.pName %></span>
            <%--<span id='timepage'>19/08/2011</span>--%>
            <div id='contentpage' class='clearfix'>
                <%= Html.Decode(Model.CurrentPage.pContent) %>
            </div>
        </div>
    </div>
    <div id='mleft'>
        <div id='list-pages'>
            <span>Mục Lục</span>
            <% if (Model.ListTitle.Count > 0)
               {
            %>
            <ul>
                <% for (int i = 0; i < Model.ListTitle.Count; i++)
                   {
                       if (Model.CurrentPage.pID == Model.ListID[i])
                       {
                %>
                <li><a id='p_<%= Model.ListID[i] %>' class='active' href='/Page/Index/<%= Model.ListID[i] %>'>
                    <%= Model.ListTitle[i] %></a></li>
                <%
                        }
                       else
                       {
                %>
                <li><a id='p_<%= Model.ListID[i] %>' href='/Page/Index/<%= Model.ListID[i] %>'>
                    <%= Model.ListTitle[i] %></a></li>
                <%
                    }
                   } 
                %>
            </ul>
            <% } %>
        </div>
        <div id='mlistbanner'>
            <%
                if (Model.ListBanner != null && Model.ListBanner.Count > 0)
                {
                    foreach (var item in Model.ListBanner)
                    {    
            %>
            <a href='<%= item.bLink %> ' title='<%= item.bTitle %>'>
                <%= Html.Decode(item.bContent) %>
            </a>
            <%
                    }
                }
            %>
        </div>
    </div>
</asp:Content>
