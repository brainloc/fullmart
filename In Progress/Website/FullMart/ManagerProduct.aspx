<%@ Page Title="" Language="C#" MasterPageFile="~/TwoColumns.Master" AutoEventWireup="true" CodeBehind="ManagerProduct.aspx.cs" Inherits="FullMart.ManagerProduct" %>
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
                Manager Categories</p>
            <table>
                <tr>
                    <td>
                        Main Categories
                    </td>
                    <td>
                        Sub Catetgories
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="insstate left">
                            <%--<asp:TextBox ID="txtINSCAT" CssClass="aip" title="Press 'Enter' to insert" Text="Press 'Enter' to insert"
                                runat="server"></asp:TextBox>--%>
                            <input type="text" value="Press 'Enter' to insert" title="Press 'Enter' to insert" class="aip" id="INSCAT" />
                            <button class="slobox">
                            </button>
                            <div class="clear">
                            </div>
                            <script type="text/javascript">
                                        
                            </script>
                            <ul class="maincat">
                                <li><span>Sate 1</span>
                                    <button class="delState" title="Delete" title="Delete">
                                    </button>
                                </li>
                                <li><span>Sate 2</span>
                                    <button class="delState" title="Delete">
                                    </button>
                                </li>
                                <li><span>Sate 3</span>
                                    <button class="delState" title="Delete">
                                    </button>
                                </li>
                                <li><span>Sate 4</span>
                                    <button class="delState" title="Delete">
                                    </button>
                                </li>
                                <li><span>Sate 5</span>
                                    <button class="delState" title="Delete">
                                    </button>
                                </li>
                                <li><span>Sate 6</span>
                                    <button class="delState" title="Delete">
                                    </button>
                                </li>
                                <li><span>Sate 7</span>
                                    <button class="delState" title="Delete">
                                    </button>
                                </li>
                                <li><span>Sate 8</span>
                                    <button class="delState" title="Delete">
                                    </button>
                                </li>
                                <li><span>Sate 9</span>
                                    <button class="delState" title="Delete">
                                    </button>
                                </li>
                                <li><span>Sate 10</span>
                                    <button class="delState" title="Delete">
                                    </button>
                                </li>
                                <li><span>Sate 11</span>
                                    <button class="delState" title="Delete">
                                    </button>
                                </li>
                                <li><span>Sate 12</span>
                                    <button class="delState" title="Delete">
                                    </button>
                                </li>
                            </ul>
                        </div>
                    </td>
                    <td>
                        <div class="insstate left">
                            <%--<asp:TextBox ID="txtINSSUBCAT" CssClass="aip" title="Press 'Enter' to insert" Text="Press 'Enter' to insert"
                                runat="server"></asp:TextBox>--%>
                            <input type="text" value="Press 'Enter' to insert" title="Press 'Enter' to insert" class="aip" id="INSSUBCAT" />
                            <button class="slobox">
                            </button>
                            <div class="clear">
                            </div>
                            <ul class="subcat">
                                <li><span>Sate 1</span>
                                    <button class="delState" title="Delete" title="Delete">
                                    </button>
                                </li>
                                <li><span>Sate 2</span>
                                    <button class="delState" title="Delete">
                                    </button>
                                </li>
                                <li><span>Sate 3</span>
                                    <button class="delState" title="Delete">
                                    </button>
                                </li>
                                <li><span>Sate 4</span>
                                    <button class="delState" title="Delete">
                                    </button>
                                </li>
                                <li><span>Sate 5</span>
                                    <button class="delState" title="Delete">
                                    </button>
                                </li>
                                <li><span>Sate 6</span>
                                    <button class="delState" title="Delete">
                                    </button>
                                </li>
                                <li><span>Sate 7</span>
                                    <button class="delState" title="Delete">
                                    </button>
                                </li>
                                <li><span>Sate 8</span>
                                    <button class="delState" title="Delete">
                                    </button>
                                </li>
                                <li><span>Sate 9</span>
                                    <button class="delState" title="Delete">
                                    </button>
                                </li>
                                <li><span>Sate 10</span>
                                    <button class="delState" title="Delete">
                                    </button>
                                </li>
                                <li><span>Sate 11</span>
                                    <button class="delState" title="Delete">
                                    </button>
                                </li>
                                <li><span>Sate 12</span>
                                    <button class="delState" title="Delete">
                                    </button>
                                </li>
                            </ul>
                        </div>
                    </td>
                </tr>
            </table>
            <div class="clear">
            </div>
        </div>
        <div class="acontent block">
            <p class="atitle">
                Manager Product</p>
            <div class="insstate">
                <%--<asp:TextBox ID="txtsearchPID" CssClass="aip" title="Search by Product's ID" Text="Search by Product's ID"
                    runat="server"></asp:TextBox>--%>
                <input type="text" value="Search by Product's ID" class="aip" id="searchPID" title="Search by Product's ID" />
                <button class="SUser">
                </button>
            </div>
            <div class="insstate left">
                <%--<asp:TextBox ID="txtSProduct" CssClass="aip SProduct" title="Enter Email to search user's product"
                    Text="Enter Email to search user's product" runat="server"></asp:TextBox>--%>
                <input type="text" title="Enter Email to search user's product" value="Enter Email to search user's product" class="aip SProduct" id="SProduct" />
            </div>
            <div class="insstate left">
                <select>
                    <option>--All Categories--</option>
                    <option>List Categories</option>
                </select></div>
            <div class="insstate left">
                <select>
                    <option>--All Categories--</option>
                    <option>List SubCategories</option>
                </select></div>
            <asp:Button ID="Button1" CssClass="bt block" runat="server" Text="Filter" />
            <div class="clear">
            </div>
        </div>
    </div>
                <div class="MProduct">
                    <table cellpadding=0 cellspacing=0>
                        <thead><tr><th>ID</th><th>Product's Name</th><th>Post date</th><th>Poster</th><th>Price(vnd)</th><th>Sub Category</th><th>OS</th></tr></thead>
                        <tbody>
                            <tr><td><div class="cmdUser">
                                            <a href="viewp.aspx?id=1" target="_blank"><button class="Uview left">
                                            </button></a>
                                            <a href="editp.aspx?id=1" target="_blank"><button class="Uedit left">
                                            </button></a>
                                            <button class="Udelete left">
                                            </button>
                                            <div class="clear"></div>
                                            </div>1</td><td><a href="#link_Product" target="_Blank">IPhone 4</a></td><td>21/12/2011</td><td>sadman289@gmail.com</td><td>10.000.000</td><td>IPhone</td><td><input type=checkbox class="outstanding" /></td></tr>
                            <tr><td><div class="cmdUser">
                                            <a href="viewp.aspx?id=1" target="_blank"><button class="Uview left">
                                            </button></a>
                                            <a href="editp.aspx?id=1" target="_blank"><button class="Uedit left">
                                            </button></a>
                                            <button class="Udelete left">
                                            </button>
                                            <div class="clear"></div>
                                            </div>2</td><td><a href="#link_Product" target="_Blank">IPhone 4</a></td><td>21/12/2011</td><td>sadman289@gmail.com</td><td>10.000.000</td><td>IPhone</td><td><input type=checkbox class="outstanding" /></td></tr>
                            <tr><td><div class="cmdUser">
                                            <a href="viewp.aspx?id=1" target="_blank"><button class="Uview left">
                                            </button></a>
                                            <a href="editp.aspx?id=1" target="_blank"><button class="Uedit left">
                                            </button></a>
                                            <button class="Udelete left">
                                            </button>
                                            <div class="clear"></div>
                                            </div>3</td><td><a href="#link_Product" target="_Blank">IPhone 4</a></td><td>21/12/2011</td><td>sadman289@gmail.com</td><td>10.000.000</td><td>IPhone</td><td><input type=checkbox class="outstanding" /></td></tr>
                            <tr><td><div class="cmdUser">
                                            <a href="viewp.aspx?id=1" target="_blank"><button class="Uview left">
                                            </button></a>
                                            <a href="editp.aspx?id=1" target="_blank"><button class="Uedit left">
                                            </button></a>
                                            <button class="Udelete left">
                                            </button>
                                            <div class="clear"></div>
                                            </div>4</td><td><a href="#link_Product" target="_Blank">IPhone 4</a></td><td>21/12/2011</td><td>sadman289@gmail.com</td><td>10.000.000</td><td>IPhone</td><td><input type=checkbox class="outstanding" /></td></tr>
                            <tr><td><div class="cmdUser">
                                            <a href="viewp.aspx?id=1" target="_blank"><button class="Uview left">
                                            </button></a>
                                            <a href="editp.aspx?id=1" target="_blank"><button class="Uedit left">
                                            </button></a>
                                            <button class="Udelete left">
                                            </button>
                                            <div class="clear"></div>
                                            </div>5</td><td><a href="#link_Product" target="_Blank">IPhone 4</a></td><td>21/12/2011</td><td>sadman289@gmail.com</td><td>10.000.000</td><td>IPhone</td><td><input type=checkbox class="outstanding" /></td></tr>
                            <tr><td><div class="cmdUser">
                                            <a href="viewp.aspx?id=1" target="_blank"><button class="Uview left">
                                            </button></a>
                                            <a href="editp.aspx?id=1" target="_blank"><button class="Uedit left">
                                            </button></a>
                                            <button class="Udelete left">
                                            </button>
                                            <div class="clear"></div>
                                            </div>6</td><td><a href="#link_Product" target="_Blank">IPhone 4</a></td><td>21/12/2011</td><td>sadman289@gmail.com</td><td>10.000.000</td><td>IPhone</td><td><input type=checkbox class="outstanding" /></td></tr>
                            <tr><td><div class="cmdUser">
                                            <a href="viewp.aspx?id=1" target="_blank"><button class="Uview left">
                                            </button></a>
                                            <a href="editp.aspx?id=1" target="_blank"><button class="Uedit left">
                                            </button></a>
                                            <button class="Udelete left">
                                            </button>
                                            <div class="clear"></div>
                                            </div>7</td><td><a href="#link_Product" target="_Blank">IPhone 4</a></td><td>21/12/2011</td><td>sadman289@gmail.com</td><td>10.000.000</td><td>IPhone</td><td><input type=checkbox class="outstanding" /></td></tr>
                            <tr><td><div class="cmdUser">
                                            <a href="viewp.aspx?id=1" target="_blank"><button class="Uview left">
                                            </button></a>
                                            <a href="editp.aspx?id=1" target="_blank"><button class="Uedit left">
                                            </button></a>
                                            <button class="Udelete left">
                                            </button>
                                            <div class="clear"></div>
                                            </div>8</td><td><a href="#link_Product" target="_Blank">IPhone 4</a></td><td>21/12/2011</td><td>sadman289@gmail.com</td><td>10.000.000</td><td>IPhone</td><td><input type=checkbox class="outstanding" /></td></tr>
                            <tr><td><div class="cmdUser">
                                            <a href="viewp.aspx?id=1" target="_blank"><button class="Uview left">
                                            </button></a>
                                            <a href="editp.aspx?id=1" target="_blank"><button class="Uedit left">
                                            </button></a>
                                            <button class="Udelete left">
                                            </button>
                                            <div class="clear"></div>
                                            </div>9</td><td><a href="#link_Product" target="_Blank">IPhone 4</a></td><td>21/12/2011</td><td>sadman289@gmail.com</td><td>10.000.000</td><td>IPhone</td><td><input type=checkbox class="outstanding" /></td></tr>
                            <tr><td><div class="cmdUser">
                                            <a href="viewp.aspx?id=1" target="_blank"><button class="Uview left">
                                            </button></a>
                                            <a href="editp.aspx?id=1" target="_blank"><button class="Uedit left">
                                            </button></a>
                                            <button class="Udelete left">
                                            </button>
                                            <div class="clear"></div>
                                            </div>10</td><td><a href="#link_Product" target="_Blank">IPhone 4</a></td><td>21/12/2011</td><td>sadman289@gmail.com</td><td>10.000.000</td><td>IPhone</td><td><input type=checkbox class="outstanding" /></td></tr>
                            <tr><td><div class="cmdUser">
                                           <a href="viewp.aspx?id=1" target="_blank"><button class="Uview left">
                                            </button></a>
                                            <a href="editp.aspx?id=1" target="_blank"><button class="Uedit left">
                                            </button></a>
                                            <button class="Udelete left">
                                            </button>
                                            <div class="clear"></div>
                                            </div>11</td><td><a href="#link_Product" target="_Blank">IPhone 4</a></td><td>21/12/2011</td><td>sadman289@gmail.com</td><td>10.000.000</td><td>IPhone</td><td><input type=checkbox class="outstanding" /></td></tr>
                            <tr><td><div class="cmdUser">
                                            <a href="viewp.aspx?id=1" target="_blank"><button class="Uview left">
                                            </button></a>
                                            <a href="editp.aspx?id=1" target="_blank"><button class="Uedit left">
                                            </button></a>
                                            <button class="Udelete left">
                                            </button>
                                            <div class="clear"></div>
                                            </div>12</td><td><a href="#link_Product" target="_Blank">IPhone 4</a></td><td>21/12/2011</td><td>sadman289@gmail.com</td><td>10.000.000</td><td>IPhone</td><td><input type=checkbox class="outstanding" /></td></tr>
                            <tr><td><div class="cmdUser">
                                            <a href="viewp.aspx?id=1" target="_blank"><button class="Uview left">
                                            </button></a>
                                            <a href="editp.aspx?id=1" target="_blank"><button class="Uedit left">
                                            </button></a>
                                            <button class="Udelete left">
                                            </button>
                                            <div class="clear"></div>
                                            </div>13</td><td><a href="#link_Product" target="_Blank">IPhone 4</a></td><td>21/12/2011</td><td>sadman289@gmail.com</td><td>10.000.000</td><td>IPhone</td><td><input type=checkbox class="outstanding" /></td></tr>
                            <tr><td><div class="cmdUser">
                                           <a href="viewp.aspx?id=1" target="_blank"><button class="Uview left">
                                            </button></a>
                                            <a href="editp.aspx?id=1" target="_blank"><button class="Uedit left">
                                            </button></a>
                                            <button class="Udelete left">
                                            </button>
                                            <div class="clear"></div>
                                            </div>14</td><td><a href="#link_Product" target="_Blank">IPhone 4</a></td><td>21/12/2011</td><td>sadman289@gmail.com</td><td>10.000.000</td><td>IPhone</td><td><input type=checkbox class="outstanding" /></td></tr>
                            <tr><td><div class="cmdUser">
                                           <a href="viewp.aspx?id=1" target="_blank"><button class="Uview left">
                                            </button></a>
                                            <a href="editp.aspx?id=1" target="_blank"><button class="Uedit left">
                                            </button></a>
                                            <button class="Udelete left">
                                            </button>
                                            <div class="clear"></div>
                                            </div>15</td><td><a href="#link_Product" target="_Blank">IPhone 4</a></td><td>21/12/2011</td><td>sadman289@gmail.com</td><td>10.000.000</td><td>IPhone</td><td><input type=checkbox class="outstanding" /></td></tr>
                            <tr><td><div class="cmdUser">
                                           <a href="viewp.aspx?id=1" target="_blank"><button class="Uview left">
                                            </button></a>
                                            <a href="editp.aspx?id=1" target="_blank"><button class="Uedit left">
                                            </button></a>
                                            <button class="Udelete left">
                                            </button>
                                            <div class="clear"></div>
                                            </div>16</td><td><a href="#link_Product" target="_Blank">IPhone 4</a></td><td>21/12/2011</td><td>sadman289@gmail.com</td><td>10.000.000</td><td>IPhone</td><td><input type=checkbox class="outstanding" /></td></tr>
                            <tr><td><div class="cmdUser">
                                            <a href="viewp.aspx?id=1" target="_blank"><button class="Uview left">
                                            </button></a>
                                            <a href="editp.aspx?id=1" target="_blank"><button class="Uedit left">
                                            </button></a>
                                            <button class="Udelete left">
                                            </button>
                                            <div class="clear"></div>
                                            </div>17</td><td><a href="#link_Product" target="_Blank">IPhone 4</a></td><td>21/12/2011</td><td>sadman289@gmail.com</td><td>10.000.000</td><td>IPhone</td><td><input type=checkbox class="outstanding" /></td></tr>
                            <tr><td><div class="cmdUser">
                                            <a href="viewp.aspx?id=1" target="_blank"><button class="Uview left">
                                            </button></a>
                                            <a href="editp.aspx?id=1" target="_blank"><button class="Uedit left">
                                            </button></a>
                                            <button class="Udelete left">
                                            </button>
                                            <div class="clear"></div>
                                            </div>18</td><td><a href="#link_Product" target="_Blank">IPhone 4</a></td><td>21/12/2011</td><td>sadman289@gmail.com</td><td>10.000.000</td><td>IPhone</td><td><input type=checkbox class="outstanding" /></td></tr>
                            <tr><td><div class="cmdUser">
                                            <a href="viewp.aspx?id=1" target="_blank"><button class="Uview left">
                                            </button></a>
                                            <a href="editp.aspx?id=1" target="_blank"><button class="Uedit left">
                                            </button></a>
                                            <button class="Udelete left">
                                            </button>
                                            <div class="clear"></div>
                                            </div>19</td><td><a href="#link_Product" target="_Blank">IPhone 4</a></td><td>21/12/2011</td><td>sadman289@gmail.com</td><td>10.000.000</td><td>IPhone</td><td><input type=checkbox class="outstanding" /></td></tr>
                            <tr><td><div class="cmdUser">
                                            <a href="viewp.aspx?id=1" target="_blank"><button class="Uview left">
                                            </button></a>
                                            <a href="editp.aspx?id=1" target="_blank"><button class="Uedit left">
                                            </button></a>
                                            <button class="Udelete left">
                                            </button>
                                            <div class="clear"></div>
                                            </div>20</td><td><a href="#link_Product" target="_Blank">IPhone 4</a></td><td>21/12/2011</td><td>sadman289@gmail.com</td><td>10.000.000</td><td>IPhone</td><td><input type=checkbox class="outstanding" /></td></tr>
                            <tr><td><div class="cmdUser">
                                            <a href="viewp.aspx?id=1" target="_blank"><button class="Uview left">
                                            </button></a>
                                            <a href="editp.aspx?id=1" target="_blank"><button class="Uedit left">
                                            </button></a>
                                            <button class="Udelete left">
                                            </button>
                                            <div class="clear"></div>
                                            </div>21</td><td><a href="#link_Product" target="_Blank">IPhone 4</a></td><td>21/12/2011</td><td>sadman289@gmail.com</td><td>10.000.000</td><td>IPhone</td><td><input type=checkbox class="outstanding" /></td></tr>
                            <tr><td><div class="cmdUser">
                                            <a href="viewp.aspx?id=1" target="_blank"><button class="Uview left">
                                            </button></a>
                                            <a href="editp.aspx?id=1" target="_blank"><button class="Uedit left">
                                            </button></a>
                                            <button class="Udelete left">
                                            </button>
                                            <div class="clear"></div>
                                            </div>22</td><td><a href="#link_Product" target="_Blank">IPhone 4</a></td><td>21/12/2011</td><td>sadman289@gmail.com</td><td>10.000.000</td><td>IPhone</td><td><input type=checkbox class="outstanding" /></td></tr>
                            <tr><td><div class="cmdUser">
                                            <a href="viewp.aspx?id=1" target="_blank"><button class="Uview left">
                                            </button></a>
                                            <a href="editp.aspx?id=1" target="_blank"><button class="Uedit left">
                                            </button></a>
                                            <button class="Udelete left">
                                            </button>
                                            <div class="clear"></div>
                                            </div>23</td><td><a href="#link_Product" target="_Blank">IPhone 4</a></td><td>21/12/2011</td><td>sadman289@gmail.com</td><td>10.000.000</td><td>IPhone</td><td><input type=checkbox class="outstanding" /></td></tr>
                            <tr><td><div class="cmdUser">
                                           <a href="viewp.aspx?id=1" target="_blank"><button class="Uview left">
                                            </button></a>
                                            <a href="editp.aspx?id=1" target="_blank"><button class="Uedit left">
                                            </button></a>
                                            <button class="Udelete left">
                                            </button>
                                            <div class="clear"></div>
                                            </div>24</td><td><a href="#link_Product" target="_Blank">IPhone 4</a></td><td>21/12/2011</td><td>sadman289@gmail.com</td><td>10.000.000</td><td>IPhone</td><td><input type=checkbox class="outstanding" /></td></tr>
                            <tr><td><div class="cmdUser">
                                            <a href="viewp.aspx?id=1" target="_blank"><button class="Uview left">
                                            </button></a>
                                            <a href="editp.aspx?id=1" target="_blank"><button class="Uedit left">
                                            </button></a>
                                            <button class="Udelete left">
                                            </button>
                                            <div class="clear"></div>
                                            </div>25</td><td><a href="#link_Product" target="_Blank">IPhone 4</a></td><td>21/12/2011</td><td>sadman289@gmail.com</td><td>10.000.000</td><td>IPhone</td><td><input type=checkbox class="outstanding" /></td></tr>
                            <tr><td><div class="cmdUser">
                                            <a href="viewp.aspx?id=1" target="_blank"><button class="Uview left">
                                            </button></a>
                                            <a href="editp.aspx?id=1" target="_blank"><button class="Uedit left">
                                            </button></a>
                                            <button class="Udelete left">
                                            </button>
                                            <div class="clear"></div>
                                            </div>26</td><td><a href="#link_Product" target="_Blank">IPhone 4</a></td><td>21/12/2011</td><td>sadman289@gmail.com</td><td>10.000.000</td><td>IPhone</td><td><input type=checkbox class="outstanding" /></td></tr>
                            <tr><td><div class="cmdUser">
                                            <a href="viewp.aspx?id=1" target="_blank"><button class="Uview left">
                                            </button></a>
                                            <a href="editp.aspx?id=1" target="_blank"><button class="Uedit left">
                                            </button></a>
                                            <button class="Udelete left">
                                            </button>
                                            <div class="clear">
                                            </div></div>
                                            27</td><td><a href="#link_Product" target="_Blank">IPhone 4</a></td><td>21/12/2011</td><td>sadman289@gmail.com</td><td>10.000.000</td><td>IPhone</td><td><input type=checkbox class="outstanding" /></td></tr>
                        </tbody>
                    </table>
                <div class="Apages right">
                    <a href="#1" class="active" ref="1">1</a> <a href="#2" ref="2">2</a> <a href="#3"
                        ref="3">3</a> <a href="#4" ref="4">4</a> <a href="#5" ref="5">5</a> <a href="#0"
                            ref="0">All</a>
                </div>
                </div>
            <div class="clear">
                    </div>
</asp:Content>
