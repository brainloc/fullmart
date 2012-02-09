﻿<%@ Page Title="" Language="C#" MasterPageFile="~/OneColumn.Master" AutoEventWireup="true"
    CodeBehind="Register.aspx.cs" Inherits="FullMart.Register1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/themes/style/register.css" rel="stylesheet" type="text/css" />
    <script src="/themes/script/jquery.calculation.min.js" type="text/javascript"></script>
    <script src="/themes/script/dropbox.js" type="text/javascript"></script>      
    <script src="/themes/script/register.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="formPanel" runat="server">
    <div class="block clear">
    </div>
    <div id="policyuser" class="pl">
        <div class="ptitle">
            User's Policy
        </div>
        <div class="description">
            <div align="justify" style="font-family: Arial, Tahoma; color: rgb(77, 77, 77); font-size: 12px;
                font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal;
                line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal;
                widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;
                background-color: rgb(255, 255, 255);">
                <strong style="font-family: Arial, Tahoma;"><u style="font-family: Arial, Tahoma;"><font
                    face="Tahoma" size="2" style="font-family: Arial, Tahoma;">Đi</font></u></strong><font
                        face="Tahoma" style="font-family: Arial, Tahoma;"><font size="2" style="font-family: Arial, Tahoma;"><strong
                            style="font-family: Arial, Tahoma;"><u style="font-family: Arial, Tahoma;">ều 1</u></strong><span
                                class="Apple-converted-space">&nbsp;</span>: Đăng ký thành viên<br style="font-family: Arial, Tahoma;" />
                            <br style="font-family: Arial, Tahoma;" />
                        </font></font>
            </div>
            <div align="justify" style="font-family: Arial, Tahoma; color: rgb(77, 77, 77); font-size: 12px;
                font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal;
                line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal;
                widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;
                background-color: rgb(255, 255, 255);">
                <font face="Tahoma" size="2" style="font-family: Arial, Tahoma;">Thành viên đăng ký
                    tài khoản trong<span class="Apple-converted-space">&nbsp;</span></font><a href="http://www.vatgia.com/"
                        style="font-family: Arial, Tahoma; text-decoration: none; color: rgb(96, 93, 87);"><font
                            color="#800080" face="Tahoma" size="2" style="font-family: Arial, Tahoma;">www.vatgia.com</font></a><font
                                face="Tahoma" size="2" style="font-family: Arial, Tahoma;"><span class="Apple-converted-space">&nbsp;</span>là
                                người đã đăng ký tài khoản sử dụng theo các bước quy định của công ty Cổ phần vật
                                giá Việt Nam (Dưới đây viết tắt là công ty), và được công ty chấp nhận sự đăng ký
                                đó.</font></div>
            <div align="justify" style="font-family: Arial, Tahoma; color: rgb(77, 77, 77); font-size: 12px;
                font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal;
                line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal;
                widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;
                background-color: rgb(255, 255, 255);">
                <font face="Tahoma" size="2" style="font-family: Arial, Tahoma;">&nbsp;</font></div>
            <div align="justify" style="font-family: Arial, Tahoma; color: rgb(77, 77, 77); font-size: 12px;
                font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal;
                line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal;
                widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;
                background-color: rgb(255, 255, 255);">
                <font face="Tahoma" style="font-family: Arial, Tahoma;"><font size="2" style="font-family: Arial, Tahoma;">
                    <strong style="font-family: Arial, Tahoma;"><u style="font-family: Arial, Tahoma;">Điều
                        2</u></strong><span class="Apple-converted-space">&nbsp;</span>: Bản quy định<br
                            style="font-family: Arial, Tahoma;" />
                    <br style="font-family: Arial, Tahoma;" />
                </font></font>
            </div>
            <div align="justify" style="font-family: Arial, Tahoma; color: rgb(77, 77, 77); font-size: 12px;
                font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal;
                line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal;
                widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;
                background-color: rgb(255, 255, 255);">
                <font face="Tahoma" size="2" style="font-family: Arial, Tahoma;">Tất cả các thành viên
                    khi đăng ký, và sau khi đi đăng ký đều phải tuân thủ những quy định này</font></div>
            <div align="justify" style="font-family: Arial, Tahoma; color: rgb(77, 77, 77); font-size: 12px;
                font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal;
                line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal;
                widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;
                background-color: rgb(255, 255, 255);">
                <font face="Tahoma" size="2" style="font-family: Arial, Tahoma;">&nbsp;</font></div>
            <div align="justify" style="font-family: Arial, Tahoma; color: rgb(77, 77, 77); font-size: 12px;
                font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal;
                line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal;
                widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;
                background-color: rgb(255, 255, 255);">
                <font face="Tahoma" style="font-family: Arial, Tahoma;"><font size="2" style="font-family: Arial, Tahoma;">
                    <strong style="font-family: Arial, Tahoma;"><u style="font-family: Arial, Tahoma;">Điều
                        3</u></strong><span class="Apple-converted-space">&nbsp;</span>: Thay đổi quy
                    định<br style="font-family: Arial, Tahoma;" />
                </font></font>
            </div>
            <div align="justify" style="font-family: Arial, Tahoma; color: rgb(77, 77, 77); font-size: 12px;
                font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal;
                line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal;
                widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;
                background-color: rgb(255, 255, 255);">
                <font face="Tahoma" size="2" style="font-family: Arial, Tahoma;">Công ty chúng tôi có
                    thể thay đổi quy định theo các chính sách của công ty. Khi có thay đổi, chúng tôi
                    sẽ đăng tải lên<span class="Apple-converted-space">&nbsp;</span></font><a href="http://www.vatgia.com/"
                        style="font-family: Arial, Tahoma; text-decoration: none; color: rgb(96, 93, 87);"><font
                            color="#800080" face="Tahoma" size="2" style="font-family: Arial, Tahoma;">www.vatgia.com</font></a><font
                                face="Tahoma" size="2" style="font-family: Arial, Tahoma;">, và sau khi đăng lên
                                coi như quy định đó có hiệu lực. Sau khi quy định thay đổi, nếu thành viên sử dụng<span
                                    class="Apple-converted-space">&nbsp;</span></font><a href="http://www.vatgia.com/"
                                        style="font-family: Arial, Tahoma; text-decoration: none; color: rgb(96, 93, 87);"><font
                                            color="#800080" face="Tahoma" size="2" style="font-family: Arial, Tahoma;">www.vatgia.com</font></a><font
                                                face="Tahoma" size="2" style="font-family: Arial, Tahoma;"><span class="Apple-converted-space">&nbsp;</span>thì
                                                chúng tôi coi thành viên đã chấp nhận tất cả các quy định mới.</font></div>
            <div align="justify" style="font-family: Arial, Tahoma; color: rgb(77, 77, 77); font-size: 12px;
                font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal;
                line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal;
                widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;
                background-color: rgb(255, 255, 255);">
                <font face="Tahoma" size="2" style="font-family: Arial, Tahoma;">&nbsp;</font></div>
            <div align="justify" style="font-family: Arial, Tahoma; color: rgb(77, 77, 77); font-size: 12px;
                font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal;
                line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal;
                widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;
                background-color: rgb(255, 255, 255);">
                <font face="Tahoma" style="font-family: Arial, Tahoma;"><font size="2" style="font-family: Arial, Tahoma;">
                    <strong style="font-family: Arial, Tahoma;"><u style="font-family: Arial, Tahoma;">Điều
                        4</u></strong><span class="Apple-converted-space">&nbsp;</span>: Tư cách thành
                    viên, và các bước đăng ký tài khoản sử dụng</font></font></div>
            <ol style="font-family: Arial, Tahoma; color: rgb(77, 77, 77); font-size: 12px; font-style: normal;
                font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal;
                orphans: 2; text-align: -webkit-auto; text-indent: 0px; text-transform: none;
                white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto;
                -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">
                <li style="font-family: Arial, Tahoma;">
                    <div align="justify" style="font-family: Arial, Tahoma;">
                        <font face="Tahoma" style="font-family: Arial, Tahoma;"><font size="2" style="font-family: Arial, Tahoma;">
                            <strong style="font-family: Arial, Tahoma;">Tư cách thành viên</strong><span class="Apple-converted-space">&nbsp;</span>:Thành
                            viên sau khi đồng ý quy định này và kết thúc đăng ký tài khoản sử dụng trên<span
                                class="Apple-converted-space">&nbsp;</span></font></font><a href="http://www.vatgia.com/"
                                    style="font-family: Arial, Tahoma; text-decoration: none; color: rgb(96, 93, 87);"><font
                                        color="#800080" face="Tahoma" size="2" style="font-family: Arial, Tahoma;">www.vatgia.com</font></a><font
                                            face="Tahoma" size="2" style="font-family: Arial, Tahoma;"><span class="Apple-converted-space">&nbsp;</span>được
                                            coi là thành viên của<span class="Apple-converted-space">&nbsp;</span></font><a href="http://www.vatgia.com/"
                                                style="font-family: Arial, Tahoma; text-decoration: none; color: rgb(96, 93, 87);"><font
                                                    color="#800080" face="Tahoma" size="2" style="font-family: Arial, Tahoma;">www.vatgia.com</font></a><font
                                                        face="Tahoma" size="2" style="font-family: Arial, Tahoma;">. Thành viên chỉ đăng
                                                        ký tài khoản sử dụng cho bản thân, không được đăng ký hộ cho người khác. Chúng tôi
                                                        có thể từ chối việc đăng ký làm thành viên của những thành viên đã từng bị hủy bỏ
                                                        tư cách thành viên trên<span class="Apple-converted-space">&nbsp;</span></font><a
                                                            href="http://www.vatgia.com/" style="font-family: Arial, Tahoma; text-decoration: none;
                                                            color: rgb(96, 93, 87);"><font color="#800080" face="Tahoma" size="2" style="font-family: Arial, Tahoma;">www.vatgia.com</font></a><font
                                                                face="Tahoma" size="2" style="font-family: Arial, Tahoma;">.</font></div>
                </li>
                <li style="font-family: Arial, Tahoma;">
                    <div align="justify" style="font-family: Arial, Tahoma;">
                        <font face="Tahoma" style="font-family: Arial, Tahoma;"><font size="2" style="font-family: Arial, Tahoma;">
                            <strong style="font-family: Arial, Tahoma;">Bước đăng ký tài khoản</strong><span
                                class="Apple-converted-space">&nbsp;</span>:Thành viên phải đọc rõ các lưu ý,
                            và điền chính xác nội dung thông tin cần thiết vào bản đăng ký mẫu.</font></font></div>
                </li>
            </ol>
            <div align="justify" style="font-family: Arial, Tahoma; color: rgb(77, 77, 77); font-size: 12px;
                font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal;
                line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal;
                widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;
                background-color: rgb(255, 255, 255);">
                <font face="Tahoma" size="2" style="font-family: Arial, Tahoma;">&nbsp;</font></div>
            <div align="justify" style="font-family: Arial, Tahoma; color: rgb(77, 77, 77); font-size: 12px;
                font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal;
                line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal;
                widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;
                background-color: rgb(255, 255, 255);">
                <font face="Tahoma" style="font-family: Arial, Tahoma;"><font size="2" style="font-family: Arial, Tahoma;">
                    <strong style="font-family: Arial, Tahoma;"><u style="font-family: Arial, Tahoma;">Điều
                        5</u></strong><span class="Apple-converted-space">&nbsp;</span>: Thay đổi thông
                    tin đăng ký<br style="font-family: Arial, Tahoma;" />
                    <br style="font-family: Arial, Tahoma;" />
                    Sau khi đăng ký các thành viên có thể thay đổi thông tin đã đăng ký theo các bước
                    đã quy định. Chúng tôi không chịu bất kỳ trách nhiệm gì về những phát sinh liên
                    quan đến việc thay đổi thông tin của các thành viên.</font></font></div>
            <div align="justify" style="font-family: Arial, Tahoma; color: rgb(77, 77, 77); font-size: 12px;
                font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal;
                line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal;
                widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;
                background-color: rgb(255, 255, 255);">
                <font face="Tahoma" size="2" style="font-family: Arial, Tahoma;">&nbsp;</font></div>
            <div align="justify" style="font-family: Arial, Tahoma; color: rgb(77, 77, 77); font-size: 12px;
                font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal;
                line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal;
                widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;
                background-color: rgb(255, 255, 255);">
                <font face="Tahoma" style="font-family: Arial, Tahoma;"><font size="2" style="font-family: Arial, Tahoma;">
                    <strong style="font-family: Arial, Tahoma;"><u style="font-family: Arial, Tahoma;">Điều
                        6</u></strong><span class="Apple-converted-space">&nbsp;</span>: Quản lý tài
                    khoản và mật khẩu<br style="font-family: Arial, Tahoma;" />
                </font></font>
            </div>
            <ol style="font-family: Arial, Tahoma; color: rgb(77, 77, 77); font-size: 12px; font-style: normal;
                font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal;
                orphans: 2; text-align: -webkit-auto; text-indent: 0px; text-transform: none;
                white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto;
                -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">
                <li style="font-family: Arial, Tahoma;">
                    <div align="justify" style="font-family: Arial, Tahoma;">
                        <font face="Tahoma" size="2" style="font-family: Arial, Tahoma;">Thành viên sau khi
                            đăng ký phải có trách nhiệm tự quản lý tên tài khoản và mật khẩu.<span class="Apple-converted-space">&nbsp;</span><br
                                style="font-family: Arial, Tahoma;" />
                        </font>
                    </div>
                </li>
                <li style="font-family: Arial, Tahoma;">
                    <div align="justify" style="font-family: Arial, Tahoma;">
                        <font face="Tahoma" size="2" style="font-family: Arial, Tahoma;">Thành viên phải có
                            nghĩa vụ thay đổi mật khẩu định kỳ, công ty chúng tôi không chịu trách nhiệm về
                            những tổn hại phát sinh nếu thành viên mất mật khẩu do không thay đổi.<span class="Apple-converted-space">&nbsp;</span><br
                                style="font-family: Arial, Tahoma;" />
                        </font>
                    </div>
                </li>
                <li style="font-family: Arial, Tahoma;">
                    <div align="justify" style="font-family: Arial, Tahoma;">
                        <font face="Tahoma" size="2" style="font-family: Arial, Tahoma;">Thành viên phải có
                            trách nhiệm tự bảo quản về tài khoản và mật khẩu của mình, nếu thành viên không
                            quản lý tốt để người thứ ba lấy được thông tin, chúng tôi không chịu trách nhiệm
                            về bất ký những tổn thất phát sinh do việc để mất thông tin trên gây ra.<span class="Apple-converted-space">&nbsp;</span><br
                                style="font-family: Arial, Tahoma;" />
                        </font>
                    </div>
                </li>
                <li style="font-family: Arial, Tahoma;">
                    <div align="justify" style="font-family: Arial, Tahoma;">
                        <font face="Tahoma" size="2" style="font-family: Arial, Tahoma;">Thành viên không được
                            cho người khác mượn sử dụng, bán, chuyển nhượng lại tài khoản và mật khẩu.<span class="Apple-converted-space">&nbsp;</span><br
                                style="font-family: Arial, Tahoma;" />
                        </font>
                    </div>
                </li>
                <li style="font-family: Arial, Tahoma;">
                    <div align="justify" style="font-family: Arial, Tahoma;">
                        <font face="Tahoma" size="2" style="font-family: Arial, Tahoma;">Nếu trong một thời
                            gian nhất định chúng tôi thấy rằng tài khoản và mật khẩu của thành viên không được
                            sử dụng, chúng tôi có thể tạm ngưng việc sử dụng tài khoản đó. Trong trường hợp
                            khẩn cấp, chúng tôi có thể xóa tài khoản và mật khẩu của thành viên mà không cần
                            được thành viên chấp thuận. Và chúng tôi cũng không chịu trách nhiệm về sự tổn hại
                            phát sinh từ việc thành viên không quản lý được tài khoản của mình.</font></div>
                    <div style="font-family: Arial, Tahoma;">
                    </div>
                    <div style="font-family: Arial, Tahoma;">
                    </div>
                </li>
            </ol>
            <div align="justify" style="font-family: Arial, Tahoma; color: rgb(77, 77, 77); font-size: 12px;
                font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal;
                line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal;
                widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;
                background-color: rgb(255, 255, 255);">
                <font face="Tahoma" style="font-family: Arial, Tahoma;"><font size="2" style="font-family: Arial, Tahoma;">
                    <strong style="font-family: Arial, Tahoma;"><u style="font-family: Arial, Tahoma;">Điều
                        7</u></strong><span class="Apple-converted-space">&nbsp;</span>: Sử dụng thông
                    tin đăng ký<br style="font-family: Arial, Tahoma;" />
                </font></font>
            </div>
            <ol style="font-family: Arial, Tahoma; color: rgb(77, 77, 77); font-size: 12px; font-style: normal;
                font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal;
                orphans: 2; text-align: -webkit-auto; text-indent: 0px; text-transform: none;
                white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto;
                -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">
                <li style="font-family: Arial, Tahoma;">
                    <div align="justify" style="font-family: Arial, Tahoma;">
                        <font face="Tahoma" size="2" style="font-family: Arial, Tahoma;">Thông tin do các thành
                            viên đăng ký lên<span class="Apple-converted-space">&nbsp;</span></font><a href="http://www.vatgia.com/"
                                style="font-family: Arial, Tahoma; text-decoration: none; color: rgb(96, 93, 87);"><font
                                    color="#800080" face="Tahoma" size="2" style="font-family: Arial, Tahoma;">www.vatgia.com</font></a><font
                                        face="Tahoma" size="2" style="font-family: Arial, Tahoma;"><span class="Apple-converted-space">&nbsp;</span>sẽ
                                        thuộc quyền sở hữu của công ty Cổ phần vật giá Việt Nam, được quản lý và sử dụng
                                        theo các chính sách về bảo vệ thông tin cá nhân của công ty.<span class="Apple-converted-space">&nbsp;</span><br
                                            style="font-family: Arial, Tahoma;" />
                                    </font>
                    </div>
                </li>
                <li style="font-family: Arial, Tahoma;">
                    <div align="justify" style="font-family: Arial, Tahoma;">
                        <font face="Tahoma" size="2" style="font-family: Arial, Tahoma;">Một phần thông tin
                            của các thành viên sẽ được sử dụng làm số liệu thống kê ở mức độ sẽ không phân biệt
                            được từng cá nhân. Trong trường hợp nếu chúng tôi sử dụng thông tin của các thành
                            viên ở mức độ cao hơn thì chúng tôi sẽ thông báo với thành viên đó.<span class="Apple-converted-space">&nbsp;</span><br
                                style="font-family: Arial, Tahoma;" />
                        </font>
                    </div>
                </li>
                <li style="font-family: Arial, Tahoma;">
                    <div align="justify" style="font-family: Arial, Tahoma;">
                        <font face="Tahoma" size="2" style="font-family: Arial, Tahoma;">Khi thành viên có hành
                            vi gây tổn hại đến các thành viên khác hoặc người thứ ba, chúng tôi có thể cung
                            cấp thông tin cá nhân của thành viên đó cho người bị hại, cảnh sát, hoặc các cơ
                            quan hữu quan.<span class="Apple-converted-space">&nbsp;</span><br style="font-family: Arial, Tahoma;" />
                        </font>
                    </div>
                </li>
                <li style="font-family: Arial, Tahoma;">
                    <div align="justify" style="font-family: Arial, Tahoma;">
                        <font face="Tahoma" size="2" style="font-family: Arial, Tahoma;">Khi tòa án, viện kiểm
                            sát, cảnh sát, cơ quan thuế, văn phòng luật sư, trung tâm bảo vệ người tiêu dùng,
                            các cơ quan có thẩm quyền tương đương, hoặc công ty làm về bảo mật yêu cầu công
                            ty chúng tôi cung cấp thông tin cá nhân, chúng tôi sẽ cung cấp thông tin cá nhân
                            của các thành viên với mục đích bảo vệ quyền lợi, thương hiệu, tài sản của công
                            ty.<span class="Apple-converted-space">&nbsp;</span><br style="font-family: Arial, Tahoma;" />
                        </font>
                    </div>
                </li>
            </ol>
            <div align="justify" style="font-family: Arial, Tahoma; color: rgb(77, 77, 77); font-size: 12px;
                font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal;
                line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal;
                widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;
                background-color: rgb(255, 255, 255);">
                <font face="Tahoma" style="font-family: Arial, Tahoma;"><font size="2" style="font-family: Arial, Tahoma;">
                    <strong style="font-family: Arial, Tahoma;"><u style="font-family: Arial, Tahoma;">Điều
                        8<span class="Apple-converted-space">&nbsp;</span></u></strong>: Ngừng sử dụng
                    dịch vụ<br style="font-family: Arial, Tahoma;" />
                </font></font>
            </div>
            <ol style="font-family: Arial, Tahoma; color: rgb(77, 77, 77); font-size: 12px; font-style: normal;
                font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal;
                orphans: 2; text-align: -webkit-auto; text-indent: 0px; text-transform: none;
                white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto;
                -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">
                <li style="font-family: Arial, Tahoma;">
                    <div align="justify" style="font-family: Arial, Tahoma;">
                        <font face="Tahoma" size="2" style="font-family: Arial, Tahoma;">Trong trường hợp thành
                            viên muốn ngừng sử dụng dịch vụ, thì thành viên sẽ tiến hành các thủ tục đã quy
                            định của công ty chúng tôi.<span class="Apple-converted-space">&nbsp;</span><br style="font-family: Arial, Tahoma;" />
                        </font>
                    </div>
                </li>
                <li style="font-family: Arial, Tahoma;">
                    <div align="justify" style="font-family: Arial, Tahoma;">
                        <font face="Tahoma" size="2" style="font-family: Arial, Tahoma;">Sau khi kết thúc sử
                            dụng dịch vụ, tài khoản và mật khẩu của thành viên sẽ mất</font></div>
                </li>
            </ol>
            <div align="justify" style="font-family: Arial, Tahoma; color: rgb(77, 77, 77); font-size: 12px;
                font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal;
                line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal;
                widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;
                background-color: rgb(255, 255, 255);">
                <font face="Tahoma" style="font-family: Arial, Tahoma;"><font size="2" style="font-family: Arial, Tahoma;">
                    <strong style="font-family: Arial, Tahoma;"><u style="font-family: Arial, Tahoma;">Điều
                        9</u></strong><span class="Apple-converted-space">&nbsp;</span>: Cấm, hủy bỏ
                    tư cách sử dụng của thành viên<br style="font-family: Arial, Tahoma;" />
                </font></font>
            </div>
            <div align="justify" style="font-family: Arial, Tahoma; color: rgb(77, 77, 77); font-size: 12px;
                font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal;
                line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal;
                widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;
                background-color: rgb(255, 255, 255);">
                <font face="Tahoma" size="2" style="font-family: Arial, Tahoma;">Trong trường hợp công
                    ty chúng tôi xác nhận được thành viên vi phạm những điều dưới đây, chúng tôi có
                    thể ngừng, hoặc hủy bỏ tư cách sử dụng<span class="Apple-converted-space">&nbsp;</span></font><a
                        href="http://www.vatgia.com/" style="font-family: Arial, Tahoma; text-decoration: none;
                        color: rgb(96, 93, 87);"><font color="#800080" face="Tahoma" size="2" style="font-family: Arial, Tahoma;">www.vatgia.com</font></a><font
                            face="Tahoma" size="2" style="font-family: Arial, Tahoma;"><span class="Apple-converted-space">&nbsp;</span>của
                            thành viên đó, và chúng tôi không chịu trách nhiệm về những tổn hại phát sinh do
                            việc ngừng, hoặc hủy bỏ như trên gây ra. Trong trường hợp thành viên gây tổn hại
                            đến lợi ích của công ty chúng tôi, hoặc người thứ ba do vi phạm những điều nêu dưới
                            đây, thì thành viên vi phạm phải có trách nhiệm bồi thường những tổn hại đó.</font></div>
            <ol style="font-family: Arial, Tahoma; color: rgb(77, 77, 77); font-size: 12px; font-style: normal;
                font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal;
                orphans: 2; text-align: -webkit-auto; text-indent: 0px; text-transform: none;
                white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto;
                -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">
                <li style="font-family: Arial, Tahoma;">
                    <div align="justify" style="font-family: Arial, Tahoma;">
                        <font face="Tahoma" size="2" style="font-family: Arial, Tahoma;">Đăng ký thông tin không
                            đúng sự thật khi đăng ký thành viên.</font></div>
                </li>
                <li style="font-family: Arial, Tahoma;">
                    <div align="justify" style="font-family: Arial, Tahoma;">
                        <font face="Tahoma" size="2" style="font-family: Arial, Tahoma;">Có các hành vi vi phạm
                            pháp luật, quy định này</font></div>
                </li>
                <li style="font-family: Arial, Tahoma;">
                    <div align="justify" style="font-family: Arial, Tahoma;">
                        <font face="Tahoma" size="2" style="font-family: Arial, Tahoma;">Có những hành vi bất
                            chính khi sử dụng<span class="Apple-converted-space">&nbsp;</span></font><a href="http://www.vatgia.com/"
                                style="font-family: Arial, Tahoma; text-decoration: none; color: rgb(96, 93, 87);"><font
                                    color="#800080" face="Tahoma" size="2" style="font-family: Arial, Tahoma;">www.vatgia.com</font></a></div>
                </li>
                <li style="font-family: Arial, Tahoma;">
                    <div align="justify" style="font-family: Arial, Tahoma;">
                        <font face="Tahoma" size="2" style="font-family: Arial, Tahoma;">Sử dụng tài khoản và
                            mật khẩu và mục đích bất chính, hoặc cho người thứ ba sử dụng.</font></div>
                </li>
                <li style="font-family: Arial, Tahoma;">
                    <div align="justify" style="font-family: Arial, Tahoma;">
                        <font face="Tahoma" size="2" style="font-family: Arial, Tahoma;">Gây tổn hại đến công
                            ty chúng tôi</font></div>
                </li>
                <li style="font-family: Arial, Tahoma;">
                    <div align="justify" style="font-family: Arial, Tahoma;">
                        <font face="Tahoma" size="2" style="font-family: Arial, Tahoma;">Những hành vi mà công
                            ty chúng tôi cho rằng không phù hợp.</font></div>
                </li>
            </ol>
            <div align="justify" style="font-family: Arial, Tahoma; color: rgb(77, 77, 77); font-size: 12px;
                font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal;
                line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal;
                widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;
                background-color: rgb(255, 255, 255);">
                <font face="Tahoma" style="font-family: Arial, Tahoma;"><font size="2" style="font-family: Arial, Tahoma;">
                    <strong style="font-family: Arial, Tahoma;"><u style="font-family: Arial, Tahoma;">Điều
                        10</u></strong><span class="Apple-converted-space">&nbsp;</span>: Thông báo<br style="font-family: Arial, Tahoma;" />
                </font></font>
            </div>
            <div align="justify" style="font-family: Arial, Tahoma; color: rgb(77, 77, 77); font-size: 12px;
                font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal;
                line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal;
                widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;
                background-color: rgb(255, 255, 255);">
                <font face="Tahoma" size="2" style="font-family: Arial, Tahoma;">Công ty chúng tôi sẽ
                    gửi các bản tin thông báo vào địa chỉ email do thành viên đăng ký trong trường hợp
                    cần thiết. Trong trường hợp khẩn cấp chúng tôi sẽ thông báo bằng các phương tiện
                    khác.</font></div>
            <div align="justify" style="font-family: Arial, Tahoma; color: rgb(77, 77, 77); font-size: 12px;
                font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal;
                line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal;
                widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;
                background-color: rgb(255, 255, 255);">
                <font face="Tahoma" size="2" style="font-family: Arial, Tahoma;">&nbsp;</font></div>
            <div align="justify" style="font-family: Arial, Tahoma; color: rgb(77, 77, 77); font-size: 12px;
                font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal;
                line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal;
                widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;
                background-color: rgb(255, 255, 255);">
                <font face="Tahoma" style="font-family: Arial, Tahoma;"><font size="2" style="font-family: Arial, Tahoma;">
                    <strong style="font-family: Arial, Tahoma;"><u style="font-family: Arial, Tahoma;">Điều
                        11</u></strong><span class="Apple-converted-space">&nbsp;</span>: Sử dụng dịch
                    vụ</font></font></div>
            <ol style="font-family: Arial, Tahoma; color: rgb(77, 77, 77); font-size: 12px; font-style: normal;
                font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal;
                orphans: 2; text-align: -webkit-auto; text-indent: 0px; text-transform: none;
                white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto;
                -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">
                <li style="font-family: Arial, Tahoma;">
                    <div align="justify" style="font-family: Arial, Tahoma;">
                        <font face="Tahoma" size="2" style="font-family: Arial, Tahoma;">Các thành viên phải
                            tuân thủ các quy định chung, và các hướng dẫn, quy định của từng dịch vụ riêng.<br
                                style="font-family: Arial, Tahoma;" />
                        </font>
                    </div>
                </li>
                <li style="font-family: Arial, Tahoma;">
                    <div align="justify" style="font-family: Arial, Tahoma;">
                        <font face="Tahoma" size="2" style="font-family: Arial, Tahoma;">Trong trường hợp công
                            ty chúng tôi tiến hành bảo trì, nâng cấp hệ thống để nâng cấp dịch vụ, tiến hành
                            bảo mật thông tin, hệ thống bị quá tải, và những trường hợp khác mang tính khách
                            quan gây ảnh hưởng đến hệ thống, chúng tôi có thể dừng một phần, hoặc toàn bộ dịch
                            vụ, và sẽ không chịu trách nhiệm về tổn thất phát sinh do việc dừng cung cấp với
                            lý do trên gây ra.</font></div>
                </li>
            </ol>
            <div align="justify" style="font-family: Arial, Tahoma; color: rgb(77, 77, 77); font-size: 12px;
                font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal;
                line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal;
                widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;
                background-color: rgb(255, 255, 255);">
                <font face="Tahoma" size="2" style="font-family: Arial, Tahoma;">&nbsp;</font></div>
            <div align="justify" style="font-family: Arial, Tahoma; color: rgb(77, 77, 77); font-size: 12px;
                font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal;
                line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal;
                widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;
                background-color: rgb(255, 255, 255);">
                <font face="Tahoma" style="font-family: Arial, Tahoma;"><font size="2" style="font-family: Arial, Tahoma;">
                    <strong style="font-family: Arial, Tahoma;"><u style="font-family: Arial, Tahoma;">Điều
                        12</u></strong><span class="Apple-converted-space">&nbsp;</span>: Các mục cấm<br
                            style="font-family: Arial, Tahoma;" />
                    <br style="font-family: Arial, Tahoma;" />
                </font></font>
            </div>
            <div align="justify" style="font-family: Arial, Tahoma; color: rgb(77, 77, 77); font-size: 12px;
                font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal;
                line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal;
                widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;
                background-color: rgb(255, 255, 255);">
                <font face="Tahoma" size="2" style="font-family: Arial, Tahoma;">Khi sử dụng<span
                    class="Apple-converted-space">&nbsp;</span></font><a href="http://www.vatgia.com/"
                        style="font-family: Arial, Tahoma; text-decoration: none; color: rgb(96, 93, 87);"><font
                            color="#800080" face="Tahoma" size="2" style="font-family: Arial, Tahoma;">www.vatgia.com</font></a><font
                                face="Tahoma" size="2" style="font-family: Arial, Tahoma;"><span class="Apple-converted-space">&nbsp;</span>,
                                các thành viên sẽ không được vi phạm các mục cấm dưới đây.</font></div>
            <ol style="font-family: Arial, Tahoma; color: rgb(77, 77, 77); font-size: 12px; font-style: normal;
                font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal;
                orphans: 2; text-align: -webkit-auto; text-indent: 0px; text-transform: none;
                white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto;
                -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">
                <li style="font-family: Arial, Tahoma;">
                    <div align="justify" style="font-family: Arial, Tahoma;">
                        <font face="Tahoma" size="2" style="font-family: Arial, Tahoma;">Vi phạm quy định sử
                            dụng của<span class="Apple-converted-space">&nbsp;</span></font><a href="http://www.vatgia.com/"
                                style="font-family: Arial, Tahoma; text-decoration: none; color: rgb(96, 93, 87);"><font
                                    face="Tahoma" size="2" style="font-family: Arial, Tahoma;">www.vatgia.com</font></a><br
                                        style="font-family: Arial, Tahoma;" />
                    </div>
                </li>
                <li style="font-family: Arial, Tahoma;">
                    <div align="justify" style="font-family: Arial, Tahoma;">
                        <font face="Tahoma" size="2" style="font-family: Arial, Tahoma;">Đăng thông tin vi phạm
                            thuần phong mỹ tục của Việt Nam và các nước khác.<br style="font-family: Arial, Tahoma;" />
                        </font>
                    </div>
                </li>
                <li style="font-family: Arial, Tahoma;">
                    <div align="justify" style="font-family: Arial, Tahoma;">
                        <font face="Tahoma" size="2" style="font-family: Arial, Tahoma;">Hành vi phạm tội.<br
                            style="font-family: Arial, Tahoma;" />
                        </font>
                    </div>
                </li>
                <li style="font-family: Arial, Tahoma;">
                    <div align="justify" style="font-family: Arial, Tahoma;">
                        <font face="Tahoma" size="2" style="font-family: Arial, Tahoma;">Xâm hại đến quyền sở
                            hữu trí tuệ ( như bản quyền, thương hiệu, sáng chế, bí mật kinh doanh và những vấn
                            đề khác liên quan) của</font><a href="http://www.vatgia.com/" style="font-family: Arial, Tahoma;
                                text-decoration: none; color: rgb(96, 93, 87);"><font color="#800080" face="Tahoma"
                                    size="2" style="font-family: Arial, Tahoma;">www.vatgia.com</font></a><font face="Tahoma"
                                        size="2" style="font-family: Arial, Tahoma;">, và người khác.<br style="font-family: Arial, Tahoma;" />
                                    </font>
                    </div>
                </li>
                <li style="font-family: Arial, Tahoma;">
                    <div align="justify" style="font-family: Arial, Tahoma;">
                        <font face="Tahoma" size="2" style="font-family: Arial, Tahoma;">Gây tổn hại đến người
                            khác thông qua<span class="Apple-converted-space">&nbsp;</span></font><a href="http://www.vatgia.com/"
                                style="font-family: Arial, Tahoma; text-decoration: none; color: rgb(96, 93, 87);"><font
                                    color="#800080" face="Tahoma" size="2" style="font-family: Arial, Tahoma;">www.vatgia.com</font></a><font
                                        face="Tahoma" size="2" style="font-family: Arial, Tahoma;"><span class="Apple-converted-space">&nbsp;</span><br
                                            style="font-family: Arial, Tahoma;" />
                                    </font>
                    </div>
                </li>
                <li style="font-family: Arial, Tahoma;">
                    <div align="justify" style="font-family: Arial, Tahoma;">
                        <font face="Tahoma" size="2" style="font-family: Arial, Tahoma;">Làm tổn hại đến việc
                            kinh doanh của công ty chúng tôi. Làm mất uy tín của công ty chúng tôi.<br style="font-family: Arial, Tahoma;" />
                        </font>
                    </div>
                </li>
                <li style="font-family: Arial, Tahoma;">
                    <div align="justify" style="font-family: Arial, Tahoma;">
                        <font face="Tahoma" size="2" style="font-family: Arial, Tahoma;">Một thành viên đăng
                            ký nhiều tài khoản để sử dụng.<br style="font-family: Arial, Tahoma;" />
                        </font>
                    </div>
                </li>
                <li style="font-family: Arial, Tahoma;">
                    <div align="justify" style="font-family: Arial, Tahoma;">
                        <font face="Tahoma" size="2" style="font-family: Arial, Tahoma;">Những hành vi khác
                            bị công ty chúng tôi coi không hợp lý.</font></div>
                </li>
            </ol>
            <div align="justify" style="font-family: Arial, Tahoma; color: rgb(77, 77, 77); font-size: 12px;
                font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal;
                line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal;
                widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;
                background-color: rgb(255, 255, 255);">
                <font face="Tahoma" style="font-family: Arial, Tahoma;"><font size="2" style="font-family: Arial, Tahoma;">
                    <strong style="font-family: Arial, Tahoma;"><u style="font-family: Arial, Tahoma;">Điều
                        13</u></strong><span class="Apple-converted-space">&nbsp;</span>: Giải quyết
                    tranh chấp, luật áp dụng<br style="font-family: Arial, Tahoma;" />
                </font></font>
            </div>
            <div align="justify" style="font-family: Arial, Tahoma; color: rgb(77, 77, 77); font-size: 12px;
                font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal;
                line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal;
                widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;
                background-color: rgb(255, 255, 255);">
                <font face="Tahoma" size="2" style="font-family: Arial, Tahoma;">Trong quá trình sử
                    dụng nếu xảy ra tranh chấp giữa người sử dụng và công ty chúng tôi, hai bên sẽ tiến
                    hành đàm phán hòa giải với tinh thần hữu nghị. Trong trường hợp không giải quyết
                    được bằng hòa giải sẽ đưa ra toà án kinh tế Hà Nội giải quyết.</font></div>
        </div>
        <form class="agree block center">
        <button>
            Agree</button>
        <button>
            Don't Agree</button>
        </form>
    </div>
    <div id="policyshop" class="pl">
        <div class="ptitle">
            Shop's Policy
        </div>
        <div class="description">
            <div align="justify" style="font-family: Arial, Tahoma; color: rgb(77, 77, 77); font-size: 12px;
                font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal;
                line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal;
                widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;
                background-color: rgb(255, 255, 255);">
                <strong style="font-family: Arial, Tahoma;"><u style="font-family: Arial, Tahoma;"><font
                    face="Tahoma" size="2" style="font-family: Arial, Tahoma;">Đi</font></u></strong><font
                        face="Tahoma" style="font-family: Arial, Tahoma;"><font size="2" style="font-family: Arial, Tahoma;"><strong
                            style="font-family: Arial, Tahoma;"><u style="font-family: Arial, Tahoma;">ều 1</u></strong><span
                                class="Apple-converted-space">&nbsp;</span>: Đăng ký thành viên<br style="font-family: Arial, Tahoma;" />
                            <br style="font-family: Arial, Tahoma;" />
                        </font></font>
            </div>
            <div align="justify" style="font-family: Arial, Tahoma; color: rgb(77, 77, 77); font-size: 12px;
                font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal;
                line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal;
                widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;
                background-color: rgb(255, 255, 255);">
                <font face="Tahoma" size="2" style="font-family: Arial, Tahoma;">Thành viên đăng ký
                    tài khoản trong<span class="Apple-converted-space">&nbsp;</span></font><a href="http://www.vatgia.com/"
                        style="font-family: Arial, Tahoma; text-decoration: none; color: rgb(96, 93, 87);"><font
                            color="#800080" face="Tahoma" size="2" style="font-family: Arial, Tahoma;">www.vatgia.com</font></a><font
                                face="Tahoma" size="2" style="font-family: Arial, Tahoma;"><span class="Apple-converted-space">&nbsp;</span>là
                                người đã đăng ký tài khoản sử dụng theo các bước quy định của công ty Cổ phần vật
                                giá Việt Nam (Dưới đây viết tắt là công ty), và được công ty chấp nhận sự đăng ký
                                đó.</font></div>
            <div align="justify" style="font-family: Arial, Tahoma; color: rgb(77, 77, 77); font-size: 12px;
                font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal;
                line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal;
                widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;
                background-color: rgb(255, 255, 255);">
                <font face="Tahoma" size="2" style="font-family: Arial, Tahoma;">&nbsp;</font></div>
            <div align="justify" style="font-family: Arial, Tahoma; color: rgb(77, 77, 77); font-size: 12px;
                font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal;
                line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal;
                widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;
                background-color: rgb(255, 255, 255);">
                <font face="Tahoma" style="font-family: Arial, Tahoma;"><font size="2" style="font-family: Arial, Tahoma;">
                    <strong style="font-family: Arial, Tahoma;"><u style="font-family: Arial, Tahoma;">Điều
                        2</u></strong><span class="Apple-converted-space">&nbsp;</span>: Bản quy định<br
                            style="font-family: Arial, Tahoma;" />
                    <br style="font-family: Arial, Tahoma;" />
                </font></font>
            </div>
            <div align="justify" style="font-family: Arial, Tahoma; color: rgb(77, 77, 77); font-size: 12px;
                font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal;
                line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal;
                widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;
                background-color: rgb(255, 255, 255);">
                <font face="Tahoma" size="2" style="font-family: Arial, Tahoma;">Tất cả các thành viên
                    khi đăng ký, và sau khi đi đăng ký đều phải tuân thủ những quy định này</font></div>
            <div align="justify" style="font-family: Arial, Tahoma; color: rgb(77, 77, 77); font-size: 12px;
                font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal;
                line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal;
                widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;
                background-color: rgb(255, 255, 255);">
                <font face="Tahoma" size="2" style="font-family: Arial, Tahoma;">&nbsp;</font></div>
            <div align="justify" style="font-family: Arial, Tahoma; color: rgb(77, 77, 77); font-size: 12px;
                font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal;
                line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal;
                widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;
                background-color: rgb(255, 255, 255);">
                <font face="Tahoma" style="font-family: Arial, Tahoma;"><font size="2" style="font-family: Arial, Tahoma;">
                    <strong style="font-family: Arial, Tahoma;"><u style="font-family: Arial, Tahoma;">Điều
                        3</u></strong><span class="Apple-converted-space">&nbsp;</span>: Thay đổi quy
                    định<br style="font-family: Arial, Tahoma;" />
                </font></font>
            </div>
            <div align="justify" style="font-family: Arial, Tahoma; color: rgb(77, 77, 77); font-size: 12px;
                font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal;
                line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal;
                widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;
                background-color: rgb(255, 255, 255);">
                <font face="Tahoma" size="2" style="font-family: Arial, Tahoma;">Công ty chúng tôi có
                    thể thay đổi quy định theo các chính sách của công ty. Khi có thay đổi, chúng tôi
                    sẽ đăng tải lên<span class="Apple-converted-space">&nbsp;</span></font><a href="http://www.vatgia.com/"
                        style="font-family: Arial, Tahoma; text-decoration: none; color: rgb(96, 93, 87);"><font
                            color="#800080" face="Tahoma" size="2" style="font-family: Arial, Tahoma;">www.vatgia.com</font></a><font
                                face="Tahoma" size="2" style="font-family: Arial, Tahoma;">, và sau khi đăng lên
                                coi như quy định đó có hiệu lực. Sau khi quy định thay đổi, nếu thành viên sử dụng<span
                                    class="Apple-converted-space">&nbsp;</span></font><a href="http://www.vatgia.com/"
                                        style="font-family: Arial, Tahoma; text-decoration: none; color: rgb(96, 93, 87);"><font
                                            color="#800080" face="Tahoma" size="2" style="font-family: Arial, Tahoma;">www.vatgia.com</font></a><font
                                                face="Tahoma" size="2" style="font-family: Arial, Tahoma;"><span class="Apple-converted-space">&nbsp;</span>thì
                                                chúng tôi coi thành viên đã chấp nhận tất cả các quy định mới.</font></div>
            <div align="justify" style="font-family: Arial, Tahoma; color: rgb(77, 77, 77); font-size: 12px;
                font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal;
                line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal;
                widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;
                background-color: rgb(255, 255, 255);">
                <font face="Tahoma" size="2" style="font-family: Arial, Tahoma;">&nbsp;</font></div>
            <div align="justify" style="font-family: Arial, Tahoma; color: rgb(77, 77, 77); font-size: 12px;
                font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal;
                line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal;
                widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;
                background-color: rgb(255, 255, 255);">
                <font face="Tahoma" style="font-family: Arial, Tahoma;"><font size="2" style="font-family: Arial, Tahoma;">
                    <strong style="font-family: Arial, Tahoma;"><u style="font-family: Arial, Tahoma;">Điều
                        4</u></strong><span class="Apple-converted-space">&nbsp;</span>: Tư cách thành
                    viên, và các bước đăng ký tài khoản sử dụng</font></font></div>
            <ol style="font-family: Arial, Tahoma; color: rgb(77, 77, 77); font-size: 12px; font-style: normal;
                font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal;
                orphans: 2; text-align: -webkit-auto; text-indent: 0px; text-transform: none;
                white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto;
                -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">
                <li style="font-family: Arial, Tahoma;">
                    <div align="justify" style="font-family: Arial, Tahoma;">
                        <font face="Tahoma" style="font-family: Arial, Tahoma;"><font size="2" style="font-family: Arial, Tahoma;">
                            <strong style="font-family: Arial, Tahoma;">Tư cách thành viên</strong><span class="Apple-converted-space">&nbsp;</span>:Thành
                            viên sau khi đồng ý quy định này và kết thúc đăng ký tài khoản sử dụng trên<span
                                class="Apple-converted-space">&nbsp;</span></font></font><a href="http://www.vatgia.com/"
                                    style="font-family: Arial, Tahoma; text-decoration: none; color: rgb(96, 93, 87);"><font
                                        color="#800080" face="Tahoma" size="2" style="font-family: Arial, Tahoma;">www.vatgia.com</font></a><font
                                            face="Tahoma" size="2" style="font-family: Arial, Tahoma;"><span class="Apple-converted-space">&nbsp;</span>được
                                            coi là thành viên của<span class="Apple-converted-space">&nbsp;</span></font><a href="http://www.vatgia.com/"
                                                style="font-family: Arial, Tahoma; text-decoration: none; color: rgb(96, 93, 87);"><font
                                                    color="#800080" face="Tahoma" size="2" style="font-family: Arial, Tahoma;">www.vatgia.com</font></a><font
                                                        face="Tahoma" size="2" style="font-family: Arial, Tahoma;">. Thành viên chỉ đăng
                                                        ký tài khoản sử dụng cho bản thân, không được đăng ký hộ cho người khác. Chúng tôi
                                                        có thể từ chối việc đăng ký làm thành viên của những thành viên đã từng bị hủy bỏ
                                                        tư cách thành viên trên<span class="Apple-converted-space">&nbsp;</span></font><a
                                                            href="http://www.vatgia.com/" style="font-family: Arial, Tahoma; text-decoration: none;
                                                            color: rgb(96, 93, 87);"><font color="#800080" face="Tahoma" size="2" style="font-family: Arial, Tahoma;">www.vatgia.com</font></a><font
                                                                face="Tahoma" size="2" style="font-family: Arial, Tahoma;">.</font></div>
                </li>
                <li style="font-family: Arial, Tahoma;">
                    <div align="justify" style="font-family: Arial, Tahoma;">
                        <font face="Tahoma" style="font-family: Arial, Tahoma;"><font size="2" style="font-family: Arial, Tahoma;">
                            <strong style="font-family: Arial, Tahoma;">Bước đăng ký tài khoản</strong><span
                                class="Apple-converted-space">&nbsp;</span>:Thành viên phải đọc rõ các lưu ý,
                            và điền chính xác nội dung thông tin cần thiết vào bản đăng ký mẫu.</font></font></div>
                </li>
            </ol>
            <div align="justify" style="font-family: Arial, Tahoma; color: rgb(77, 77, 77); font-size: 12px;
                font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal;
                line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal;
                widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;
                background-color: rgb(255, 255, 255);">
                <font face="Tahoma" size="2" style="font-family: Arial, Tahoma;">&nbsp;</font></div>
            <div align="justify" style="font-family: Arial, Tahoma; color: rgb(77, 77, 77); font-size: 12px;
                font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal;
                line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal;
                widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;
                background-color: rgb(255, 255, 255);">
                <font face="Tahoma" style="font-family: Arial, Tahoma;"><font size="2" style="font-family: Arial, Tahoma;">
                    <strong style="font-family: Arial, Tahoma;"><u style="font-family: Arial, Tahoma;">Điều
                        5</u></strong><span class="Apple-converted-space">&nbsp;</span>: Thay đổi thông
                    tin đăng ký<br style="font-family: Arial, Tahoma;" />
                    <br style="font-family: Arial, Tahoma;" />
                    Sau khi đăng ký các thành viên có thể thay đổi thông tin đã đăng ký theo các bước
                    đã quy định. Chúng tôi không chịu bất kỳ trách nhiệm gì về những phát sinh liên
                    quan đến việc thay đổi thông tin của các thành viên.</font></font></div>
            <div align="justify" style="font-family: Arial, Tahoma; color: rgb(77, 77, 77); font-size: 12px;
                font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal;
                line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal;
                widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;
                background-color: rgb(255, 255, 255);">
                <font face="Tahoma" size="2" style="font-family: Arial, Tahoma;">&nbsp;</font></div>
            <div align="justify" style="font-family: Arial, Tahoma; color: rgb(77, 77, 77); font-size: 12px;
                font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal;
                line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal;
                widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;
                background-color: rgb(255, 255, 255);">
                <font face="Tahoma" style="font-family: Arial, Tahoma;"><font size="2" style="font-family: Arial, Tahoma;">
                    <strong style="font-family: Arial, Tahoma;"><u style="font-family: Arial, Tahoma;">Điều
                        6</u></strong><span class="Apple-converted-space">&nbsp;</span>: Quản lý tài
                    khoản và mật khẩu<br style="font-family: Arial, Tahoma;" />
                </font></font>
            </div>
            <ol style="font-family: Arial, Tahoma; color: rgb(77, 77, 77); font-size: 12px; font-style: normal;
                font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal;
                orphans: 2; text-align: -webkit-auto; text-indent: 0px; text-transform: none;
                white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto;
                -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">
                <li style="font-family: Arial, Tahoma;">
                    <div align="justify" style="font-family: Arial, Tahoma;">
                        <font face="Tahoma" size="2" style="font-family: Arial, Tahoma;">Thành viên sau khi
                            đăng ký phải có trách nhiệm tự quản lý tên tài khoản và mật khẩu.<span class="Apple-converted-space">&nbsp;</span><br
                                style="font-family: Arial, Tahoma;" />
                        </font>
                    </div>
                </li>
                <li style="font-family: Arial, Tahoma;">
                    <div align="justify" style="font-family: Arial, Tahoma;">
                        <font face="Tahoma" size="2" style="font-family: Arial, Tahoma;">Thành viên phải có
                            nghĩa vụ thay đổi mật khẩu định kỳ, công ty chúng tôi không chịu trách nhiệm về
                            những tổn hại phát sinh nếu thành viên mất mật khẩu do không thay đổi.<span class="Apple-converted-space">&nbsp;</span><br
                                style="font-family: Arial, Tahoma;" />
                        </font>
                    </div>
                </li>
                <li style="font-family: Arial, Tahoma;">
                    <div align="justify" style="font-family: Arial, Tahoma;">
                        <font face="Tahoma" size="2" style="font-family: Arial, Tahoma;">Thành viên phải có
                            trách nhiệm tự bảo quản về tài khoản và mật khẩu của mình, nếu thành viên không
                            quản lý tốt để người thứ ba lấy được thông tin, chúng tôi không chịu trách nhiệm
                            về bất ký những tổn thất phát sinh do việc để mất thông tin trên gây ra.<span class="Apple-converted-space">&nbsp;</span><br
                                style="font-family: Arial, Tahoma;" />
                        </font>
                    </div>
                </li>
                <li style="font-family: Arial, Tahoma;">
                    <div align="justify" style="font-family: Arial, Tahoma;">
                        <font face="Tahoma" size="2" style="font-family: Arial, Tahoma;">Thành viên không được
                            cho người khác mượn sử dụng, bán, chuyển nhượng lại tài khoản và mật khẩu.<span class="Apple-converted-space">&nbsp;</span><br
                                style="font-family: Arial, Tahoma;" />
                        </font>
                    </div>
                </li>
                <li style="font-family: Arial, Tahoma;">
                    <div align="justify" style="font-family: Arial, Tahoma;">
                        <font face="Tahoma" size="2" style="font-family: Arial, Tahoma;">Nếu trong một thời
                            gian nhất định chúng tôi thấy rằng tài khoản và mật khẩu của thành viên không được
                            sử dụng, chúng tôi có thể tạm ngưng việc sử dụng tài khoản đó. Trong trường hợp
                            khẩn cấp, chúng tôi có thể xóa tài khoản và mật khẩu của thành viên mà không cần
                            được thành viên chấp thuận. Và chúng tôi cũng không chịu trách nhiệm về sự tổn hại
                            phát sinh từ việc thành viên không quản lý được tài khoản của mình.</font></div>
                    <div style="font-family: Arial, Tahoma;">
                    </div>
                    <div style="font-family: Arial, Tahoma;">
                    </div>
                </li>
            </ol>
            <div align="justify" style="font-family: Arial, Tahoma; color: rgb(77, 77, 77); font-size: 12px;
                font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal;
                line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal;
                widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;
                background-color: rgb(255, 255, 255);">
                <font face="Tahoma" style="font-family: Arial, Tahoma;"><font size="2" style="font-family: Arial, Tahoma;">
                    <strong style="font-family: Arial, Tahoma;"><u style="font-family: Arial, Tahoma;">Điều
                        7</u></strong><span class="Apple-converted-space">&nbsp;</span>: Sử dụng thông
                    tin đăng ký<br style="font-family: Arial, Tahoma;" />
                </font></font>
            </div>
            <ol style="font-family: Arial, Tahoma; color: rgb(77, 77, 77); font-size: 12px; font-style: normal;
                font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal;
                orphans: 2; text-align: -webkit-auto; text-indent: 0px; text-transform: none;
                white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto;
                -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">
                <li style="font-family: Arial, Tahoma;">
                    <div align="justify" style="font-family: Arial, Tahoma;">
                        <font face="Tahoma" size="2" style="font-family: Arial, Tahoma;">Thông tin do các thành
                            viên đăng ký lên<span class="Apple-converted-space">&nbsp;</span></font><a href="http://www.vatgia.com/"
                                style="font-family: Arial, Tahoma; text-decoration: none; color: rgb(96, 93, 87);"><font
                                    color="#800080" face="Tahoma" size="2" style="font-family: Arial, Tahoma;">www.vatgia.com</font></a><font
                                        face="Tahoma" size="2" style="font-family: Arial, Tahoma;"><span class="Apple-converted-space">&nbsp;</span>sẽ
                                        thuộc quyền sở hữu của công ty Cổ phần vật giá Việt Nam, được quản lý và sử dụng
                                        theo các chính sách về bảo vệ thông tin cá nhân của công ty.<span class="Apple-converted-space">&nbsp;</span><br
                                            style="font-family: Arial, Tahoma;" />
                                    </font>
                    </div>
                </li>
                <li style="font-family: Arial, Tahoma;">
                    <div align="justify" style="font-family: Arial, Tahoma;">
                        <font face="Tahoma" size="2" style="font-family: Arial, Tahoma;">Một phần thông tin
                            của các thành viên sẽ được sử dụng làm số liệu thống kê ở mức độ sẽ không phân biệt
                            được từng cá nhân. Trong trường hợp nếu chúng tôi sử dụng thông tin của các thành
                            viên ở mức độ cao hơn thì chúng tôi sẽ thông báo với thành viên đó.<span class="Apple-converted-space">&nbsp;</span><br
                                style="font-family: Arial, Tahoma;" />
                        </font>
                    </div>
                </li>
                <li style="font-family: Arial, Tahoma;">
                    <div align="justify" style="font-family: Arial, Tahoma;">
                        <font face="Tahoma" size="2" style="font-family: Arial, Tahoma;">Khi thành viên có hành
                            vi gây tổn hại đến các thành viên khác hoặc người thứ ba, chúng tôi có thể cung
                            cấp thông tin cá nhân của thành viên đó cho người bị hại, cảnh sát, hoặc các cơ
                            quan hữu quan.<span class="Apple-converted-space">&nbsp;</span><br style="font-family: Arial, Tahoma;" />
                        </font>
                    </div>
                </li>
                <li style="font-family: Arial, Tahoma;">
                    <div align="justify" style="font-family: Arial, Tahoma;">
                        <font face="Tahoma" size="2" style="font-family: Arial, Tahoma;">Khi tòa án, viện kiểm
                            sát, cảnh sát, cơ quan thuế, văn phòng luật sư, trung tâm bảo vệ người tiêu dùng,
                            các cơ quan có thẩm quyền tương đương, hoặc công ty làm về bảo mật yêu cầu công
                            ty chúng tôi cung cấp thông tin cá nhân, chúng tôi sẽ cung cấp thông tin cá nhân
                            của các thành viên với mục đích bảo vệ quyền lợi, thương hiệu, tài sản của công
                            ty.<span class="Apple-converted-space">&nbsp;</span><br style="font-family: Arial, Tahoma;" />
                        </font>
                    </div>
                </li>
            </ol>
            <div align="justify" style="font-family: Arial, Tahoma; color: rgb(77, 77, 77); font-size: 12px;
                font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal;
                line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal;
                widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;
                background-color: rgb(255, 255, 255);">
                <font face="Tahoma" style="font-family: Arial, Tahoma;"><font size="2" style="font-family: Arial, Tahoma;">
                    <strong style="font-family: Arial, Tahoma;"><u style="font-family: Arial, Tahoma;">Điều
                        8<span class="Apple-converted-space">&nbsp;</span></u></strong>: Ngừng sử dụng
                    dịch vụ<br style="font-family: Arial, Tahoma;" />
                </font></font>
            </div>
            <ol style="font-family: Arial, Tahoma; color: rgb(77, 77, 77); font-size: 12px; font-style: normal;
                font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal;
                orphans: 2; text-align: -webkit-auto; text-indent: 0px; text-transform: none;
                white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto;
                -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">
                <li style="font-family: Arial, Tahoma;">
                    <div align="justify" style="font-family: Arial, Tahoma;">
                        <font face="Tahoma" size="2" style="font-family: Arial, Tahoma;">Trong trường hợp thành
                            viên muốn ngừng sử dụng dịch vụ, thì thành viên sẽ tiến hành các thủ tục đã quy
                            định của công ty chúng tôi.<span class="Apple-converted-space">&nbsp;</span><br style="font-family: Arial, Tahoma;" />
                        </font>
                    </div>
                </li>
                <li style="font-family: Arial, Tahoma;">
                    <div align="justify" style="font-family: Arial, Tahoma;">
                        <font face="Tahoma" size="2" style="font-family: Arial, Tahoma;">Sau khi kết thúc sử
                            dụng dịch vụ, tài khoản và mật khẩu của thành viên sẽ mất</font></div>
                </li>
            </ol>
            <div align="justify" style="font-family: Arial, Tahoma; color: rgb(77, 77, 77); font-size: 12px;
                font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal;
                line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal;
                widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;
                background-color: rgb(255, 255, 255);">
                <font face="Tahoma" style="font-family: Arial, Tahoma;"><font size="2" style="font-family: Arial, Tahoma;">
                    <strong style="font-family: Arial, Tahoma;"><u style="font-family: Arial, Tahoma;">Điều
                        9</u></strong><span class="Apple-converted-space">&nbsp;</span>: Cấm, hủy bỏ
                    tư cách sử dụng của thành viên<br style="font-family: Arial, Tahoma;" />
                </font></font>
            </div>
            <div align="justify" style="font-family: Arial, Tahoma; color: rgb(77, 77, 77); font-size: 12px;
                font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal;
                line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal;
                widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;
                background-color: rgb(255, 255, 255);">
                <font face="Tahoma" size="2" style="font-family: Arial, Tahoma;">Trong trường hợp công
                    ty chúng tôi xác nhận được thành viên vi phạm những điều dưới đây, chúng tôi có
                    thể ngừng, hoặc hủy bỏ tư cách sử dụng<span class="Apple-converted-space">&nbsp;</span></font><a
                        href="http://www.vatgia.com/" style="font-family: Arial, Tahoma; text-decoration: none;
                        color: rgb(96, 93, 87);"><font color="#800080" face="Tahoma" size="2" style="font-family: Arial, Tahoma;">www.vatgia.com</font></a><font
                            face="Tahoma" size="2" style="font-family: Arial, Tahoma;"><span class="Apple-converted-space">&nbsp;</span>của
                            thành viên đó, và chúng tôi không chịu trách nhiệm về những tổn hại phát sinh do
                            việc ngừng, hoặc hủy bỏ như trên gây ra. Trong trường hợp thành viên gây tổn hại
                            đến lợi ích của công ty chúng tôi, hoặc người thứ ba do vi phạm những điều nêu dưới
                            đây, thì thành viên vi phạm phải có trách nhiệm bồi thường những tổn hại đó.</font></div>
            <ol style="font-family: Arial, Tahoma; color: rgb(77, 77, 77); font-size: 12px; font-style: normal;
                font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal;
                orphans: 2; text-align: -webkit-auto; text-indent: 0px; text-transform: none;
                white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto;
                -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">
                <li style="font-family: Arial, Tahoma;">
                    <div align="justify" style="font-family: Arial, Tahoma;">
                        <font face="Tahoma" size="2" style="font-family: Arial, Tahoma;">Đăng ký thông tin không
                            đúng sự thật khi đăng ký thành viên.</font></div>
                </li>
                <li style="font-family: Arial, Tahoma;">
                    <div align="justify" style="font-family: Arial, Tahoma;">
                        <font face="Tahoma" size="2" style="font-family: Arial, Tahoma;">Có các hành vi vi phạm
                            pháp luật, quy định này</font></div>
                </li>
                <li style="font-family: Arial, Tahoma;">
                    <div align="justify" style="font-family: Arial, Tahoma;">
                        <font face="Tahoma" size="2" style="font-family: Arial, Tahoma;">Có những hành vi bất
                            chính khi sử dụng<span class="Apple-converted-space">&nbsp;</span></font><a href="http://www.vatgia.com/"
                                style="font-family: Arial, Tahoma; text-decoration: none; color: rgb(96, 93, 87);"><font
                                    color="#800080" face="Tahoma" size="2" style="font-family: Arial, Tahoma;">www.vatgia.com</font></a></div>
                </li>
                <li style="font-family: Arial, Tahoma;">
                    <div align="justify" style="font-family: Arial, Tahoma;">
                        <font face="Tahoma" size="2" style="font-family: Arial, Tahoma;">Sử dụng tài khoản và
                            mật khẩu và mục đích bất chính, hoặc cho người thứ ba sử dụng.</font></div>
                </li>
                <li style="font-family: Arial, Tahoma;">
                    <div align="justify" style="font-family: Arial, Tahoma;">
                        <font face="Tahoma" size="2" style="font-family: Arial, Tahoma;">Gây tổn hại đến công
                            ty chúng tôi</font></div>
                </li>
                <li style="font-family: Arial, Tahoma;">
                    <div align="justify" style="font-family: Arial, Tahoma;">
                        <font face="Tahoma" size="2" style="font-family: Arial, Tahoma;">Những hành vi mà công
                            ty chúng tôi cho rằng không phù hợp.</font></div>
                </li>
            </ol>
            <div align="justify" style="font-family: Arial, Tahoma; color: rgb(77, 77, 77); font-size: 12px;
                font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal;
                line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal;
                widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;
                background-color: rgb(255, 255, 255);">
                <font face="Tahoma" style="font-family: Arial, Tahoma;"><font size="2" style="font-family: Arial, Tahoma;">
                    <strong style="font-family: Arial, Tahoma;"><u style="font-family: Arial, Tahoma;">Điều
                        10</u></strong><span class="Apple-converted-space">&nbsp;</span>: Thông báo<br style="font-family: Arial, Tahoma;" />
                </font></font>
            </div>
            <div align="justify" style="font-family: Arial, Tahoma; color: rgb(77, 77, 77); font-size: 12px;
                font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal;
                line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal;
                widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;
                background-color: rgb(255, 255, 255);">
                <font face="Tahoma" size="2" style="font-family: Arial, Tahoma;">Công ty chúng tôi sẽ
                    gửi các bản tin thông báo vào địa chỉ email do thành viên đăng ký trong trường hợp
                    cần thiết. Trong trường hợp khẩn cấp chúng tôi sẽ thông báo bằng các phương tiện
                    khác.</font></div>
            <div align="justify" style="font-family: Arial, Tahoma; color: rgb(77, 77, 77); font-size: 12px;
                font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal;
                line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal;
                widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;
                background-color: rgb(255, 255, 255);">
                <font face="Tahoma" size="2" style="font-family: Arial, Tahoma;">&nbsp;</font></div>
            <div align="justify" style="font-family: Arial, Tahoma; color: rgb(77, 77, 77); font-size: 12px;
                font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal;
                line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal;
                widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;
                background-color: rgb(255, 255, 255);">
                <font face="Tahoma" style="font-family: Arial, Tahoma;"><font size="2" style="font-family: Arial, Tahoma;">
                    <strong style="font-family: Arial, Tahoma;"><u style="font-family: Arial, Tahoma;">Điều
                        11</u></strong><span class="Apple-converted-space">&nbsp;</span>: Sử dụng dịch
                    vụ</font></font></div>
            <ol style="font-family: Arial, Tahoma; color: rgb(77, 77, 77); font-size: 12px; font-style: normal;
                font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal;
                orphans: 2; text-align: -webkit-auto; text-indent: 0px; text-transform: none;
                white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto;
                -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">
                <li style="font-family: Arial, Tahoma;">
                    <div align="justify" style="font-family: Arial, Tahoma;">
                        <font face="Tahoma" size="2" style="font-family: Arial, Tahoma;">Các thành viên phải
                            tuân thủ các quy định chung, và các hướng dẫn, quy định của từng dịch vụ riêng.<br
                                style="font-family: Arial, Tahoma;" />
                        </font>
                    </div>
                </li>
                <li style="font-family: Arial, Tahoma;">
                    <div align="justify" style="font-family: Arial, Tahoma;">
                        <font face="Tahoma" size="2" style="font-family: Arial, Tahoma;">Trong trường hợp công
                            ty chúng tôi tiến hành bảo trì, nâng cấp hệ thống để nâng cấp dịch vụ, tiến hành
                            bảo mật thông tin, hệ thống bị quá tải, và những trường hợp khác mang tính khách
                            quan gây ảnh hưởng đến hệ thống, chúng tôi có thể dừng một phần, hoặc toàn bộ dịch
                            vụ, và sẽ không chịu trách nhiệm về tổn thất phát sinh do việc dừng cung cấp với
                            lý do trên gây ra.</font></div>
                </li>
            </ol>
            <div align="justify" style="font-family: Arial, Tahoma; color: rgb(77, 77, 77); font-size: 12px;
                font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal;
                line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal;
                widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;
                background-color: rgb(255, 255, 255);">
                <font face="Tahoma" size="2" style="font-family: Arial, Tahoma;">&nbsp;</font></div>
            <div align="justify" style="font-family: Arial, Tahoma; color: rgb(77, 77, 77); font-size: 12px;
                font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal;
                line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal;
                widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;
                background-color: rgb(255, 255, 255);">
                <font face="Tahoma" style="font-family: Arial, Tahoma;"><font size="2" style="font-family: Arial, Tahoma;">
                    <strong style="font-family: Arial, Tahoma;"><u style="font-family: Arial, Tahoma;">Điều
                        12</u></strong><span class="Apple-converted-space">&nbsp;</span>: Các mục cấm<br
                            style="font-family: Arial, Tahoma;" />
                    <br style="font-family: Arial, Tahoma;" />
                </font></font>
            </div>
            <div align="justify" style="font-family: Arial, Tahoma; color: rgb(77, 77, 77); font-size: 12px;
                font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal;
                line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal;
                widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;
                background-color: rgb(255, 255, 255);">
                <font face="Tahoma" size="2" style="font-family: Arial, Tahoma;">Khi sử dụng<span
                    class="Apple-converted-space">&nbsp;</span></font><a href="http://www.vatgia.com/"
                        style="font-family: Arial, Tahoma; text-decoration: none; color: rgb(96, 93, 87);"><font
                            color="#800080" face="Tahoma" size="2" style="font-family: Arial, Tahoma;">www.vatgia.com</font></a><font
                                face="Tahoma" size="2" style="font-family: Arial, Tahoma;"><span class="Apple-converted-space">&nbsp;</span>,
                                các thành viên sẽ không được vi phạm các mục cấm dưới đây.</font></div>
            <ol style="font-family: Arial, Tahoma; color: rgb(77, 77, 77); font-size: 12px; font-style: normal;
                font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal;
                orphans: 2; text-align: -webkit-auto; text-indent: 0px; text-transform: none;
                white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto;
                -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">
                <li style="font-family: Arial, Tahoma;">
                    <div align="justify" style="font-family: Arial, Tahoma;">
                        <font face="Tahoma" size="2" style="font-family: Arial, Tahoma;">Vi phạm quy định sử
                            dụng của<span class="Apple-converted-space">&nbsp;</span></font><a href="http://www.vatgia.com/"
                                style="font-family: Arial, Tahoma; text-decoration: none; color: rgb(96, 93, 87);"><font
                                    face="Tahoma" size="2" style="font-family: Arial, Tahoma;">www.vatgia.com</font></a><br
                                        style="font-family: Arial, Tahoma;" />
                    </div>
                </li>
                <li style="font-family: Arial, Tahoma;">
                    <div align="justify" style="font-family: Arial, Tahoma;">
                        <font face="Tahoma" size="2" style="font-family: Arial, Tahoma;">Đăng thông tin vi phạm
                            thuần phong mỹ tục của Việt Nam và các nước khác.<br style="font-family: Arial, Tahoma;" />
                        </font>
                    </div>
                </li>
                <li style="font-family: Arial, Tahoma;">
                    <div align="justify" style="font-family: Arial, Tahoma;">
                        <font face="Tahoma" size="2" style="font-family: Arial, Tahoma;">Hành vi phạm tội.<br
                            style="font-family: Arial, Tahoma;" />
                        </font>
                    </div>
                </li>
                <li style="font-family: Arial, Tahoma;">
                    <div align="justify" style="font-family: Arial, Tahoma;">
                        <font face="Tahoma" size="2" style="font-family: Arial, Tahoma;">Xâm hại đến quyền sở
                            hữu trí tuệ ( như bản quyền, thương hiệu, sáng chế, bí mật kinh doanh và những vấn
                            đề khác liên quan) của</font><a href="http://www.vatgia.com/" style="font-family: Arial, Tahoma;
                                text-decoration: none; color: rgb(96, 93, 87);"><font color="#800080" face="Tahoma"
                                    size="2" style="font-family: Arial, Tahoma;">www.vatgia.com</font></a><font face="Tahoma"
                                        size="2" style="font-family: Arial, Tahoma;">, và người khác.<br style="font-family: Arial, Tahoma;" />
                                    </font>
                    </div>
                </li>
                <li style="font-family: Arial, Tahoma;">
                    <div align="justify" style="font-family: Arial, Tahoma;">
                        <font face="Tahoma" size="2" style="font-family: Arial, Tahoma;">Gây tổn hại đến người
                            khác thông qua<span class="Apple-converted-space">&nbsp;</span></font><a href="http://www.vatgia.com/"
                                style="font-family: Arial, Tahoma; text-decoration: none; color: rgb(96, 93, 87);"><font
                                    color="#800080" face="Tahoma" size="2" style="font-family: Arial, Tahoma;">www.vatgia.com</font></a><font
                                        face="Tahoma" size="2" style="font-family: Arial, Tahoma;"><span class="Apple-converted-space">&nbsp;</span><br
                                            style="font-family: Arial, Tahoma;" />
                                    </font>
                    </div>
                </li>
                <li style="font-family: Arial, Tahoma;">
                    <div align="justify" style="font-family: Arial, Tahoma;">
                        <font face="Tahoma" size="2" style="font-family: Arial, Tahoma;">Làm tổn hại đến việc
                            kinh doanh của công ty chúng tôi. Làm mất uy tín của công ty chúng tôi.<br style="font-family: Arial, Tahoma;" />
                        </font>
                    </div>
                </li>
                <li style="font-family: Arial, Tahoma;">
                    <div align="justify" style="font-family: Arial, Tahoma;">
                        <font face="Tahoma" size="2" style="font-family: Arial, Tahoma;">Một thành viên đăng
                            ký nhiều tài khoản để sử dụng.<br style="font-family: Arial, Tahoma;" />
                        </font>
                    </div>
                </li>
                <li style="font-family: Arial, Tahoma;">
                    <div align="justify" style="font-family: Arial, Tahoma;">
                        <font face="Tahoma" size="2" style="font-family: Arial, Tahoma;">Những hành vi khác
                            bị công ty chúng tôi coi không hợp lý.</font></div>
                </li>
            </ol>
            <div align="justify" style="font-family: Arial, Tahoma; color: rgb(77, 77, 77); font-size: 12px;
                font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal;
                line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal;
                widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;
                background-color: rgb(255, 255, 255);">
                <font face="Tahoma" style="font-family: Arial, Tahoma;"><font size="2" style="font-family: Arial, Tahoma;">
                    <strong style="font-family: Arial, Tahoma;"><u style="font-family: Arial, Tahoma;">Điều
                        13</u></strong><span class="Apple-converted-space">&nbsp;</span>: Giải quyết
                    tranh chấp, luật áp dụng<br style="font-family: Arial, Tahoma;" />
                </font></font>
            </div>
            <div align="justify" style="font-family: Arial, Tahoma; color: rgb(77, 77, 77); font-size: 12px;
                font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal;
                line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal;
                widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;
                background-color: rgb(255, 255, 255);">
                <font face="Tahoma" size="2" style="font-family: Arial, Tahoma;">Trong quá trình sử
                    dụng nếu xảy ra tranh chấp giữa người sử dụng và công ty chúng tôi, hai bên sẽ tiến
                    hành đàm phán hòa giải với tinh thần hữu nghị. Trong trường hợp không giải quyết
                    được bằng hòa giải sẽ đưa ra toà án kinh tế Hà Nội giải quyết.</font></div>
        </div>
        <span>
            <form class="agree clear">
            <input type="checkbox" />
            I have read, and agree</span>
        <input class="agree" type="button" value="Agree" />
        <div class="freg block center b shadow">
            <div class="ftitle">
                <div class="ftitle">
                </div>
                <div class="ftitle">
                </div>
                <div class="ftitle">
                </div>
            </div>
            <div id="reguser" class="block">
                <form id="freguser" class="formular">
                <table>
                    <tr>
                        <td>
                            First Name<span style="color: red">*</span>
                        </td>
                        <td>
                            <input class="validate[required]" type="text" name="ufname" id="ufname" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Last Name<span style="color: red">*</span>
                        </td>
                        <td>
                            <input class="validate[required]" type="text" name="ulname" id="ulname" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Email<span style="color: red">*</span>
                        </td>
                        <td>
                            <input class="validate[required,custom[email]]" type="text" name="uemail" id="uemail" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Password<span style="color: red">*</span>
                        </td>
                        <td>
                            <input class="validate[required,custom[passl]]" type="password" name="upass" id="upass" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Confirm Password<span style="color: red">*</span>
                        </td>
                        <td>
                            <input class="validate[required,funcCall[ckmk]]" type="password" name="uconfirm"
                                id="uconfirm" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Your Birthday<span style="color: red">*</span>
                        </td>
                        <td>
                            <input class="validate[required,custom[date]]" type="text" id="ubirthday" name="ubirthday" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Your State<span style="color: red">*</span>
                        </td>
                        <td>
                            <select class="validate[required]" id="freguserstate" name="freguserstate">
                                <option>Select your current states</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Your College/ University<span style="color: red">*</span>
                        </td>
                        <td>
                            <select class="validate[required]" id="freguserCU" name="freguserCU">
                                <option>Chose your College/ University</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Class<span style="color: red">*</span>
                        </td>
                        <td>
                            <select id="freguserclass" name="freguserclass">
                                <option>Select your class</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Yahoo/Skype
                        </td>
                        <td>
                            <input type="text" name="uyahoo" id="Text2" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Mobile
                        </td>
                        <td>
                            <input type="text" name="umobile" id="Text3" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Shop / Company Name
                        </td>
                        <td>
                            <input type="text" name="uusername" id="Text1" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Website Address
                        </td>
                        <td>
                            <input class="validate[custom[email]]" value="http://" type="text" name="uemail"
                                id="Text8" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Captcha image
                        </td>
                        <td>
                            <p id='veryu' class='very' title="reload image">
                                ABjs</p>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Enter Captcha image<span style="color: red">*</span>
                        </td>
                        <td>
                            <input class="validate[required,funcCall[ckcap]]" type="text" id="freguserckcap"
                                name="freguserckcap" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td>
                            <input type="submit" value="Sign up" />
                            <input type="reset" value="Reset" />
                        </td>
                    </tr>
                </table>
                </form>
            </div>
        </div>
</asp:Content>
