<%@ Page Title="" Language="C#" MasterPageFile="~/TwoColumns.Master" AutoEventWireup="true" CodeBehind="viewNews.aspx.cs" Inherits="FullMart.viewNews" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<link href="/themes/style/viewnews.css" rel="stylesheet" type="text/css" />
<script src="/themes/script/viewProduct.js" type="text/javascript"></script>
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
        <img src="/themes/images/leftadv.jpg" /></div>
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
<asp:Content ID="Content3" ContentPlaceHolderID="Right" runat="server">
<div class="contentnews btlr bgwt block">
                        <p class="titlen btlr block">Product info</p>
                        <p class="postday">Posted: 22/01/2011</p>
                        <div class="contentn">
                        <p>
	&nbsp;</p>
<p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); ">
	<span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; font-size: small; vertical-align: baseline; border-style: initial; border-color: initial; ">Gi&aacute; tr&ecirc;n kh&ocirc;ng bao&nbsp; gồm&nbsp;VAT</span></p>
<p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); ">
	<img alt="" src="http://static80.ichodientuvn.com/data/UserData/user_image/ps.tunglt/ffcd97d918b3bd1de0640bb60923d38e.JPG" style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; vertical-align: baseline; border-style: initial; border-color: initial; " /></p>
<p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); ">
	<span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; font-size: small; vertical-align: baseline; border-style: initial; border-color: initial; ">Giỏ qu&agrave; gồm</span>:</p>
<p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); ">
	<span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; font-size: small; vertical-align: baseline; border-style: initial; border-color: initial; ">1. R<span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; font-size: 13px; vertical-align: baseline; border-style: initial; border-color: initial; ">ượ</span>u Curner Sione: Th<span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; font-size: 13px; vertical-align: baseline; border-style: initial; border-color: initial; ">ể</span>&nbsp;t&iacute;ch: 750ml;&nbsp; Xu<span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; font-size: 13px; vertical-align: baseline; border-style: initial; border-color: initial; ">ấ</span>t x<span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; font-size: 13px; vertical-align: baseline; border-style: initial; border-color: initial; ">ứ</span>: Chile</span></p>
<p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); ">
	<span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; font-size: small; vertical-align: baseline; border-style: initial; border-color: initial; ">2. B&aacute;nh Classe : Trọng lượng: 400g; Xuất xứ: Việt Nam</span></p>
<p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); ">
	<span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; font-size: small; vertical-align: baseline; border-style: initial; border-color: initial; ">3.&nbsp;</span><span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; font-size: 11pt; vertical-align: baseline; border-style: initial; border-color: initial; line-height: 17px; ">Hộp Cafe G7 Cappuccino: 1 hộp 12 g&oacute;i; Xuất xứ: Việt Nam</span></p>
<p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); ">
	<span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; font-size: small; vertical-align: baseline; border-style: initial; border-color: initial; ">4. Hộp Lipton tea 25 t&uacute;i; Xuất xứ Việt Nam</span></p>
<p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); ">
	<span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; font-size: small; vertical-align: baseline; border-style: initial; border-color: initial; ">5. G&oacute;i Oreo Trọng lượng: 137g Xuất xứ: Indonexia</span></p>
<p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); ">
	<span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; font-size: small; vertical-align: baseline; border-style: initial; border-color: initial; ">6. Hộp sugas Trọng lượng: 140g Xuất xứ: Việt Nam</span></p>
<p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); ">
	<span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; font-size: small; vertical-align: baseline; border-style: initial; border-color: initial; ">7. Hộp Hello panda Trọng lượng: 50g Xuất xứ Singapore</span></p>
<p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); ">
	<span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; font-size: small; vertical-align: baseline; border-style: initial; border-color: initial; ">8. Giỏ m&acirc;y v&agrave; trang tr&iacute;</span></p>
<p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 1px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); width: 690px; border-top-color: rgb(204, 204, 204); border-top-style: dotted; ">
	&nbsp;</p>
<p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); text-align: center; ">
	<span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; vertical-align: baseline; border-style: initial; border-color: initial; "><em style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; vertical-align: baseline; border-style: initial; border-color: initial; "><strong style="font-weight: bold; "><span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-weight: inherit; font-style: inherit; font-size: medium; vertical-align: baseline; border-style: initial; border-color: initial; ">Shop Zippo Vạn An</span></strong></em></span></p>
<p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); text-align: center; ">
	<span style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; vertical-align: baseline; border-style: initial; border-color: initial; "><em style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-style: inherit; vertical-align: baseline; border-style: initial; border-color: initial; ">Chuy&ecirc;n cung cấp c&aacute;c sản phẩm zippo như: Zippo vintage, zippo Set, zippo la m&atilde;, zippo catalogue, zippo L, zippo B, zippo V, zippo M, zippo C, zippo đ&atilde; sử dụng, phụ kiện zippo, giữ ấm tay zippo, bao da zippo, xăng zippo, đ&aacute; zippo, bấc zippo, zippo la tinh, zippo slim...</em></span></p>
<p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); text-align: center; ">
	Địa chỉ: Số 404 Nh&agrave; G1 - Chung Cư Th&agrave;nh C&ocirc;ng - Ba Đ&igrave;nh - H&agrave; Nội.</p>
<p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); text-align: center; ">
	(Ng&otilde; 10 Đường Nguy&ecirc;n Hồng - Gần hồ Th&agrave;nh C&ocirc;ng)</p>
<p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); text-align: center; ">
	Hotline: 090 3 268885</p>
<p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); text-align: center; ">
	ĐT:&nbsp; 04 3773 9688</p>
<p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); text-align: center; ">
	Fax: 04 3773 3858</p>
<p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); text-align: center; ">
	Website: http://van-an.net</p>
<p style="margin-top: 0px; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; font-size: 12px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; border-style: initial; border-color: initial; color: rgb(68, 68, 68); background-color: rgb(247, 239, 203); text-align: center; ">
	Email: van-an@live.com</p>
<p>
	&nbsp;</p>

                        </div>
                        <div class="clear"></div>
                    </div>
            
</asp:Content>
