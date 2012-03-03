<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ManageState.aspx.cs" Inherits="FullMart.Administration.ManageState" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Right" runat="server">
 <div class="acontent block">
     <p class="atitle">
            Manager States</p>
        <span style="color: Red; padding: 10px; font-size: 15px">Press 'tab' when change Order
            number to check.<br />
            Press 'Enter' when change States's Name, Order to Update. </span>
        <div class="block clear">
            <table class="tbstates left" cellpadding="0" cellspacing="0">
                <thead><tr>
                    <td>
                        State Name
                    </td>
                    <td>
                        Order
                    </td>
                    <td>
                    </td></tr>
                </thead>
                <asp:Repeater ID="rpListStates" DataSourceID="dsListStates" runat="server">
                    <ItemTemplate>
                        <tr ref='<%# Eval("ID") %>'>
                            <td>
                                <input ref="<%# Eval("ID") %>" value='<%# Eval("StateName") %>' />
                                <%--<asp:TextBox ID="ABC" Text='<%# Eval("Name") %>'  runat="server" OnTextChanged="ABC"></asp:TextBox>--%>
                            </td>
                            <td>
                                <input ref="<%# Eval("ID") %>" value='<%# Eval("Order") %>' />
                                <%-- <asp:TextBox ID='ABD' Text='<%# Eval("Order") %>' runat="server"></asp:TextBox>--%>
                            </td>
                            <td>
                                <img class="sDel" ref="<%# Eval("ID") %>" src="/themes/images/delete.png" /><img
                                    ref="<%# Eval("ID") %>" class="bindSubCate" src="/themes/images/Arrow_Right.png" />
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
                <tfoot>
                    <tr class="insertCates">
                        <td>
                            <asp:TextBox ID="txtInsert" CssClass="insertNameCates" ToolTip="Press 'Enter' to insert" Text="Press 'Enter' to insert" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="txtInsertOrder" CssClass="insertOrderCates" ToolTip="..." Text="..."
                                runat="server"></asp:TextBox>
                        </td>
                    </tr>
                </tfoot>
            </table>
            <table class="tbsubstates right" cellpadding="0" cellspacing="0">
                <thead><tr>
                    <td>
                        Zone Name
                    </td>
                    <td>
                        Order
                    </td>
                    <td>
                    </td></tr>
                </thead>
                <tbody>
                </tbody>
                <tfoot>
                    <tr class="insertCates">
                        <td>
                            <asp:TextBox ID="TextBox1" CssClass="insertNameCates" ToolTip="Press 'Enter' to insert" Text="Press 'Enter' to insert" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox2" Enabled=false CssClass="insertOrderCates" ToolTip="..." Text="..." runat="server"></asp:TextBox>
                        </td>
                    </tr>
                </tfoot>
            </table>
        </div>
        <div class="clear">
        </div>
    </div>
    <asp:SqlDataSource ID="dsListStates" runat="server" ConnectionString="<%$ ConnectionStrings:FullMartConnectionString %>"
        SelectCommand="GetStates" SelectCommandType="StoredProcedure">
    </asp:SqlDataSource>
</asp:Content>