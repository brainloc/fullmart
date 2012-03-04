<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ManageCategories.aspx.cs" Inherits="FullMart.Administration.ManageCategories" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Right" runat="server">
 <p class="atitle"><%=FullMart.Code.DAO.BindingUltilities.GetResourceValue("managecategories") %></p>
            <span style="color: Red; padding: 10px; font-size: 15px">
            Press 'tab' when change Order number to check.<br />
                Press 'Enter' when change Category's Name, Order to Update. </span>
            <div class="block clear">
                <table class="tbcates left" cellpadding="0" cellspacing="0">
                    <thead>
                        <tr>
                            <td>
                                <%=FullMart.Code.DAO.BindingUltilities.GetResourceValue("categorysname") %>
                            </td>
                            <td>
                                <%=FullMart.Code.DAO.BindingUltilities.GetResourceValue("order") %>
                            </td>
                            <td>
                            </td>
                        </tr>
                    </thead>
                    <asp:Repeater ID="rpListCategories" DataSourceID="dsCategories" runat="server">
                        <ItemTemplate>
                            <tr ref='<%# Eval("ID") %>'>
                                <td>
                                    <input ref="<%# Eval("ID") %>" value='<%# Eval("Name") %>' />
                                    <%--<asp:TextBox ID="ABC" Text='<%# Eval("Name") %>'  runat="server" OnTextChanged="ABC"></asp:TextBox>--%>
                                </td>
                                <td>
                                    <input ref="<%# Eval("ID") %>" value='<%# Eval("Order") %>' />
                                    <%-- <asp:TextBox ID='ABD' Text='<%# Eval("Order") %>' runat="server"></asp:TextBox>--%>
                                </td>
                                <td>
                                    <img class="catDel" ref="<%# Eval("ID") %>" src="/themes/images/delete.png" /><img
                                        ref="<%# Eval("ID") %>" class="bindSubCate" src="/themes/images/Arrow_Right.png" />
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                    <tfoot>
                        <tr class="insertCates">
                            <td>
                                <asp:TextBox ID="txtInsert" CssClass="insertNameCates" ToolTip="Press 'Enter' to insert"
                                    Text="Press 'Enter' to insert" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txtInsertOrder" Enabled="false" CssClass="insertOrderCates" ToolTip="..."
                                    Text="..." runat="server"></asp:TextBox>
                            </td>
                        </tr>
                    </tfoot>
                </table>
                <table class="tbsubcates right" cellpadding="0" cellspacing="0">
                    <thead>
                        <tr>
                            <td>
                                <%=FullMart.Code.DAO.BindingUltilities.GetResourceValue("subcategorysname") %>
                            </td>
                            <td>
                               <%=FullMart.Code.DAO.BindingUltilities.GetResourceValue("order") %>
                            </td>
                            <td>
                            </td>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                    <tfoot>
                        <tr class="insertCates">
                            <td>
                                <asp:TextBox ID="TextBox1" CssClass="insertNameCates" ToolTip="Press 'Enter' to insert"
                                    Text="Press 'Enter' to insert" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox2" CssClass="insertOrderCates" ToolTip="..." Text="..." runat="server"></asp:TextBox>
                            </td>
                        </tr>
                    </tfoot>
                </table>
            </div>
            <div class="clear">
            </div>
</asp:Content>
