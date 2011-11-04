<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RepeaterVerticalMenu.aspx.cs"
    Inherits="Demo.RepeaterVerticalMenu" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <link href="css/top.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="css/main.css" rel="stylesheet" type="text/css" />
    <script src="script/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="script/header.js" type="text/javascript"></script>
    <script src="script/menu.js" type="text/javascript"></script>
    <script src="script/jquery.nivo.slider.pack.js" type="text/javascript"></script>
    <!--[if IE]>
                <link href="css/fix.css" rel="stylesheet" type="text/css" />
            <![EndIf]-->
</head>
<body>
    <form id="form1" runat="server">
    <asp:Panel ID="Panel" runat="server">
        <div id="divMain">
            <div id="divContent">
                <div id="divLeft">
                    <div id="divCategories">
                        <ul id="Lmenu">
                            <asp:Repeater ID="rpCategory" runat="server" DataSourceID="dsCategory">
                                <ItemTemplate>
                                    <li><a href='?cat=<%# Eval("ID") %>'>
                                        <%# Eval("Name") %></a>
                                        <ul>
                                            <asp:Label ID="lblCategoryID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                            <asp:Repeater ID="rpSubCategory" runat="server" DataSourceID="dsSubCategory">
                                                <ItemTemplate>
                                                    <li><a href="?subcat=2">
                                                        <%# Eval("Name") %></a></li>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                            <asp:SqlDataSource ID="dsSubCategory" runat="server" ConnectionString="<%$ ConnectionStrings:FullMartConnectionString %>"
                                                SelectCommand="SELECT [ID],[Name] FROM [FullMart].[dbo].[SubCategory] WHERE [CategoryID] = @CategoryID">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="lblCategoryID" Name="CategoryID" Type="Int32" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </ul>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>                           
                            <asp:SqlDataSource ID="dsCategory" runat="server" ConnectionString="<%$ ConnectionStrings:FullMartConnectionString %>"
                                SelectCommand="SELECT [ID],[Name] FROM [FullMart].[dbo].[Category] ORDER BY [Order]">
                            </asp:SqlDataSource>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </asp:Panel>
    <script type="text/javascript">
        $(document).ready(function () {
            $("marquee").mouseover(function () {
                this.stop();
            });
            $("marquee").mouseleave(function () {
                this.start();
            });
        });
        function setHomepage() {
            if (document.all) {
                document.body.style.behavior = 'url(#default#homepage)';
                document.body.setHomePage('http://#/');

            }
            else if (window.sidebar) {
                if (window.netscape) {
                    try {
                        netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
                    }
                    catch (e) {
                        alert("Trình duyệt của bạn đã chặn chức năng này! \n Để mở chức năng này : gõ about:config vào thanh địa chỉ\n Thay đổi giá trị của signed.applets.codebase_principal_support thành true");
                    }
                }
                var prefs = Components.classes['@mozilla.org/preferences-service;1'].getService(Components.interfaces.nsIPrefBranch);
                prefs.setCharPref('browser.startup.homepage', '#');
            }
        }
    </script>
    <script src="script/footer.js" type="text/javascript"></script>
    </form>
</body>
</html>
