<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="FullMart.admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/themes/style/admin.css" rel="stylesheet" type="text/css" />
    <script src="/themes/script/admin.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Left" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Right" runat="server">
<table class="block center">
                    <tr>
                        <td>
                            <div class="product">
                                <a class="mmsh" href="/Administration/ManagerGeneral.aspx">
                                    <div class="content">
                                        <center>
                                            <img src="/themes/images/Window.png" />
                                        </center>
                                    </div>
                                    <div class="nameproduct">
                                        General Manager
                                    </div>
                                </a>
                            </div>
                        </td>
                        <td>
                            <div class="product">
                                <a class="mmsh" href="/Administration/ManageUser.aspx">
                                    <div class="content">
                                        <center>
                                            <img src="/themes/images/IDblue.png" />
                                        </center>
                                    </div>
                                    <div class="nameproduct">
                                        User Manager
                                    </div>
                                </a>
                            </div>
                        </td>
                       <td>
                            <div class="product">
                                <a class="mmsh" href="/Shop/ManageProducts.aspx">
                                    <div class="content">
                                        <center>
                                            <img src="/themes/images/Bag_Purchase.png" />
                                        </center>
                                    </div>
                                    <div class="nameproduct">
                                        Product Manager
                                    </div>
                                </a>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="product">
                                <a  class="mmsh" href="QAA.htm">
                                    <div class="content">
                                        <center>
                                            <img src="/themes/images/talkblue.png" />
                                        </center>
                                    </div>
                                    <div class="nameproduct">
                                        A&Q Manager
                                    </div>
                                </a>
                            </div>
                        </td>
                        
                         <td>
                            <div class="product">
                                <a class="mmsh" href="/News/ManageNews.aspx">
                                    <div class="content">
                                        <center>
                                            <img src="/themes/images/newsblue.png" />
                                        </center>
                                    </div>
                                    <div class="nameproduct">
                                        News Manager
                                    </div>
                                </a>
                            </div>
                        </td><td>
                        </td>
                    </tr>
                </table>
</asp:Content>
