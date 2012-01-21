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
                    <li><a class="ap" href='?cat=<%# Eval("ID") %>'>
                        <%# Eval("Name") %></a>
                        <div class="lsubcat b">
                            <span class="block title btlr">
                                <%# Eval("Name") %></span>
                            <ul>
                                <asp:Label ID="lblCategoryID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                <asp:Repeater ID="rpSubCategories" runat="server" DataSourceID="dsSubCategories">
                                    <ItemTemplate>
                                        <li><a href='?subcat=<%# Eval("ID") %>'>
                                            <%# Eval("Name") %></a></li>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:SqlDataSource ID="dsSubCategories" runat="server" ConnectionString="<%$ ConnectionStrings:FullMartConnectionString %>"
                                    SelectCommand="SELECT [ID],[Name] FROM [FullMart].[dbo].[SubCategory] WHERE [CategoryID] = @CategoryID">
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
                SelectCommand="SELECT [ID],[Name] FROM [FullMart].[dbo].[Category] ORDER BY [Order]">
            </asp:SqlDataSource>
        </ul>
    </div>
    <div class="ladv lb">
        <img src="themes/images/leftadv.jpg" /></div>
    <div id="AAQ" class="lb b">
        <div class="title">
            <span>Answers & Questions</span></div>
        <div class="listitem">
            <ul>
                <li>
                    <div class="Ahead">
                        <span class="Ausername"><a href="#aa">sniperPro</a></span></div>
                    <div class="Aarrow">
                        21/11/2011</div>
                    <div class="Acontent b">
                        <a href="a">
                            <p>
                                Something need to know about this website .....</p>
                        </a>
                    </div>
                </li>
                <li>
                    <div class="Ahead">
                        <span class="Ausername"><a href="#aa">sniperPro</a></span></div>
                    <div class="Aarrow">
                        21/11/2011</div>
                    <div class="Acontent b">
                        <a href="a">
                            <p>
                                Something need to know about this website .....</p>
                        </a>
                    </div>
                </li>
                <li>
                    <div class="Ahead">
                        <span class="Ausername"><a href="#aa">sniperPro</a></span></div>
                    <div class="Aarrow">
                        21/11/2011</div>
                    <div class="Acontent b">
                        <a href="a">
                            <p>
                                Something need to know about this website .....</p>
                        </a>
                    </div>
                </li>
                <li>
                    <div class="Ahead">
                        <span class="Ausername"><a href="#aa">sniperPro</a></span></div>
                    <div class="Aarrow">
                        21/11/2011</div>
                    <div class="Acontent b">
                        <a href="a">
                            <p>
                                Something need to know about this website Something need to know about this website
                                Something need to know about this website .....</p>
                        </a>
                    </div>
                </li>
            </ul>
            <div class="Apages right">
                <a href="#1" class="active" ref="1">1</a> <a href="#2" ref="2">2</a> <a href="#3"
                    ref="3">3</a> <a href="#4" ref="4">4</a> <a href="#5" ref="5">5</a> <a href="#0"
                        ref="0">All</a>
            </div>
            <div class="clear">
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Center" runat="server">
    <div id="cmslide" class="block">
        <div id='mslider'>
            <div class="item">
                <img src="themes/images/slide1.jpg" /></div>
            <div class="item">
                <img src="themes/images/slide2.jpg" /></div>
            <div class="item">
                <img src="themes/images/slide3.jpg" /></div>
            <div class="item">
                <img src="themes/images/slide4.jpg" /></div>
        </div>
        <div class="clear">
        </div>
    </div>
    <div id="cmproduce" class="block">
        <div class="parea b">
            <div class="gcats btl">
                <span class="gtitle btl"><a href="#maincat" class="maincat btl"><span class="btl">Khuyến
                    mãi</span></a><a href="#subcat1" class="subcat"><span>Quà Tặng</span></a><a href="#subcat2"
                        class="subcat"><span>Others</span></a></span></div>
            <div class="listp">
                <div class="content">
                    <asp:Repeater ID="rpTopSection" runat="server" DataSourceID="dsTopSection">
                        <ItemTemplate>
                            <div class="product">
                                <a href='ViewProduct.aspx?ID=<%# Eval("ID") %>'>
                                    <div class="content">
                                        <center>
                                            <img src='<%# ConfigurationSettings.AppSettings["ImagesPath"] %><%# Eval("Thumbnail") %>' alt='<%# Eval("Title") %>' />
                                        </center>
                                    </div>
                                    <div class="bottom">
                                    </div>
                                    <div class="nameproduct">
                                        <%# Eval("Title") %><p>
                                            <%# Eval("Price") %> vnd</p>
                                        <div class="salef">
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:SqlDataSource ID="dsTopSection" runat="server" ConnectionString="<%$ ConnectionStrings:FullMartConnectionString %>"
                        SelectCommand="SELECT TOP 8 [ID],[Price],[Thumbnail],[Title],[CreatedDate],[State] FROM [FullMart].[dbo].[Product] ORDER BY [CreatedDate] DESC">
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
        </div>
        <div class="parea b">
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
    <div id="hotnew" class="lb b">
        <div class="title">
            Hot News</div>
        <div class="listitem">
            <ul>
                <li>
                    <div class="item">
                        <div class="left">
                            <a href="#" title="tieu de bai viet">
                                <img class="thumb" alt="tieu de bai viet" src="media/upload/product1.jpg" /></a></div>
                        <p>
                            <a href="tieu de bai viet" title="tieu de bai viet">Tieu de rut gon</a> <span>Nội dung
                                rút gọn của bài viết, Nội dung rút gọn của bài viết, Nội dung rút gọn của bài viết,
                                Nội dung rút gọn của bài viết, giới hạn tối đa 150 ký tự</span>
                        </p>
                    </div>
                    <div class="clear">
                    </div>
                </li>
                <li>
                    <div class="item">
                        <div class="left">
                            <a href="#" title="tieu de bai viet">
                                <img class="thumb" alt="tieu de bai viet" src="media/upload/product1.jpg" /></a></div>
                        <p>
                            <a href="tieu de bai viet" title="tieu de bai viet">Tieu de rut gon</a> <span>Nội dung
                                rút gọn của bài viết, Nội dung rút gọn của bài viết, Nội dung rút gọn của bài viết,
                                Nội dung rút gọn của bài viết, giới hạn tối đa 150 ký tự</span>
                        </p>
                    </div>
                    <div class="clear">
                    </div>
                </li>
                <li>
                    <div class="item">
                        <div class="left">
                            <a href="#" title="tieu de bai viet">
                                <img class="thumb" alt="tieu de bai viet" src="media/upload/product1.jpg" /></a></div>
                        <p class="block">
                            <a href="tieu de bai viet" title="tieu de bai viet">Tieu de rut gon cua bai viet asd
                                da dd faf af</a> <span>Nội dung rút gọn của bài viết, Nội dung rút gọn của bài viết,
                                    Nội dung rút gọn của bài viết, Nội dung rút gọn của bài viết, giới hạn tối đa 150
                                    ký tự</span>
                        </p>
                    </div>
                    <div class="clear">
                    </div>
                </li>
            </ul>
            <div class="Apages right">
                <a href="#1" class="active" ref="1">1</a> <a href="#2" ref="2">2</a> <a href="#3"
                    ref="3">3</a> <a href="#4" ref="4">4</a> <a href="#5" ref="5">5</a> <a href="#0"
                        ref="0">All</a>
            </div>
            <div class="clear">
            </div>
        </div>
    </div>
    <div class="ladv lb">
        <img src="themes/images/rightadv.jpg" /></div>
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
