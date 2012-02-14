<%@ Page Title="" Language="C#" MasterPageFile="~/TwoColumns.Master" AutoEventWireup="true" CodeBehind="ManageNews.aspx.cs" Inherits="FullMart.ManageNews" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/themes/style/admin.css" rel="stylesheet" type="text/css" />
    <script src="/themes/script/admin.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Left" runat="server">
<div id="Lmenu" class="lb btlr">
<div id="Div1" class="lb btlr">
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
<asp:Content ID="Content3" ContentPlaceHolderID="Right" runat="server"><div class="acontent block"><a href="CreateNews.aspx"><img src="/themes/images/upload.png" /></a>
    <div class="acontent block">
        <p class="atitle">
            Manager News</p>
        <div class="MNews">
            <table cellpadding="0" cellspacing="0">
                <thead>
                    <tr>
                        <th>
                            ID
                        </th>
                        <th>
                            News title
                        </th>
                        <th>
                            Post date
                        </th>
                        <th>
                            Poster
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="rpNewsList" runat="server" DataSourceID="dsNewsList">
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <div class="cmdUser">
                                        <a href="/viewNews.aspx?ID=<%# Eval("ID") %>" target="_blank">
                                            <button class="Uview left">
                                            </button>
                                        </a><a href="editp.aspx?id=<%# Eval("ID") %>" target="_blank">
                                            <button class="Uedit left">
                                            </button>
                                        </a>
                                        <button class="Udelete left">
                                        </button>
                                        <div class="clear">
                                        </div>
                                    </div>
                                    <%# Eval("ID") %>
                                </td>
                                <td>
                                    <a href="/viewNews.aspx?ID=<%# Eval("ID") %>" target="_Blank">
                                        <%# Eval("Title") %></a>
                                </td>
                                <td>
                                    <%# Eval("CREATEDATE") %>
                                </td>
                                <td>
                                    <%# Eval("Poster") %>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:SqlDataSource ID="dsNewsList" runat="server" ConnectionString="<%$ ConnectionStrings:FullMartConnectionString %>"
                        SelectCommandType="StoredProcedure" SelectCommand="GetAllNews"></asp:SqlDataSource>
                </tbody>
            </table>
        </div>
        <div class="Apages right">
            <a href="#1" class="active" ref="1">1</a> <a href="#2" ref="2">2</a> <a href="#3"
                ref="3">3</a> <a href="#4" ref="4">4</a> <a href="#5" ref="5">5</a> <a href="#0"
                    ref="0">All</a>
        </div>
        <div class="clear">
        </div>
    </div>
    <script type="text/javascript">
        
    </script>
    <div id="cfdeleten">
        <p><center>Do you want to delete New : <span></span> ?</center></p>
        <input type="hidden" />
        <center><button>Yes</button><button>No</button></center>
      </div>
</asp:Content>
