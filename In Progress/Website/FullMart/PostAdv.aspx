<%@ Page Title="" Language="C#" MasterPageFile="~/OneColumn.Master" AutoEventWireup="true" CodeBehind="PostAdv.aspx.cs" Inherits="FullMart.PostAdv" %>
<%@ Register TagPrefix="ckeditor" Namespace="CKEditor.NET" Assembly="CKEditor.NET" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="formPanel" runat="server">
  <div id="UpProduct">
        <asp:Label ID="txtmessage" CssClass="message" runat="server" Text=""></asp:Label>
        <asp:Panel ID="pnCreate" runat="server"> 
            <table class="UPtb b bgwt">
            <tr>
                <td>
                    <%=FullMart.Code.DAO.BindingUltilities.GetResourceValue("title") %> :
                </td>
                <td>
                    <%--<input type="text" id="tbtitle" />--%>
                    <asp:DropDownList ID="dlType" CssClass="dlType" DataSourceID="dsType" runat="server" 
                        DataTextField="Name" DataValueField="ID">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="dsType" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:FullMartConnectionString %>" 
                        SelectCommand="SELECT ID, Name, [Order] FROM MemsPostType ORDER BY [Order] DESC"></asp:SqlDataSource>
                    <asp:TextBox CssClass="tbtitle" ID="txtTitle" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <%=FullMart.Code.DAO.BindingUltilities.GetResourceValue("categories") %> :
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
                    <%=FullMart.Code.DAO.BindingUltilities.GetResourceValue("state") %> :
                </td>
                <td id="Td1"><asp:DropDownList ID="dlState" runat="server" DataSourceID="dsState" 
                        DataTextField="StateName" DataValueField="id">
                            </asp:DropDownList>
                    <asp:SqlDataSource ID="dsState" runat="server" DataSourceMode="DataReader" 
                        ConnectionString="<%$ ConnectionStrings:FullMartConnectionString %>" 
                        SelectCommand="SELECT [id], [StateName], [Order] FROM [State] ORDER BY [Order]"></asp:SqlDataSource>
                </td>
               
            </tr>
            <tr>
                <td>
                    <%=FullMart.Code.DAO.BindingUltilities.GetResourceValue("imageproduct") %> :<br />
                    <span class="note">size: 250x250px</span>Browse Server</button>
                </td>
                <td>
                    <%--<asp:TextBox ID="imageProduct" Enabled="false" CssClass="imageProduct" runat="server"></asp:TextBox>--%>
                    <input id="imgUploader" type="file" runat="server" /> <asp:Image ID="imgthumbN" CssClass="imgthumbN" ToolTip="images Thumb preview" runat="server" />
                    <%--<asp:FileUpload ID="imgUploader" runat="server" />--%>
                </td>
            </tr>
            <tr>
                <td>
                    <%=FullMart.Code.DAO.BindingUltilities.GetResourceValue("price") %> :
                </td>
                <td>
                    <%--<input type="text" id="tbPrice" />--%>
                    <asp:TextBox ID="txtPrice" CssClass="tprice" runat="server"></asp:TextBox>
                    VNĐ
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <ckeditor:CKEditorControl ID="CKENet" runat="server" Height="200" DefaultLanguage="En"></ckeditor:CKEditorControl>
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
                                    <asp:Button ID="btnCreateProduct" runat="server" Text="Create" OnClick="btnCreateProduct_Click" />
                                </div>
                            </td>
                        </tr>
                    </tfoot>
           
        </table>
        </asp:Panel>
       
    </div>
</asp:Content>
