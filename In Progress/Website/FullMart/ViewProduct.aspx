<%@ Page Title="" Language="C#" MasterPageFile="~/ThreeColumns.Master" AutoEventWireup="true"
    CodeBehind="ViewProduct.aspx.cs" Inherits="FullMart.ViewProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="themes/style/QAA.css" rel="stylesheet" type="text/css" />
    <link href="/themes/style/viewproduct.css" rel="stylesheet" type="text/css" />
    <script src="/themes/script/viewProduct.js" type="text/javascript"></script>
    <script src="themes/script/QAA.js" type="text/javascript"></script>
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
<asp:Content ID="Content3" ContentPlaceHolderID="Center" runat="server">
    <div class="viewproduct b bgwt block">
        <asp:Repeater ID="rpProductDetail" runat="server">
            <ItemTemplate>
                <div class="headproduct block">
                    <p class="titlep btlr block">
                        <%# Eval("Title")%></p>
                    <div class="imagepreview center left">
                        <img src='<%# ConfigurationSettings.AppSettings["ImagesPath"] %><%# Eval("Picture") %>' alt='<%# Eval("Title") %>' /></div>
                    <div class="Posterinfo bgwt left">
                        <div class="buy">
                            <input type="text" class="b nump" value="1" title="Quantity" />
                            <button>
                                Buy It</button></div>
                        <ul>
                            <li>Price: <span class="price">
                                <%# Eval("Price")%>
                                VNĐ</span> </li>
                            <li>Poster: <a href="#" title='Ghé thăm Shop của <%# Eval("PosterName") %>'>
                                <%# Eval("PosterName") %></a></li>
                            <li>Post date: 11-07-2011 | 15:12 </li>
                            <li>State :
                                <%# Eval("StateName")%></li>
                            <li>Contact :
                                <ul>
                                    <li><a href='mailto:<%# Eval("email") %>'>
                                        <img src="/themes/images/email-Icon.png" alt="Email" /></a></li>
                                    <li><a href='ymsgr:sendIM?<%# Eval("yahoo") %>'>
                                        <img src='http://opi.yahoo.com/online?u=<%# Eval("yahoo") %>&amp;m=g&amp;t=1' alt="Chat trực tiếp"
                                            title="Chat trực tiếp" /></a></li>
                                    <li>
                                        <img src="/themes/images/Phone-Icon.png" />
                                        :
                                        <%# Eval("mobile") %></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="clear">
                    </div>
                </div>
                <div class="contentproduct block">
                    <p class="titlep btlr block">
                        Product info</p>
                    <div class="contentp">
                        <p>
                            &nbsp;</p>
                        <%# Eval("Content")%>
                        <p>
                            &nbsp;</p>
                    </div>
                    <div class="clear">
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <div id="cmproduce" class="block">
        <div class="parea b">
            <div class="gcats btl">
                <span class="gtitle btl"><a href="#maincat" class="maincat btl"><span class="btl">Other
                    Product Same Categories</span></a></span></div>
            <div class="listp">
                <div class="content">
                    <asp:Repeater ID="rpProductsOfCurrentCategory" runat="server">
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
                    <div class="clear">
                    </div>
                </div>
            </div>
        </div>
        <div class="parea b">
            <div class="gcats btl">
                <span class="gtitle btl"><a href="#maincat" class="maincat btl"><span class="btl">Other
                    Product Same Poster</span></a></span></div>
            <div class="listp">
                <div class="content">
                    <asp:Repeater ID="rpProductByPoster" runat="server">
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
                    <div class="clear">
                    </div>
                </div>
            </div>
        </div>
    </div>
   <div class="viewproduct comment">
        <div class="contentproduct block">
        <p class="titlep btlr block">Comment</p>
            <div class="contentp bgwt">
                <div class="listitem bgwt b block">
                    <div id="fcomment">
                        <div id='support'>
                            <div class="Ahead">
                                <span class="Ausername"><a>
                                    <%= Page.User.Identity.Name %></a>
                                    <asp:HyperLink ID="hlUser" runat="server"></asp:HyperLink></span></div>
                            <div id='AQtext' class="AQtext b block">
                                <asp:TextBox ID="txtmscontent" runat="server" TextMode="MultiLine" CssClass="txtmscontent"></asp:TextBox>
                                <%--<textarea id="txtmscontent" class="txtmscontent" cols="20" rows="2"></textarea>--%>
                                <div id='msinfo' class="bblr msinfo">
                                    <%--<button class="mspost right" type="submit" value="Gửi">Gửi</button>--%>
                                    <asp:Button ID="Button1" CssClass="mspost right" runat="server" Text="SEND" />
                                    <div class="right msveryp">
                                        <input class="msvery" type="text" value='Captcha' /></div>
                                    <p class='very right'>
                                        <%= FullMart.QA.RandomString() %></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <asp:UpdatePanel ID="updatePostList" runat="server" OnLoad="updatePostList_Load">
                        <ContentTemplate>
                            <ul class="mcomment">
                                <asp:Repeater ID="rpPost" runat="server" DataSourceID="dsPost">
                                    <ItemTemplate>
                                        <li>
                                            <div id="<%# Eval("ID") %>" class="Ahead">
                                                <span class="Ausername"><a href="#aa">
                                                    <%# Eval("UserName")%></a></span></div>
                                            <div class="Aarrow">
                                                <%# Eval("CreateDate")%></div>
                                            <div class="Acontent b">
                                                <a href="#a">
                                                    <p>
                                                        <%# Eval("Content") %></p>
                                                    <button value='DeleteQA$<%# Eval("ID") %>' onclick="DeleteSubQA(this)">
                                                        Remove</button></a></div>
                                            <span title="number of comment" class="numc">
                                                <%# Eval("COMMENTSCOUNT")%></span>
                                            <asp:Label ID="txtPostID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                            <ul class="subcomment" id='<%# Eval("ID") %>'>
                                                <asp:Repeater ID="rpComments" runat="server" DataSourceID="dsComments">
                                                    <ItemTemplate>
                                                        <li>
                                                            <div class="Ahead">
                                                                <span class="Ausername"><a href="#aa">
                                                                    <%# Eval("UserName")%></a></span></div>
                                                            <div class="Aarrow">
                                                                <%# Eval("CreateDate")%></div>
                                                            <div class="Acontent b">
                                                                <a href="#a">
                                                                    <p>
                                                                        <%# Eval("Content")%></p>
                                                                    <button value='DeleteSubQA$<%# Eval("ID") %>' onclick="DeleteSubQA(this)">
                                                                        Remove</button>
                                                                </a>
                                                            </div>
                                                        </li>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                                <asp:SqlDataSource ID="dsComments" runat="server" ConnectionString="<%$ ConnectionStrings:FullMartConnectionString %>"
                                                    SelectCommand="GetSubQA" SelectCommandType="StoredProcedure">
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="txtPostID" Name="QAID" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                                <li>
                                                    <div>
                                                        <div class="Ahead">
                                                            <span class="Ausername"><a href="#aa">
                                                                <%= Page.User.Identity.Name %></a></span></div>
                                                        <div class="AQtext b block SubCommentSpace">
                                                            <asp:TextBox ID="txtSubComment" runat="server" TextMode="MultiLine" CssClass="txtmscontent"></asp:TextBox>
                                                            <div id='Div3' class="bblr msinfo">
                                                                <input type="button" class="mspost right" value="SEND" onclick="AddSubQA(this)" />
                                                                <div class="right msveryp">
                                                                    <input class="msvery" type="text" value='Captcha' />
                                                                </div>
                                                                <p class='very right'>
                                                                    <%= FullMart.QA.RandomString()%></p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                            <div class="clear">
                                            </div>
                                        </li>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:SqlDataSource ID="dsPost" runat="server" ConnectionString="<%$ ConnectionStrings:FullMartConnectionString %>"
                                    SelectCommandType="StoredProcedure" SelectCommand="GetQAStatistic"></asp:SqlDataSource>
                            </ul>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <div class="Apages right">
                        <a href="#1" class="active" ref="1">1</a> <a href="#2" ref="2">2</a> <a href="#3"
                            ref="3">3</a> <a href="#4" ref="4">4</a> <a href="#5" ref="5">5</a> <a href="#0"
                                ref="0">...</a>
                    </div>
                    <div class="clear">
                    </div>
                </div>
            </div>
        <div class="clear">
        </div>
    </div>
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
        <AlternatingItemTemplate>
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
        </AlternatingItemTemplate>
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
        <SelectedItemTemplate>
            <li style="">Title:
                <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
                <br />
                ID:
                <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                <br />
                ShortContent:
                <asp:Label ID="ShortContentLabel" runat="server" 
                    Text='<%# Eval("ShortContent") %>' />
                <br />
                ImageThumb:
                <asp:Label ID="ImageThumbLabel" runat="server" 
                    Text='<%# Eval("ImageThumb") %>' />
                <br />
            </li>
        </SelectedItemTemplate>
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
