<%@ Page Title="" Language="C#" MasterPageFile="~/TwoColumns.Master" AutoEventWireup="true" CodeBehind="ManagerGeneral.aspx.cs" Inherits="FullMart.ManagerGeneral" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="/ckeditor/ckeditor.js" type="text/javascript"></script>
    <script src="/ckfinder/ckfinder.js" type="text/javascript"></script>
    <link href="/themes/style/admin.css" rel="stylesheet" type="text/css" />
    <script src="/themes/script/admin.js" type="text/javascript"></script>
    <script type="text/javascript">
        CKFinder.setupCKEditor(null, '/ckfinder/');
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Left" runat="server">
<div id="Lmenu" class="lb btlr">
        <div class="title block btlr">
            <span>Manager</span></div>
        <ul class="lplist">
            <li><a class="ap" href="/Administration/ManagerGeneral.aspx">General Manager</a>
            </li>
            <li><a class="ap" href="/Administration/ManageUser.aspx">User Manager</a>
            </li>
            <li><a class="ap" href="/Shop/ManageProducts.aspx">Product Manager</a>
            </li>
            <li><a class="ap" href="/News/ManageNews.aspx">News Manager</a>
            </li>
            <li><a class="ap" href="#">Answer & Question Manager</a> </li>
        </ul>
        
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Right" runat="server">
<div class="State block" id="State">
    <div class="acontent block">
                    <p class="atitle">
                        Manager State</p>
                    <div class="insstate">
                    <asp:TextBox ID="txtINSState" CssClass="aip" title="Press 'Enter' to insert" Text="Press 'Enter' to insert" runat="server"></asp:TextBox>
                        <%--<input type="text" value="Press 'Enter' to insert" class="aip" id="INSState" />--%>
                        <button class="slobox">
                        </button>
                        <div class="clear">
                        </div>
                        <ul class="state">
                            <li><span>Sate 1</span>
                                <button class="delState" title="Delete" title="Delete">
                            </button>
                            </li>
                            <li><span>Sate 2</span>
                                <button class="delState" title="Delete">
                            </button>
                            </li>
                            <li><span>Sate 3</span>
                                <button class="delState" title="Delete">
                            </button>
                            </li>
                            <li><span>Sate 4</span>
                                <button class="delState" title="Delete">
                            </button>
                            </li>
                            <li><span>Sate 5</span>
                                <button class="delState" title="Delete">
                            </button>
                            </li>
                            <li><span>Sate 6</span>
                                <button class="delState" title="Delete">
                            </button>
                            </li>
                            <li><span>Sate 7</span>
                                <button class="delState" title="Delete">
                            </button>
                            </li>
                            <li><span>Sate 8</span>
                                <button class="delState" title="Delete">
                            </button>
                            </li>
                            <li><span>Sate 9</span>
                                <button class="delState" title="Delete">
                            </button>
                            </li>
                            <li><span>Sate 10</span>
                                <button class="delState" title="Delete">
                            </button>
                            </li>
                            <li><span>Sate 11</span>
                                <button class="delState" title="Delete">
                            </button>
                            </li>
                            <li><span>Sate 12</span>
                                <button class="delState" title="Delete">
                            </button>
                            </li>
                        </ul>
                    </div>
                </div>
</div>
    <div class="TC" id="TC">
    <div class="block message">
        <asp:Label ID="lbnotemessage" runat="server" Text="Label"></asp:Label></div>
        <div class="acontent block">
            <p class="atitle block">
                Term Condition for User</p>
            <span class="block">English version</span>
            <%--<textarea id="UserEN" class="block" cols="20" rows="2"></textarea>--%>
            <ckeditor:CKEditorControl ID="UserEN" runat="server" Height="200" DefaultLanguage="En"></ckeditor:CKEditorControl>
            <span class="block">Vietnamese version</span>
            <ckeditor:CKEditorControl ID="UserVi" runat="server" Height="200" DefaultLanguage="Vi"></ckeditor:CKEditorControl>
            <%--<textarea id="UserVI" class="block" cols="20" rows="2"></textarea>--%>
        </div>
        <div class="acontent block">
            <p class="atitle block">
                Footer</p>
            <span class="block"></span>
            <ckeditor:CKEditorControl ID="FooterEN" runat="server" Height="200" DefaultLanguage="En"></ckeditor:CKEditorControl>
            <ckeditor:CKEditorControl ID="FooterVI" runat="server" Height="200" DefaultLanguage="En"></ckeditor:CKEditorControl>
            <%--<textarea class="block" id="FooterEN" cols="20" rows="2"></textarea>--%>
        </div><asp:Button ID="cmdSave" runat="server" Text="SAVE" 
            onclick="cmdSave_Click" />
    </div>
</asp:Content>
