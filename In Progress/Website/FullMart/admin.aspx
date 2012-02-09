<%@ Page Title="" Language="C#" MasterPageFile="~/TwoColumns.Master" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="FullMart.admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/themes/style/admin.css" rel="stylesheet" type="text/css" />
    <script src="themes/script/admin.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Left" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Right" runat="server">
<table>
                    <tr>
                        <td>
                            <div class="product">
                                <a class="mmsh" href="TC.htm">
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
                                <a class="mmsh" href="UserManager.htm">
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
                                <a class="mmsh" href="ManagerProduct.htm">
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
                                        Answer & Question Manager
                                    </div>
                                </a>
                            </div>
                        </td>
                        
                         <td>
                            <div class="product">
                                <a class="mmsh" href="ManagerNews.htm">
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
