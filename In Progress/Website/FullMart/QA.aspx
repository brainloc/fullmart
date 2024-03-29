﻿<%@ Page Title="" Language="C#" MasterPageFile="~/ThreeColumns.Master" AutoEventWireup="true"
    CodeBehind="QA.aspx.cs" Inherits="FullMart.QA" %>
    <%@ Register Assembly="DataPagerRepeater" Namespace="DataPagerRepeater" TagPrefix="Custom" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/themes/style/QAA.css" rel="stylesheet" type="text/css" />
    <script src="/themes/script/QAA.js" type="text/javascript"></script>
    <script type="text/javascript">
        function AddSubQA(AQObj) {            
            var posterID = <%= Session["ID"] %>;
            var postID = $(AQObj).closest("ul.subcomment").attr("id");
            var comment = $(AQObj).closest("div.SubCommentSpace").children("textarea:eq(0)").val();
            var command = "AddSubQA";
            var eventArgs = command + "$" + posterID + "$" + postID + "$" + comment;
            __doPostBack('<%= updatePostList.ClientID %>', eventArgs);
        }


        function DeleteSubQA(Obj)
        {
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
            <span><%=FullMart.Code.DAO.BindingUltilities.GetResourceValue("categories") %></span></div>
        <ul class="lplist">
            <asp:Repeater ID="rpCategories" runat="server" DataSourceID="dsCategories">
                <ItemTemplate>
                    <li id="<%# Eval("ID") %>"><a class="ap" href='/ListProducts.aspx?cat=<%# Eval("ID") %>'>
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
        <!--<img src="/themes/images/leftadv.jpg" />--></div>
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
    <div class="listitem bgwt b block">
        <div id="fcomment">
            <div id='support'>
                <div class="Ahead">
                    <span class="Ausername"><a href="#aa">
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
                                    <%= RandomString()%></p>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
        <asp:UpdatePanel ID="updatePostList" runat="server" OnLoad="updatePostList_Load">
            <ContentTemplate>
                <ul class="mcomment">
                    <Custom:DataPagerRepeater ID="rpPost" runat="server" DataSourceID="dsPost">
                        <ItemTemplate>
                            <li id="CQA<%# Eval("ID") %>">
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
                                                        <%= RandomString()%></p>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                                <div class="clear">
                                </div>
                            </li>
                        </ItemTemplate>
                    </Custom:DataPagerRepeater>
                    <asp:SqlDataSource ID="dsPost" runat="server" ConnectionString="<%$ ConnectionStrings:FullMartConnectionString %>"
                        SelectCommandType="StoredProcedure" SelectCommand="GetQAStatistic"></asp:SqlDataSource>
                </ul>
            </ContentTemplate>
        </asp:UpdatePanel>
       <div class="Apages right">
                        <asp:DataPager ID="DataPager1" runat="server" PageSize="10" PagedControlID="rpPost">
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
        <div class="clear">
        </div>
    </div>
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
                                        <img class="thumb" alt="<%# Eval("Title") %>" src="<%# ConfigurationSettings.AppSettings["ImagesPath"] %><%# Eval("Thumbnail") %>" /></a></div>
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
                                        <img class="thumb" alt="<%# Eval("Title") %>" src="<%# ConfigurationSettings.AppSettings["ImagesPath"] %><%# Eval("Thumbnail") %>"  /></a></div>
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
