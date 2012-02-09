<%@ Page Title="" Language="C#" MasterPageFile="~/ThreeColumns.Master" AutoEventWireup="true" CodeBehind="QAA.aspx.cs" Inherits="FullMart.QAA" %>
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
                    <asp:TextBox ID="txtmscontent" runat="server" TextMode="MultiLine" CssClass="txtmscontent"></asp:TextBox>
                    <%--<textarea id="txtmscontent" class="txtmscontent" cols="20" rows="2"></textarea>--%>
                    <div id='msinfo' class="bblr msinfo">
                    <%--<button class="mspost right" type="submit" value="Gửi">Gửi</button>--%>
                    <asp:Button ID="Button1" CssClass="mspost right" runat="server" Text="SEND" />
                    <div class="right msveryp"><input class="msvery" type="text" value='Nhập mã xác nhận' /></div>
                    
                        <p class='very right'>ABjs</p>
                        
                        
                    </div>
                </div>
            </div>
            </div>
                    <ul class="mcomment">
                        <li>
                            <div class="Ahead"><span class="Ausername"><a href="#aa">sniperPro</a></span></div>
                            <div class="Aarrow">21/11/2011</div>
                            <div class="Acontent b"><a href="#a"><p>Something need to know about this website Something need to know about this website Something need to know about this website Something need to know about this website Something need to know about this website Something need to know about this website Something need to know about this website Something need to know about this website Something need to know about this website Something need to know about this website .....</p><button>remove</button></a></div>                        
                            <span title="number of comment" class="numc">3</span>
                            <ul class="subcomment">
                                <li>
                                    <div class="Ahead">
                                        <span class="Ausername"><a href="#aa">sniperPro</a></span></div>
                                    <div class="Aarrow">
                                        21/11/2011</div>
                                    <div class="Acontent b">
                                        <a href="#a">
                                            <p>
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                .....</p><button>remove</button>
                                        </a>
                                    </div>
                                </li><li>
                                    <div class="Ahead">
                                        <span class="Ausername"><a href="#aa">sniperPro</a></span></div>
                                    <div class="Aarrow">
                                        21/11/2011</div>
                                    <div class="Acontent b">
                                        <a href="#a">
                                            <p>
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                .....</p><button>remove</button>
                                        </a>
                                    </div>
                                </li><li>
                                    <div class="Ahead">
                                        <span class="Ausername"><a href="#aa">sniperPro</a></span></div>
                                    <div class="Aarrow">
                                        21/11/2011</div>
                                    <div class="Acontent b">
                                        <a href="#a">
                                            <p>
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                .....</p><button>remove</button>
                                        </a>
                                        
                                    </div>
                                </li>
                                
                                <li>
                                    <div>
                                        <div class="Ahead">
                                            <span class="Ausername"><a href="#aa">UserName</a></span></div>
                                        <div class="AQtext b block">
                                            <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" CssClass="txtmscontent"></asp:TextBox>
                                            <%--<textarea id="txtmscontent" class="txtmscontent" cols="20" rows="2"></textarea>--%>
                                            <div id='Div3' class="bblr msinfo">
                                                <%--<button class="mspost right" type="submit" value="Gửi">Gửi</button>--%>
                                                <asp:Button ID="Button2" CssClass="mspost right" runat="server" Text="SEND" />
                                                <div class="right msveryp">
                                                    <input class="msvery" type="text" value='Nhập mã xác nhận' />
                                                    </div>
                                                <p class='very right'>
                                                    ABjs</p>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                            <div class="clear"></div>
                        </li>
                        <li>
                            <div class="Ahead"><span class="Ausername"><a href="#aa">sniperPro</a></span></div>
                            <div class="Aarrow">21/11/2011</div>
                            <div class="Acontent b"><a href="#a"><p>Something need to know about this website .....</p><button>remove</button></a></div>                        
                            <span title="number of comment" class="numc">3</span>
                            <ul class="subcomment">
                                <li>
                                    <div class="Ahead">
                                        <span class="Ausername"><a href="#aa">sniperPro</a></span></div>
                                    <div class="Aarrow">
                                        21/11/2011</div>
                                    <div class="Acontent b">
                                        <a href="#a">
                                            <p>
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                .....</p><button>remove</button>
                                        </a>
                                    </div>
                                </li><li>
                                    <div class="Ahead">
                                        <span class="Ausername"><a href="#aa">sniperPro</a></span></div>
                                    <div class="Aarrow">
                                        21/11/2011</div>
                                    <div class="Acontent b">
                                        <a href="#a">
                                            <p>
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                .....</p><button>remove</button>
                                        </a>
                                    </div>
                                </li><li>
                                    <div class="Ahead">
                                        <span class="Ausername"><a href="#aa">sniperPro</a></span></div>
                                    <div class="Aarrow">
                                        21/11/2011</div>
                                    <div class="Acontent b">
                                        <a href="#a">
                                            <p>
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                .....</p><button>remove</button>
                                        </a>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <div class="Ahead">
                                            <span class="Ausername"><a href="#aa">UserName</a></span></div>
                                         <div class="AQtext b block">
                                            <asp:TextBox ID="TextBox2" runat="server" TextMode="MultiLine" CssClass="txtmscontent"></asp:TextBox>
                                            <%--<textarea id="txtmscontent" class="txtmscontent" cols="20" rows="2"></textarea>--%>
                                            <div id='Div1' class="bblr msinfo">
                                                <%--<button class="mspost right" type="submit" value="Gửi">Gửi</button>--%>
                                                <asp:Button ID="Button3" CssClass="mspost right" runat="server" Text="SEND" />
                                                <div class="right msveryp">
                                                    <input class="msvery" type="text" value='Nhập mã xác nhận' />
                                                    </div>
                                                <p class='very right'>
                                                    ABjs</p>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                            <div class="clear"></div>
                        </li>
                        <li>
                            <div class="Ahead"><span class="Ausername"><a href="#aa">sniperPro</a></span></div>
                            <div class="Aarrow">21/11/2011</div>
                            <div class="Acontent b"><a href="#a"><p>Something need to know about this website .....</p><button>remove</button></a></div>                        
                            <span title="number of comment" class="numc">3</span>
                            <ul class="subcomment">
                                <li>
                                    <div class="Ahead">
                                        <span class="Ausername"><a href="#aa">sniperPro</a></span></div>
                                    <div class="Aarrow">
                                        21/11/2011</div>
                                    <div class="Acontent b">
                                        <a href="#a">
                                            <p>
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                .....</p><button>remove</button>
                                        </a>
                                    </div>
                                </li><li>
                                    <div class="Ahead">
                                        <span class="Ausername"><a href="#aa">sniperPro</a></span></div>
                                    <div class="Aarrow">
                                        21/11/2011</div>
                                    <div class="Acontent b">
                                        <a href="#a">
                                            <p>
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                .....</p><button>remove</button>
                                        </a>
                                    </div>
                                </li><li>
                                    <div class="Ahead">
                                        <span class="Ausername"><a href="#aa">sniperPro</a></span></div>
                                    <div class="Aarrow">
                                        21/11/2011</div>
                                    <div class="Acontent b">
                                        <a href="#a">
                                            <p>
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                .....</p><button>remove</button>
                                        </a>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <div class="Ahead">
                                            <span class="Ausername"><a href="#aa">UserName</a></span></div>
                                        <div class="AQtext b block">
                                            <asp:TextBox ID="TextBox3" runat="server" TextMode="MultiLine" CssClass="txtmscontent"></asp:TextBox>
                                            <%--<textarea id="txtmscontent" class="txtmscontent" cols="20" rows="2"></textarea>--%>
                                            <div id='Div2' class="bblr msinfo">
                                                <%--<button class="mspost right" type="submit" value="Gửi">Gửi</button>--%>
                                                <asp:Button ID="Button4" CssClass="mspost right" runat="server" Text="SEND" />
                                                <div class="right msveryp">
                                                    <input class="msvery" type="text" value='Nhập mã xác nhận' />
                                                    </div>
                                                <p class='very right'>
                                                    ABjs</p>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                            <div class="clear"></div>
                        </li>
                        <li>
                            <div class="Ahead"><span class="Ausername"><a href="#aa">sniperPro</a></span></div>
                            <div class="Aarrow">21/11/2011</div>
                            <div class="Acontent b"><a href="#a"><p>Something need to know about this website Something need to know about this website Something need to know about this website .....</p><button>remove</button></a></div>                        
                            <span title="number of comment" class="numc">3</span>
                            <ul class="subcomment">
                                <li>
                                    <div class="Ahead">
                                        <span class="Ausername"><a href="#aa">sniperPro</a></span></div>
                                    <div class="Aarrow">
                                        21/11/2011</div>
                                    <div class="Acontent b">
                                        <a href="#a">
                                            <p>
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                .....</p><button>remove</button>
                                        </a>
                                    </div>
                                </li><li>
                                    <div class="Ahead">
                                        <span class="Ausername"><a href="#aa">sniperPro</a></span></div>
                                    <div class="Aarrow">
                                        21/11/2011</div>
                                    <div class="Acontent b">
                                        <a href="#a">
                                            <p>
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                .....</p><button>remove</button>
                                        </a>
                                    </div>
                                </li><li>
                                    <div class="Ahead">
                                        <span class="Ausername"><a href="#aa">sniperPro</a></span></div>
                                    <div class="Aarrow">
                                        21/11/2011</div>
                                    <div class="Acontent b">
                                        <a href="#a">
                                            <p>
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                .....</p><button>remove</button>
                                        </a>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <div class="Ahead">
                                            <span class="Ausername"><a href="#aa">UserName</a></span></div>
                                        <div class="AQtext b block">
                                            <asp:TextBox ID="TextBox4" runat="server" TextMode="MultiLine" CssClass="txtmscontent"></asp:TextBox>
                                            <%--<textarea id="txtmscontent" class="txtmscontent" cols="20" rows="2"></textarea>--%>
                                            <div id='Div4' class="bblr msinfo">
                                                <%--<button class="mspost right" type="submit" value="Gửi">Gửi</button>--%>
                                                <asp:Button ID="Button5" CssClass="mspost right" runat="server" Text="SEND" />
                                                <div class="right msveryp">
                                                    <input class="msvery" type="text" value='Nhập mã xác nhận' />
                                                    </div>
                                                <p class='very right'>
                                                    ABjs</p>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                            <div class="clear"></div>
                        </li>
                    </ul>
                    <div class="Apages right" >
                        <a href="#1" class="active" ref="1">1</a>
                        <a href="#2" ref="2">2</a>
                        <a href="#3" ref="3">3</a>
                        <a href="#4" ref="4">4</a>
                        <a href="#5" ref="5">5</a>
                        <a href="#0" ref="0">...</a>
                    </div><div class="clear"></div>
                    
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
