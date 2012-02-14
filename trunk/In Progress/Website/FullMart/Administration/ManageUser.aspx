<%@ Page Title="" Language="C#" MasterPageFile="~/TwoColumns.Master" AutoEventWireup="true"
    CodeBehind="ManageUser.aspx.cs" Inherits="FullMart.Administration.ManageUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/themes/style/admin.css" rel="stylesheet" type="text/css" />
    <script src="/themes/script/admin.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Left" runat="server">
    <div id="Lmenu" class="lb btlr">
        <div class="title block btlr">
            <span>Manager</span></div>
        <ul class="lplist">
            <li><a class="ap" href="/Administration/ManagerGeneral.aspx">General Manager</a>
            </li>
            <li><a class="ap" href="/Administration/ManageUser.aspx">User Manager</a>
            </li>
            <li><a class="ap" href="/Shop/ManageProducts.aspx">Product Manager</a>
            </li>
            <li><a class="ap" href="/News/ManageNews.aspx">News Manager</a>
            </li>
            <li><a class="ap" href="#">Answer & Question Manager</a> </li>
        </ul>
        
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Right" runat="server">
    <div class="State block" id="State">
        <div class="acontent block">
            <p class="atitle">
                Manager User</p>
            <div class="insstate">
                <asp:TextBox ID="txtSearchKey" title="Enter Email to search user" Text="Enter Email to search user"
                    CssClass="aip" runat="server"></asp:TextBox>
                <asp:Button ID="Button1" CssClass="SUser" runat="server" Text="Button" 
                    onclick="Button1_Click" />
            </div>
        </div>
    </div>
    <div id="Usertab">
     
        
        <asp:Panel ID="pnSearchUser" Visible=false runat="server">
            <table id="searchUser" class="usereven tablesorter lUser">
               <thead>
                    <tr>
                        <th>
                            Email
                        </th>
                        <th>
                            First Name
                        </th>
                        <th>
                            Last Name
                        </th>
                        <th>
                            Join Day
                        </th>
                        <th>
                            State
                        </th>
                        <th>
                            College/University
                        </th>
                        <th>
                            class
                        </th>
                        <th>
                            Birthday
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="rpSearchUserList" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <%# Eval("email")%>
                                </td>
                                <td>
                                    <%# Eval("fname")%>
                                </td>
                                <td>
                                    <%# Eval("lname")%>
                                </td>
                                <td>
                                    <%# Eval("createdate")%>
                                </td>
                                <td>
                                    <%# Eval("state")%>
                                </td>
                                <td>
                                    <%# Eval("CU")%>
                                </td>
                                <td>
                                    <%# Eval("class")%>
                                </td>
                                <td>
                                    <a href='<%# Eval("bday")%>' target="_blank"><%# Eval("Web")%></a>                                    
                                    <div class="cmdUser">
                                        <button class="Uview left">
                                        </button>
                                        <button class="Uedit left">
                                        </button>
                                        <button class="Udelete left">
                                        </button>
                                        <div class="clear">
                                        </div>
                                    </div>
                                     <div class="detailU"><div class="viewU">
                                        <span id="tUser"><%# Eval("email")%></span>
                                        <table>
                                            <tbody>
                                                <tr>
                                                    <td>
                                                        <span>Email: </span>
                                                        <input disabled="disabled" class="VUEmail" value="<%# Eval("email")%>" type="text" />
                                                    </td>
                                                    <td>
                                                        <span>Password: </span>
                                                        <input class="VUPass" type="text" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <span>First Name:</span><input class="VUFName" value="<%# Eval("fname")%>" type="text" />
                                                    </td>
                                                    <td>
                                                        <span>Last Name</span><input class="VULName" value="<%# Eval("lname")%>" type="text" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <span>Birthday: </span>
                                                        <input class="VUBday" value="<%# Eval("bday")%>" type="text" />
                                                    </td>
                                                    <td>
                                                        <span>State: </span>
                                                        <input class="VUState" value="<%# Eval("state")%>" type="text" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <span>College/University: </span>
                                                        <input class="VUCU" value="<%# Eval("CU")%>" type="text" />
                                                    </td>
                                                    <td>
                                                        <span>Class: </span>
                                                        <input class="VUClass" value="<%# Eval("class")%>" type="text" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <span>Join Date: </span>
                                                        <input class="VUCreatedate" value="<%# Eval("createdate")%>" type="text" />
                                                    </td>
                                                    <td>
                                                        <span>Yahoo: </span>
                                                        <input class="VUYahoo" value="<%# Eval("yahoo")%>" type="text" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <span>Mobile: </span>
                                                        <input class="VUMobile" value="<%# Eval("mobile")%>" type="text" />
                                                    </td>
                                                    <td>
                                                        <span>Shop Name: </span>
                                                        <input class="VUShopName" value="<%# Eval("shopname")%>" type="text" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <span>Website: </span>
                                                        <input class="VUWeb" value="<%# Eval("web")%>" type="text" />
                                                    </td>
                                                    <td>
                                                        <span>User type: </span>
                                                        <select class="VURole">
                                                            <option selected="selected">Member</option>
                                                            <option>Shop</option>
                                                            <option>Administrator</option>
                                                        </select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        <span>WishList:</span>
                                                        <textarea disabled="disabled" value="<%# Eval("Wishlist")%>" class="VUWishlist"></textarea>
                                                    </td>
                                                </tr>
                                            </tbody>
                                            <tfoot>
                                                <tr>
                                                    <td colspan="2">
                                                        <div>
                                                            <center>
                                                                <button onclick="btUser($(this));">
                                                                    CLOSE</button></center>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </div></div>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </asp:Panel>
        <ul>
            <li><a href="#Usert">User</a></li>
            <li><a href="#Shopt">Shop</a></li>
            <li><a href="#Adminitratort">Adminitrator</a></li>
        </ul>
        <div id="Usert" class="usereven">            
            <table id="Table1" class="tablesorter lUser">
               <thead>
                    <tr>
                        <th>
                            Email
                        </th>
                        <th>
                            First Name
                        </th>
                        <th>
                            Last Name
                        </th>
                        <th>
                            Join Day
                        </th>
                        <th>
                            State
                        </th>
                        <th>
                            College/University
                        </th>
                        <th>
                            class
                        </th>
                        <th>
                            Birthday
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="rpUserList" runat="server" DataSourceID="dsUserList">
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <%# Eval("email")%>
                                </td>
                                <td>
                                    <%# Eval("fname")%>
                                </td>
                                <td>
                                    <%# Eval("lname")%>
                                </td>
                                <td>
                                    <%# Eval("createdate")%>
                                </td>
                                <td>
                                    <%# Eval("state")%>
                                </td>
                                <td>
                                    <%# Eval("CU")%>
                                </td>
                                <td>
                                    <%# Eval("class")%>
                                </td>
                                <td>
                                    <a href='<%# Eval("bday")%>' target="_blank"><%# Eval("Web")%></a>                                    
                                    <div class="cmdUser">
                                        <button class="Uview left">
                                        </button>
                                        <button class="Uedit left">
                                        </button>
                                        <button class="Udelete left">
                                        </button>
                                        <div class="clear">
                                        </div>
                                    </div>
                                    <div class="detailU"><div class="viewU">
                                        <span id="tUser"><%# Eval("email")%></span>
                                        <table>
                                            <tbody>
                                                <tr>
                                                    <td>
                                                        <span>Email: </span>
                                                        <input disabled="disabled" class="VUEmail" value="<%# Eval("email")%>" type="text" />
                                                    </td>
                                                    <td>
                                                        <span>Password: </span>
                                                        <input class="VUPass" type="text" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <span>First Name:</span><input class="VUFName" value="<%# Eval("fname")%>" type="text" />
                                                    </td>
                                                    <td>
                                                        <span>Last Name</span><input class="VULName" value="<%# Eval("lname")%>" type="text" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <span>Birthday: </span>
                                                        <input class="VUBday" value="<%# Eval("bday")%>" type="text" />
                                                    </td>
                                                    <td>
                                                        <span>State: </span>
                                                        <input class="VUState" value="<%# Eval("state")%>" type="text" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <span>College/University: </span>
                                                        <input class="VUCU" value="<%# Eval("CU")%>" type="text" />
                                                    </td>
                                                    <td>
                                                        <span>Class: </span>
                                                        <input class="VUClass" value="<%# Eval("class")%>" type="text" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <span>Join Date: </span>
                                                        <input class="VUCreatedate" value="<%# Eval("createdate")%>" type="text" />
                                                    </td>
                                                    <td>
                                                        <span>Yahoo: </span>
                                                        <input class="VUYahoo" value="<%# Eval("yahoo")%>" type="text" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <span>Mobile: </span>
                                                        <input class="VUMobile" value="<%# Eval("mobile")%>" type="text" />
                                                    </td>
                                                    <td>
                                                        <span>Shop Name: </span>
                                                        <input class="VUShopName" value="<%# Eval("shopname")%>" type="text" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <span>Website: </span>
                                                        <input class="VUWeb" value="<%# Eval("web")%>" type="text" />
                                                    </td>
                                                    <td>
                                                        <span>User type: </span>
                                                        <select class="VURole">
                                                            <option selected="selected">Member</option>
                                                            <option>Shop</option>
                                                            <option>Administrator</option>
                                                        </select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        <span>WishList:</span>
                                                        <textarea disabled="disabled" value="<%# Eval("Wishlist")%>" class="VUWishlist"></textarea>
                                                    </td>
                                                </tr>
                                            </tbody>
                                            <tfoot>
                                                <tr>
                                                    <td colspan="2">
                                                        <div>
                                                            <center>
                                                                <button onclick="btUser($(this));">
                                                                    CLOSE</button></center>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </div></div>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:SqlDataSource ID="dsUserList" runat="server" ConnectionString="<%$ ConnectionStrings:FullMartConnectionString %>" SelectCommandType="StoredProcedure" SelectCommand="GetAllUserByRole">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="roleID" DefaultValue='3' />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </tbody>
            </table>
        </div>
        <div id="Shopt" class="usereven">
            <table id="Table2" class="tablesorter lUser">
                <thead>
                    <tr>
                        <th>
                            Email
                        </th>
                        <th>
                            First Name
                        </th>
                        <th>
                            Last Name
                        </th>
                        <th>
                            Join Day
                        </th>
                        <th>
                            State
                        </th>
                        <th>
                            ShopName
                        </th>
                        <th>
                            Website
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="rpShopList" runat="server" DataSourceID="dsShopList">
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <%# Eval("email")%>
                                </td>
                                <td>
                                    <%# Eval("fname")%>
                                </td>
                                <td>
                                    <%# Eval("lname")%>
                                </td>
                                <td>
                                    <%# Eval("createdate")%>
                                </td>
                                <td>
                                    <%# Eval("state")%>
                                </td>
                                <td>
                                    <%# Eval("Shopname")%>
                                </td>
                                <td>
                                    <a href='<%# Eval("Web")%>' target="_blank"><%# Eval("Web")%></a>                                    
                                    <div class="cmdUser">
                                        <button class="Uview left">
                                        </button>
                                        <button class="Uedit left">
                                        </button>
                                        <button class="Udelete left">
                                        </button>
                                        <div class="clear">
                                        </div>
                                    </div>
                                    
                                    <div class="detailU"><div class="viewU">
                                        <span id="tUser"><%# Eval("email")%></span>
                                        <table>
                                            <tbody>
                                                <tr>
                                                    <td>
                                                        <span>Email: </span>
                                                        <input disabled="disabled" class="VUEmail" value="<%# Eval("email")%>" type="text" />
                                                    </td>
                                                    <td>
                                                        <span>Password: </span>
                                                        <input class="VUPass" type="text" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <span>First Name:</span><input class="VUFName" value="<%# Eval("fname")%>" type="text" />
                                                    </td>
                                                    <td>
                                                        <span>Last Name</span><input class="VULName" value="<%# Eval("lname")%>" type="text" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <span>Birthday: </span>
                                                        <input class="VUBday" value="<%# Eval("bday")%>" type="text" />
                                                    </td>
                                                    <td>
                                                        <span>State: </span>
                                                        <input class="VUState" value="<%# Eval("state")%>" type="text" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <span>College/University: </span>
                                                        <input class="VUCU" value="<%# Eval("CU")%>" type="text" />
                                                    </td>
                                                    <td>
                                                        <span>Class: </span>
                                                        <input class="VUClass" value="<%# Eval("class")%>" type="text" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <span>Join Date: </span>
                                                        <input class="VUCreatedate" value="<%# Eval("createdate")%>" type="text" />
                                                    </td>
                                                    <td>
                                                        <span>Yahoo: </span>
                                                        <input class="VUYahoo" value="<%# Eval("yahoo")%>" type="text" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <span>Mobile: </span>
                                                        <input class="VUMobile" value="<%# Eval("mobile")%>" type="text" />
                                                    </td>
                                                    <td>
                                                        <span>Shop Name: </span>
                                                        <input class="VUShopName" value="<%# Eval("shopname")%>" type="text" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <span>Website: </span>
                                                        <input class="VUWeb" value="<%# Eval("web")%>" type="text" />
                                                    </td>
                                                    <td>
                                                        <span>User type: </span>
                                                        <select class="VURole">
                                                            <option>Member</option>
                                                            <option selected="selected">Shop</option>
                                                            <option>Administrator</option>
                                                        </select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        <span>WishList:</span>
                                                        <textarea disabled="disabled" value="<%# Eval("Wishlist")%>" class="VUWishlist"></textarea>
                                                    </td>
                                                </tr>
                                            </tbody>
                                            <tfoot>
                                                <tr>
                                                    <td colspan="2">
                                                        <div>
                                                            <center>
                                                                <button onclick="btUser($(this));">
                                                                    CLOSE</button></center>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </div></div>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:SqlDataSource ID="dsShopList" runat="server" ConnectionString="<%$ ConnectionStrings:FullMartConnectionString %>" SelectCommandType="StoredProcedure" SelectCommand="GetAllUserByRole">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="roleID" DefaultValue='2' />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </tbody>
            </table>
        </div>
        <div id="Adminitratort" class="usereven">
            <table id="Table3" class="tablesorter lUser">
                <thead>
                    <tr>
                        <th>
                            Email
                        </th>
                        <th>
                            First Name
                        </th>
                        <th>
                            Last Name
                        </th>
                        <th>
                            Join Day
                        </th>
                        <th>
                            State
                        </th>
                        <th>
                            mobile
                        </th>
                        <th>
                            yahoo
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="rpAdministratorList" runat="server" DataSourceID="dsAdministratorList">
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <%# Eval("email")%>
                                </td>
                                <td>
                                    <%# Eval("fname")%>
                                </td>
                                <td>
                                    <%# Eval("lname")%>
                                </td>
                                <td>
                                    <%# Eval("createdate")%>
                                </td>
                                <td>
                                    <%# Eval("state")%>
                                </td>
                                <td>
                                    <%# Eval("mobile")%>
                                </td>
                                <td>
                                    <%# Eval("yahoo")%>                 
                                    <div class="cmdUser">
                                        <button class="Uview left">
                                        </button>
                                        <button class="Uedit left">
                                        </button>
                                        <button class="Udelete left">
                                        </button>
                                        <div class="clear">
                                        </div>
                                    </div>
                                    <div class="detailU">
                                    <div class="viewU">
                                        <span id="tUser"><%# Eval("email")%></span>
                                        <table>
                                            <tbody>
                                                <tr>
                                                    <td>
                                                        <span>Email: </span>
                                                        <input disabled="disabled" class="VUEmail" value="<%# Eval("email")%>" type="text" />
                                                    </td>
                                                    <td>
                                                        <span>Password: </span>
                                                        <input class="VUPass" type="text" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <span>First Name:</span><input class="VUFName" value="<%# Eval("fname")%>" type="text" />
                                                    </td>
                                                    <td>
                                                        <span>Last Name</span><input class="VULName" value="<%# Eval("lname")%>" type="text" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <span>Birthday: </span>
                                                        <input class="VUBday" value="<%# Eval("bday")%>" type="text" />
                                                    </td>
                                                    <td>
                                                        <span>State: </span>
                                                        <input class="VUState" value="<%# Eval("state")%>" type="text" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <span>College/University: </span>
                                                        <input class="VUCU" value="<%# Eval("CU")%>" type="text" />
                                                    </td>
                                                    <td>
                                                        <span>Class: </span>
                                                        <input class="VUClass" value="<%# Eval("class")%>" type="text" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <span>Join Date: </span>
                                                        <input class="VUCreatedate" value="<%# Eval("createdate")%>" type="text" />
                                                    </td>
                                                    <td>
                                                        <span>Yahoo: </span>
                                                        <input class="VUYahoo" value="<%# Eval("yahoo")%>" type="text" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <span>Mobile: </span>
                                                        <input class="VUMobile" value="<%# Eval("mobile")%>" type="text" />
                                                    </td>
                                                    <td>
                                                        <span>Shop Name: </span>
                                                        <input class="VUShopName" value="<%# Eval("shopname")%>" type="text" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <span>Website: </span>
                                                        <input class="VUWeb" value="<%# Eval("web")%>" type="text" />
                                                    </td>
                                                    <td>
                                                        <span>User type: </span>
                                                        <select class="VURole">
                                                            <option>Member</option>
                                                            <option>Shop</option>
                                                            <option selected="selected">Administrator</option>
                                                        </select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        <span>WishList:</span>
                                                        <textarea disabled="disabled" value="<%# Eval("Wishlist")%>" class="VUWishlist"></textarea>
                                                    </td>
                                                </tr>
                                            </tbody>
                                            <tfoot>
                                                <tr>
                                                    <td colspan="2">
                                                        <div>
                                                            <center>
                                                                <button onclick="btUser($(this));">
                                                                    CLOSE</button></center>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </div></div>
                                    
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:SqlDataSource ID="dsAdministratorList" runat="server" ConnectionString="<%$ ConnectionStrings:FullMartConnectionString %>" SelectCommandType="StoredProcedure" SelectCommand="GetAllUserByRole">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="roleID" DefaultValue='2' />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </tbody>
            </table>
        </div>
    </div>
    <div id="viewU" class="viewU">
        <div class="cmdUser">
            <button class="Uview left">
            </button>
            <button class="Uedit left">
            </button>
            <button class="Udelete left">
            </button>
            <div class="clear">
            </div>
        </div>
        <span id="tUser"></span>
        <table>
            <tbody>
                <tr>
                    <td>
                        <span>Email: </span>
                        <input disabled="disabled" class="VUEmail" type="text" />
                    </td>
                    <td>
                        <span>Password: </span>
                        <input class="VUPass" type="text" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <span>First Name:</span><input class="VUFName" type="text" />
                    </td>
                    <td>
                        <span>Last Name</span><input class="VULName" type="text" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <span>Birthday: </span>
                        <input class="VUBday" type="text" />
                    </td>
                    <td>
                        <span>State: </span>
                        <input class="VUState" type="text" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <span>College/University: </span>
                        <input class="VUCU" type="text" />
                    </td>
                    <td>
                        <span>Class: </span>
                        <input class="VUClass" type="text" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <span>Join Date: </span>
                        <input class="VUCreatedate" type="text" />
                    </td>
                    <td>
                        <span>Yahoo: </span>
                        <input class="VUYahoo" type="text" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <span>Mobile: </span>
                        <input class="VUMobile" type="text" />
                    </td>
                    <td>
                        <span>Shop Name: </span>
                        <input class="VUShopName" type="text" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <span>Website: </span>
                        <input class="VUWeb" type="text" />
                    </td>
                    <td>
                        <span>User type: </span>
                        <select class="VURole">
                            <option>User</option>
                            <option>Shop</option>
                            <option>Adminitrator</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <span>WishList:</span>
                        <textarea disabled="disabled" class="VUWishlist"></textarea>
                    </td>
                </tr>
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="2">
                        <div>
                            <center>
                                <button onclick="btUser($(this));">
                                                                    CLOSE</button></center>
                        </div>
                    </td>
                </tr>
            </tfoot>
        </table>
    </div>
    <div id="cfdelete">
        <p>
            <center>
                Do you want to delete User: <span></span>?</center>
        </p>
        <center>
            <button>
                Yes</button>
            <button>
                No</button></center>
    </div>
</asp:Content>
