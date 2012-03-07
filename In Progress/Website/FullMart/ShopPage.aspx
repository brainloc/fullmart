﻿<%@ Page Title="" Language="C#" MasterPageFile="~/ThreeColumns.Master" AutoEventWireup="true" CodeBehind="ShopPage.aspx.cs" Inherits="FullMart.ShopPage" %>
<%@ Register Assembly="DataPagerRepeater" Namespace="DataPagerRepeater" TagPrefix="Custom" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="/themes/script/ShopPage.js" type="text/javascript"></script>
    <link href="/themes/style/ShopPages.css" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Left" runat="server">
    <div id="listcats" class="lb btlr">
        <div class="title block btlr">
            <span><%=FullMart.Code.DAO.BindingUltilities.GetResourceValue("categories") %></span></div>
        <ul class="lplist">
            <asp:Repeater ID="rpCategories" runat="server" DataSourceID="dsCategories">
                <ItemTemplate>
                    <li><a class="ap" href='/ListProducts.aspx?cat=<%# Eval("ID") %>'>
                        <%# Eval("Name") %></a>
                        <div class="lsubcat b">
                            <span class="block title btlr">
                                <%# Eval("Name") %></span>
                            <ul>
                                                            <asp:Label ID="lblCategoryID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                <asp:Repeater ID="rpSubCategories" runat="server" DataSourceID="dsSubCategories">
                                    <ItemTemplate>
                                        <li><a href='/ListProducts.aspx?subcat=<%# Eval("ID") %>'>
                                            <%# Eval("Name") %></a></li>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:SqlDataSource ID="dsSubCategories" runat="server" ConnectionString="<%$ ConnectionStrings:FullMartConnectionString %>"
                                    SelectCommand="SELECT [ID],[Name] FROM [dbo].[SubCategory] WHERE [CategoryID] = @CategoryID">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="lblCategoryID" Name="CategoryID" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </ul>
                        </div>
                    </li>
                </ItemTemplate>
            </asp:Repeater>
            <asp:SqlDataSource ID="dsCategories" runat="server" ConnectionString="<%$ ConnectionStrings:FullMartConnectionString %>"
                SelectCommand="SELECT [ID],[Name] FROM [dbo].[Category] ORDER BY [Order]">
            </asp:SqlDataSource>
        </ul>
    </div>
    <div class="ladv lb">
        <img src="/themes/images/leftadv.jpg" />
    </div>
   
   <asp:ListView ID="ListAQ" runat="server" DataKeyNames="ID" DataSourceID="dsAQ" EnableModelValidation="True">
                <EmptyDataTemplate>
                    No data was returned.
                </EmptyDataTemplate>
               <ItemTemplate>
                    <li>
                        <div class="Ahead">
                            <span class="Ausername"><a><%# Eval("UserName") %></a></span></div>
                        <div class="Aarrow">
                            <%# Eval("CreateDate") %></div>
                        <div class="Acontent b">
                            <a href="QA.aspx#CQA<%# Eval("ID") %>">
                                <p>
                                    <%# Eval("Content") %></p>
                            </a>
                        </div>
                    </li>
                </ItemTemplate>

                <LayoutTemplate>
                    <div id="AAQ" class="lb b">
                        <div class="title">
                            <span><%=FullMart.Code.DAO.BindingUltilities.GetResourceValue("answerQuestion") %></span></div>
                        <div class="listitem">
                            <ul id="itemPlaceholderContainer" runat="server" style="">
                                <li runat="server" id="itemPlaceholder" />
                            </ul>
                             <div  class="Apages right">
                                <asp:DataPager ID="DataPager1" runat="server" PageSize="5">
                                    <Fields>
                                        <asp:NumericPagerField />
                                    </Fields>
                                </asp:DataPager>
                                <a href="/QA.aspx" ref="0">All</a>
                            </div>
                            <div class="clear">
                            </div>
                        </div>
                    </div>
                   
                </LayoutTemplate>
            </asp:ListView>
            <asp:SqlDataSource ID="dsAQ" runat="server"  ConnectionString="<%$ ConnectionStrings:FullMartConnectionString %>"  SelectCommand="GetQAStatistic" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Center" runat="server">
    <div class="clear block">
        <asp:Repeater ID="rpShopInfor" runat="server">
            <ItemTemplate>
                <div class="Shopdetail clear">
                    <div class="summary-info">
                        <div class="summary-info-box clear">
                            <h3 class="name-shop">
                                <a href="#" title="<%# Eval("ShopName") %>">
                                    <%# Eval("ShopName")%></a>
                            </h3>
                            <table>
                                <tr>
                                    <td>
                                        <%=FullMart.Code.DAO.BindingUltilities.GetResourceValue("status") %>
                                    </td>
                                    <td>
                                        <%=shopchecked %>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <%=FullMart.Code.DAO.BindingUltilities.GetResourceValue("createdDate") %>
                                    </td>
                                    <td>
                                        <%# Eval("CreateDate")%>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <%=FullMart.Code.DAO.BindingUltilities.GetResourceValue("address") %>
                                    </td>
                                    <td>
                                        <%# Eval("Adress")%>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <%=FullMart.Code.DAO.BindingUltilities.GetResourceValue("phone") %>
                                    </td>
                                    <td>
                                        <%# Eval("Phone")%>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <img src="/themes/images/icon-chat.jpg" />Yahoo !ID :
                                    </td>
                                    <td>
                                        <%# Eval("Chat")%>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <%=FullMart.Code.DAO.BindingUltilities.GetResourceValue("rate") %>
                                    </td>
                                    <td>
                                        <span class="rate">
                                            <%# Eval("rate")%></span>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
            </asp:Repeater>
        <div class="clear">
        </div>
    </div><input id="UShopID" type="hidden" value="-1" runat="server" />
     <div id="cmproduce" class="block">
        <div class="parea b">
            
            <div class="gcats btl">
                <span class="gtitle btl"><a href="#maincat" class="maincat btl"><span class="btl"><%=FullMart.Code.DAO.BindingUltilities.GetResourceValue("productsofshop") %></span></a></span></div>
            <div class="listp">
                <div class="content">
                    <asp:ListView ID="ListProductShop" runat="server" DataKeyNames="ID" EnableModelValidation="True">
                        <EmptyDataTemplate>
                            <%=FullMart.Code.DAO.BindingUltilities.GetResourceValue("noproduct") %>
                        </EmptyDataTemplate>
                        <ItemTemplate>
                            <li style="">
                                <div class="product">
                                    <a href='/ViewProduct.aspx?ID=<%# Eval("ID") %>'>
                                        <div class="content">
                                            <center>
                                                <img src='<%# ConfigurationSettings.AppSettings["ImagesPath"] %><%# Eval("Thumbnail") %>'
                                                    alt='<%# Eval("Title") %>' />
                                            </center>
                                        </div>
                                        <div class="bottom">
                                        </div>
                                        <div class="nameproduct">
                                            <%# Eval("Title") %><p>
                                                <%# Eval("Price") %>
                                                vnd</p>
                                            <div class="salef">
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </li>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <ul id="itemPlaceholderContainer" runat="server" class="clear">
                                <li runat="server" id="itemPlaceholder" />
                            </ul>
                            <div class="clear">
                            </div>
                            <div class="Apages right">
                                <asp:DataPager ID="DataPager1" runat="server" PageSize="20">
                                    <Fields>
                                        <asp:NumericPagerField />
                                    </Fields>
                                </asp:DataPager>
                                <%--<a href="/QA.aspx" ref="0">All</a>--%>
                            </div>
                            <div class="clear">
                            </div>
                        </LayoutTemplate>
                    </asp:ListView>
                    <div class="clear">
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Right" runat="server">
   
    <asp:SqlDataSource ID="dsListNew" runat="server" 
        ConnectionString="<%$ ConnectionStrings:FullMartConnectionString %>" 
        SelectCommand="GetAllNews1" SelectCommandType="StoredProcedure">
    </asp:SqlDataSource>
    <div id="hotnew" class="lb b">
        <div class="title"><%=FullMart.Code.DAO.BindingUltilities.GetResourceValue("hotnews") %></div>
        <div class="listitem">
         <asp:ListView ID="ListView1" runat="server" DataKeyNames="ID" DataSourceID="dsListNew" EnableModelValidation="True">
        <EmptyDataTemplate>
            
        </EmptyDataTemplate>
        <ItemTemplate>
            <li><div class="item">
                        <div class="left">
                            <a href="viewNews.aspx?ID=<%# Eval("ID") %>" title="<%# Eval("Title") %>">
                                <img class="thumb" alt="<%# Eval("Title") %>" src="<%# Eval("ImageThumb") %>" /></a></div>
                        <p>
                            <a href="viewNews.aspx?ID=<%# Eval("ID") %>" title="<%# Eval("Title") %>"><%# Eval("Title") %></a> 
                            <span><%# correctshortCT(Eval("ShortContent"),200) %></span>
                        </p>
                    </div>
                    <div class="clear">
                    </div>
                </li>
        </ItemTemplate>
        <LayoutTemplate>
            <ul ID="itemPlaceholderContainer" runat="server" style="">
                <li runat="server" id="itemPlaceholder" />
            </ul>
            <div class="Apages right">
                <asp:DataPager ID="DataPager1" runat="server" PageSize="4">
                    <Fields><%--
                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                            ShowNextPageButton="False" ShowPreviousPageButton="False" />--%>
                        <asp:NumericPagerField />
                        <%--<asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" 
                            ShowNextPageButton="False" ShowPreviousPageButton="False" />--%>
                    </Fields>
                </asp:DataPager>
                <a href="/listnew.aspx" ref="0">All</a>
            </div>
        </LayoutTemplate>
    </asp:ListView>
            <div class="clear">
            </div>
        </div>
    </div>
    <div class="ladv lb">
        <img src="/themes/images/rightadv.jpg" /></div>
  <div id="newadv" class="lb b">
        <div class="title"><%=FullMart.Code.DAO.BindingUltilities.GetResourceValue("newadv") %></div>
        <div class="advc">
            <div id="NAtab1" class="tabsi active">
                <ul>
                    <asp:Repeater ID="rpadvSell" DataSourceID="dsADVSell" runat="server">
                    <ItemTemplate>
                        <li>
                            <div class="item">
                                <div class="left">
                                    <a href="/ViewProduct.aspx?ID=<%# Eval("ID") %>" title="<%# Eval("Title") %>">
                                        <img class="thumb" alt="<%# Eval("Title") %>" src="<%# ConfigurationSettings.AppSettings["ImagesPath"] %><%# Eval("Thumbnail") %>" /></a></div>
                                <p>
                                    <a href="/ViewProduct.aspx?ID=<%# Eval("ID") %>" title="<%# Eval("Title") %>">
                                        <%# Eval("Title") %></a> <span>
                                            <%# Eval("CreatedDate")%></span>
                                </p>
                            </div>
                            <div class="clear">
                            </div>
                        </li>
                    </ItemTemplate>
                    </asp:Repeater>
                </ul>
                <a class="All" href="/ListMemsProduct.aspx">>>See All</a></div>
            <div id="NAtab2" class="tabsi">
                <ul>
                    <asp:Repeater ID="rpBuy" DataSourceID="dsADVBuy" runat="server">
                    <ItemTemplate>
                        <li>
                            <div class="item">
                                <div class="left">
                                    <a href="/ViewProduct.aspx?ID=<%# Eval("ID") %>" title="<%# Eval("Title") %>">
                                        <img class="thumb" alt="<%# Eval("Title") %>" src="<%# Eval("Thumbnail") %>" /></a></div>
                                <p>
                                    <a href="/ViewProduct.aspx?ID=<%# Eval("ID") %>" title="<%# Eval("Title") %>">
                                        <%# Eval("Title") %></a> <span>
                                            <%# Eval("CreatedDate")%></span>
                                </p>
                            </div>
                            <div class="clear">
                            </div>
                        </li>
                    </ItemTemplate>
                    </asp:Repeater>
                </ul>
                <a class="All" href="/ListMemsProduct.aspx">>>See All</a></div>
            <div id="NAtab3" class="tabsi">
                <ul>
                    <asp:Repeater ID="rpShare" DataSourceID="dsADVShare" runat="server">
                    <ItemTemplate>
                        <li>
                            <div class="item">
                                <div class="left">
                                    <a href="/ViewProduct.aspx?ID=<%# Eval("ID") %>" title="<%# Eval("Title") %>">
                                        <img class="thumb" alt="<%# Eval("Title") %>" src="<%# ConfigurationSettings.AppSettings["ImagesPath"] %><%# Eval("Thumbnail") %>"  /></a></div>
                                <p>
                                    <a href="/ViewProduct.aspx?ID=<%# Eval("ID") %>" title="<%# Eval("Title") %>">
                                        <%# Eval("Title") %></a> <span>
                                            <%# Eval("CreatedDate")%></span>
                                </p>
                            </div>
                            <div class="clear">
                            </div>
                        </li>
                    </ItemTemplate>
                    </asp:Repeater>
                </ul>
                <a class="All" href="/ListMemsProduct.aspx">>>See All</a></div>
        </div>
        <ul id="tabs">
            <li class="active"><a href="#NAtab1">SELL</a></li>
            <li><a href="#NAtab2">BUY</a></li>
            <li><a href="#NAtab3">SHARE</a></li>
        </ul>
        <div class="clear">
        </div>
    </div>
    <asp:SqlDataSource ID="dsADVSell" runat="server" 
        ConnectionString="<%$ ConnectionStrings:FullMartConnectionString %>" 
        SelectCommand="SELECT TOP 5 [ID], [Price], [Thumbnail], [Title], [CreatedDate], [type] FROM [Product] WHERE ([type] = @type) ORDER BY [CreatedDate]">
        <SelectParameters>
            <asp:Parameter DefaultValue="1" Name="type" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsADVBuy" runat="server" 
        ConnectionString="<%$ ConnectionStrings:FullMartConnectionString %>" 
        SelectCommand="SELECT TOP 5 [ID], [Price], [Thumbnail], [Title], [CreatedDate], [type] FROM [Product] WHERE ([type] = @type) ORDER BY [CreatedDate]">
        <SelectParameters>
            <asp:Parameter DefaultValue="2" Name="type" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsADVShare" runat="server" 
        ConnectionString="<%$ ConnectionStrings:FullMartConnectionString %>" 
        SelectCommand="SELECT TOP 5 [ID], [Price], [Thumbnail], [Title], [CreatedDate], [type] FROM [Product] WHERE ([type] = @type) ORDER BY [CreatedDate]">
        <SelectParameters>
            <asp:Parameter DefaultValue="3" Name="type" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
