<%@ Page Title="" Language="C#" MasterPageFile="~/TwoColumns.Master" AutoEventWireup="true" CodeBehind="viewNews.aspx.cs" Inherits="FullMart.viewNews" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<link href="/themes/style/viewnews.css" rel="stylesheet" type="text/css" />
<script src="/themes/script/viewProduct.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Left" runat="server">
        <div id="listcats" class="lb btlr">
        <div class="title block btlr">
            <span><%=FullMart.Code.DAO.BindingUltilities.GetResourceValue("catogiries") %></span></div>
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
<asp:Content ID="Content3" ContentPlaceHolderID="Right" runat="server">
    <div class="contentnews btlr bgwt block">
        <p class="titlen btlr block">
            <asp:Label ID="txtTitleNew" runat="server" Text=""></asp:Label></p>
        <p class="postday">
            <asp:Label ID="txtTimePostNew" runat="server" Text=""></asp:Label></p>
        <div class="contentn">
            <%--<div class="topcontent block">
                <div class="previewimage left">
                    <center>
                        <asp:Image ID="imgNew" runat="server" /></center>
                </div>
                <div class="previewcontent left">
                    <asp:Label ID="txtpewviewcontent" runat="server" Text=""></asp:Label>
                </div>
                <div class="clear">
                </div>
            </div>--%>
            <asp:Label ID="txtContentNew" runat="server" Text=""></asp:Label>
            </div>
        <div class="author">
            <asp:Label ID="txtAuthorNew" runat="server" Text=""></asp:Label></div>
        <div class="clear">
        </div>
    </div>
</asp:Content>
