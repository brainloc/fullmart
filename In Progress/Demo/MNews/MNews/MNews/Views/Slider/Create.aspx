<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MNews.Models.Slider>" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Quản lý Slider - tạo mới Slider
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
                    <%= scontent.ClientID %>: " Bạn chưa nhập nội dung cho tin tức mới"
                    npreview: " Bạn chưa nhập nội dung cho tin tức mới"
                }
            });
        });
    </script>
    <div style="padding: 10px">
        <h2>
            Tạo mới slider</h2>
        <form runat="server">
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
                <input type="submit" value="Tạo mới" />
            </p>
        </fieldset>
        <% } %>
        </form>
        <div>
            <%: Html.ActionLink("Trở về danh sách", "Index") %>
        </div>
    </div>
</asp:Content>
