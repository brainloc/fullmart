<%@ Page Title="" Language="C#" MasterPageFile="~/ThreeColumns.Master" AutoEventWireup="true"
    CodeBehind="QA.aspx.cs" Inherits="FullMart.QA" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/themes/style/QAA.css" rel="stylesheet" type="text/css" />
    <script src="/themes/script/QAA.js" type="text/javascript"></script>
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
<asp:Content ID="Content3" ContentPlaceHolderID="Center" runat="server">
    <div class="listitem bgwt b block">
        <div id="fcomment">
            <div id='support'>
                <div class="Ahead">
                    <span class="Ausername"><a href="#aa">UserName</a></span></div>
                <div id='AQtext' class="AQtext b block">
                    <asp:TextBox ID="txtPost" runat="server" TextMode="MultiLine" CssClass="txtmscontent"></asp:TextBox>
                    <div id='msinfo' class="bblr msinfo">
                        <asp:Button ID="btnPost" CssClass="mspost right" runat="server" Text="SEND" />
                        <div class="right msveryp">
                            <input class="msvery" type="text" value='Nhập mã xác nhận' /></div>
                        <p class='very right'>
                            ABjs</p>
                    </div>
                </div>
            </div>
        </div>
        <ul class="mcomment">
            <asp:Repeater ID="rpPost" runat="server" DataSourceID="dsPost">
                <ItemTemplate>
                    <li>
                        <div class="Ahead">
                            <span class="Ausername"><a href="#aa">
                                <%# Eval("email")%></a></span></div>
                        <div class="Aarrow">
                            <%# Eval("CreateDate")%></div>
                        <div class="Acontent b">
                            <a href="#a">
                                <p>
                                    <%# Eval("Content") %></p>
                                <button>
                                    remove</button></a></div>
                        <span title="number of comment" class="numc">3</span>
                        <asp:Label ID="txtPostID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                        <asp:Label ID="txtPosterID" runat="server" Text='<%# Eval("PosterID") %>' Visible="false"></asp:Label>
                        <ul class="subcomment">
                            <asp:Repeater ID="rpComments" runat="server" DataSourceID="dsComments">
                                <ItemTemplate>
                                    <li>
                                        <div class="Ahead">
                                            <span class="Ausername"><a href="#aa">
                                                <%# Eval("email") %></a></span></div>
                                        <div class="Aarrow">
                                            <%# Eval("CreateDate")%></div>
                                        <div class="Acontent b">
                                            <a href="#a">
                                                <p>
                                                    <%# Eval("Content")%></p>
                                                <button>
                                                    remove</button>
                                            </a>
                                        </div>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:SqlDataSource ID="dsComments" runat="server" ConnectionString="<%$ ConnectionStrings:FullMartConnectionString %>"
                                SelectCommand="SELECT [FullMart].[dbo].[SubAQ].[ID],[email],[AQID],[Content],[FullMart].[dbo].[SubAQ].[CreateDate] FROM [FullMart].[dbo].[SubAQ],[FullMart].[dbo].[User] WHERE [AQID] = @PostID AND [FullMart].[dbo].[User].[ID] = @PosterID ORDER BY [FullMart].[dbo].[SubAQ].[CreateDate] DESC">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="txtPostID" Name="PostID" />
                                    <asp:ControlParameter ControlID="txtPosterID" Name="PosterID" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <li>
                                <div>
                                    <div class="Ahead">
                                        <span class="Ausername"><a href="#aa"><%# Eval("email") %></a></span></div>
                                    <div class="AQtext b block">
                                        <asp:TextBox ID="txtSubComment" runat="server" TextMode="MultiLine" CssClass="txtmscontent"></asp:TextBox>
                                        <div id='Div3' class="bblr msinfo">
                                            <asp:Button ID="btnComment" CssClass="mspost right" runat="server" Text="SEND"/>
                                            <div class="right msveryp">
                                                <input class="msvery" type="text" value='Nh?p mã xác nh?n' />
                                            </div>
                                            <p class='very right'>
                                                ABjs</p>
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
                SelectCommand="SELECT [FullMart].[dbo].[AnswerQuestion].[ID],[PosterID],[email],[FullMart].[dbo].[AnswerQuestion].[CreateDate],[Content] FROM [FullMart].[dbo].[AnswerQuestion],[FullMart].[dbo].[User] WHERE [FullMart].[dbo].[AnswerQuestion].[isActive] = 1	AND [FullMart].[dbo].[User].[ID] = [PosterID] ORDER BY [FullMart].[dbo].[AnswerQuestion].[CreateDate] DESC">
            </asp:SqlDataSource>
        </ul>
        <div class="Apages right">
            <a href="#1" class="active" ref="1">1</a> <a href="#2" ref="2">2</a> <a href="#3"
                ref="3">3</a> <a href="#4" ref="4">4</a> <a href="#5" ref="5">5</a> <a href="#0"
                    ref="0">...</a>
        </div>
        <div class="clear">
        </div>
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
