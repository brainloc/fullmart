<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MNews.Models.Slider>" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Quản lý slider - Chỉnh sửa thông tin slider
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script src="<%= Url.Content("~/Scripts/jquery-1.4.1.js") %>" type="text/javascript"></script>
    <script type="text/javascript" src="<%= Url.Content("~/Scripts/jquery.validate.js") %>"> </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#FrmTintuc").validate({
                rules: {
                    stitle: "required",
                    <%= scontent.ClientID %>: "required"
                },
                messages: {
                    ntitle: " Chưa có dữ liệu",
                    <%= scontent.ClientID %>: " Bạn chưa nhập nội dung "
                }
            });
        });
    </script>
    <script runat="server">
        protected void Page_Load(object sendder, System.EventArgs e)
        {
            if (!IsPostBack)
            {
                scontent.Text = Model.scontent;
            }
        }
    </script>
    <form id="Form1" runat="server">
    <h2>Chỉnh sửa slider</h2>
    <% using (Html.BeginForm())
       {%>
    <fieldset>
        <div class="editor-label">
           Tiêu đề
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.stitle) %>
        </div>
        <div class="editor-label">
           Nội dung
        </div>
        <div class="editor-field">
            <CKEditor:CKEditorControl ID="scontent" runat="server" ClientIDMode="Inherit">
            </CKEditor:CKEditorControl>
        </div>
        <p>
            <input type="submit" value="Cập nhật" />
        </p>
    </fieldset>
    <% } %>
    </form>
    <div>
        <%: Html.ActionLink("Back to List", "Index") %>
    </div>
</asp:Content>
