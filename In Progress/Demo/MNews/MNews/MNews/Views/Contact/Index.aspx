<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IPagedList<MNews.Models.Contact>>" %>
<%@ Import Namespace="MNews.Helpers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<script src="<%= Url.Content("~/Scripts/jquery-1.4.1.js") %>" type="text/javascript"></script>
	<script type="text/javascript">
		function GetContacts() {
			$.get($(this).attr("href"), function (response) {
				$("#contacts").replaceWith($("#contacts", response));
			});
			return false;
		}

		$(function () {
		    $(".pager a").live("click", GetContacts);
		    $(".delete").live("click", GetContacts);
		});

	</script>
	<div style="padding: 10px">
		<h2>
			Danh sách liên lạc</h2>
		<div id="contacts">
			<table style="width: 100%">
				<tr>
					<th>
					</th>
					<th>
						Email
					</th>
					<th>
						Điện thoại
					</th>
					<th>
						Nội dung
					</th>
				</tr>
				<% foreach (var item in Model)
				   { %>
				<tr>
					<td style="width: 100px">
						<%: Html.ActionLink("Xem", "Details", new { id=item.cID })%>
						|
						<%: Html.ActionLink("Xóa", "Delete", new { id = item.cID }, new { @class = "delete" })%>
					</td>
					<td style="text-align:center">
						<%: item.cEmail %>
					</td>
					<td style="text-align:center">
						<%: item.cTel %>
					</td>
					<td style="text-align:center">
						<%: item.cContent %>
					</td>
				</tr>
				<% } %>
			</table>
			<div class="pager">
				Trang:<%= Html.Pager("page", ViewData.Model.PageSize, ViewData.Model.PageNumber, ViewData.Model.TotalItemCount)%>
			</div>
		</div>
	</div>
</asp:Content>
