<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Comment.aspx.cs" Inherits="Demo.Comment" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager" runat="server">
    </asp:ScriptManager>
    <div>
        <asp:UpdatePanel ID="UpdatePanel" runat="server">
            <ContentTemplate>
                <table>
                    <tr>
                        <td>
                            <asp:DataGrid ID="gridComments" runat="server" DataSourceID="DS" Width="593px" CellPadding="4"
                                ForeColor="#333333" GridLines="None">
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <EditItemStyle BackColor="#2461BF" />
                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                <AlternatingItemStyle BackColor="White" />
                                <ItemStyle BackColor="#EFF3FB" />
                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            </asp:DataGrid>
                        </td>
                    </tr>
                </table>
                <asp:FormView runat="server" DefaultMode="Insert" DataSourceID="DS" ID="FormView">
                    <InsertItemTemplate>
                        <table>
                            <tr>
                                <td>
                                    UserID:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtUID" runat="server" Text="<%# Bind('PosterID') %>" EnableViewState="true"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    ProductID:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtPID" runat="server" Text="<%# Bind('ProductID') %>" EnableViewState="true"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:TextBox ID="txtContent" runat="server" TextMode="MultiLine" Rows="4" Columns="50"
                                        Text="<%# Bind('Content') %>"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" CommandName="Insert" /><br />
                                    <asp:HiddenField ID="hdnDateTime" runat="server" Value="<%# Bind('CommentTime') %>"/>                                
                                </td>
                            </tr>
                        </table>
                    </InsertItemTemplate>
                </asp:FormView>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:SqlDataSource ID="DS" runat="server" ConnectionString="<%$ ConnectionStrings:FullMartConnectionString %>"
            SelectCommand="SELECT [ID],[ProductID],[PosterID],[Content],[CommentTime] FROM [FullMart].[dbo].[Comment] ORDER BY [CommentTime] DESC"
            InsertCommand="INSERT [FullMart].[dbo].[Comment]([ProductID],[PosterID],[Content],[CommentTime]) VALUES(@ProductID,@PosterID,@Content,@CommentTime)">
            <InsertParameters>
                <asp:Parameter Name="ProductID" />
                <asp:Parameter Name="PosterID" />
                <asp:Parameter Name="Content" />
                <asp:Parameter Name="CommentTime" />
            </InsertParameters>
        </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
