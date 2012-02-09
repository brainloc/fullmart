<%@ Page Title="" Language="C#" MasterPageFile="~/TwoColumns.Master" AutoEventWireup="true" CodeBehind="ManagerUser.aspx.cs" Inherits="FullMart.ManagerUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/themes/style/admin.css" rel="stylesheet" type="text/css" />
    <script src="themes/script/admin.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Left" runat="server">
<div id="Lmenu" class="lb btlr">
        <div class="title block btlr">
            <span>Manager</span></div>
        <ul class="lplist">
            <li><a class="ap" href="#">General Manager</a>
                <div class="lsubcat b">
                    <ul>
                        <li><a href="#">Term Conditions</a></li>
                        <li><a href="#">State Manager</a></li>
                    </ul>
                </div>
            </li>
            <li><a class="ap" href="#">User Manager</a>
                <div class="lsubcat b">
                    <ul>
                        <li><a href="#">Create New User</a></li>
                        <li><a href="#">Edit User Information</a></li>
                        <li><a href="#">Change User Permistion</a></li>
                    </ul>
                </div>
            </li>
            <li><a class="ap" href="#">Product Manager</a>
                <div class="lsubcat b">
                    <ul>
                        <li><a href="#">Manager Categories</a></li>
                        <li><a href="#">Post New Product</a></li>
                        <li><a href="#">Select Product On Out Side</a></li>
                    </ul>
                </div>
            </li>
            <li><a class="ap" href="#">News Manager</a>
                <div class="lsubcat b">
                    <ul>
                        <li><a href="#">Create News</a></li>
                        <li><a href="#">Edit News</a></li>
                    </ul>
                </div>
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
                <asp:TextBox ID="TextBox1" title="Enter Email to search user" Text="Enter Email to search user" CssClass="aip" runat="server"></asp:TextBox>
                <asp:Button ID="Button1" CssClass="SUser" runat="server" Text="Button" />
            </div>
        </div>
    </div>
    <div id="Usertab">
        <ul>
            <li><a href="#Usert">User</a></li>
            <li><a href="#Shopt">Shop</a></li>
            <li><a href="#Adminitratort">Adminitrator</a></li>
        </ul>
        <div id="Usert">
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
                    <tr>
                        <td>
                            sad2man289@gmail.com
                        </td>
                        <td>
                            Nam
                        </td>
                        <td>
                            Nguyễn
                        </td>
                        <td>
                            21/12/2011
                        </td>
                        <td>
                            Viet Nam
                        </td>
                        <td>
                            DH Su Pham Ky Thuat
                        </td>
                        <td>
                            type
                        </td>
                        <td>
                            Shop<div class="cmdUser">
                                <button class="Uview left">
                                </button>
                                <button class="Uedit left">
                                </button>
                                <button class="Udelete left">
                                </button>
                                <div class="clear">
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            sadma1n289@gmail.com
                        </td>
                        <td>
                            Nam
                        </td>
                        <td>
                            Nguyễn
                        </td>
                        <td>
                            21/12/2011
                        </td>
                        <td>
                            Viet Nam
                        </td>
                        <td>
                            DH Su 1Pham Ky Thuat
                        </td>
                        <td>
                            None Shop type
                        </td>
                        <td>
                            Adminitrator<div class="cmdUser">
                                <button class="Uview left">
                                </button>
                                <button class="Uedit left">
                                </button>
                                <button class="Udelete left">
                                </button>
                                <div class="clear">
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            sadman289@gmail.com
                        </td>
                        <td>
                            Nam
                        </td>
                        <td>
                            Nguyễn
                        </td>
                        <td>
                            29/01/2012
                        </td>
                        <td>
                            Viet Nam
                        </td>
                        <td>
                            DH Su Pham Ky Thuat
                        </td>
                        <td>
                            None Shop type
                        </td>
                        <td>
                            User<div class="cmdUser">
                                <button class="Uview left">
                                </button>
                                <button class="Uedit left">
                                </button>
                                <button class="Udelete left">
                                </button>
                                <div class="clear">
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            sadman289@gmail.com
                        </td>
                        <td>
                            Nam
                        </td>
                        <td>
                            Nguyễn
                        </td>
                        <td>
                            21/12/2011
                        </td>
                        <td>
                            Viet Nam
                        </td>
                        <td>
                            DH Su Pham Ky Thuat
                        </td>
                        <td>
                            None
                        </td>
                        <td>
                            Shop<div class="cmdUser">
                                <button class="Uview left">
                                </button>
                                <button class="Uedit left">
                                </button>
                                <button class="Udelete left">
                                </button>
                                <div class="clear">
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            sadman289@gmail.com
                        </td>
                        <td>
                            Nam
                        </td>
                        <td>
                            Nguyễn
                        </td>
                        <td>
                            21/12/2011
                        </td>
                        <td>
                            Viet Nam
                        </td>
                        <td>
                            DH Su Pham Ky Thuat
                        </td>
                        <td>
                            None Shop type
                        </td>
                        <td>
                            User<div class="cmdUser">
                                <button class="Uview left">
                                </button>
                                <button class="Uedit left">
                                </button>
                                <button class="Udelete left">
                                </button>
                                <div class="clear">
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            sadman289@gmail.com
                        </td>
                        <td>
                            Nam
                        </td>
                        <td>
                            Nguyễn
                        </td>
                        <td>
                            21/12/2011
                        </td>
                        <td>
                            Viet Nam
                        </td>
                        <td>
                            DH Su Pham Ky Thuat
                        </td>
                        <td>
                            None Shop type
                        </td>
                        <td>
                            User<div class="cmdUser">
                                <button class="Uview left">
                                </button>
                                <button class="Uedit left">
                                </button>
                                <button class="Udelete left">
                                </button>
                                <div class="clear">
                                </div>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div id="Shopt">
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
                    <tr>
                        <td>
                            sad2man289@gmail.com
                        </td>
                        <td>
                            Nam
                        </td>
                        <td>
                            Nguyễn
                        </td>
                        <td>
                            21/12/2011
                        </td>
                        <td>
                            Viet Nam
                        </td>
                        <td>
                            type
                        </td>
                        <td>
                            Shop<div class="cmdUser">
                                <button class="Uview left">
                                </button>
                                <button class="Uedit left">
                                </button>
                                <button class="Udelete left">
                                </button>
                                <div class="clear">
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            sadma1n289@gmail.com
                        </td>
                        <td>
                            Nam
                        </td>
                        <td>
                            Nguyễn
                        </td>
                        <td>
                            21/12/2011
                        </td>
                        <td>
                            Viet Nam
                        </td>
                        <td>
                            None Shop type
                        </td>
                        <td>
                            Adminitrator<div class="cmdUser">
                                <button class="Uview left">
                                </button>
                                <button class="Uedit left">
                                </button>
                                <button class="Udelete left">
                                </button>
                                <div class="clear">
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            sadman289@gmail.com
                        </td>
                        <td>
                            Nam
                        </td>
                        <td>
                            Nguyễn
                        </td>
                        <td>
                            29/01/2012
                        </td>
                        <td>
                            Viet Nam
                        </td>
                        <td>
                            None Shop type
                        </td>
                        <td>
                            User<div class="cmdUser">
                                <button class="Uview left">
                                </button>
                                <button class="Uedit left">
                                </button>
                                <button class="Udelete left">
                                </button>
                                <div class="clear">
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            sadman289@gmail.com
                        </td>
                        <td>
                            Nam
                        </td>
                        <td>
                            Nguyễn
                        </td>
                        <td>
                            21/12/2011
                        </td>
                        <td>
                            Viet Nam
                        </td>
                        <td>
                            None
                        </td>
                        <td>
                            Shop<div class="cmdUser">
                                <button class="Uview left">
                                </button>
                                <button class="Uedit left">
                                </button>
                                <button class="Udelete left">
                                </button>
                                <div class="clear">
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            sadman289@gmail.com
                        </td>
                        <td>
                            Nam
                        </td>
                        <td>
                            Nguyễn
                        </td>
                        <td>
                            21/12/2011
                        </td>
                        <td>
                            Viet Nam
                        </td>
                        <td>
                            None Shop type
                        </td>
                        <td>
                            User<div class="cmdUser">
                                <button class="Uview left">
                                </button>
                                <button class="Uedit left">
                                </button>
                                <button class="Udelete left">
                                </button>
                                <div class="clear">
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            sadman289@gmail.com
                        </td>
                        <td>
                            Nam
                        </td>
                        <td>
                            Nguyễn
                        </td>
                        <td>
                            21/12/2011
                        </td>
                        <td>
                            Viet Nam
                        </td>
                        <td>
                            None Shop type
                        </td>
                        <td>
                            User<div class="cmdUser">
                                <button class="Uview left">
                                </button>
                                <button class="Uedit left">
                                </button>
                                <button class="Udelete left">
                                </button>
                                <div class="clear">
                                </div>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div id="Adminitratort">
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
                        <th>
                            Account Type
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            sad2man289@gmail.com
                        </td>
                        <td>
                            Nam
                        </td>
                        <td>
                            Nguyễn
                        </td>
                        <td>
                            21/12/2011
                        </td>
                        <td>
                            Viet Nam
                        </td>
                        <td>
                            DH Su Pham Ky Thuat
                        </td>
                        <td>
                            type
                        </td>
                        <td>
                            Shop<div class="cmdUser">
                                <button class="Uview left">
                                </button>
                                <button class="Uedit left">
                                </button>
                                <button class="Udelete left">
                                </button>
                                <div class="clear">
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            sadma1n289@gmail.com
                        </td>
                        <td>
                            Nam
                        </td>
                        <td>
                            Nguyễn
                        </td>
                        <td>
                            21/12/2011
                        </td>
                        <td>
                            Viet Nam
                        </td>
                        <td>
                            DH Su 1Pham Ky Thuat
                        </td>
                        <td>
                            None Shop type
                        </td>
                        <td>
                            Adminitrator<div class="cmdUser">
                                <button class="Uview left">
                                </button>
                                <button class="Uedit left">
                                </button>
                                <button class="Udelete left">
                                </button>
                                <div class="clear">
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            sadman289@gmail.com
                        </td>
                        <td>
                            Nam
                        </td>
                        <td>
                            Nguyễn
                        </td>
                        <td>
                            29/01/2012
                        </td>
                        <td>
                            Viet Nam
                        </td>
                        <td>
                            DH Su Pham Ky Thuat
                        </td>
                        <td>
                            None Shop type
                        </td>
                        <td>
                            User<div class="cmdUser">
                                <button class="Uview left">
                                </button>
                                <button class="Uedit left">
                                </button>
                                <button class="Udelete left">
                                </button>
                                <div class="clear">
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            sadman289@gmail.com
                        </td>
                        <td>
                            Nam
                        </td>
                        <td>
                            Nguyễn
                        </td>
                        <td>
                            21/12/2011
                        </td>
                        <td>
                            Viet Nam
                        </td>
                        <td>
                            DH Su Pham Ky Thuat
                        </td>
                        <td>
                            None
                        </td>
                        <td>
                            Shop<div class="cmdUser">
                                <button class="Uview left">
                                </button>
                                <button class="Uedit left">
                                </button>
                                <button class="Udelete left">
                                </button>
                                <div class="clear">
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            sadman289@gmail.com
                        </td>
                        <td>
                            Nam
                        </td>
                        <td>
                            Nguyễn
                        </td>
                        <td>
                            21/12/2011
                        </td>
                        <td>
                            Viet Nam
                        </td>
                        <td>
                            DH Su Pham Ky Thuat
                        </td>
                        <td>
                            None Shop type
                        </td>
                        <td>
                            User<div class="cmdUser">
                                <button class="Uview left">
                                </button>
                                <button class="Uedit left">
                                </button>
                                <button class="Udelete left">
                                </button>
                                <div class="clear">
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            sadman289@gmail.com
                        </td>
                        <td>
                            Nam
                        </td>
                        <td>
                            Nguyễn
                        </td>
                        <td>
                            21/12/2011
                        </td>
                        <td>
                            Viet Nam
                        </td>
                        <td>
                            DH Su Ky Thuat
                        </td>
                        <td>
                            None Shop type
                        </td>
                        <td>
                            User<div class="cmdUser">
                                <button class="Uview left">
                                </button>
                                <button class="Uedit left">
                                </button>
                                <button class="Udelete left">
                                </button>
                                <div class="clear">
                                </div>
                            </div>
                        </td>
                    </tr>
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
                        <input disabled="disabled" id="VUEmail" type="text" />
                    </td>
                    <td>
                        <span>Password: </span>
                        <input id="VUPass" type="text" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <span>First Name:</span><input id="VUFName" type="text" />
                    </td>
                    <td>
                        <span>Last Name</span><input id="VULName" type="text" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <span>Birthday: </span>
                        <input id="VUBday" type="text" />
                    </td>
                    <td>
                        <span>State: </span>
                        <input id="VUState" type="text" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <span>College/University: </span>
                        <input id="VUCU" type="text" />
                    </td>
                    <td>
                        <span>Class: </span>
                        <input id="VUClass" type="text" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <span>Join Date: </span>
                        <input id="VUCreatedate" type="text" />
                    </td>
                    <td>
                        <span>Yahoo: </span>
                        <input id="VUYahoo" type="text" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <span>Mobile: </span>
                        <input id="VUMobile" type="text" />
                    </td>
                    <td>
                        <span>Shop Name: </span>
                        <input id="VUShopName" type="text" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <span>Website: </span>
                        <input id="VUWeb" type="text" />
                    </td>
                    <td>
                        <span>User type: </span>
                        <select id="VURole">
                            <option>User</option>
                            <option>Shop</option>
                            <option>Adminitrator</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <span>WishList:</span>
                        <textarea disabled="disabled" id="VUWishlist"></textarea>
                    </td>
                </tr>
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="2">
                        <div>
                            <center>
                                <button>
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
