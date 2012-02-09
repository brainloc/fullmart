<%@ Page Title="" Language="C#" MasterPageFile="~/OneColumn.Master" AutoEventWireup="true"CodeBehind="CreateNews.aspx.cs" Inherits="FullMart.News.CreateNews" ValidateRequest="false"  EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script src="/ckeditor/ckeditor.js" type="text/javascript"></script>
    <script src="/ckfinder/ckfinder.js" type="text/javascript"></script>
    <link href="/themes/style/admin.css" rel="stylesheet" type="text/css" />
    <script src="themes/script/admin.js" type="text/javascript"></script>
    <script type="text/javascript">
        CKFinder.setupCKEditor(null, '/ckfinder/');
    </script>
    <script type="text/javascript">
        function CreateProduct() {
            $.ajax({
                url: "Code/Business/AjaxUltilities.ashx?",
                type: "POST",
                dataType: "script",
                data: {
                    action: "CreateProduct",
                    SubCategoryID: $("#shopname").val(),
                    Price: $("#semail").val(),
                    sfname: $("#sfname").val(),
                    slname: $("#slname").val(),
                    spass: $("#spass").val(),
                    sweb: $("#sweb").val(),
                    fregsstate: $("#fregsstate").val()
                }
            });
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="formPanel" runat="server">
    <div id="Div1">
       <div id="UpProduct">
                <table class="UPtb b bgwt">
                    <tr>
                        <td>
                            Tiêu đề :
                        </td>
                        <td>
                            <asp:TextBox CssClass="tbtitle" ID="tbtitle" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                  
                    <tr>
                        <td colspan="2">
                        <ckeditor:CKEditorControl ID="CKENet" runat="server" Height="200" DefaultLanguage="Vi"></ckeditor:CKEditorControl>
                                </td>
                        <%--<script type="text/javascript">
		                    //<![CDATA[
                            // Replace the <textarea id="ckEditor"> with an CKEditor instance.
                            var editor = CKEDITOR.replace('ckEditor');
		                //]]>
                        </script>--%>
                    </tr>
                    
                    <tfoot>
                        <tr>
                            <td colspan="2">
                                <div class="block center">
                                    <asp:Button ID="btnCreateNews" runat="server" Text="Create" />
                                </div>
                            </td>
                        </tr>
                    </tfoot>
                </table>
                </div>
    </div>
</asp:Content>
