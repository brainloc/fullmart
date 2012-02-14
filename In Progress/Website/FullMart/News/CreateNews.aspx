<%@ Page Title="" Language="C#" MasterPageFile="~/OneColumn.Master" AutoEventWireup="true"CodeBehind="CreateNews.aspx.cs" Inherits="FullMart.News.CreateNews" ValidateRequest="false"  EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="/ckeditor/ckeditor.js" type="text/javascript"></script>
    <script src="/ckfinder/ckfinder.js" type="text/javascript"></script>
    <link href="/themes/style/admin.css" rel="stylesheet" type="text/css" />
    <script src="/themes/script/admin.js" type="text/javascript"></script>
    <script type="text/javascript">
        CKFinder.setupCKEditor(null, '/ckfinder/');
        
        
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
           <asp:Label ID="txtmes" CssClass="message" runat="server" Text=""></asp:Label>

                <table class="UPtb b bgwt">
                    <tr>
                        <td>
                            Tiêu đề :
                        </td>
                        <td>
                            <asp:TextBox CssClass="tbtitle" ID="txttitle" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                  <tr>
                        <td>
                            images thumb (150x150) :
                        </td>
                        <td>
                            <asp:TextBox CssClass="tbtitle imgthumb" ID="txtimagethumb" runat="server"></asp:TextBox><button class="BrowseServer b">
                                <asp:Image ID="imgthumbN" CssClass="imgthumbN" ToolTip="images Thumb preview" runat="server" />Browse Server</button>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">Preivew content :
                        <ckeditor:CKEditorControl ID="CKpreview" Toolbar="Basic" runat="server" Height="200" DefaultLanguage="Vi"></ckeditor:CKEditorControl>
                                </td>
                        <%--<script type="text/javascript">
		                    //<![CDATA[
                            // Replace the <textarea id="ckEditor"> with an CKEditor instance.
                            var editor = CKEDITOR.replace('ckEditor');
		                //]]>
                        </script>--%>
                    </tr>
                    <tr>
                        <td colspan="2">Content :
                        <ckeditor:CKEditorControl ID="CKContent" runat="server" Height="200" DefaultLanguage="Vi"></ckeditor:CKEditorControl>
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
                                    <asp:Button ID="btnCreateNews" runat="server" Text="Create" 
                                        onclick="btnCreateNews_Click" />
                                </div>
                            </td>
                        </tr>
                    </tfoot>
                </table>
                </div>
    </div>
</asp:Content>
