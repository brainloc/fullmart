<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MNews.Models.NewViewModel>" %>

<%@ Import Namespace="MNews.Helpers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	News
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<link href="<%= Url.Content("~/Content/news.css") %>" rel="stylesheet" type="text/css" />
	<script src="<%= Url.Content("~/Scripts/jquery-1.4.1.js") %>" type="text/javascript"></script>
	<script type="text/javascript">
		function GetNews() {
			$.get($(this).attr("href"), function (response) {
				$("#news").replaceWith($("#news", response));
			});
			return false;
		}

		$(function () {
			$(".pager a").live("click", GetNews);
			$(".delete").live("click", GetNews);
		});
		$(document).ready(function () {
			$('.list-news li:even').css('background-color', '#ddfcd8');

		});


	</script>
	<div id='mleft'>
		<div id="news">
			<ul>
				<% foreach (var item in Model.News)
				   { %>
				<li>
					<div class='newsitem'>
						<span class='newsit_title'><a href="/New/Details/<%=item.nID %>" title='<%= Html.Encode(item.ntitle) %>'>
							<%= Html.Encode(item.ntitle) %></a></span> <span class='newsit_date'>
								<%= Html.Encode(item.nDate.ToShortDateString()) %></span>
						<div class='newsit_preview'>
							<%= Html.Decode(item.npreview) %>
						</div>
						<a class='readmore' href="/New/Details/<%=item.nID %>" title='<%= Html.Encode(item.ntitle) %>'>
							Đọc thêm</a>
					</div>
				</li>
				<% } %>
			</ul>
			<div class="pager">
				Trang:<%= Html.Pager("page", ViewData.Model.News.PageSize, ViewData.Model.News.PageNumber, ViewData.Model.News.TotalItemCount)%>
			</div>
		</div>
	</div>
	<div id='mright'>
		<div id='mlistbanner'>
			<%
				if (Model.Banners != null && Model.Banners.Count > 0)
				{
					foreach (var item in Model.Banners)
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
