<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MNews.Models.Banner>" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Quản lý banner - Chỉnh sử thông tin banner
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <script src="<%= Url.Content("~/Scripts/jquery-1.4.1.js") %>" type="text/javascript"></script>
    <script type="text/javascript" src="<%= Url.Content("~/Scripts/jquery.validate.js") %>"> </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#FrmTintuc").validate({
                rules: {
                    ntitle: "required",
                    <%= bContent.ClientID %>: "required"
                   
                },
                messages: {
                    ntitle: " Chưa có dữ liệu",
                    <%= bContent.ClientID %>: " Bạn chưa nhập nội dung cho tin tức mới"
                    
                }
            });
        });
    </script>
     <script runat="server">
        protected void Page_Load(object sendder, System.EventArgs e)
        {
            if (!IsPostBack)
            {
                bContent.Text = Model.bContent;
            }
        }
    </script>
    <form id="Form1" runat="server">
    <% using (Html.BeginForm("Create", "Banner", FormMethod.Post, new { id = "FrmBanner" }))
       {%>
    <fieldset>
        <legend>Thông tin banner</legend>
        <div class="editor-label">
            Địa chỉ
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.bLink) %>
        </div>
        <div class="editor-label">
            Tiêu đề
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.bTitle) %>
        </div>
        <div class="editor-label">
            Nội dung
        </div>
        <div class="editor-field">
             <CKEditor:CKEditorControl ID="bContent" runat="server" ClientIDMode="Inherit">
            </CKEditor:CKEditorControl>
        </div>
        <div class="editor-label">
            Page
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.bPage) %>
        </div>
        <p>
            <input type="submit" value="Cập nhật" />
        </p>
    </fieldset>
    <% } %>
    </form>
    <div>
        <%: Html.ActionLink("Trở về danh sách", "Index") %>
    </div>
</asp:Content>
