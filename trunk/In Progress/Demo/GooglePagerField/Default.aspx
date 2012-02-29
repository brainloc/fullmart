<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DataPagerRepeater" Namespace="DataPagerRepeater" TagPrefix="Custom" %>
<%--<%@ Register Assembly="SqlNetFramework.Web2" Namespace="SqlNetFramework.Web" TagPrefix="SqlNetFramework" %>--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table class="tableInfo">
            <Custom:DataPagerRepeater ID="Repeater1" runat="server" DataSourceID="AccessDataSource1">
                <HeaderTemplate>
                    <tr>
                        <th>
                            ID
                        </th>
                        <th>
                            First name
                        </th>
                        <th>
                            Last name
                        </th>
                    </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td>
                            <%# Eval("PlayerId") %>
                        </td>
                        <td>
                            <%# Eval("FirstName") %>
                        </td>
                        <td>
                            <%# Eval("LastName") %>
                        </td>
                    </tr>
                </ItemTemplate>
            </Custom:DataPagerRepeater>
            <tr>
                <td colspan="3">
                    <asp:DataPager ID="DataPager1" runat="server" PagedControlID="Repeater1" PageSize="5"
                        class="googleNavegationBar">
                        <Fields>
                            <SqlNetFrameworkWebControls:GooglePagerField NextPageImageUrl="~/Images/button_arrow_right.gif"
                                PreviousPageImageUrl="~/Images/button_arrow_left.gif" />
                        </Fields>
                    </asp:DataPager>
                </td>
            </tr>
        </table>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/DemoDb.mdb"
            SelectCommand="SELECT * FROM [SoccerPlayer]"></asp:AccessDataSource>
    </div>
    </form>
</body>
</html>
