<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ManageGeneral.aspx.cs" Inherits="FullMart.ManagerGeneral" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="/ckeditor/ckeditor.js" type="text/javascript"></script>
    <script src="/ckfinder/ckfinder.js" type="text/javascript"></script>
    <script src="/themes/script/genoption.js" type="text/javascript"></script>
    <script type="text/javascript">
        CKFinder.setupCKEditor(null, '/ckfinder/');
    </script>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Right" runat="server">
   <div class="block message">
            <asp:Label ID="lbnotemessage" runat="server" Text=""></asp:Label></div> 
            <div class="TC" id="TC">
        
            <ul>
                <li><a href="#Num">Number Product Homepage</a>
                </li>
                <li><a href="#TC">Term Condition</a>
                </li>
                <li><a href="#slider">Slider</a>
                </li>
                <li><a href="#footer">Footer Content</a>
                </li>
            </ul>

        <div class="acontent block" id="TC">
            <p class="atitle block">
                Term Condition for User</p>
            <span class="block">English version</span>
            <%--<textarea id="UserEN" class="block" cols="20" rows="2"></textarea>--%>
            <CKEditor:CKEditorControl ID="UserEN" runat="server" Height="200" DefaultLanguage="En"></CKEditor:CKEditorControl>
            <span class="block">Vietnamese version</span>
            <CKEditor:CKEditorControl ID="UserVi" runat="server" Height="200" DefaultLanguage="Vi"></CKEditor:CKEditorControl>
            <%--<textarea id="UserVI" class="block" cols="20" rows="2"></textarea>--%>
        </div>
        <div class="acontent block" id="footer">
            <p class="atitle block">
                Footer</p>
            <span class="block"></span>
            <CKEditor:CKEditorControl ID="FooterEN" runat="server" Height="200" DefaultLanguage="En"></CKEditor:CKEditorControl>
            <CKEditor:CKEditorControl ID="FooterVI" runat="server" Height="200" DefaultLanguage="En"></CKEditor:CKEditorControl>
            <%--<textarea class="block" id="FooterEN" cols="20" rows="2"></textarea>--%>
        </div>
        <div class="acontent block" id="Num">
            <p class="atitle block">
                Number Product Homepage</p>
            <span class="block"></span>
            <table>
                <tr><td><%=FullMart.Code.DAO.BindingUltilities.GetResourceValue("numberTopProducts")%></td><td><asp:TextBox ID="txtnumberTopProducts" CssClass="inputnum" runat="server"></asp:TextBox></td></tr>
                <tr><td><%=FullMart.Code.DAO.BindingUltilities.GetResourceValue("numberNewestProducts")%></td><td><asp:TextBox ID="txtnumberNewestProducts" CssClass="inputnum" runat="server"></asp:TextBox></td></tr>
            </table>
            <%--<textarea class="block" id="FooterEN" cols="20" rows="2"></textarea>--%>
        </div>
        <div class="acontent block" id="slider">
            <p class="atitle block">Slider on Homepage</p>
            <span class="block"></span>
           <img id="imgplus" src="/themes/images/plus.png" /><br class="clear block" />
                    <asp:TextBox ID="txtimg1" CssClass="imgmpreview" ToolTip="Slider image" Text="Slider image" runat="server"></asp:TextBox><br style="display:none" />
                    <asp:TextBox ID="txtimg2" CssClass="imgmpreview" ToolTip="Slider image" Text="Slider image" runat="server"></asp:TextBox><br style="display:none" />
                    <asp:TextBox ID="txtimg3" CssClass="imgmpreview" ToolTip="Slider image" Text="Slider image" runat="server"></asp:TextBox><br style="display:none" />
                    <asp:TextBox ID="txtimg4" CssClass="imgmpreview" ToolTip="Slider image" Text="Slider image" runat="server"></asp:TextBox><br style="display:none" />
                    <asp:TextBox ID="txtimg5" CssClass="imgmpreview" ToolTip="Slider image" Text="Slider image" runat="server"></asp:TextBox>
            <div class="clear"></div>
        </div>
        
        <asp:Button ID="cmdSave" runat="server" Text="SAVE" OnClick="cmdSave_Click" />
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#TC").tabs();
        });
    </script>
</asp:Content>
