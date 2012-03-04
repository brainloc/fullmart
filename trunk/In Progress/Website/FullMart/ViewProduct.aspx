<%@ Page Title="" Language="C#" MasterPageFile="~/ThreeColumns.Master" AutoEventWireup="true"
    CodeBehind="ViewProduct.aspx.cs" Inherits="FullMart.ViewProduct" %>
    <%@ Register Assembly="DataPagerRepeater" Namespace="DataPagerRepeater" TagPrefix="Custom" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="themes/style/QAA.css" rel="stylesheet" type="text/css" />
    <link href="/themes/style/viewproduct.css" rel="stylesheet" type="text/css" />
    <script src="/themes/script/viewProduct.js" type="text/javascript"></script>
    <%--<script src="/themes/script/cloud-zoom.1.0.2.min.js" type="text/javascript"></script>--%>
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
            <span><%=FullMart.Code.DAO.BindingUltilities.GetResourceValue("categories")%></span></div>
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
        <!--<img src="/themes/images/leftadv.jpg" />--></div>
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
                            <span><%=FullMart.Code.DAO.BindingUltilities.GetResourceValue("answerQuestion")%></span></div>
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
    <div class="viewproduct b bgwt block">
        <asp:Repeater ID="rpProductDetail" runat="server">
            <ItemTemplate>
                <div class="headproduct block clear">
                    
                    <p class="titlep btlr block"><%# Eval("Title")%></p>
                    <%--<a href='<%# ConfigurationSettings.AppSettings["ImagesPath"] %><%# Eval("Picture") %>' class='cloud-zoom' id='zoom1' rel="adjustX: 10, adjustY:-4">
                        <img src="<%# ConfigurationSettings.AppSettings["ImagesPath"] %><%# Eval("Picture") %>" alt='' title="Optional title display" />
                    </a>--%>
                    <div class="imagepreview b center left">
                        <img id="imgpreM" src='<%# ConfigurationSettings.AppSettings["ImagesPath"] %><%# Eval("Picture") %>'
                            alt='<%# Eval("Title") %>' ref="<%# tmprole = Eval("roleID").ToString()%>" />
                       <% if (tmprole != "3")
                          { %>
                        <div class="listimg">
                               <%--<a href='http://resource.hula.vn/images/shop/products/2012/2/1/normal/dong-ho-cap-doi-mai-nho-14235.jpg' class='cloud-zoom-gallery' title='Thumbnail 1'
                                rel="useZoom: 'zoom1', smallImage: 'http://resource.hula.vn/images/shop/products/2012/2/1/normal/dong-ho-cap-doi-mai-nho-14235.jpg' ">
                                <img src="http://resource.hula.vn/images/shop/products/2012/2/1/normal/dong-ho-cap-doi-mai-nho-14235.jpg" alt="Thumbnail 1" /></a>
                                <a href='http://resource.hula.vn/images/shop/products/2012/2/1/normal/dong-ho-cap-doi-mai-nho-14232.jpg' class='cloud-zoom-gallery' title='Thumbnail 1'
                                rel="useZoom: 'zoom1', smallImage: 'http://resource.hula.vn/images/shop/products/2012/2/1/normal/dong-ho-cap-doi-mai-nho-14232.jpg' ">
                                <img src="http://resource.hula.vn/images/shop/products/2012/2/1/normal/dong-ho-cap-doi-mai-nho-14232.jpg" alt="Thumbnail 2" /></a>
                                <a href='http://resource.hula.vn/images/shop/products/2012/2/1/normal/dong-ho-cap-doi-mai-nho-14234.jpg' class='cloud-zoom-gallery' title='Thumbnail 1'
                                rel="useZoom: 'zoom1', smallImage: 'http://resource.hula.vn/images/shop/products/2012/2/1/normal/dong-ho-cap-doi-mai-nho-14234.jpg' ">
                                <img src="http://resource.hula.vn/images/shop/products/2012/2/1/normal/dong-ho-cap-doi-mai-nho-14234.jpg" alt="Thumbnail 3" /></a>--%>
                            <img src="<%# Eval("img1").ToString() %>"/>
                            <img src="<%# Eval("img2").ToString() %>"/>
                            <img src="<%# Eval("img3").ToString() %>"/>
                        </div>
                        <%} %>
                        <div class="clear"></div>
                    </div>
                    <div class="Posterinfo bgwt left">
                        <% if (tmprole != "3")
                           { %>
                        <div class="buy">
                            <input type="text" class="b nump" value="1" title="Quantity" />
                            <button><%=FullMart.Code.DAO.BindingUltilities.GetResourceValue("BuyIt") %></button></div>
                        <% } %>
                        <ul>                            
                            <li><%=FullMart.Code.DAO.BindingUltilities.GetResourceValue("price") %>: <span class="price">
                                <%# Eval("Price")%>
                                VNĐ</span> </li>
                            <li><%=FullMart.Code.DAO.BindingUltilities.GetResourceValue("poster") %>: <a href="#" title='<%=FullMart.Code.DAO.BindingUltilities.GetResourceValue("visitShop") %><%# Eval("PosterName") %>'>
                                <%# Eval("PosterName") %></a></li>
                            <li><%=FullMart.Code.DAO.BindingUltilities.GetResourceValue("postdate") %>: <%# Eval("CreatedDate") %> </li>
                            <li><%=FullMart.Code.DAO.BindingUltilities.GetResourceValue("location") %> :
                                <%# Eval("StateName")%></li>
                            <li>Contact :
                                <ul>
                                    <li><a href='mailto:<%# Eval("email") %>'>
                                        <img src="/themes/images/email-Icon.png" alt="Email" /></a></li>
                                    <li><a href='ymsgr:sendIM?<%# Eval("yahoo") %>'>
                                        <img src="/themes/images/icon-chat.jpg" alt="Chat trực tiếp"
                                            title="Chat trực tiếp" /></a></li>
                                    <li>
                                        <img alt="Phone" src="/themes/images/Phone-Icon.png" /> : <%# Eval("mobile") %></li>
                                </ul>
                            </li>
                        </ul>
                        
                        <div class="clear block"></div>
                    </div>
                    <% if (tmprole != "3"&& shopID!="-1")
                       { %>
                    <div class="Shopdetail clear">
                    <div class="summary-info right">
                        <div class="summary-info-box clearfix">
                        <h3 class="name-shop"><a href="/ShopPage.aspx?Shop=<%# Eval("ShopID") %>" title="<%=FullMart.Code.DAO.BindingUltilities.GetResourceValue("visitShop") %><%# Eval("ShopName") %>"><%# Eval("ShopName") %></a>  </h3>
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
                                    <%# Eval("ShopCreatedDate")%>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <%=FullMart.Code.DAO.BindingUltilities.GetResourceValue("address") %>

                                </td>
                                <td>
                                    <%# Eval("ShopAddress")%>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <%=FullMart.Code.DAO.BindingUltilities.GetResourceValue("phone") %>
                                </td>
                                <td>
                                    <%# Eval("ShopPhone")%>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <img src="/themes/images/icon-chat.jpg" />Yahoo !ID :
                                </td>
                                <td>
                                    <%# Eval("ShopYahoo")%>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <%=FullMart.Code.DAO.BindingUltilities.GetResourceValue("rate") %>

                                </td>
                                <td>
                                <span class="rate"><%# Eval("Shoprate")%></span>
                                </td>
                            </tr>
                        </table>
                        </div></div>
                    </div>
                    <% } %>
                    <div class="clear block">
                            <!-- AddThis Button BEGIN -->
                                <div class="addthis_toolbox addthis_default_style addthis_32x32_style">
                                    <a class="addthis_button_preferred_1"></a><a class="addthis_button_preferred_2">
                                    </a><a class="addthis_button_preferred_3"></a><a class="addthis_button_preferred_4">
                                    </a><a class="addthis_button_compact"></a><a class="addthis_counter addthis_bubble_style">
                                    </a>
                                </div>
                                <script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#pubid=xa-4f4f9c9f470f6fdf"></script>
                                <!-- AddThis Button END -->
                        </div>
                </div>
                <script type="text/javascript">
                    
                </script>
                <div class="clear block"></div>
                <div class="contentproduct block">
                    <p class="titlep btlr block"><%=FullMart.Code.DAO.BindingUltilities.GetResourceValue("productinfo") %></p>
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
                <span class="gtitle btl"><a href="#maincat" class="maincat btl"><span class="btl"><%=FullMart.Code.DAO.BindingUltilities.GetResourceValue("otherproductsamecat") %></span></a></span></div>
            <div class="listp">
                <div class="content">
                    <asp:ListView ID="ListView2" runat="server" DataKeyNames="ID" EnableModelValidation="True">
                        <EmptyDataTemplate>
                            <%=FullMart.Code.DAO.BindingUltilities.GetResourceValue("noproduct")%>
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
                <span class="gtitle btl"><a href="#maincat" class="maincat btl"><span class="btl"><%=FullMart.Code.DAO.BindingUltilities.GetResourceValue("otherproductsameposter")%></span></a></span></div>
            <div class="listp">
                <div class="content">
                    <asp:ListView ID="ListView3" runat="server" DataKeyNames="ID" EnableModelValidation="True">
                        <EmptyDataTemplate>
                            <%=FullMart.Code.DAO.BindingUltilities.GetResourceValue("noproduct")%>
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
            <p class="titlep btlr block"><%=FullMart.Code.DAO.BindingUltilities.GetResourceValue("comment")%></p>
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
                                            <asp:Button ID="btnPost" CssClass="mspost right" runat="server" Text="<%$ Resources:LocalizedText, send %>" OnClick="btnPost_Click" />
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
                                        <span title="<%=FullMart.Code.DAO.BindingUltilities.GetResourceValue("numcomment")%>" class="numc">
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
                                                            <input type="button" class="mspost right" runat="server" value="<%$ Resources:LocalizedText, send %>" onclick="AddSubComment(this)" />
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
    <div class="getCart ndialog">
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
                                    <%=FullMart.Code.DAO.BindingUltilities.GetResourceValue("receipientinfo")%>:</div>
                                <div class="message" style="display: none">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-top: 10px">
                                <%=FullMart.Code.DAO.BindingUltilities.GetResourceValue("receipient")%>
                            </td>
                            <td style="padding-top: 10px">
                                <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                                <%--<input type="text" class="text" id="txtname" name="txtname" />--%>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-top: 10px">
                                <%=FullMart.Code.DAO.BindingUltilities.GetResourceValue("quantity")%>
                            </td>
                            <td style="padding-top: 10px">
                                <asp:TextBox ID="txtAmount" runat="server"></asp:TextBox>
                                <%--<input type="text" class="text" id="soluong" />--%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <%=FullMart.Code.DAO.BindingUltilities.GetResourceValue("location")%>
                            </td>
                            <td>
                                <asp:DropDownList ID="idTinhThanhFull" runat="server" CssClass="selectbox" OnSelectedIndexChanged="idTinhThanhFull_SelectedIndexChanged"
                                    AutoPostBack="true">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <%=FullMart.Code.DAO.BindingUltilities.GetResourceValue("zone")%>
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
                                <%=FullMart.Code.DAO.BindingUltilities.GetResourceValue("phone")%>
                            </td>
                            <td>
                                <asp:TextBox ID="txtPhoneNumber" runat="server"></asp:TextBox>
                                <%--<input type="text" class="text" id="txttelefone" name="txttelefone">--%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Email (<%=FullMart.Code.DAO.BindingUltilities.GetResourceValue("option")%>):
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
                                <button runat="server" id="btnContiue" onserverclick="btnContiue_Click" onclick=""><%=FullMart.Code.DAO.BindingUltilities.GetResourceValue("addtocart")%></button>
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
<asp:SqlDataSource ID="dsListNew" runat="server" 
        ConnectionString="<%$ ConnectionStrings:FullMartConnectionString %>" 
        SelectCommand="SELECT [Title], [ID], [ShortContent], [ImageThumb] FROM [News] ORDER BY [CreatedDate] DESC">
    </asp:SqlDataSource>
    <div id="hotnew" class="lb b">
        <div class="title" title="<%=FullMart.Code.DAO.BindingUltilities.GetResourceValue("hotnews") %>"><%=FullMart.Code.DAO.BindingUltilities.GetResourceValue("hotnews") %></div>
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
