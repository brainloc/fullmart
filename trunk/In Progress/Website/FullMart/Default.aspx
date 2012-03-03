<%@ Page Title="" Language="C#" MasterPageFile="~/ThreeColumns.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="FullMart.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
                            <span>Answers & Questions</span></div>
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
    <div id="cmslide" class="block">
        <div id='mslider'>
            <div class="item">
                <img src="/themes/images/slide1.jpg" /></div>
            <div class="item">
                <img src="/themes/images/slide2.jpg" /></div>
            <div class="item">
                <img src="/themes/images/slide3.jpg" /></div>
            <div class="item">
                <img src="/themes/images/slide4.jpg" /></div>
        </div>
        <div class="clear">
        </div>
    </div>
    <div id="cmproduce" class="block">
        <div class="parea b">
            <div class="gcats btl">
                <span class="gtitle btl"><a href="#maincat" class="maincat btl"><span class="btl">
                    <asp:Label ID="txtTopProductPane" runat="server" Text="<%$ Resources:LocalizedText, txtTopProductPane %>"></asp:Label></span></a></span></div>
            <div class="listp">
                <div class="content">
                    <asp:Repeater ID="rpTopSection" runat="server" DataSourceID="dsTopSection">
                        <ItemTemplate>
                            <div class="product">
                                <a href='ViewProduct.aspx?ID=<%# Eval("ID") %>'>
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
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:SqlDataSource ID="dsTopSection" runat="server" ConnectionString="<%$ ConnectionStrings:FullMartConnectionString %>">
                    </asp:SqlDataSource>
                    <div class="clear">
                    </div>
                </div>
            </div>
        </div>
        <div class="parea b">
            <div class="gcats btl">
                <span class="gtitle btl"><a href="#maincat" class="maincat btl"><span class="btl">Newest Product</span></a></span></div>
            <div class="listp">
                <div class="content">
                    <asp:Repeater ID="rpNewSection" runat="server" DataSourceID="dsNewSection">
                        <ItemTemplate>
                            <div class="product">
                                <a href='ViewProduct.aspx?ID=<%# Eval("ID") %>'>
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
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:SqlDataSource ID="dsNewSection" runat="server" ConnectionString="<%$ ConnectionStrings:FullMartConnectionString %>">
                    </asp:SqlDataSource>
                    <div class="clear">
                    </div>
                </div>
            </div>
        </div>
        <%-- <div class="parea b">
            <div class="gcats btl">
                <span class="gtitle btl"><a href="#maincat" class="maincat btl"><span class="btl">Khuyến
                    mãi</span></a><a href="#subcat1" class="subcat"><span>Quà Tặng</span></a><a href="#subcat2"
                        class="subcat"><span>Others</span></a></span></div>
            <div class="listp">
                <div class="content">
                    <div class="product">
                        <a href="#a">
                            <div class="content">
                                <center>
                                    <img src="media/upload/product1.jpg" />
                                </center>
                            </div>
                            <div class="bottom">
                            </div>
                            <div class="nameproduct">
                                Điện Thoại<p>
                                    8.000.000 vnd</p>
                                <div class="salef">
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="product">
                        <a href="#a">
                            <div class="content">
                                <center>
                                    <img src="media/upload/product2.jpg" />
                                </center>
                            </div>
                            <div class="bottom">
                            </div>
                            <div class="nameproduct">
                                Điện Thoại<p>
                                    8.000.000 vnd</p>
                                <div class="salef">
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="product">
                        <a href="#a">
                            <div class="content">
                                <center>
                                    <img src="media/upload/product3.jpg" />
                                </center>
                            </div>
                            <div class="bottom">
                            </div>
                            <div class="nameproduct">
                                Điện Thoại<p>
                                    8.000.000 vnd</p>
                                <div class="salef">
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="product">
                        <a href="#a">
                            <div class="content">
                                <center>
                                    <img src="media/upload/product4.jpg" />
                                </center>
                            </div>
                            <div class="bottom">
                            </div>
                            <div class="nameproduct">
                                Điện Thoại<p>
                                    8.000.000 vnd</p>
                                <div class="salef">
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="product">
                        <a href="#a">
                            <div class="content">
                                <center>
                                    <img src="media/upload/product5.jpg" />
                                </center>
                            </div>
                            <div class="bottom">
                            </div>
                            <div class="nameproduct">
                                Điện Thoại<p>
                                    8.000.000 vnd</p>
                                <div class="salef">
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="product">
                        <a href="#a">
                            <div class="content">
                                <center>
                                    <img src="media/upload/product6.jpg" />
                                </center>
                            </div>
                            <div class="bottom">
                            </div>
                            <div class="nameproduct">
                                Điện Thoại<p>
                                    8.000.000 vnd</p>
                                <div class="salef">
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="product">
                        <a href="#a">
                            <div class="content">
                                <center>
                                    <img src="media/upload/product7.jpg" />
                                </center>
                            </div>
                            <div class="bottom">
                            </div>
                            <div class="nameproduct">
                                Điện Thoại<p>
                                    8.000.000 vnd</p>
                                <div class="salef">
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="product">
                        <a href="#a">
                            <div class="content">
                                <center>
                                    <img src="media/upload/product8.jpg" />
                                </center>
                            </div>
                            <div class="bottom">
                            </div>
                            <div class="nameproduct">
                                Điện Thoại<p>
                                    8.000.000 vnd</p>
                                <div class="salef">
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="clear">
                    </div>
                </div>
            </div>
        </div>--%>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Right" runat="server">
   
    <asp:SqlDataSource ID="dsListNew" runat="server" 
        ConnectionString="<%$ ConnectionStrings:FullMartConnectionString %>" 
        SelectCommand="SELECT [Title], [ID], [ShortContent], [ImageThumb] FROM [News] ORDER BY [CreatedDate] DESC">
    </asp:SqlDataSource>
    <div id="hotnew" class="lb b">
        <div class="title">
            Hot News</div>
        <div class="listitem">
         <asp:ListView ID="ListView1" runat="server" DataKeyNames="ID" DataSourceID="dsListNew" EnableModelValidation="True">
       <%-- <AlternatingItemTemplate>
        <li><div class="item">
                        <div class="left">
                            <a href="viewNews.aspx?ID=<%# Eval("ID") %>" title="<%# Eval("Title") %>">
                                <img class="thumb" alt="<%# Eval("Title") %>" src="<%# Eval("ImageThumb") %>" /></a></div>
                        <p>
                            <a href="viewNews.aspx?ID=<%# Eval("ID") %>" title="<%# Eval("Title") %>"><%# Eval("Title") %></a> 
                            <span><%# correctshortCT(Eval("ShortContent"), 30) %></span>
                        </p>
                    </div>
                    <div class="clear">
                    </div>
                </li>
        </AlternatingItemTemplate>--%>
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
        <div class="title">
            New ADV</div>
        <div class="advc">
            <div id="NAtab1" class="tabsi active">
                <ul>
                    <li><a href="#">noi dung quang cao, noi dung quang cao, noi dung quang cao, noi dung
                        quang cao, noi dung quang cao, noi dung quang cao,</a></li>
                    <li><a href="#">noi dung quang cao, noi dung quang cao, noi dung quang cao, noi dung
                        quang cao, noi dung quang cao, noi dung quang cao,</a></li>
                    <li><a href="#">noi dung quang cao, noi dung quang cao, noi dung quang cao, noi dung
                        quang cao, noi dung quang cao, noi dung quang cao,</a></li>
                    <li><a href="#">noi dung quang cao, noi dung quang cao, noi dung quang cao, noi dung
                        quang cao, noi dung quang cao, noi dung quang cao,</a></li>
                </ul>
                <a class="All" href="#All">>>See All</a></div>
            <div id="NAtab2" class="tabsi">
                <ul>
                    <li><a href="#">noi dung quang cao, noi dung quang cao, noi dung quang cao, noi dung
                        quang cao, noi dung quang cao, noi dung quang cao,2</a></li>
                    <li><a href="#">noi dung quang cao, noi dung quang cao, noi dung quang cao, noi dung
                        quang cao, noi dung quang cao, noi dung quang cao,2</a></li>
                    <li><a href="#">noi dung quang cao, noi dung quang cao, noi dung quang cao, noi dung
                        quang cao, noi dung quang cao, noi dung quang cao,2</a></li>
                    <li><a href="#">noi dung quang cao, noi dung quang cao, noi dung quang cao, noi dung
                        quang cao, noi dung quang cao, noi dung quang cao,2</a></li>
                </ul>
                <a class="All" href="#All">>>See All</a></div>
            <div id="NAtab3" class="tabsi">
                <ul>
                    <li><a href="#">noi dung quang cao, noi dung quang cao, noi dung quang cao, noi dung
                        quang cao, noi dung quang cao, noi dung quang cao,3</a></li>
                    <li><a href="#">noi dung quang cao, noi dung quang cao, noi dung quang cao, noi dung
                        quang cao, noi dung quang cao, noi dung quang cao,3</a></li>
                    <li><a href="#">noi dung quang cao, noi dung quang cao, noi dung quang cao, noi dung
                        quang cao, noi dung quang cao, noi dung quang cao,3</a></li>
                    <li><a href="#">noi dung quang cao, noi dung quang cao, noi dung quang cao, noi dung
                        quang cao, noi dung quang cao, noi dung quang cao,3</a></li>
                </ul>
                <a class="All" href="#All">>>See All</a></div>
        </div>
        <ul id="tabs">
            <li class="active"><a href="#NAtab1">SELL</a></li>
            <li><a href="#NAtab2">BUY</a></li>
            <li><a href="#NAtab3">SHARE</a></li>
        </ul>
        <div class="clear">
        </div>
    </div>
</asp:Content>
