<%@ Page Title="" Language="C#" MasterPageFile="~/OneColumn.Master" AutoEventWireup="true" CodeBehind="ShopC.aspx.cs" Inherits="FullMart.ShopC" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/themes/style/RShop.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        $(document).ready(function () {
            
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="formPanel" runat="server">
<asp:Label ID="lbmess" runat="server" CssClass="titler" Text=""></asp:Label>
    <asp:Panel ID="pnRshop" Visible=false runat="server">
    <asp:Panel ID="pnRshop1" Visible=false runat="server">
        <div class="rstc clear block b">
            <span class="titler">Shop's Condition</span>
            <div class="rstc1">
                <asp:Label ID="lbShop" runat="server" Text=""></asp:Label>
            </div>
            <div class="clear"></div>
            <asp:Button ID="cmdAgree" runat="server" Text="Agree" 
                onclick="cmdAgree_Click" />
        </div>
    </asp:Panel>
    <asp:Panel ID="pnRshop2" Visible=false runat="server">
        <div class="clear block">
            
            <table class="regShop block center">
            <tr>
                <td>Shop Name :</td>
                <td>
                    <asp:TextBox ID="txtShopName" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Address :</td>
                <td>
                    <asp:TextBox ID="txtAdress" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Phone :</td>
                <td>
                    <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Yahoo! ID :</td>
                <td>
                    <asp:TextBox ID="txtYahoo" runat="server"></asp:TextBox></td>
            </tr>
            <tfoot>
                <tr><td colspan="2"><asp:Button ID="cmdCREATEShop" runat="server" Text="CREATE" 
                onclick="cmdCREATEShop_Click"  /></td></tr>
            </tfoot>
            </table>
            
        </div>
    </asp:Panel>
    <asp:Panel ID="pnRshop3" Visible=false runat="server">
        <div class="block bgwt b titler">
            <asp:Label ID="Label1" runat="server" Text="Your Shop Created Successfull!"></asp:Label> <a href="/Shop/CreateProduct.aspx" title="Post your first Product"> Post your first Product</a>
        </div>
    </asp:Panel>    
    </asp:Panel>
    <asp:Panel ID="pnShop" Visible=false runat="server">
        <div class="Shopdetail">
            <table>
                <tr>
                    <td>ShopName :</td>
                    <td><asp:Label ID="lbShopName" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td>Status :</td>
                    <td><asp:Label ID="lbstatus" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td>Created Date :</td>
                    <td><asp:Label ID="lbCreatedDate" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td>Address :</td>
                    <td><asp:Label ID="lbAddress" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td>Phone :</td>
                    <td><asp:Label ID="lbPhone" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td>
                        <img src="/themes/images/icon-chat.jpg" />Yahoo !ID :</td>
                    <td><asp:Label ID="lbYahoo" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td>Rate :</td>
                    <td><asp:Label CssClass="rate" ID="lbrate" runat="server" Text=""></asp:Label></td>
                </tr>
                <tfoot>
                    <tr>
                        <td colspan="2">
                            <asp:Button ID="cmdedit" runat="server" Text="edit" OnClick="cmdedit_Click" />
                        </td>
                    </tr>
                </tfoot>
            </table>
        </div>
    </asp:Panel>
</asp:Content>
