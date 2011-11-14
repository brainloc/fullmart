<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MNews.Models.New>" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Chỉnh sửa tin tức
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

   <script src="<%= Url.Content("~/Scripts/jquery-1.4.1.js") %>" type="text/javascript"></script>
    <script type="text/javascript" src="<%= Url.Content("~/Scripts/jquery.validate.js") %>"> </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#FrmTintuc").validate({
                rules: {
                    ntitle: "required",
                    <%= ncontent.ClientID %>: "required",
                    <%= npreview.ClientID %>: "required"
                },
                messages: {
                    ntitle: " Chưa có dữ liệu",
                    <%= ncontent.ClientID %>: " Bạn chưa nhập nội dung cho tin tức mới"
                     <%= npreview.ClientID %>: " Bạn chưa nhập nội dung cho tin tức mới"
                }
            });
        });
    </script>
     <script runat="server">
        protected void Page_Load(object sendder, System.EventArgs e)
        {
            if (!IsPostBack)
            {
                ncontent.Text = Model.nContent;
                npreview.Text = Model.npreview;
            }
        }
    </script>

    <form id="Form1" runat="server">
    <h2>
       Chỉnh sửa tin tức</h2>
    <% using (Html.BeginForm("Edit", "New", FormMethod.Post, new { id = "FrmTintuc" }))
       {%>
    <fieldset>
        <legend>Thông tin</legend>
        <div class="editor-label">
            <font color="red">*</font>Tiêu đề:
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.ntitle) %>
        </div>
        <div class="editor-label">
            Ngày tạo:
        </div>
        <div class="editor-field">
            <%= string.Format("{0:dd/MM/yyyy}", Model.nDate) %>
        </div>
        <div class="editor-label">
            <font color="red">*</font> Nội dung
        </div>
        <div class="editor-field">
            <CKEditor:CKEditorControl ID="ncontent" runat="server" ClientIDMode="Inherit">
            </CKEditor:CKEditorControl>
        </div>
        <div class="editor-label">
            Tóm lược:
        </div>
        <div class="editor-field">
               <CKEditor:CKEditorControl ID="npreview" runat="server" ClientIDMode="Inherit">
            </CKEditor:CKEditorControl>
        </div>
        <p>
            <input type="submit" value="Cập nhật" />
        </p>
    </fieldset>
    <% } %>
    </form>
    <div style="padding-top: 20px">
        <%= Html.ActionLink("Trở về danh sách", "Manager") %>
    </div>

</asp:Content>

