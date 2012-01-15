<%@ Page Title="" Language="C#" MasterPageFile="~/OneColumn.Master" AutoEventWireup="true"
    CodeBehind="OneColumn.aspx.cs" Inherits="FullMart.OneColumn1" ValidateRequest="false"
    EnableEventValidation="false" %>

<%@ Register TagPrefix="ckeditor" Namespace="CKEditor.NET" Assembly="CKEditor.NET" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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

        //        $(document).ready(function () {
        //            $("#CatSubCat select:eq(0)").change(function () {
        //                $(this).selectmenu("refresh", true);
        //                var selectedOption = $("#CatSubCat select:eq(0) option:selected").val();
        //                $.ajax({
        //                    url: "Code/Business/AjaxUltilities.ashx?",
        //                    type: "POST",
        //                    dataType: "script",
        //                    data: {
        //                        action: "GetSubCategoriesByCatID",
        //                        subCatID: selectedOption
        //                    }
        //                });
        //            });
        //        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="formPanel" runat="server">
    <div id="UpProduct">
        <table class="UPtb b bgwt">
            <tr>
                <td>
                    Tiêu đề :
                </td>
                <td>
                    <%--<input type="text" id="tbtitle" />--%>
                    <asp:TextBox ID="txtTitle" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Category :
                </td>
                <td id="CatSubCat">
                    <asp:UpdatePanel ID="UpdatePanel" runat="server" UpdateMode="Conditional">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="dlCategories" EventName="SelectedIndexChanged" />
                        </Triggers>
                        <ContentTemplate>
                            <asp:DropDownList ID="dlCategories" runat="server" OnSelectedIndexChanged="dlCategories_SelectedIndexChanged"
                                AutoPostBack="true">
                            </asp:DropDownList>
                            <asp:DropDownList ID="dlSubCategories" runat="server">
                            </asp:DropDownList>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr>
                <td>
                    Hình sản phẩm :<br />
                    <span class="note">size: 150x150px</span>
                </td>
                <td>
                    <input id="imgUploader" type="file" runat="server" />
                    <%--<asp:FileUpload ID="imgUploader" runat="server" />--%>
                </td>
            </tr>
            <tr>
                <td>
                    Giá :
                </td>
                <td>
                    <%--<input type="text" id="tbPrice" />--%>
                    <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>
                    VNĐ
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
            <tr>
                <td colspan="2">
                    <asp:Button ID="btnCreateProduct" runat="server" Text="Create" OnClick="btnCreateProduct_Click" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
