<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MNews.Models.HomeViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Quản lý trang chủ
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
        input
        {
            background-color: White;
        }
    </style>
    <form action="/Home/ManagerHome" method="post">
    <fieldset style="padding: 10px">
        <legend>Thông tin quản lý trang chủ</legend>
        <div style="width: 200px; float: left;">
            Số lượng tin tức:
        </div>
        <div style="margin-bottom: 5px">
            <input type="text" value="" name="NumOfNew" />
        </div>
        <div style="width: 200px; float: left">
            Số lượng tiêu đề (danh mục):
        </div>
        <div style="margin-bottom: 5px">
            <input type="text" value="" name="NumOfColumn" />
        </div>
        <div style="width: 200px; float: left">
            Số lượng banner:
        </div>
        <div style="margin-bottom: 5px">
            <input type="text" value="" name="NumOfBanner" />
        </div>
        <div style="width: 200px; float: left">
            Số lượng sliders:
        </div>
        <div style="margin-bottom: 5px">
            <input type="text" value="" name="NumOfSlider" />
        </div>
        <div style="width: 200px; float: left">
            Số lượng slide:
        </div>
        <div style="margin-bottom: 5px">
            <input type="text" value="" name="NumOfSlide" />
        </div>
        <p>
            <input type="submit" value="Cập nhật" />
        </p>
    </fieldset>
    </form>
    <p>
        <%: Html.ActionLink("Trở lại trang quản trị", "Index", "Admin") %>
    </p>
</asp:Content>
