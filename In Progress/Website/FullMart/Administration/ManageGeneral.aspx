<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ManageGeneral.aspx.cs" Inherits="FullMart.ManagerGeneral" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="/ckeditor/ckeditor.js" type="text/javascript"></script>
    <script src="/ckfinder/ckfinder.js" type="text/javascript"></script>
    <script type="text/javascript">
        CKFinder.setupCKEditor(null, '/ckfinder/');
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Right" runat="server">
    <div class="TC" id="TC">
        <div class="block message">
            <asp:Label ID="lbnotemessage" runat="server" Text=""></asp:Label></div>
        <div class="acontent block">
            <p class="atitle block">
                Term Condition for User</p>
            <span class="block">English version</span>
            <%--<textarea id="UserEN" class="block" cols="20" rows="2"></textarea>--%>
            <CKEditor:CKEditorControl ID="UserEN" runat="server" Height="200" DefaultLanguage="En"></CKEditor:CKEditorControl>
            <span class="block">Vietnamese version</span>
            <CKEditor:CKEditorControl ID="UserVi" runat="server" Height="200" DefaultLanguage="Vi"></CKEditor:CKEditorControl>
            <%--<textarea id="UserVI" class="block" cols="20" rows="2"></textarea>--%>
        </div>
        <div class="acontent block">
            <p class="atitle block">
                Footer</p>
            <span class="block"></span>
            <CKEditor:CKEditorControl ID="FooterEN" runat="server" Height="200" DefaultLanguage="En"></CKEditor:CKEditorControl>
            <CKEditor:CKEditorControl ID="FooterVI" runat="server" Height="200" DefaultLanguage="En"></CKEditor:CKEditorControl>
            <%--<textarea class="block" id="FooterEN" cols="20" rows="2"></textarea>--%>
        </div>
        <asp:Button ID="cmdSave" runat="server" Text="SAVE" OnClick="cmdSave_Click" />
    </div>
</asp:Content>
