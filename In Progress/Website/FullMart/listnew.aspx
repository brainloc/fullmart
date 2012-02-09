<%@ Page Title="" Language="C#" MasterPageFile="~/TwoColumns.Master" AutoEventWireup="true" CodeBehind="listnew.aspx.cs" Inherits="FullMart.themes.script.listnew" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/themes/style/Listnews.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Left" runat="server">
    <div id="listcats" class="lb btlr">
        <div class="title block btlr">
            <span>Categories</span></div>
        <ul class="lplist">
            <asp:Repeater ID="rpCategories" runat="server" DataSourceID="dsCategories">
                <ItemTemplate>
                    <li><a class="ap" href='?cat=<%# Eval("ID") %>'>
                        <%# Eval("Name") %></a>
                        <div class="lsubcat b">
                            <span class="block title btlr">
                                <%# Eval("Name") %></span>
                            <ul>
                                <asp:Label ID="lblCategoryID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                <asp:Repeater ID="rpSubCategories" runat="server" DataSourceID="dsSubCategories">
                                    <ItemTemplate>
                                        <li><a href='?subcat=<%# Eval("ID") %>'>
                                            <%# Eval("Name") %></a></li>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:SqlDataSource ID="dsSubCategories" runat="server" ConnectionString="<%$ ConnectionStrings:FullMartConnectionString %>"
                                    SelectCommand="SELECT [ID],[Name] FROM [FullMart].[dbo].[SubCategory] WHERE [CategoryID] = @CategoryID">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="lblCategoryID" Name="CategoryID" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </ul>
                        </div>
                    </li>
                </ItemTemplate>
            </asp:Repeater>
            <asp:SqlDataSource ID="dsCategories" runat="server" ConnectionString="<%$ ConnectionStrings:FullMartConnectionString %>"
                SelectCommand="SELECT [ID],[Name] FROM [FullMart].[dbo].[Category] ORDER BY [Order]">
            </asp:SqlDataSource>
        </ul>
    </div>
    <div class="ladv lb">
        <img src="/themes/images/leftadv.jpg" /></div>
    <div id="AAQ" class="lb b">
        <div class="title">
            <span>Answers & Questions</span></div>
        <div class="listitem">
            <ul>
                <li>
                    <div class="Ahead">
                        <span class="Ausername"><a href="#aa">sniperPro</a></span></div>
                    <div class="Aarrow">
                        21/11/2011</div>
                    <div class="Acontent b">
                        <a href="a">
                            <p>
                                Something need to know about this website .....</p>
                        </a>
                    </div>
                </li>
                <li>
                    <div class="Ahead">
                        <span class="Ausername"><a href="#aa">sniperPro</a></span></div>
                    <div class="Aarrow">
                        21/11/2011</div>
                    <div class="Acontent b">
                        <a href="a">
                            <p>
                                Something need to know about this website .....</p>
                        </a>
                    </div>
                </li>
                <li>
                    <div class="Ahead">
                        <span class="Ausername"><a href="#aa">sniperPro</a></span></div>
                    <div class="Aarrow">
                        21/11/2011</div>
                    <div class="Acontent b">
                        <a href="a">
                            <p>
                                Something need to know about this website .....</p>
                        </a>
                    </div>
                </li>
                <li>
                    <div class="Ahead">
                        <span class="Ausername"><a href="#aa">sniperPro</a></span></div>
                    <div class="Aarrow">
                        21/11/2011</div>
                    <div class="Acontent b">
                        <a href="a">
                            <p>
                                Something need to know about this website Something need to know about this website
                                Something need to know about this website .....</p>
                        </a>
                    </div>
                </li>
            </ul>
            <div class="Apages right">
                <a href="#1" class="active" ref="1">1</a> <a href="#2" ref="2">2</a> <a href="#3"
                    ref="3">3</a> <a href="#4" ref="4">4</a> <a href="#5" ref="5">5</a> <a href="#0"
                        ref="0">All</a>
            </div>
            <div class="clear">
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Right" runat="server">
    <ul class="listnew block">
        <li class="b bgwt">
            <div class="previewimage left">
                <center>
                    <img src="media/upload/product1.jpg" alt="title new"></center>
            </div>
            <div class="previewcontent left">
                <span class="postday btlr">20/01/2012</span>
                <p class="title">
                    <a href="viewnews.htm" title="Samsung mang loạt sản phẩm 'hot' từ CES 2012 về VNs">Samsung
                        mang loạt sản phẩm 'hot' từ CES 2012 về VN</a></p>
                <p class="content">
                    Hãng này sẽ phân phối ra thị trường Việt Nam TV thông minh dùng chip lõi kép, ultrabook
                    Seires 5, Series 9… được giới thiệu tại triển lãm CES vừa diễn ra ở Las Vegas (Mỹ).Đáng
                    chú ý trong đó có TV LED ES8000 với thiết kế chân đế hình chữ U độc đáo, dày chỉ
                    vài mm cùng đường viền siêu mỏng. Sản phẩm tích hợp bộ vi xử lý lõi kép đầu tiên
                    cho phép vừa lướt web và tải ứng dụng trên mạng.Ngoài ra TV này còn được trang bị
                    một camera HD và microphone kép để hỗ trợ công nghệ tương tác thông minh (Smart
                    Interaction), cho phép con người điều chỉnh nó từ xa bằng chuyển động của cơ thể
                    hay qua giọng nói. Người dùng chỉ cần nói trước micro để bật chức năng điều khiển
                    hoặc chỉ tay để tăng giảm âm lượng...
                </p>
            </div>
            <div class="clear">
            </div>
        </li>
        <li class="b bgwt">
            <div class="previewimage left">
                <center>
                    <img src="media/upload/product1.jpg" alt="title new"></center>
            </div>
            <div class="previewcontent left">
                <span class="postday btlr">20/01/2012</span>
                <p class="title">
                    <a href="viewnews.htm" title="Samsung mang loạt sản phẩm 'hot' từ CES 2012 về VNs">Samsung
                        mang loạt sản phẩm 'hot' từ CES 2012 về VN</a></p>
                <p class="content">
                    Hãng này sẽ phân phối ra thị trường Việt Nam TV thông minh dùng chip lõi kép, ultrabook
                    Seires 5, Series 9… được giới thiệu tại triển lãm CES vừa diễn ra ở Las Vegas (Mỹ).Đáng
                    chú ý trong đó có TV LED ES8000 với thiết kế chân đế hình chữ U độc đáo, dày chỉ
                    vài mm cùng đường viền siêu mỏng. Sản phẩm tích hợp bộ vi xử lý lõi kép đầu tiên
                    cho phép vừa lướt web và tải ứng dụng trên mạng.Ngoài ra TV này còn được trang bị
                    một camera HD và microphone kép để hỗ trợ công nghệ tương tác thông minh (Smart
                    Interaction), cho phép con người điều chỉnh nó từ xa bằng chuyển động của cơ thể
                    hay qua giọng nói. Người dùng chỉ cần nói trước micro để bật chức năng điều khiển
                    hoặc chỉ tay để tăng giảm âm lượng...
                </p>
            </div>
            <div class="clear">
            </div>
        </li>
        <li class="b bgwt">
            <div class="previewimage left">
                <center>
                    <img src="media/upload/product1.jpg" alt="title new"></center>
            </div>
            <div class="previewcontent left">
                <span class="postday btlr">20/01/2012</span>
                <p class="title">
                    <a href="viewnews.htm" title="Samsung mang loạt sản phẩm 'hot' từ CES 2012 về VNs">Samsung
                        mang loạt sản phẩm 'hot' từ CES 2012 về VN</a></p>
                <p class="content">
                    Hãng này sẽ phân phối ra thị trường Việt Nam TV thông minh dùng chip lõi kép, ultrabook
                    Seires 5, Series 9… được giới thiệu tại triển lãm CES vừa diễn ra ở Las Vegas (Mỹ).Đáng
                    chú ý trong đó có TV LED ES8000 với thiết kế chân đế hình chữ U độc đáo, dày chỉ
                    vài mm cùng đường viền siêu mỏng. Sản phẩm tích hợp bộ vi xử lý lõi kép đầu tiên
                    cho phép vừa lướt web và tải ứng dụng trên mạng.Ngoài ra TV này còn được trang bị
                    một camera HD và microphone kép để hỗ trợ công nghệ tương tác thông minh (Smart
                    Interaction), cho phép con người điều chỉnh nó từ xa bằng chuyển động của cơ thể
                    hay qua giọng nói. Người dùng chỉ cần nói trước micro để bật chức năng điều khiển
                    hoặc chỉ tay để tăng giảm âm lượng...
                </p>
            </div>
            <div class="clear">
            </div>
        </li>
        <li class="b bgwt">
            <div class="previewimage left">
                <center>
                    <img src="media/upload/product1.jpg" alt="title new"></center>
            </div>
            <div class="previewcontent left">
                <span class="postday btlr">20/01/2012</span>
                <p class="title">
                    <a href="viewnews.htm" title="Samsung mang loạt sản phẩm 'hot' từ CES 2012 về VNs">Samsung
                        mang loạt sản phẩm 'hot' từ CES 2012 về VN</a></p>
                <p class="content">
                    Hãng này sẽ phân phối ra thị trường Việt Nam TV thông minh dùng chip lõi kép, ultrabook
                    Seires 5, Series 9… được giới thiệu tại triển lãm CES vừa diễn ra ở Las Vegas (Mỹ).Đáng
                    chú ý trong đó có TV LED ES8000 với thiết kế chân đế hình chữ U độc đáo, dày chỉ
                    vài mm cùng đường viền siêu mỏng. Sản phẩm tích hợp bộ vi xử lý lõi kép đầu tiên
                    cho phép vừa lướt web và tải ứng dụng trên mạng.Ngoài ra TV này còn được trang bị
                    một camera HD và microphone kép để hỗ trợ công nghệ tương tác thông minh (Smart
                    Interaction), cho phép con người điều chỉnh nó từ xa bằng chuyển động của cơ thể
                    hay qua giọng nói. Người dùng chỉ cần nói trước micro để bật chức năng điều khiển
                    hoặc chỉ tay để tăng giảm âm lượng...
                </p>
            </div>
            <div class="clear">
            </div>
        </li>
        <li class="b bgwt">
            <div class="previewimage left">
                <center>
                    <img src="media/upload/product1.jpg" alt="title new"></center>
            </div>
            <div class="previewcontent left">
                <span class="postday btlr">20/01/2012</span>
                <p class="title">
                    <a href="viewnews.htm" title="Samsung mang loạt sản phẩm 'hot' từ CES 2012 về VNs">Samsung
                        mang loạt sản phẩm 'hot' từ CES 2012 về VN</a></p>
                <p class="content">
                    Hãng này sẽ phân phối ra thị trường Việt Nam TV thông minh dùng chip lõi kép, ultrabook
                    Seires 5, Series 9… được giới thiệu tại triển lãm CES vừa diễn ra ở Las Vegas (Mỹ).Đáng
                    chú ý trong đó có TV LED ES8000 với thiết kế chân đế hình chữ U độc đáo, dày chỉ
                    vài mm cùng đường viền siêu mỏng. Sản phẩm tích hợp bộ vi xử lý lõi kép đầu tiên
                    cho phép vừa lướt web và tải ứng dụng trên mạng.Ngoài ra TV này còn được trang bị
                    một camera HD và microphone kép để hỗ trợ công nghệ tương tác thông minh (Smart
                    Interaction), cho phép con người điều chỉnh nó từ xa bằng chuyển động của cơ thể
                    hay qua giọng nói. Người dùng chỉ cần nói trước micro để bật chức năng điều khiển
                    hoặc chỉ tay để tăng giảm âm lượng...
                </p>
            </div>
            <div class="clear">
            </div>
        </li>
        <li class="b bgwt">
            <div class="previewimage left">
                <center>
                    <img src="media/upload/product1.jpg" alt="title new"></center>
            </div>
            <div class="previewcontent left">
                <span class="postday btlr">20/01/2012</span>
                <p class="title">
                    <a href="viewnews.htm" title="Samsung mang loạt sản phẩm 'hot' từ CES 2012 về VNs">Samsung
                        mang loạt sản phẩm 'hot' từ CES 2012 về VN</a></p>
                <p class="content">
                    Hãng này sẽ phân phối ra thị trường Việt Nam TV thông minh dùng chip lõi kép, ultrabook
                    Seires 5, Series 9… được giới thiệu tại triển lãm CES vừa diễn ra ở Las Vegas (Mỹ).Đáng
                    chú ý trong đó có TV LED ES8000 với thiết kế chân đế hình chữ U độc đáo, dày chỉ
                    vài mm cùng đường viền siêu mỏng. Sản phẩm tích hợp bộ vi xử lý lõi kép đầu tiên
                    cho phép vừa lướt web và tải ứng dụng trên mạng.Ngoài ra TV này còn được trang bị
                    một camera HD và microphone kép để hỗ trợ công nghệ tương tác thông minh (Smart
                    Interaction), cho phép con người điều chỉnh nó từ xa bằng chuyển động của cơ thể
                    hay qua giọng nói. Người dùng chỉ cần nói trước micro để bật chức năng điều khiển
                    hoặc chỉ tay để tăng giảm âm lượng...
                </p>
            </div>
            <div class="clear">
            </div>
        </li>
        <li class="b bgwt">
            <div class="previewimage left">
                <center>
                    <img src="media/upload/product1.jpg" alt="title new"></center>
            </div>
            <div class="previewcontent left">
                <span class="postday btlr">20/01/2012</span>
                <p class="title">
                    <a href="viewnews.htm" title="Samsung mang loạt sản phẩm 'hot' từ CES 2012 về VNs">Samsung
                        mang loạt sản phẩm 'hot' từ CES 2012 về VN</a></p>
                <p class="content">
                    Hãng này sẽ phân phối ra thị trường Việt Nam TV thông minh dùng chip lõi kép, ultrabook
                    Seires 5, Series 9… được giới thiệu tại triển lãm CES vừa diễn ra ở Las Vegas (Mỹ).Đáng
                    chú ý trong đó có TV LED ES8000 với thiết kế chân đế hình chữ U độc đáo, dày chỉ
                    vài mm cùng đường viền siêu mỏng. Sản phẩm tích hợp bộ vi xử lý lõi kép đầu tiên
                    cho phép vừa lướt web và tải ứng dụng trên mạng.Ngoài ra TV này còn được trang bị
                    một camera HD và microphone kép để hỗ trợ công nghệ tương tác thông minh (Smart
                    Interaction), cho phép con người điều chỉnh nó từ xa bằng chuyển động của cơ thể
                    hay qua giọng nói. Người dùng chỉ cần nói trước micro để bật chức năng điều khiển
                    hoặc chỉ tay để tăng giảm âm lượng...
                </p>
            </div>
            <div class="clear">
            </div>
        </li>
        <li class="b bgwt">
            <div class="previewimage left">
                <center>
                    <img src="media/upload/product1.jpg" alt="title new"></center>
            </div>
            <div class="previewcontent left">
                <span class="postday btlr">20/01/2012</span>
                <p class="title">
                    <a href="viewnews.htm" title="Samsung mang loạt sản phẩm 'hot' từ CES 2012 về VNs">Samsung
                        mang loạt sản phẩm 'hot' từ CES 2012 về VN</a></p>
                <p class="content">
                    Hãng này sẽ phân phối ra thị trường Việt Nam TV thông minh dùng chip lõi kép, ultrabook
                    Seires 5, Series 9… được giới thiệu tại triển lãm CES vừa diễn ra ở Las Vegas (Mỹ).Đáng
                    chú ý trong đó có TV LED ES8000 với thiết kế chân đế hình chữ U độc đáo, dày chỉ
                    vài mm cùng đường viền siêu mỏng. Sản phẩm tích hợp bộ vi xử lý lõi kép đầu tiên
                    cho phép vừa lướt web và tải ứng dụng trên mạng.Ngoài ra TV này còn được trang bị
                    một camera HD và microphone kép để hỗ trợ công nghệ tương tác thông minh (Smart
                    Interaction), cho phép con người điều chỉnh nó từ xa bằng chuyển động của cơ thể
                    hay qua giọng nói. Người dùng chỉ cần nói trước micro để bật chức năng điều khiển
                    hoặc chỉ tay để tăng giảm âm lượng...
                </p>
            </div>
            <div class="clear">
            </div>
        </li>
        <li class="b bgwt">
            <div class="previewimage left">
                <center>
                    <img src="media/upload/product1.jpg" alt="title new"></center>
            </div>
            <div class="previewcontent left">
                <span class="postday btlr">20/01/2012</span>
                <p class="title">
                    <a href="viewnews.htm" title="Samsung mang loạt sản phẩm 'hot' từ CES 2012 về VNs">Samsung
                        mang loạt sản phẩm 'hot' từ CES 2012 về VN</a></p>
                <p class="content">
                    Hãng này sẽ phân phối ra thị trường Việt Nam TV thông minh dùng chip lõi kép, ultrabook
                    Seires 5, Series 9… được giới thiệu tại triển lãm CES vừa diễn ra ở Las Vegas (Mỹ).Đáng
                    chú ý trong đó có TV LED ES8000 với thiết kế chân đế hình chữ U độc đáo, dày chỉ
                    vài mm cùng đường viền siêu mỏng. Sản phẩm tích hợp bộ vi xử lý lõi kép đầu tiên
                    cho phép vừa lướt web và tải ứng dụng trên mạng.Ngoài ra TV này còn được trang bị
                    một camera HD và microphone kép để hỗ trợ công nghệ tương tác thông minh (Smart
                    Interaction), cho phép con người điều chỉnh nó từ xa bằng chuyển động của cơ thể
                    hay qua giọng nói. Người dùng chỉ cần nói trước micro để bật chức năng điều khiển
                    hoặc chỉ tay để tăng giảm âm lượng...
                </p>
            </div>
            <div class="clear">
            </div>
        </li>
        <li class="b bgwt">
            <div class="previewimage left">
                <center>
                    <img src="media/upload/product1.jpg" alt="title new"></center>
            </div>
            <div class="previewcontent left">
                <span class="postday btlr">20/01/2012</span>
                <p class="title">
                    <a href="viewnews.htm" title="Samsung mang loạt sản phẩm 'hot' từ CES 2012 về VNs">Samsung
                        mang loạt sản phẩm 'hot' từ CES 2012 về VN</a></p>
                <p class="content">
                    Hãng này sẽ phân phối ra thị trường Việt Nam TV thông minh dùng chip lõi kép, ultrabook
                    Seires 5, Series 9… được giới thiệu tại triển lãm CES vừa diễn ra ở Las Vegas (Mỹ).Đáng
                    chú ý trong đó có TV LED ES8000 với thiết kế chân đế hình chữ U độc đáo, dày chỉ
                    vài mm cùng đường viền siêu mỏng. Sản phẩm tích hợp bộ vi xử lý lõi kép đầu tiên
                    cho phép vừa lướt web và tải ứng dụng trên mạng.Ngoài ra TV này còn được trang bị
                    một camera HD và microphone kép để hỗ trợ công nghệ tương tác thông minh (Smart
                    Interaction), cho phép con người điều chỉnh nó từ xa bằng chuyển động của cơ thể
                    hay qua giọng nói. Người dùng chỉ cần nói trước micro để bật chức năng điều khiển
                    hoặc chỉ tay để tăng giảm âm lượng...
                </p>
            </div>
            <div class="clear">
            </div>
        </li>
    </ul>
    <div class="Apages right">
        <a href="#1" class="active" ref="1">1</a> <a href="#2" ref="2">2</a> <a href="#3"
            ref="3">3</a> <a href="#4" ref="4">4</a> <a href="#5" ref="5">5</a> <a href="#0"
                ref="0">All</a>
    </div>
</asp:Content>
