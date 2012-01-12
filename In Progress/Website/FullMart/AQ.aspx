﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AQ.aspx.cs" Inherits="FullMart.AQ" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>FullMarts</title>
    <link rel="stylesheet" type="text/css" href="themes/style/main.css" />
    <link href="themes/style/comment.css" rel="stylesheet" type="text/css" />
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
    <script src="themes/script/dropbox.js" type="text/javascript"></script>
    <script src="themes/script/main.js" type="text/javascript"></script>
    <script src="themes/script/AQ.js" type="text/javascript"></script>
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
                        <!-- End Login -->
                    </div>
                </div>
            </div>
            <div id="banner" class="clear">
                <a href="#home" title="Home">
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
                            <dt><a href="#" class="b"><span>Please select the country</span></a><div class="nr"></div></dt>
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
                            <div title=Search">
                                <input id="search" name=search type="text" value="Search me" /></div>
                        </div>
                        <div class="left">
                            <input id="sbsearch" type="submit" value="" /></div>
                    </div>
                    <div class="sys left">
                        <a href="#" title="SignUp your Store"><img src="themes/images/signup-your-shop.png" alt="SignUp your Store" /></a>
                    </div>
                    <div class="sys left">
                        <a href="#" title="Post your Adv"><img src="themes/images/postAD.png" alt="Post your Adv" /></a>
                    </div>
                </div>
            </div>
        </div>
        <div class="block clear">
                </div>
        
        <div id="mcontent" class="block">
        
            <div id="cleft" class="left">
                <div id="listcats" class="lb btlr">
                    <div class="title block btlr"><span>Categories</span></div>
                    <ul class="lplist">
                        <li><a class="ap" href="#">Computings & tablet</a>
                        <div class="lsubcat b">
                            <span class="block title btlr">Computings & tablet</span>
                            <ul>
                                <li><a href="#" >Điện thoại di động</a></li>
                                <li><a href="#" >Điện thoại Trung Quốc</a></li>
                                <li><a href="#" >PDA</a></li>
                                <li><a href="#" >PDA phone</a></li>
                                <li><a href="#" >Linh phụ kiện điện thoại</a></li>
                                <li><a href="#" >Sim, thẻ</a></li>
                                <li><a href="#" >Phần mềm mobile, PDA</a></li>
                                <li><a href="#" >Dịch vụ viễn thông</a></li>
                                <li><a href="#" >Điện thoại di động</a></li>
                                <li><a href="#" >Điện thoại Trung Quốc</a></li>
                                <li><a href="#" >PDA</a></li>
                                <li><a href="#" >PDA phone</a></li>
                                <li><a href="#" >Linh phụ kiện điện thoại</a></li>
                                <li><a href="#" >Sim, thẻ</a></li>
                                <li><a href="#" >Phần mềm mobile, PDA</a></li>
                                <li><a href="#" >Dịch vụ viễn thông</a></li>
                                <li><a href="#" >Điện thoại di động</a></li>
                                <li><a href="#" >Điện thoại Trung Quốc</a></li>
                                <li><a href="#" >PDA</a></li>
                                <li><a href="#" >PDA phone</a></li> 
                                <li><a href="#" >Phần mềm mobile, PDA</a></li>
                                <li><a href="#" >Dịch vụ viễn thông</a></li>
                                <li><a href="#" >Điện thoại di động</a></li>
                                <li><a href="#" >Điện thoại Trung Quốc</a></li>
                                <li><a href="#" >PDA</a></li>
                                <li><a href="#" >PDA phone</a></li>
                                <li><a href="#" >Linh phụ kiện điện thoại</a></li>
                                <li><a href="#" >Sim, thẻ</a></li>
                                <li><a href="#" >Phần mềm mobile, PDA</a></li>
                                <li><a href="#" >Dịch vụ viễn thông</a></li>
                                <li><a href="#" >Điện thoại di động</a></li>
                                <li><a href="#" >Điện thoại Trung Quốc</a></li>
                                <li><a href="#" >PDA</a></li>
                                <li><a href="#" >PDA phone</a></li>
                                <li><a href="#" >Linh phụ kiện điện thoại</a></li>
                                <li><a href="#" >Sim, thẻ</a></li>
                                <li><a href="#" >Phần mềm mobile, PDA</a></li>
                                <li><a href="#" >Dịch vụ viễn thông</a></li>
                            </ul>
                        </div>
                        </li>
                        <li><a class="ap" href="#">mobile phone</a>
                        <div class="lsubcat b">
                            <span class="block title btlr">mobile phone</span>
                            <ul>
                                <li><a href="#" >Điện thoại di động</a></li>
                                <li><a href="#" >Điện thoại Trung Quốc</a></li>
                                <li><a href="#" >PDA</a></li>
                                <li><a href="#" >PDA phone</a></li>
                                <li><a href="#" >Linh phụ kiện điện thoại</a></li>
                                <li><a href="#" >Sim, thẻ</a></li>
                                <li><a href="#" >Phần mềm mobile, PDA</a></li>
                                <li><a href="#" >Dịch vụ viễn thông</a></li>
                                <li><a href="#" >Điện thoại di động</a></li>
                                <li><a href="#" >Điện thoại Trung Quốc</a></li>
                                <li><a href="#" >PDA</a></li>
                                <li><a href="#" >PDA phone</a></li>
                                <li><a href="#" >Linh phụ kiện điện thoại</a></li>
                                <li><a href="#" >Sim, thẻ</a></li>
                                <li><a href="#" >Phần mềm mobile, PDA</a></li>
                                <li><a href="#" >Dịch vụ viễn thông</a></li>
                                <li><a href="#" >Điện thoại di động</a></li>
                                <li><a href="#" >Điện thoại Trung Quốc</a></li>
                                <li><a href="#" >PDA</a></li>
                                <li><a href="#" >PDA phone</a></li>
                                <li><a href="#" >Linh phụ kiện điện thoại</a></li>
                                <li><a href="#" >Sim, thẻ</a></li>
                                <li><a href="#" >Phần mềm mobile, PDA</a></li>
                                <li><a href="#" >Dịch vụ viễn thông</a></li>
                            </ul>
                        </div>
                        </li>
                        <li><a class="ap" href="#">Electronic</a>
                        <div class="lsubcat b">
                            <span class="block title btlr">Electronic</span>
                            <ul>
                                <li><a href="#" >Điện thoại di động</a></li>
                                <li><a href="#" >Điện thoại Trung Quốc</a></li>
                                <li><a href="#" >PDA</a></li>
                                <li><a href="#" >PDA phone</a></li>
                                <li><a href="#" >Linh phụ kiện điện thoại</a></li>
                                <li><a href="#" >Sim, thẻ</a></li>
                                <li><a href="#" >Phần mềm mobile, PDA</a></li>
                                <li><a href="#" >Dịch vụ viễn thông</a></li>
                                <li><a href="#" >Điện thoại di động</a></li>
                                <li><a href="#" >Điện thoại Trung Quốc</a></li>
                                <li><a href="#" >PDA</a></li>
                                <li><a href="#" >PDA phone</a></li>
                                <li><a href="#" >Linh phụ kiện điện thoại</a></li>
                                <li><a href="#" >Sim, thẻ</a></li>
                                <li><a href="#" >Phần mềm mobile, PDA</a></li>
                                <li><a href="#" >Dịch vụ viễn thông</a></li>
                            </ul>
                        </div>
                        </li>
                        <li><a class="ap" href="#">Fashion</a></li>
                        <li><a class="ap" href="#">Computings & tablet</a></li>
                        <li><a class="ap" href="#">mobile phone</a></li>
                        <li><a class="ap" href="#">Electronic</a></li>
                        <li><a class="ap" href="#">Fashion</a></li>
                    </ul>
                </div>
                <div class="ladv lb"><img src="themes/images/leftadv.jpg" /></div>
                <div id="AAQ" class="lb b">
                    <div class="title"><span>Answers & Questions</span></div>
                    <div class="listitem">
                    <ul>
                        <li>
                            <div class="Ahead"><span class="Ausername"><a href="#aa">sniperPro</a></span></div>
                            <div class="Aarrow">21/11/2011</div>
                            <div class="Acontent b"><a href="#a"><p>Something need to know about this website .....</p></a></div>                        
                        </li>
                        <li>
                            <div class="Ahead"><span class="Ausername"><a href="#aa">sniperPro</a></span></div>
                            <div class="Aarrow">21/11/2011</div>
                            <div class="Acontent b"><a href="#a"><p>Something need to know about this website .....</p></a></div>                        
                        </li>
                        <li>
                            <div class="Ahead"><span class="Ausername"><a href="#aa">sniperPro</a></span></div>
                            <div class="Aarrow">21/11/2011</div>
                            <div class="Acontent b"><a href="#a"><p>Something need to know about this website .....</p></a></div>                        
                        </li>
                        <li>
                            <div class="Ahead"><span class="Ausername"><a href="#aa">sniperPro</a></span></div>
                            <div class="Aarrow">21/11/2011</div>
                            <div class="Acontent b"><a href="#a"><p>Something need to know about this website Something need to know about this website Something need to know about this website .....</p></a></div>                        
                        </li>
                    </ul>
                    <div class="Apages right" >
                        <a href="#1" class="active" ref="1">1</a>
                        <a href="#2" ref="2">2</a>
                        <a href="#3" ref="3">3</a>
                        <a href="#4" ref="4">4</a>
                        <a href="#5" ref="5">5</a>
                        <a href="#0" ref="0">All</a>
                    </div>
                    <div class="clear"></div>
                    </div>
                </div>
            </div>
            <div id="cmain" class="left">
            <div class="listitem bgwt b block">
            <form id="fcomment" runat="server">
            <div id='support'>
                <div class="Ahead">
                    <span class="Ausername"><a href="#aa">UserName</a></span></div>
                <div id='AQtext' class="AQtext b block">
                    <asp:TextBox ID="txtmscontent" CssClass="txtmscontent" TextMode="MultiLine" runat="server"></asp:TextBox>
                    <div id='msinfo' class="bblr msinfo">
                    <button class="mspost right" type="submit" value="Gửi">Gửi</button>
                    <div class="right msveryp"><input class="msvery" type="text" value='Nhập mã xác nhận' /></div>
                    
                        <p class='very right'>ABjs</p>
                        
                        
                    </div>
                </div>
            </div>
            </form>
                    <ul class="mcomment">
                        <li>
                            <div class="Ahead"><span class="Ausername"><a href="#aa">sniperPro</a></span></div>
                            <div class="Aarrow">21/11/2011</div>
                            <div class="Acontent b"><a href="#a"><p>Something need to know about this website Something need to know about this website Something need to know about this website Something need to know about this website Something need to know about this website Something need to know about this website Something need to know about this website Something need to know about this website Something need to know about this website Something need to know about this website .....</p></a></div>                        
                            <span title="number of comment" class="numc">3</span>
                            <ul class="subcomment">
                                <li>
                                    <div class="Ahead">
                                        <span class="Ausername"><a href="#aa">sniperPro</a></span></div>
                                    <div class="Aarrow">
                                        21/11/2011</div>
                                    <div class="Acontent b">
                                        <a href="#a">
                                            <p>
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                .....</p>
                                        </a>
                                    </div>
                                </li><li>
                                    <div class="Ahead">
                                        <span class="Ausername"><a href="#aa">sniperPro</a></span></div>
                                    <div class="Aarrow">
                                        21/11/2011</div>
                                    <div class="Acontent b">
                                        <a href="#a">
                                            <p>
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                .....</p>
                                        </a>
                                    </div>
                                </li><li>
                                    <div class="Ahead">
                                        <span class="Ausername"><a href="#aa">sniperPro</a></span></div>
                                    <div class="Aarrow">
                                        21/11/2011</div>
                                    <div class="Acontent b">
                                        <a href="#a">
                                            <p>
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                .....</p>
                                        </a>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <div class="Ahead">
                                            <span class="Ausername"><a href="#aa">UserName</a></span></div>
                                        <div class="AQtext b block">
                                            <textarea id="TextArea1" class="txtmscontent" cols="20" rows="2"></textarea>
                                            <div id='Div3' class="msinfo bblr">
                                                <button class="mspost right" type="submit" value="Gửi">
                                                    Gửi</button>
                                                <div class="right msveryp">
                                                    <input class="msvery" type="text" value='Nhập mã xác nhận' /></div>
                                                <p class='very right'>
                                                    ABjs</p>
                                            </div>
                                        </div>
                                    </div>
                                    </form>
                                </li>
                            </ul>
                            <div class="clear"></div>
                        </li>
                        <li>
                            <div class="Ahead"><span class="Ausername"><a href="#aa">sniperPro</a></span></div>
                            <div class="Aarrow">21/11/2011</div>
                            <div class="Acontent b"><a href="#a"><p>Something need to know about this website .....</p></a></div>                        
                            <span title="number of comment" class="numc">3</span>
                            <ul class="subcomment">
                                <li>
                                    <div class="Ahead">
                                        <span class="Ausername"><a href="#aa">sniperPro</a></span></div>
                                    <div class="Aarrow">
                                        21/11/2011</div>
                                    <div class="Acontent b">
                                        <a href="#a">
                                            <p>
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                .....</p>
                                        </a>
                                    </div>
                                </li><li>
                                    <div class="Ahead">
                                        <span class="Ausername"><a href="#aa">sniperPro</a></span></div>
                                    <div class="Aarrow">
                                        21/11/2011</div>
                                    <div class="Acontent b">
                                        <a href="#a">
                                            <p>
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                .....</p>
                                        </a>
                                    </div>
                                </li><li>
                                    <div class="Ahead">
                                        <span class="Ausername"><a href="#aa">sniperPro</a></span></div>
                                    <div class="Aarrow">
                                        21/11/2011</div>
                                    <div class="Acontent b">
                                        <a href="#a">
                                            <p>
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                .....</p>
                                        </a>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <div class="Ahead">
                                            <span class="Ausername"><a href="#aa">UserName</a></span></div>
                                        <div class="AQtext b block">
                                            <textarea id="TextArea2" class="txtmscontent" cols="20" rows="2"></textarea>
                                            <div id='Div1' class="msinfo bblr">
                                                <button class="mspost right" type="submit" value="Gửi">
                                                    Gửi</button>
                                                <div class="right msveryp">
                                                    <input class="msvery" type="text" value='Nhập mã xác nhận' /></div>
                                                <p class='very right'>
                                                    ABjs</p>
                                            </div>
                                        </div>
                                    </div>
                                    </form>
                                </li>
                            </ul>
                            <div class="clear"></div>
                        </li>
                        <li>
                            <div class="Ahead"><span class="Ausername"><a href="#aa">sniperPro</a></span></div>
                            <div class="Aarrow">21/11/2011</div>
                            <div class="Acontent b"><a href="#a"><p>Something need to know about this website .....</p></a></div>                        
                            <span title="number of comment" class="numc">3</span>
                            <ul class="subcomment">
                                <li>
                                    <div class="Ahead">
                                        <span class="Ausername"><a href="#aa">sniperPro</a></span></div>
                                    <div class="Aarrow">
                                        21/11/2011</div>
                                    <div class="Acontent b">
                                        <a href="#a">
                                            <p>
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                .....</p>
                                        </a>
                                    </div>
                                </li><li>
                                    <div class="Ahead">
                                        <span class="Ausername"><a href="#aa">sniperPro</a></span></div>
                                    <div class="Aarrow">
                                        21/11/2011</div>
                                    <div class="Acontent b">
                                        <a href="#a">
                                            <p>
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                .....</p>
                                        </a>
                                    </div>
                                </li><li>
                                    <div class="Ahead">
                                        <span class="Ausername"><a href="#aa">sniperPro</a></span></div>
                                    <div class="Aarrow">
                                        21/11/2011</div>
                                    <div class="Acontent b">
                                        <a href="#a">
                                            <p>
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                .....</p>
                                        </a>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <div class="Ahead">
                                            <span class="Ausername"><a href="#aa">UserName</a></span></div>
                                        <div class="AQtext b block">
                                            <textarea id="TextArea3" class="txtmscontent" cols="20" rows="2"></textarea>
                                            <div id='Div2' class="msinfo bblr">
                                                <button class="mspost right" type="submit" value="Gửi">
                                                    Gửi</button>
                                                <div class="right msveryp">
                                                    <input class="msvery" type="text" value='Nhập mã xác nhận' /></div>
                                                <p class='very right'>
                                                    ABjs</p>
                                            </div>
                                        </div>
                                    </div>
                                    </form>
                                </li>
                            </ul>
                            <div class="clear"></div>
                        </li>
                        <li>
                            <div class="Ahead"><span class="Ausername"><a href="#aa">sniperPro</a></span></div>
                            <div class="Aarrow">21/11/2011</div>
                            <div class="Acontent b"><a href="#a"><p>Something need to know about this website Something need to know about this website Something need to know about this website .....</p></a></div>                        
                            <span title="number of comment" class="numc">3</span>
                            <ul class="subcomment">
                                <li>
                                    <div class="Ahead">
                                        <span class="Ausername"><a href="#aa">sniperPro</a></span></div>
                                    <div class="Aarrow">
                                        21/11/2011</div>
                                    <div class="Acontent b">
                                        <a href="#a">
                                            <p>
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                .....</p>
                                        </a>
                                    </div>
                                </li><li>
                                    <div class="Ahead">
                                        <span class="Ausername"><a href="#aa">sniperPro</a></span></div>
                                    <div class="Aarrow">
                                        21/11/2011</div>
                                    <div class="Acontent b">
                                        <a href="#a">
                                            <p>
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                .....</p>
                                        </a>
                                    </div>
                                </li><li>
                                    <div class="Ahead">
                                        <span class="Ausername"><a href="#aa">sniperPro</a></span></div>
                                    <div class="Aarrow">
                                        21/11/2011</div>
                                    <div class="Acontent b">
                                        <a href="#a">
                                            <p>
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                Something need to know about this website Something need to know about this website
                                                .....</p>
                                        </a>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <div class="Ahead">
                                            <span class="Ausername"><a href="#aa">UserName</a></span></div>
                                        <div class="AQtext b block">
                                            <textarea id="TextArea4" class="txtmscontent" cols="20" rows="2"></textarea>
                                            <div id='Div4' class="msinfo bblr">
                                                <button class="mspost right" type="submit" value="Gửi">
                                                    Gửi</button>
                                                <div class="right msveryp">
                                                    <input class="msvery" type="text" value='Nhập mã xác nhận' /></div>
                                                <p class='very right'>
                                                    ABjs</p>
                                            </div>
                                        </div>
                                    </div>
                                    </form>
                                </li>
                            </ul>
                            <div class="clear"></div>
                        </li>
                    </ul>
                    <div class="Apages right" >
                        <a href="#1" class="active" ref="1">1</a>
                        <a href="#2" ref="2">2</a>
                        <a href="#3" ref="3">3</a>
                        <a href="#4" ref="4">4</a>
                        <a href="#5" ref="5">5</a>
                        <a href="#0" ref="0">All</a>
                    </div>
                    <div class="clear"></div>
                    </div>
                <div id="searchwl">
                    <div class="searchwl">
                        Search your friend's wishes list by Username
                        <input class="b" type="text" />
                        or Name
                        <input class="b" type="text" />
                        <input type="button" /></div>
                    <p class="block">
                        linkedin member directory - Browse members <a href="#">by country</a> <a href="#">a</a>
                        <a href="#">b</a> <a href="#">c</a> <a href="#">d</a> <a href="#">e</a> <a href="#">
                            f</a> <a href="#">h</a> <a href="#">h</a> <a href="#">i</a> <a href="#">j</a>
                        <a href="#">k</a> <a href="#">l</a> <a href="#">m</a> <a href="#">n</a> <a href="#">
                            o</a> <a href="#">p</a> <a href="#">q</a> <a href="#">r</a> <a href="#">s</a>
                        <a href="#">t</a> <a href="#">u</a> <a href="#">v</a> <a href="#">w</a> <a href="#">
                            x</a> <a href="#">y</a> <a href="#">z</a>
                    </p>
                    <div>
                    </div>
                </div>
            </div>
            <div id="cright" class="left">
                <div id="hotnew" class="lb b">
                    <div class="title">Hot News</div>
                    <div class="listitem">
                        <ul>
                            <li>
                                <div class="item">
                                    <div class="left">
                                        <a href="#" title="tieu de bai viet">
                                            <img class="thumb" alt="tieu de bai viet" src="media/upload/product1.jpg" /></a></div>
                                            <p><a href="tieu de bai viet" title="tieu de bai viet">Tieu de rut gon</a>
                                                <span>Nội dung rút gọn của bài viết, Nội dung rút gọn của bài viết, Nội dung rút gọn của bài viết, Nội dung rút gọn của bài viết, giới hạn tối đa 150 ký tự</span>
                                            </p>
                                </div><div class="clear"></div>
                            </li><li>
                                <div class="item">
                                    <div class="left">
                                        <a href="#" title="tieu de bai viet">
                                            <img class="thumb" alt="tieu de bai viet" src="media/upload/product1.jpg" /></a></div>
                                            <p><a href="tieu de bai viet" title="tieu de bai viet">Tieu de rut gon</a>
                                                <span>Nội dung rút gọn của bài viết, Nội dung rút gọn của bài viết, Nội dung rút gọn của bài viết, Nội dung rút gọn của bài viết, giới hạn tối đa 150 ký tự</span>
                                            </p>
                                </div><div class="clear"></div>
                            </li><li>
                                <div class="item">
                                    <div class="left">
                                        <a href="#" title="tieu de bai viet">
                                            <img class="thumb" alt="tieu de bai viet" src="media/upload/product1.jpg" /></a></div>
                                            <p class="block"><a href="tieu de bai viet" title="tieu de bai viet">Tieu de rut gon cua bai viet asd da  dd faf af</a>
                                                <span>Nội dung rút gọn của bài viết, Nội dung rút gọn của bài viết, Nội dung rút gọn của bài viết, Nội dung rút gọn của bài viết, giới hạn tối đa 150 ký tự</span>
                                            </p>
                                </div><div class="clear"></div>
                            </li>
                        </ul>
                        <div class="Apages right" >
                        <a href="#1" class="active" ref="1">1</a>
                        <a href="#2" ref="2">2</a>
                        <a href="#3" ref="3">3</a>
                        <a href="#4" ref="4">4</a>
                        <a href="#5" ref="5">5</a>
                        <a href="#0" ref="0">All</a>
                    </div>
                    <div class="clear"></div>
                    </div>
                </div>
                <div class="ladv lb"><img src="themes/images/rightadv.jpg" /></div>
                <div id="newadv" class="lb b">
                    <div class="title">New ADV</div>
                    <div class="advc">
                        <div id="NAtab1" class="tabsi active"><ul>
                                <li><a href="#">noi dung quang cao, noi dung quang cao, noi dung quang cao, noi dung
                                    quang cao, noi dung quang cao, noi dung quang cao,</a></li>
                                <li><a href="#">noi dung quang cao, noi dung quang cao, noi dung quang cao, noi dung
                                    quang cao, noi dung quang cao, noi dung quang cao,</a></li>
                                <li><a href="#">noi dung quang cao, noi dung quang cao, noi dung quang cao, noi dung
                                    quang cao, noi dung quang cao, noi dung quang cao,</a></li>
                                <li><a href="#">noi dung quang cao, noi dung quang cao, noi dung quang cao, noi dung
                                    quang cao, noi dung quang cao, noi dung quang cao,</a></li>
                            </ul><a class="All" href="#All">>>See All</a></div>
                        <div id="NAtab2" class="tabsi"><ul>
                                <li><a href="#">noi dung quang cao, noi dung quang cao, noi dung quang cao, noi dung
                                    quang cao, noi dung quang cao, noi dung quang cao,2</a></li>
                                <li><a href="#">noi dung quang cao, noi dung quang cao, noi dung quang cao, noi dung
                                    quang cao, noi dung quang cao, noi dung quang cao,2</a></li>
                                <li><a href="#">noi dung quang cao, noi dung quang cao, noi dung quang cao, noi dung
                                    quang cao, noi dung quang cao, noi dung quang cao,2</a></li>
                                <li><a href="#">noi dung quang cao, noi dung quang cao, noi dung quang cao, noi dung
                                    quang cao, noi dung quang cao, noi dung quang cao,2</a></li>
                            </ul><a class="All" href="#All">>>See All</a></div>
                        <div id="NAtab3" class="tabsi"><ul>
                                <li><a href="#">noi dung quang cao, noi dung quang cao, noi dung quang cao, noi dung
                                    quang cao, noi dung quang cao, noi dung quang cao,3</a></li>
                                <li><a href="#">noi dung quang cao, noi dung quang cao, noi dung quang cao, noi dung
                                    quang cao, noi dung quang cao, noi dung quang cao,3</a></li>
                                <li><a href="#">noi dung quang cao, noi dung quang cao, noi dung quang cao, noi dung
                                    quang cao, noi dung quang cao, noi dung quang cao,3</a></li>
                                <li><a href="#">noi dung quang cao, noi dung quang cao, noi dung quang cao, noi dung
                                    quang cao, noi dung quang cao, noi dung quang cao,3</a></li>
                            </ul><a class="All" href="#All">>>See All</a></div>
                    </div>
                    <ul id="tabs">
                        <li class="active"><a href="#NAtab1">SELL</a></li>
                        <li><a href="#NAtab2">BUY</a></li>
                        <li><a href="#NAtab3">SHARE</a></li>
                    </ul>
                    <div class="clear"></div>
                </div>
            </div>
            <div class="clear">
            </div>
        </div>
        <div id="footer" class="block">
            a3</div>
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            
        });
    </script>
</body>
</html>