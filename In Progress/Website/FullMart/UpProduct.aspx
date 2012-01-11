﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpProduct.aspx.cs" Inherits="FullMart.UpProduct" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>FullMarts Register</title>
    <link rel="stylesheet" type="text/css" href="themes/style/main.css" />
    <link rel="stylesheet" type="text/css" href="themes/style/dialog.css" />
    <link href="themes/style/tablesorter.css" rel="stylesheet" type="text/css" />
    <link href="themes/style/jqtransform.css" rel="stylesheet" type="text/css" />
    <link href="themes/style/validationEngine.jquery.css" rel="stylesheet" type="text/css" />
    <link href="themes/style/jquery-ui-1.8.16.custom.css" rel="stylesheet" type="text/css" />
    <link href="themes/style/UpProduct.css" rel="stylesheet" type="text/css" />
    <!--[if IE]>
        <link href="themes/style/fixie1.css" rel="stylesheet" type="text/css" />
    <![EndIf]-->
    <!--[if lt IE 9]>
        <link href="themes/style/fixie8.css" rel="stylesheet" type="text/css" />
    <![EndIf]-->
    <!--[if lt IE 8]>
        <link href="themes/style/fixie7.css" rel="stylesheet" type="text/css" />
    <![EndIf]-->
    <script src="themes/script/jquery-1.7.js" type="text/javascript"></script>
    <script src="themes/script/jquery-ui-1.8.16.custom.min.js" type="text/javascript"></script>
    <script src="themes/script/dropbox.js" type="text/javascript"></script>
    <script src="themes/script/jquery.simplemodal.js" type="text/javascript"></script>
    <script src="themes/script/jquery.jqtransform.js" type="text/javascript"></script>
    <script src="themes/script/jquery.validationEngine-en.js" type="text/javascript"></script>
    <script src="themes/script/jquery.validationEngine.js" type="text/javascript"></script>
    <script src="themes/script/main.js" type="text/javascript"></script>
    <script src="themes/script/UpProduct.js" type="text/javascript"></script>
    <script type="text/javascript">
        
    </script>
