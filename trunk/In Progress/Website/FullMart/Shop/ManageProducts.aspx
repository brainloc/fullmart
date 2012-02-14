﻿<%@ Page Title="" Language="C#" MasterPageFile="~/TwoColumns.Master" AutoEventWireup="true"
    CodeBehind="ManageProducts.aspx.cs" Inherits="FullMart.Shop.ManageProducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../themes/style/admin.css" rel="stylesheet" type="text/css" />
    <script src="../themes/script/admin.js" type="text/javascript"></script>
    <%--<script type="text/javascript">
        $(document).ready(function () {
            //update select
            $("ul.maincat > li").click(function () {
                var selectedCatID = $(this).children("span").attr("id");
                var commandName = "Select";
                __doPostBack('<%= updateSubCat.ClientID %>', commandName + "$" + selectedCatID);
                return false;
            });

            //delete
            $("button.delState").click(function () {
                var clickedID = $(this).closest("span").attr("id");
                __doPostBack('<%= updateSubCat.ClientID %>', clickedID);
                return false;
            });

            //insert
        });
    </script>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Left" runat="server">
<div id="Lmenu" class="lb btlr">
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
<asp:Content ID="Content3" ContentPlaceHolderID="Right" runat="server">
    <div class="State block" id="State">
     <div class="acontent block"><a href="CreateProduct.aspx"><img src="/themes/images/upload.png" /></a>
         </div>
        <div class="acontent block">
            <p class="atitle">
                Manager Categories</p>
            <table>
                <tr>
                    <td>
                        Main Categories
                    </td>
                    <td>
                        Sub Catetgories
                    </td>
                </tr>
                <tr>
                    <td id="dlCategory">
                        <div class="insstate left">
                            <input type="text" value="Press 'Enter' to insert" title="Press 'Enter' to insert"
                                class="aip" id="INSCAT" />
                            <button class="slobox">
                            </button>
                            <div class="clear">
                            </div>
                            <ul class="maincat">
                                <asp:Repeater ID="rpCategories" runat="server" DataSourceID="dsCategories">
                                    <ItemTemplate>
                                        <li><span id='Category$<%# Eval("ID") %>'><%# Eval("Name") %></span>
                                            <button class="delState" title="Delete" title="Delete">
                                            </button>
                                        </li>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:SqlDataSource ID="dsCategories" runat="server" ConnectionString="<%$ ConnectionStrings:FullMartConnectionString %>"
                                    SelectCommand="SELECT [ID],[Name] FROM [FullMart].[dbo].[Category] ORDER BY [Order]">
                                </asp:SqlDataSource>
                            </ul>
                        </div>
                    </td>
                    <td id="dlSubCategory">
                        <div class="insstate left">
                            <input type="text" value="Press 'Enter' to insert" title="Press 'Enter' to insert"
                                class="aip" id="INSSUBCAT" />
                            <button class="slobox">
                            </button>
                            <div class="clear">
                            </div>
                            <ul class="subcat">
                                <asp:UpdatePanel ID="updateSubCat" runat="server">
                                    <ContentTemplate>
                                        <asp:Repeater ID="rpSubCategories" runat="server">
                                            <ItemTemplate>
                                                <li><span id='SubCategory$<%# Eval("ID") %>'><%# Eval("Name") %></span>
                                                    <button class="delState" title="Delete" title="Delete">
                                                    </button>
                                                </li>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </ul>
                        </div>
                    </td>
                </tr>
            </table>
            <div class="clear">
            </div>
        </div>
        <div class="acontent block">
            <p class="atitle">
                Manager Product</p>
            <div class="insstate">
                <asp:TextBox ID="txtsearchPID" CssClass="aip" title="Search by Product ID" Text="Search by Product ID"
                    runat="server"></asp:TextBox>
                <button class="SUser">
                </button>
            </div>
            <div class="insstate left">
                <asp:TextBox ID="txtSProduct" CssClass="aip SProduct" title="Enter Email to search user's product"
                    Text="Enter Email to search user's product" runat="server"></asp:TextBox>
            </div>
            <asp:UpdatePanel ID="updateCategory" runat="server">
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="dlCategories" EventName="SelectedIndexChanged" />
                </Triggers>
                <ContentTemplate>
                    <div class="insstate left">
                        <asp:DropDownList ID="dlCategories" runat="server" OnSelectedIndexChanged="dlCategories_SelectedIndexChanged"
                            AutoPostBack="true">
                        </asp:DropDownList>
                    </div>
                    <div class="insstate left">
                        <asp:DropDownList ID="dlSubCategories" runat="server">
                        </asp:DropDownList>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:Button ID="btnSearch" CssClass="bt block" runat="server" Text="Search" OnClick="btnSearch_Click" />
            <div class="clear">
            </div>
        </div>
    </div>
    <div class="MProduct">
        <table cellpadding="0" cellspacing="0">
            <thead>
                <tr>
                    <th>
                        ID
                    </th>
                    <th>
                        Product's Name
                    </th>
                    <th>
                        Post date
                    </th>
                    <th>
                        Poster
                    </th>
                    <th>
                        Price(vnd)
                    </th>
                    <th>
                        Sub Category
                    </th>
                    <th>
                        OS
                    </th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="rpManagingProductList" runat="server" DataSourceID="dsManagingProductList">
                    <ItemTemplate>
                        <tr>
                            <td>
                                <div class="cmdUser">
                                    <a href="/ViewProduct.aspx?id=<%# Eval("ID")%>" target="_blank">
                                        <button class="Uview left">
                                        </button>
                                    </a><a href="editp.aspx?id=<%# Eval("ID")%>" target="_blank">
                                        <button class="Uedit left">
                                        </button>
                                    </a>
                                    <button class="Udelete left">
                                    </button>
                                    <div class="clear">
                                    </div>
                                </div>
                                <%# Eval("ID")%>
                            </td>
                            <td>
                                <a href="#link_Product" target="_Blank">
                                    <%# Eval("Title")%></a>
                            </td>
                            <td>
                                <%# Eval("CreatedDate") %>
                            </td>
                            <td>
                                <%# Eval("email") %>
                            </td>
                            <td>
                                <%# Eval("Price") %>
                            </td>
                            <td>
                                <%# Eval("Name") %>
                            </td>
                            <td>
                                <input type="checkbox" class="outstanding" />
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:SqlDataSource ID="dsManagingProductList" runat="server" ConnectionString="<%$ ConnectionStrings:FullMartConnectionString %>"
                    SelectCommandType="StoredProcedure" SelectCommand="GetManagingProductList">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtsearchPID" ConvertEmptyStringToNull="true" Name="ProductID" />
                        <asp:ControlParameter ControlID="txtSProduct" ConvertEmptyStringToNull="true" Name="Email" />
                        <asp:ControlParameter ControlID="dlCategories" ConvertEmptyStringToNull="true" Name="CatID" />
                        <asp:ControlParameter ControlID="dlSubCategories" ConvertEmptyStringToNull="true"
                            Name="SubcatID" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </tbody>
        </table>
        <div class="Apages right">
            <a href="#1" class="active" ref="1">1</a> <a href="#2" ref="2">2</a> <a href="#3"
                ref="3">3</a> <a href="#4" ref="4">4</a> <a href="#5" ref="5">5</a> <a href="#0"
                    ref="0">All</a>
        </div>
    </div>
    <div class="clear">
    </div>
    <div id="cfdeletep">
        <p><center>Do you want to delete : <span></span> ?</center></p>
        <input type="hidden" />
        <center><button>Yes</button><button>No</button></center>
      </div>

</asp:Content>
