﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="FullMart.admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Right" runat="server">
    <table width="785px" class="block center">
        <tr>
            <td>
                <div class="product">
                    <a class="mmsh" href="/Administration/ManageGeneral.aspx">
                        <div class="content">
                            <center>
                                <img src="/themes/images/Window.png" />
                            </center>
                        </div>
                        <div class="nameproduct">
                            Manage General 
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
                             Manage User
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
                            Manage Product 
                        </div>
                    </a>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="product">
                    <a class="mmsh" href="QAA.htm">
                        <div class="content">
                            <center>
                                <img src="/themes/images/talkblue.png" />
                            </center>
                        </div>
                        <div class="nameproduct">
                             Manage A&Q
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
                            Manage News
                        </div>
                    </a>
                </div>
            </td>
            <td>
                <div class="product">
                    <a class="mmsh" href="/Administrator/ManageGeneral.aspx">
                        <div class="content">
                            <center>
                                <img src="/themes/images/Wiki1.png" />
                            </center>
                        </div>
                        <div class="nameproduct">
                            Manage State
                        </div>
                    </a>
                </div>
            </td>
        </tr>
    </table>
</asp:Content>
