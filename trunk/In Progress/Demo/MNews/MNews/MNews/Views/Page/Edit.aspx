<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MNews.Models.Page>" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Chỉnh sửa bài viết
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <script src="<%= Url.Content("~/Scripts/jquery-1.4.1.js") %>" type="text/javascript"></script>
    <script type="text/javascript" src="<%= Url.Content("~/Scripts/jquery.validate.js") %>"> </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#FrmPage").validate({
                rules: {
                    pName: "required",
                    <%= pContent.ClientID %>: "required"
                },
                messages: {
                    pName: " Chưa có dữ liệu",
                    <%= pContent.ClientID %>: " Bạn chưa nhập nội dung cho tin tức mới"
                }
            });
        });
    </script>
    <script runat="server">
        protected void Page_Load(object sendder, System.EventArgs e)
        {
            if (!IsPostBack)
            {
                pContent.Text = Model.pContent;
            }
        }
        </script>
    <form id="Form1" runat="server">
    <h2>
        Bài viết mới</h2>
   <% using (Html.BeginForm("Edit", "Page", FormMethod.Post, new { id = "FrmPage" }))
       {%>
    <fieldset>
        <legend>Thông tin</legend>
        <div class="editor-label">
            Tiêu đề:
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.pName) %>
        </div>
        <div class="editor-label">
            Nội dung:
        </div>
        <div class="editor-field">
            <CKEditor:CKEditorControl ID="pContent" runat="server" ClientIDMode="Inherit">
            </CKEditor:CKEditorControl>
        </div>
        <div class="editor-label">
            Spage
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.pSpage) %>
        </div>
        <p>
            <input type="submit" value="Cập nhật" />
        </p>
    </fieldset>
    <% } %>
    </form>
    <div>
        <%: Html.ActionLink("Trở lại danh sách", "Manager") %>
    </div>

</asp:Content>