</head>
<body>
    <div id="main" class="center">
        <div id="header" class="block">
            <div id="topbar" class="bblr block">
                <div class="tbl">
                </div>
                <div class="tbr">
                </div>
                <div class="tbc">
                    <div class="right clear">
                        <em class="left">Developing version ! vunam289@gmail.com</em>
                        <!-- Begin User Account -->
                        <a href="#Account" title="User's Account control">
                            <div id="uus" class="us left">
                                UserName</div>
                        </a><a href="#notify" title="User's Notify">
                            <div id="unote" class="us left">
                                <strong>2</strong></div>
                        </a><a href="#Cart" title="User's Cart">
                            <div id="ucart" class="us left">
                                <strong>(3) verifiing</strong></div>
                        </a>
                        <div class="left">
                            <input id="lo" type="submit" value="" /></div>
                        <!-- End User Account -->
                        <!-- Begin Login -->
                        <div class="us bgwt left">
                            <div class="un" title="Username">
                                <input id="us" type="text" /></div>
                        </div>
                        <div class="us bgwt left">
                            <div class="pw" title="Password">
                                <input id="pw" type="password" /></div>
                        </div>
                        <div class="left">
                            <input id="sb" type="submit" value="" /></div>
                        <div class="left">
                            <input id="treg" type="submit" value="" /></div>
                        <!-- End Login -->
                    </div>
                </div>
            </div>
            <div id="banner" class="clear">
                <a href="Default.aspx" title="Home">
                    <div id="logo">
                    </div>
                </a>
                <div id="gp">
                    <img class="right" src="themes/images/goc-phai.png" alt="Buy Sale Share Your Stuffs and Knowlege With Thousands Students in UK" /></div>
            </div>
            <div class="clear">
            </div>
            <div id="menu">
                <ul id="topm">
                    <li class="active"><a href="#" title="aa">Student hot deal</a></li>
                    <li><a href="#" title="aa">Accommodation</a></li>
                    <li><a href="#" title="aa">Travel & Plant</a></li>
                    <li><a href="#" title="aa">Hot Voucher</a></li>
                    <li><a href="#" title="aa">Entertaiment</a></li>
                    <li><a href="#" title="aa">Tutorials</a></li>
                    <li><a href="#" title="aa">Class note</a></li>
                    <li><a href="#" title="aa">Jobs</a></li>
                </ul>
                <div class="block clear">
                </div>
                <div id="topsearch" class="block">
                    <div class="left">
                        <dl id="slcity" class="dropdown bgwt b">
                            <dt><a href="#" class="b"><span>Please select the country</span></a><div class="nr">
                            </div>
                            </dt>
                            <dd>
                                <ul>
                                    <li><a href="#">Brazil</a></li>
                                    <li><a href="#">France</a></li>
                                    <li><a href="#">Germany</a></li>
                                    <li><a href="#">India</a></li>
                                    <li><a href="#">Japan</a></li>
                                    <li><a href="#">Serbia</a></li>
                                    <li><a href="#">United Kingdom</a></li>
                                    <li><a href="#">United States</a></li>
                                    <li><a href="#">Viet Nam</a></li>
                                </ul>
                            </dd>
                        </dl>
                    </div>
                    <div class="left">
                        <dl id="slcats" class="dropdown bgwt b">
                            <dt><a href="#" class="b"><span>Please select the category</span></a></dt>
                            <dd>
                                <ul>
                                    <li><a href="#">Brazil</a></li>
                                    <li><a href="#">France</a></li>
                                    <li><a href="#">Germany</a></li>
                                    <li><a href="#">India</a></li>
                                    <li><a href="#">Japan</a></li>
                                    <li><a href="#">Serbia</a></li>
                                    <li><a href="#">United Kingdom</a></li>
                                    <li><a href="#">United States</a></li>
                                </ul>
                            </dd>
                        </dl>
                    </div>
                    <div class="left tops bgwt b">
                        <div class=" left">
                            <div title="Search">
                                <input id="search" name="search" type="text" value="Search me" /></div>
                        </div>
                        <div class="left">
                            <input id="sbsearch" type="submit" value="" /></div>
                    </div>
                    <div class="sys left">
                        <a href="RegisterN.aspx?type=shop" title="SignUp your Store">
                            <img src="themes/images/signup-your-shop.png" alt="SignUp your Store" /></a>
                    </div>
                    <div class="sys left">
                        <a href="RegisterN.aspx" title="Post your Adv">
                            <img src="themes/images/postAD.png" alt="Post your Adv" /></a>
                    </div>
                </div>
            </div>
        </div>
        <div class="block clear">
        </div>
        <div id="mcontent" class="block">
            <div id="cmain" class="center block">
                <form id="UpProduct" runat="server">
                <table>
                    <tr>
                        <td><asp:Label ID="lbTitle" runat="server" Text="Tiêu đề :"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="tbtitle" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Category :</td>
                        <td>
                            <asp:DropDownList ID="dlCategories" runat="server" CssClass="left"><asp:ListItem>Other</asp:ListItem>
                            </asp:DropDownList> 
                            <asp:DropDownList ID="dlSubCategories" runat="server" CssClass="left">
                                <asp:ListItem>Input New SubCategory</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                     <tr>
                        <td><asp:Label ID="lbPrice" runat="server" Text="Hình sản phẩm :"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="tbPrice" runat="server"></asp:TextBox> <asp:Label ID="Label3" runat="server"
                                Text="VNĐ"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td><asp:Label ID="lPicture" runat="server" Text="Giá :"></asp:Label>
                            <span class="note">size: 150x150px</span>
                        </td>
                        <td>
                            <asp:FileUpload ID="ulPicture" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td><asp:Label ID="lbContent" runat="server" Text="Nội dung :"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="tbContent" runat="server" TextMode="MultiLine" Width="500px" Height="300px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr><td>
                        </td><td><asp:Button ID="CreateProduct" runat="server" Text="Button" /></td></tr>
                </table>
                </form>
            </div>
            <div class="clear">
            </div>
        </div>
        <div id="footer" class="block">
            <div id="viewnote">
                <table id="listnote" class="tablesorter">
                    <thead>
                        <tr>
                            <th>
                            </th>
                            <th>
                                Username
                            </th>
                            <th>
                                Date
                            </th>
                            <th>
                                Content
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                <input class="delms" value="del" type="button" title="Delete this message" />
                            </td>
                            <td>
                                Smith10
                            </td>
                            <td>
                                20/12/2011
                            </td>
                            <td>
                                i want to buy 3 T-shirt from your shop, please contact me. smith@gmail.com
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input class="delms" value="del" type="button" title="Delete this message" />
                            </td>
                            <td>
                                Smith9
                            </td>
                            <td>
                                20/12/2011
                            </td>
                            <td>
                                i want to buy 3 T-shirt from your shop, please contact me. smith@gmail.com
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input class="delms" value="del" type="button" title="Delete this message" />
                            </td>
                            <td>
                                Smith2
                            </td>
                            <td>
                                20/12/2011
                            </td>
                            <td>
                                i want to buy 3 T-shirt from your shop, please contact me. smith@gmail.com
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input class="delms" value="del" type="button" title="Delete this message" />
                            </td>
                            <td>
                                Smith5
                            </td>
                            <td>
                                20/12/2011
                            </td>
                            <td>
                                i want to buy 3 T-shirt from your shop, please contact me. smith@gmail.com
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input class="delms" value="del" type="button" title="Delete this message" />
                            </td>
                            <td>
                                Smith8
                            </td>
                            <td>
                                20/12/2011
                            </td>
                            <td>
                                i want to buy 3 T-shirt from your shop, please contact me. smith@gmail.com
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input class="delms" value="del" type="button" title="Delete this message" />
                            </td>
                            <td>
                                Smith3
                            </td>
                            <td>
                                20/12/2011
                            </td>
                            <td>
                                i want to buy 3 T-shirt from your shop, please contact me. smith@gmail.com
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input class="delms" value="del" type="button" title="Delete this message" />
                            </td>
                            <td>
                                Smith1
                            </td>
                            <td>
                                20/12/2011
                            </td>
                            <td>
                                i want to buy 3 T-shirt from your shop, please contact me. smith@gmail.com
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input class="delms" value="del" type="button" title="Delete this message" />
                            </td>
                            <td>
                                Smith7
                            </td>
                            <td>
                                20/12/2011
                            </td>
                            <td>
                                i want to buy 3 T-shirt from your shop, please contact me. smith@gmail.com
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input class="delms" value="del" type="button" title="Delete this message" />
                            </td>
                            <td>
                                Smith6
                            </td>
                            <td>
                                20/12/2011
                            </td>
                            <td>
                                i want to buy 3 T-shirt from your shop, please contact me. smith@gmail.com
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input class="delms" value="del" type="button" title="Delete this message" />
                            </td>
                            <td>
                                Smith4
                            </td>
                            <td>
                                20/12/2011
                            </td>
                            <td>
                                i want to buy 3 T-shirt from your shop, please contact me. smith@gmail.com
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input class="delms" value="del" type="button" title="Delete this message" />
                            </td>
                            <td>
                                Smith11
                            </td>
                            <td>
                                20/12/2011
                            </td>
                            <td>
                                i want to buy 3 T-shirt from your shop, please contact me. smith@gmail.com
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input class="delms" value="del" type="button" title="Delete this message" />
                            </td>
                            <td>
                                Smith12
                            </td>
                            <td>
                                20/12/2011
                            </td>
                            <td>
                                i want to buy 3 T-shirt from your shop, please contact me. smith@gmail.com
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input class="delms" value="del" type="button" title="Delete this message" />
                            </td>
                            <td>
                                Smith9
                            </td>
                            <td>
                                20/12/2011
                            </td>
                            <td>
                                i want to buy 3 T-shirt from your shop, please contact me. smith@gmail.com
                            </td>
                        </tr>
                    </tbody>
                    <tfoot>
                        <!--<div id="pager" class="pager">
                    <form>
                    <img src="themes/images/first.png" class="first">
                    <img src="themes/images/pre.png" class="prev">
                    <input disabled="disabled" type="text" class="pagedisplay">
                    <img src="themes/images/next.png" class="next">
                    <img src="themes/images/last.png" class="last">
                    </form>
                </div>-->
                    </tfoot>
                </table>
            </div>
            a3</div>
    </div>
    <script type="text/javascript">

        $(document).ready(function () {

            //chua xong
            $("#unote").click(function () {
                showdialog($("#viewnote").html(), 700, 350, "#viewnote", true);
                $(".delms").click(function () {
                    $(this).parents("tr").hide();
                    return false;
                });
                $("#listnote").tablesorter({
                    headers: {
                        0: { sorter: false }, 3: { sorter: false }
                    },
                    widthFixed: true,
                    widgets: ['zebra']
                });
                return false;
            });
        });
    </script>
</body>
</html>