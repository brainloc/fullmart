<%@ Page Title="" Language="C#" MasterPageFile="~/ThreeColumns.Master" AutoEventWireup="true"
    CodeBehind="ViewProduct.aspx.cs" Inherits="FullMart.ViewProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="themes/style/QAA.css" rel="stylesheet" type="text/css" />
    <link href="/themes/style/viewproduct.css" rel="stylesheet" type="text/css" />
    <script src="/themes/script/viewProduct.js" type="text/javascript"></script>
    <script src="themes/script/QAA.js" type="text/javascript"></script>
    <script type="text/javascript">
        function AddSubComment(AQObj) {
            var posterID = '<%= Session["ID"] %>';
            var commentID = $(AQObj).closest("ul.subcomment").attr("id");
            var comment = $(AQObj).closest("div.SubCommentSpace").children("textarea:eq(0)").val();
            var command = "AddSubComment";
            var eventArgs = command + "$" + posterID + "$" + commentID + "$" + comment;
            __doPostBack('<%= updatePostList.ClientID %>', eventArgs);
        }

        function DeleteComment(Obj) {
            var r = confirm("Do you want to delete this question ?");
            if (r) {
                var eventArgs = $(Obj).val();
                __doPostBack('<%= updatePostList.ClientID %>', eventArgs);

                if ($(this).closest("li").find(".subcomment") == null) {

                    var tmp = $(this).parents(".subcomment").parent().find(".numc").text();
                    tmp = eval(tmp);
                    tmp--;
                    $(this).closest(".subcomment").parent().find(".numc").text(tmp);
                    $(this).closest("li").remove();
                } else {
                    $(this).closest("li").remove();
                }
            }
            return false;
        }

    </script>
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
                        <img src='<%# ConfigurationSettings.AppSettings["ImagesPath"] %><%# Eval("Picture") %>'
                            alt='<%# Eval("Title") %>' ref="<%# tmprole = Eval("roleID").ToString()%>" /></div>
                    <div class="Posterinfo bgwt left">
                        <% if (tmprole != "3")
                           { %>
                        <div class="buy">
                            <input type="text" class="b nump" value="1" title="Quantity" />
                            <button>
                                Buy It</button></div>
                        <% } %>
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
                                        <img src='http://opi.yahoo.com/online?u=vunam289&amp;m=g&amp;t=1' alt="Chat trực tiếp"
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
                    <asp:ListView ID="ListView2" runat="server" DataKeyNames="ID" EnableModelValidation="True">
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
                                <asp:DataPager ID="DataPager1" runat="server" PageSize="8">
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
        <div class="parea b">
            <div class="gcats btl">
                <span class="gtitle btl"><a href="#maincat" class="maincat btl"><span class="btl">Other
                    Product Same Poster</span></a></span></div>
            <div class="listp">
                <div class="content">
                    <asp:ListView ID="ListView3" runat="server" DataKeyNames="ID" EnableModelValidation="True">
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
                                <asp:DataPager ID="DataPager1" runat="server" PageSize="8">
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
    <div class="viewproduct comment">
        <div class="contentproduct block">
            <p class="titlep btlr block">
                Comment</p>
            <div class="contentp bgwt">
                <div class="listitem bgwt b block">
                    <div id="fcomment">
                        <div id='support'>
                            <div class="Ahead">
                                <span class="Ausername"><a href="">
                                    <%= Page.User.Identity.Name %></a></span></div>
                            <div id='AQtext' class="AQtext b block">
                                <asp:UpdatePanel ID="mainPostForm" runat="server">
                                    <ContentTemplate>
                                        <asp:TextBox ID="txtPost" runat="server" TextMode="MultiLine" CssClass="txtmscontent"></asp:TextBox>
                                        <div id='msinfo' class="bblr msinfo">
                                            <asp:Button ID="btnPost" CssClass="mspost right" runat="server" Text="SEND" OnClick="btnPost_Click" />
                                            <div class="right msveryp">
                                                <input class="msvery" type="text" title="Captcha" value='Captcha' /></div>
                                            <p class='very right'>
                                                <%= FullMart.QA.RandomString()%></p>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                    </div>
                    <asp:UpdatePanel ID="updatePostList" runat="server" OnLoad="updatePostList_Load">
                        <ContentTemplate>
                            <asp:ListView ID="ListView4" DataSourceID="dsPost" runat="server" DataKeyNames="ID"
                                EnableModelValidation="True">
                                <EmptyDataTemplate>
                                </EmptyDataTemplate>
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
                                                <% if (tmpisAdmin)
                                                   { %>
                                                <button value='DeleteComment$<%# Eval("ID") %>' onclick="DeleteComment(this)">
                                                    Remove</button></a>
                                            <%  } %>
                                        </div>
                                        <span title="number of comment" class="numc">
                                            <%# Eval("COMMENTSCOUNT")%></span>
                                        <asp:Label ID="txtCommentID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
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
                                                                <% if (tmpisAdmin)
                                                                   { %>
                                                                <button value='DeleteSubComment$<%# Eval("ID") %>' onclick="DeleteComment(this)">
                                                                    Remove</button>
                                                                <%} %>
                                                            </a>
                                                        </div>
                                                    </li>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                            <asp:SqlDataSource ID="dsComments" runat="server" ConnectionString="<%$ ConnectionStrings:FullMartConnectionString %>"
                                                SelectCommand="GetSubComment" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="txtCommentID" Name="CommentID" />
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
                                                            <input type="button" class="mspost right" value="SEND" onclick="AddSubComment(this)" />
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
                                <LayoutTemplate>
                                    <ul id="itemPlaceholderContainer" runat="server" class="mcomment">
                                        <li runat="server" id="itemPlaceholder" />
                                    </ul>
                                    <div class="Apages right">
                                        <asp:DataPager ID="DataPager1" runat="server" PageSize="12">
                                            <Fields>
                                                <asp:NumericPagerField />
                                            </Fields>
                                        </asp:DataPager>
                                    </div>
                                </LayoutTemplate>
                            </asp:ListView>
                            <asp:SqlDataSource ID="dsPost" runat="server" ConnectionString="<%$ ConnectionStrings:FullMartConnectionString %>"
                                SelectCommandType="StoredProcedure" SelectCommand="GetCommentStatistic">
                                <SelectParameters>
                                    <asp:QueryStringParameter ConvertEmptyStringToNull="true" QueryStringField="ID" Name="ProductID" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <div class="clear">
                    </div>
                </div>
            </div>
            <div class="clear">
            </div>
        </div>
    </div>
    <div class="getCart">
        <a class="modalclose" title="Close"></a>
        <asp:UpdatePanel ID="updatePurchaseForm" runat="server" UpdateMode="Conditional">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="idTinhThanhFull" EventName="SelectedIndexChanged" />
            </Triggers>
            <ContentTemplate>
                <table style="width: 97%" cellpadding="2">
                    <tbody>
                        <tr>
                            <td colspan="2">
                                <div>
                                    Nhập thông tin người nhận hàng:</div>
                                <div class="message" style="display: none">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-top: 10px">
                                Họ tên người nhận hàng
                            </td>
                            <td style="padding-top: 10px">
                                <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                                <%--<input type="text" class="text" id="txtname" name="txtname" />--%>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-top: 10px">
                                Số Lượng :
                            </td>
                            <td style="padding-top: 10px">
                                <asp:TextBox ID="txtAmount" runat="server"></asp:TextBox>
                                <%--<input type="text" class="text" id="soluong" />--%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Thành phố/Tỉnh:
                            </td>
                            <td>
                                <asp:DropDownList ID="idTinhThanhFull" runat="server" CssClass="selectbox" OnSelectedIndexChanged="idTinhThanhFull_SelectedIndexChanged"
                                    AutoPostBack="true">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Quận/Huyện:
                            </td>
                            <td>
                                <div id="id">
                                    <asp:DropDownList ID="idQuanHuyen" runat="server" CssClass="selectbox">
                                    </asp:DropDownList>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Địa chỉ :
                            </td>
                            <td>
                                <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
                                <%--<input type="text" class="text" id="txtaddress" name="txtaddress">--%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Số điện thoại:
                            </td>
                            <td>
                                <asp:TextBox ID="txtPhoneNumber" runat="server"></asp:TextBox>
                                <%--<input type="text" class="text" id="txttelefone" name="txttelefone">--%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Email (nếu có):
                            </td>
                            <td>
                                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                                <%--<input type="text" class="text" id="txtemail" name="txtemail">--%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Ghi chú
                            </td>
                            <td>
                                <asp:TextBox ID="txtNote" TextMode="MultiLine" Rows="4" runat="server"></asp:TextBox>
                                <%--<textarea id="txtnote" class="text" name="txtnote" rows="4"></textarea>--%>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <%--<asp:Button ID="btnOK" runat="server" Text="Tiếp Theo" />--%>
                                <button runat="server" id="btnContiue" onserverclick="btnContiue_Click" onclick="">Tiếp theo</button>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td style="height: 10px;" colspan="2">
                            </td>
                        </tr>
                    </tbody>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <script type="text/javascript">

    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Right" runat="server">
    <asp:SqlDataSource ID="dsListNew" runat="server" ConnectionString="<%$ ConnectionStrings:FullMartConnectionString %>"
        SelectCommand="SELECT [Title], [ID], [ShortContent], [ImageThumb] FROM [News] ORDER BY [CreatedDate] DESC">
    </asp:SqlDataSource>
    <div id="hotnew" class="lb b">
        <div class="title">
            Hot News</div>
        <div class="listitem">
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="ID" DataSourceID="dsListNew"
                EnableModelValidation="True">
                <AlternatingItemTemplate>
                    <li>
                        <div class="item">
                            <div class="left">
                                <a href="viewNews.aspx?ID=<%# Eval("ID") %>" title="<%# Eval("Title") %>">
                                    <img class="thumb" alt="<%# Eval("Title") %>" src="<%# Eval("ImageThumb") %>" /></a></div>
                            <p>
                                <a href="viewNews.aspx?ID=<%# Eval("ID") %>" title="<%# Eval("Title") %>">
                                    <%# Eval("Title") %></a> <span>
                                        <%# correctshortCT(Eval("ShortContent"),200) %></span>
                            </p>
                        </div>
                        <div class="clear">
                        </div>
                    </li>
                </AlternatingItemTemplate>
                <EmptyDataTemplate>
                </EmptyDataTemplate>
                <ItemTemplate>
                    <li>
                        <div class="item">
                            <div class="left">
                                <a href="viewNews.aspx?ID=<%# Eval("ID") %>" title="<%# Eval("Title") %>">
                                    <img class="thumb" alt="<%# Eval("Title") %>" src="<%# Eval("ImageThumb") %>" /></a></div>
                            <p>
                                <a href="viewNews.aspx?ID=<%# Eval("ID") %>" title="<%# Eval("Title") %>">
                                    <%# Eval("Title") %></a> <span>
                                        <%# correctshortCT(Eval("ShortContent"),200) %></span>
                            </p>
                        </div>
                        <div class="clear">
                        </div>
                    </li>
                </ItemTemplate>
                <LayoutTemplate>
                    <ul id="itemPlaceholderContainer" runat="server" style="">
                        <li runat="server" id="itemPlaceholder" />
                    </ul>
                    <div class="Apages right">
                        <asp:DataPager ID="DataPager1" runat="server" PageSize="4">
                            <Fields>
                                <%--
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
                        <asp:Label ID="ShortContentLabel" runat="server" Text='<%# Eval("ShortContent") %>' />
                        <br />
                        ImageThumb:
                        <asp:Label ID="ImageThumbLabel" runat="server" Text='<%# Eval("ImageThumb") %>' />
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
