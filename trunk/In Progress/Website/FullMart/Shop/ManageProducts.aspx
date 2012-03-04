<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true"
    CodeBehind="ManageProducts.aspx.cs" Inherits="FullMart.Shop.ManageProducts" %>

<%@ Register Assembly="DataPagerRepeater" Namespace="DataPagerRepeater" TagPrefix="Custom" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Right" runat="server">
    <div class="State block" id="State">
    </div>
    <div id="tabsP">
        <ul>
            <li><a href="#tabs1P-1"><span>
                <%=FullMart.Code.DAO.BindingUltilities.GetResourceValue("createnewproduct") %></span></a></li>
            <li><a href="#tabs1P-3"><span>
                <%=FullMart.Code.DAO.BindingUltilities.GetResourceValue("manageproduct") %></span></a></li>
        </ul>
         <div id="tabs1P-1">
             <a href="CreateProduct.aspx" title="<%=FullMart.Code.DAO.BindingUltilities.GetResourceValue("createnewproduct") %>">
                <img src="/themes/images/upload.png" /></a></div>
        <asp:UpdatePanel ID="updateSelectProducts" runat="server">
            <ContentTemplate>
                <div id="tabs1P-3">
                    <a href="CreateProduct.aspx" title="<%=FullMart.Code.DAO.BindingUltilities.GetResourceValue("createnewproduct") %>">
                    <div class="insstate">
                        <asp:TextBox ID="txtsearchPID" CssClass="aip" title="Search by Product ID" Text="Search by Product ID"
                            runat="server"></asp:TextBox>
                    </div>
                    <div class="insstate left">
                        <asp:TextBox ID="txtSProduct" CssClass="aip SProduct" title="Enter Email to search user's product"
                            Text="Enter Email to search user's product" runat="server"></asp:TextBox>
                    </div>
                    <asp:UpdatePanel ID="updateCategory" runat="server">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="dlCategories" EventName="SelectedIndexChanged" />
                        </Triggers>
                        <ContentTemplate>
                            <div class="insstate left">
                                <asp:DropDownList ID="dlCategories" runat="server" OnSelectedIndexChanged="dlCategories_SelectedIndexChanged"
                                    AutoPostBack="true">
                                </asp:DropDownList>
                            </div>
                            <div class="insstate left">
                                <asp:DropDownList ID="dlSubCategories" runat="server">
                                </asp:DropDownList>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:Button ID="btnSearch" CssClass="bt block" runat="server" Text="Search" OnClick="btnSearch_Click" />
                    <div class="clear">
                    </div>
                    <div class="MProduct">
                        <table cellpadding="0" cellspacing="0">
                            <thead>
                                <tr>
                                    <th>
                                        <asp:Button ID="btnSortByID" runat="server" Text="ID" CommandName="ID" OnClick="SetSortExpression" />
                                    </th>
                                    <th>
                                        <asp:Button ID="btnSortByProductName" runat="server" Text="Product's Name" CommandName="Title"
                                            OnClick="SetSortExpression" />
                                        <%--<asp:HyperLink ID="lnkSortByProductName" runat="server"></asp:HyperLink>--%>
                                    </th>
                                    <th>
                                        <asp:Button ID="btnSortByPostdate" runat="server" Text="<%$ Resources:LocalizedText, postdate %>" CommandName="CreatedDate"
                                            OnClick="SetSortExpression" />
                                        <%--<asp:HyperLink ID="lnkSortByPostdate" runat="server">Post date</asp:HyperLink>--%>
                                    </th>
                                    <th>
                                        <asp:Button ID="btnSortByPoster" runat="server" Text="<%$ Resources:LocalizedText, poster %>" CommandName="email"
                                            OnClick="SetSortExpression" />
                                        <%--<asp:HyperLink ID="lnkSortByPoster" runat="server">Poster</asp:HyperLink>--%>
                                    </th>
                                    <th>
                                        <asp:Button ID="btnSortByPrice" runat="server" Text="<%$ Resources:LocalizedText, price %>" CommandName="Price"
                                            OnClick="SetSortExpression" />
                                        <%--<asp:HyperLink ID="lnkSortByPrice" runat="server">Price(vnd)</asp:HyperLink>--%>
                                    </th>
                                    <th>
                                        <asp:Button ID="btnSortBySubCat" runat="server" Text="<%$ Resources:LocalizedText, subcategory %>" CommandName="Name"
                                            OnClick="SetSortExpression" />
                                        <%--<asp:HyperLink ID="lnkSortBySubCat" runat="server">Sub Category</asp:HyperLink>--%>
                                    </th>
                                    <th>
                                        <asp:Button ID="btnSortByOS" runat="server" Text="<%$ Resources:LocalizedText, outstanding %>" CommandName="Outstanding" OnClick="SetSortExpression" />
                                        <%--<asp:HyperLink ID="lnkSortByOS" runat="server">OS</asp:HyperLink>--%>
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <Custom:DataPagerRepeater ID="rpManagingProductList" runat="server" DataSourceID="dsManagingProductList">
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <div class="cmdUser">
                                                    <a href="/ViewProduct.aspx?id=<%# Eval("ID")%>" target="_blank">
                                                        <button class="Uview left">
                                                        </button>
                                                    </a><a href="/Shop/CreateProduct.aspx?id=<%# Eval("ID")%>" target="_blank">
                                                        <button class="Uedit left">
                                                        </button>
                                                    </a>
                                                    <button ref="<%# Eval("ID")%>" class="Udelete left">
                                                    </button>
                                                    <div class="clear">
                                                    </div>
                                                </div>
                                                <%# Eval("ID")%>
                                            </td>
                                            <td>
                                                <a href="/ViewProduct.aspx?id=<%# Eval("ID")%>" target="_Blank">
                                                    <%# Eval("Title")%></a>
                                            </td>
                                            <td>
                                                <%# Eval("CreatedDate") %>
                                            </td>
                                            <td>
                                                <%# Eval("email") %>
                                            </td>
                                            <td>
                                                <%# Eval("Price") %>
                                            </td>
                                            <td>
                                                <%# Eval("Name") %>
                                            </td>
                                            <td>
                                                <input ref="<%# Eval("ID")%>" <%# convertos(Eval("Outstanding")) %> type="checkbox"
                                                    class="outstanding" />
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </Custom:DataPagerRepeater>
                                <asp:Label ID="txtSortExpression" runat="server" Text="ID" Visible="false"></asp:Label>
                                <asp:SqlDataSource ID="dsManagingProductList" runat="server" ConnectionString="<%$ ConnectionStrings:FullMartConnectionString %>"
                                    SelectCommandType="StoredProcedure" SelectCommand="GetManagingProductList">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="txtsearchPID" ConvertEmptyStringToNull="true" Name="ProductID" />
                                        <asp:ControlParameter ControlID="txtSProduct" ConvertEmptyStringToNull="true" Name="Email" />
                                        <asp:ControlParameter ControlID="dlCategories" ConvertEmptyStringToNull="true" Name="CatID" />
                                        <asp:ControlParameter ControlID="dlSubCategories" ConvertEmptyStringToNull="true"
                                            Name="SubcatID" />
                                        <asp:ControlParameter ControlID="txtSortExpression" ConvertEmptyStringToNull="true"
                                            Name="SortBy" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </tbody>
                        </table>
                        <%--<div class="Apages right">
                    <a href="#1" class="active" ref="1">1</a> <a href="#2" ref="2">2</a> <a href="#3"
                        ref="3">3</a> <a href="#4" ref="4">4</a> <a href="#5" ref="5">5</a> <a href="#0"
                            ref="0">All</a>
                </div>--%>
                        <div class="right">
                            <asp:DataPager ID="DataPager1" runat="server" PagedControlID="rpManagingProductList"
                                PageSize="5" class="googleNavegationBar">
                                <Fields>
                                    <SqlNetFrameworkWebControls:GooglePagerField NextPageImageUrl="../themes/images/button_arrow_right.gif"
                                        PreviousPageImageUrl="../themes/images/button_arrow_left.gif" />
                                </Fields>
                            </asp:DataPager>
                        </div>
                    </div>
                    <div class="clear">
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <div class="clear">
        </div>
    </div>
    <asp:SqlDataSource ID="dsCategories" runat="server" ConnectionString="<%$ ConnectionStrings:FullMartConnectionString %>"
        SelectCommand="SELECT [ID],[Name],[Order] FROM [dbo].[Category] WHERE [Order]<> -99 ORDER BY [Order]">
    </asp:SqlDataSource>
    <div id="cfdeletep">
        <p>
            <center>
                <%=FullMart.Code.DAO.BindingUltilities.GetResourceValue("confirmdelete") %> : <span></span>?</center>
        </p>
        <input type="hidden" />
        <center>
            <button>
                Yes</button>
            <button>
                No</button></center>
    </div>
    <script type="text/javascript">

        $(document).ready(function () {
            $("#tabsP").tabs();
        });
    </script>
</asp:Content>
