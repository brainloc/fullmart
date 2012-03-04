<%@ Page Title="" Language="C#" MasterPageFile="~/TwoColumns.Master" AutoEventWireup="true" CodeBehind="listnew.aspx.cs" Inherits="FullMart.themes.script.listnew" %>
<%@ Register Assembly="DataPagerRepeater" Namespace="DataPagerRepeater" TagPrefix="Custom" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/themes/style/Listnews.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Left" runat="server">
    <div id="listcats" class="lb btlr">
        <div class="title block btlr">
            <span>Categories</span></div>
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
                SelectCommand="SELECT [ID],[Name] FROM [dbo].[Category] ORDER BY [Order]"></asp:SqlDataSource>
        </ul>
    </div>
    <div class="ladv lb">
        <img src="/themes/images/leftadv.jpg" /></div>
    <asp:ListView ID="ListAQ" runat="server" DataKeyNames="ID" DataSourceID="dsAQ" EnableModelValidation="True">
        <EmptyDataTemplate>
            No data was returned.
        </EmptyDataTemplate>
        <ItemTemplate>
            <li>
                <div class="Ahead">
                    <span class="Ausername"><a>
                        <%# Eval("UserName") %></a></span></div>
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
                    <span>Answers & Questions</span></div>
                <div class="listitem">
                    <ul id="itemPlaceholderContainer" runat="server" style="">
                        <li runat="server" id="itemPlaceholder" />
                    </ul>
                    <div class="Apages right">
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
    <asp:SqlDataSource ID="dsAQ" runat="server" ConnectionString="<%$ ConnectionStrings:FullMartConnectionString %>"
        SelectCommand="GetQAStatistic" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Right" runat="server">
    <ul class="listnew block">
        <Custom:DataPagerRepeater ID="rpNewsList" runat="server" DataSourceID="dsNewsList">
            <ItemTemplate>
                <li class="b bgwt">
            <div class="previewimage left">
                <center><a title="<%# Eval("Title") %>" href="/viewNews.aspx?ID=<%# Eval("ID") %>">
                    <img src="<%# Eval("ImageThumb") %>" alt="<%# Eval("Title") %>"></a></center>
            </div>
            <div class="previewcontent left">
                <span class="postday btlr"><%# Eval("CREATEDATE")%></span>
                <p class="title">
                    <a href="/viewNews.aspx?ID=<%# Eval("ID") %>" title="<%# Eval("Title") %>"><%# Eval("Title") %></a></p>
                <p class="content"><%# Eval("ShortContent") %>...
                </p>
            </div>
            <div class="clear">
            </div>
        </li>  
            </ItemTemplate>
        </Custom:DataPagerRepeater>
        <asp:SqlDataSource ID="dsNewsList" runat="server" ConnectionString="<%$ ConnectionStrings:FullMartConnectionString %>"
            SelectCommandType="StoredProcedure" SelectCommand="GetAllNews1"></asp:SqlDataSource>
             
    </ul>
    <div class="Apages right">
        <asp:DataPager ID="DataPager1" runat="server" PageSize="4" PagedControlID="rpNewOrders">
            <Fields>
                <%--
                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                            ShowNextPageButton="False" ShowPreviousPageButton="False" />--%>
                <asp:NumericPagerField />
                <%--<asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" 
                            ShowNextPageButton="False" ShowPreviousPageButton="False" />--%>
            </Fields>
        </asp:DataPager>
    </div>
</asp:Content>
