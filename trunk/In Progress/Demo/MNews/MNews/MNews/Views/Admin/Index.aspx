<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Administrator's page
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

	<h2>Trang Quản lý</h2>
	
	<div style="display:block; clear:both; padding: 10px;background-color:White">
		<a href="/New/Manager">
		<div style="width:40%; margin:10px; float:left; border: 2px solid black; text-align:center; color:Black;">
			Quản lý tin tức
		</div>
		</a>
		<a href="/Page/Manager">
		<div style="width:40%; margin:10px;  float:right; border: 2px solid black;  text-align:center; color:Black;">
			Quản lý bài viết
		</div>
		</a>
		<a href="/Slide/Index">
		<div style="width:40%; margin:10px;  float:left; border: 2px solid black;  text-align:center; color:Black;">
			Quản lý slide
		</div>
		</a>
		<a href="/Slider/Index">
		<div style="width:40%; margin:10px;  float:right; border: 2px solid black;  text-align:center; color:Black;">
			Quản lý slider
		</div>
		</a>
		</a>
		<a href="/Banner/Index">
		<div style="width:40%; margin:10px;  float:right; border: 2px solid black;  text-align:center; color:Black;">
			Quản lý banner
		</div>
		</a>
		<a href="/Collumn/Index">
		<div style="width:40%; margin:10px;  float:left; border: 2px solid black;  text-align:center; color:Black;">
			Quản lý chuyên mục
		</div>
		</a>
		<a href="/home/ManagerMenu">
		<div style="width:40%; margin:10px;  float:left; border: 2px solid black;  text-align:center; color:Black;">
			Quản lý menu
		</div>
		</a>
		<a href="/home/ManagerUpload">
		<div style="width:40%; margin:10px;  float:right; border: 2px solid black;  text-align:center; color:Black;">
			Quản lý upload
		</div>
		</a>

		 <a href="/Contact/Index">
		<div style="width:40%; margin:10px;  float:right; border: 2px solid black;  text-align:center; color:Black;">
			Quản lý Contact
		</div>
		</a>
	</div>

</asp:Content>
