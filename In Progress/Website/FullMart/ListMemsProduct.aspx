<%@ Page Title="" Language="C#" MasterPageFile="~/ThreeColumns.Master" AutoEventWireup="true" CodeBehind="ListMemsProduct.aspx.cs" Inherits="FullMart.ListMemsProduct" %>
<%@ Register Assembly="DataPagerRepeater" Namespace="DataPagerRepeater" TagPrefix="Custom" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/themes/style/memproduct.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Left" runat="server">
    <div id="listcats" class="lb btlr">
        <div class="title block btlr">
            <span><%=FullMart.Code.DAO.BindingUltilities.GetResourceValue("categories") %></span></div>
        <ul class="lplist">
            <asp:Repeater ID="rpCategories" runat="server" DataSourceID="dsCategories">
                <ItemTemplate>
                    <li><a class="ap" href='/ListMemsProduct.aspx?cat=<%# Eval("ID") %>'>
                        <%# Eval("Name") %></a>
                        <div class="lsubcat b">
                            <span class="block title btlr">
                                <%# Eval("Name") %></span>
                            <ul>
                                <asp:Label ID="lblCategoryID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                <asp:Repeater ID="rpSubCategories" runat="server" DataSourceID="dsSubCategories">
                                    <ItemTemplate>
                                        <li><a href='/ListMemsProduct.aspx?subcat=<%# Eval("ID") %>'>
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
        <img src="/themes/images/leftadv.jpg" /></div>
     <asp:ListView ID="ListAQ" runat="server" DataKeyNames="ID" DataSourceID="dsAQ" EnableModelValidation="True">
                <EmptyDataTemplate>
                    <%=FullMart.Code.DAO.BindingUltilities.GetResourceValue("noproduct") %>
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
    <asp:Panel ID="pnViewAll" Visible="true" runat="server">
        <div class="parea b">
            <div class="gcats btl">
                <span class="gtitle btl"><a href="#maincat" class="maincat btl"><span class="btl">Sell
                </span></a></span>
            </div>
            <div class="listp">
                <div class="content">
                    <asp:ListView ID="lvSell" DataSourceID="dsSell" runat="server" DataKeyNames="ID"
                        EnableModelValidation="True">
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
                                <asp:DataPager ID="DataPager1" runat="server" PageSize="12">
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
                    <asp:SqlDataSource ID="dsSell" runat="server" ConnectionString="<%$ ConnectionStrings:FullMartConnectionString %>"
                        SelectCommand="SELECT Product.ID, Product.Price, Product.Thumbnail, Product.Title, Product.type, Product.CreatedDate FROM Product INNER JOIN [User] ON Product.PosterID = [User].ID WHERE (Product.type = 1) AND ([User].roleID = 3) ORDER BY Product.CreatedDate DESC">
                    </asp:SqlDataSource>
                    <div class="clear">
                    </div>
                </div>
            </div>
        </div>
        <div class="parea b">
            <div class="gcats btl">
                <span class="gtitle btl"><a href="#maincat" class="maincat btl"><span class="btl">Buy
                </span></a></span>
            </div>
            <div class="listp">
                <div class="content">
                    <asp:ListView ID="LvBuy" DataSourceID="dsBuy" runat="server" DataKeyNames="ID" EnableModelValidation="True">
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
                                <asp:DataPager ID="DataPager1" runat="server" PageSize="12">
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
                    <asp:SqlDataSource ID="dsBuy" runat="server" ConnectionString="<%$ ConnectionStrings:FullMartConnectionString %>"
                        SelectCommand="SELECT Product.ID, Product.Price, Product.Thumbnail, Product.Title, Product.type, Product.CreatedDate FROM Product INNER JOIN [User] ON Product.PosterID = [User].ID WHERE (Product.type = 2) AND ([User].roleID = 3) ORDER BY Product.CreatedDate DESC">
                    </asp:SqlDataSource>
                    <div class="clear">
                    </div>
                </div>
            </div>
        </div>
        <div class="parea b">
            <div class="gcats btl">
                <span class="gtitle btl"><a href="#maincat" class="maincat btl"><span class="btl">Share
                </span></a></span>
            </div>
            <div class="listp">
                <div class="content">
                    <asp:ListView ID="ListView1" DataSourceID="dsShare" runat="server" DataKeyNames="ID"
                        EnableModelValidation="True">
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
                                <asp:DataPager ID="DataPager1" runat="server" PageSize="12">
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
                    <asp:SqlDataSource ID="dsShare" runat="server" ConnectionString="<%$ ConnectionStrings:FullMartConnectionString %>"
                        SelectCommand="SELECT Product.ID, Product.Price, Product.Thumbnail, Product.Title, Product.type, Product.CreatedDate FROM Product INNER JOIN [User] ON Product.PosterID = [User].ID WHERE (Product.type = 3) AND ([User].roleID = 3) ORDER BY Product.CreatedDate DESC">
                    </asp:SqlDataSource>
                    <div class="clear">
                    </div>
                </div>
            </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="pnViewSub" Visible=false runat="server">
     <div class="parea b">
            <div class="gcats btl">
                <span class="gtitle btl"><a href="#maincat" class="maincat btl"><span class="btl"><asp:Label
                    ID="lbSubTitle" runat="server" Text=""></asp:Label>
                </span></a></span>
            </div>
            <div class="listp">
                <div class="content">
                    <asp:ListView ID="ListView2" DataSourceID="dsViewSub" runat="server" DataKeyNames="ID"
                        EnableModelValidation="True">
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
                                <asp:DataPager ID="DataPager1" runat="server" PageSize="12">
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
                    <asp:SqlDataSource ID="dsViewSub" runat="server" ConnectionString="<%$ ConnectionStrings:FullMartConnectionString %>">
                    </asp:SqlDataSource>
                    <div class="clear">
                    </div>
                </div>
            </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="pnViewCat" Visible="false" runat="server">
        <div class="parea b">

            <Custom:DataPagerRepeater ID="rpCat" DataSourceID="dsCat" runat="server">
                <ItemTemplate>
                    <div class="gcats btl">
                        <span class="gtitle btl"><a href="<%# Eval("SUBID") %>" class="maincat btl"><span
                            class="btl">
                            <%# Eval("NAMESUB")%></asp:Label>
                            <asp:Label ID="lblSubCategoryID" runat="server" Text='<%# Eval("SUBID") %>' Visible="false"></asp:Label>
                        </span></a></span>
                    </div>
                    <div class="listp">
                        <div class="content">
                            <asp:ListView ID="ListView3" DataSourceID="dsViewSubcat" runat="server" DataKeyNames="ID"
                                EnableModelValidation="True">
                                <EmptyDataTemplate>
                                    No Product to display !.
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
                                        <asp:DataPager ID="DataPager1" runat="server" PageSize="12">
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
                            <asp:SqlDataSource ID="dsViewSubcat" runat="server" 
                ConnectionString="<%$ ConnectionStrings:FullMartConnectionString %>" 
                SelectCommand="SELECT Product.Thumbnail, Product.CreatedDate, Product.Price, Product.ID, Product.Title, Product.type, [User].roleID FROM SubCategory INNER JOIN Product ON SubCategory.ID = Product.SubCategoryID INNER JOIN [User] ON Product.PosterID = [User].ID WHERE (SubCategory.ID = @SubCategoryID) AND ([User].roleID = 3) ORDER BY Product.type">
                <SelectParameters>
                    <asp:ControlParameter ControlID="lblSubCategoryID" DefaultValue="0" Name="SubCategoryID" Type="Int32"  />
                </SelectParameters>
                    </asp:SqlDataSource>
                            <div class="clear">
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </Custom:DataPagerRepeater>
            <asp:SqlDataSource ID="dsCat" runat="server" 
                ConnectionString="<%$ ConnectionStrings:FullMartConnectionString %>" 
                SelectCommand="GetListSubSameCat" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="0" Name="ID" QueryStringField="cat" 
                        Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </asp:Panel>
    <asp:Panel ID="pnViewType" Visible=false runat="server">
    
    </asp:Panel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Right" runat="server">
</asp:Content>
