<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MNews.Models.HomeViewModel>" %>
<%@ Import Namespace="MNews.Helpers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Công Ty Cổ Phần MON - MON JSC
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script src="/Scripts/jquery.easing.1.3.js" type="text/javascript"></script>
    <script src="/Scripts/jquery.bxSlider.min.js" type="text/javascript"></script>
    <script src="/Scripts/home.js" type="text/javascript"></script>
    <div id='mleft'>
        <div id='mslider'>
            <div id='slidercontent'>
                <%
                    if (Model.Sliders != null && Model.Sliders.Count > 0)
                    {
                        foreach (var item in Model.Sliders)
                        {    
                %>
                <div>
                    <%= Html.Decode(item.scontent) %></div>
                <%
                    }
                }
                %>
            </div>
        </div>
        <div id='mslide'>
            <%
                if (Model.Slides != null && Model.Slides.Count > 0)
                {
            %>
            <ul>
                <%
                    foreach (var item in Model.Slides)
                    {    
                %>
                <li><a href='<%= item.slLink %>' title='<%= item.slText %>'>
                    <center>
                        <img src='<%= item.slImage %>' alt='<%= item.slText %>' />
                        <p>
                            <%= item.slText %></p>
                    </center>
                </a></li>
                <%
                    }
                %>
            </ul>
            <%
                }
            %>
        </div>
        <div id='mlistitem'>
            <%
                if (Model.Collumns != null && Model.Collumns.Count > 0)
                {    
            %>
            <table id='list-item'>
                <tr>
                    <%    
                        foreach (var item in Model.TitleCollumns)
                        {    
                    %>
                    <th>
                        <%=item %>
                    </th>
                    <%
                        }   
                    %>
                </tr>
                <tr>
                    <%    
                        foreach (string title in Model.TitleCollumns)
                        {
                    %>
                    <td valign="top">
                        <%
                            foreach (var item in Model.Collumns)
                            {
                                if (item.cCo == title)
                                {
                        %>
                        <a href='<%= item.cLink %>' target='_blank'>
                            <%= item.cText%></a>
                        <%
                            }
                            }
                        %>
                    </td>
                    <%

                        }
                    %>
                </tr>
            </table>
            <%     
                }
            %>
        </div>
        <div id='msupport'>
            <% using (Html.BeginForm("RegContact", "Home", FormMethod.Post))
               { %>
            <div id='mstext'>
                <textarea id="mscontent" name="cContent" cols="20" rows="10"></textarea>
            </div>
            <div id='msinfo'>
                <input id="msemail" name="cEmail" value='Nhập Email' type="text" />
                <input id="mstel" name="cTel" type="text" value='Nhập số điện thoại' />
                <p id='very'>
                    Abj</p>
                <input id="msvery" type="text" value='Nhập mã xác nhận' />
                <input id="mspost" type="submit" value="Gửi" />
            </div>
            <% } %>
        </div>
    </div>
    <div id='mright'>
        <div id='mlog'>
        <!--
            <% Html.RenderPartial("LogOnUserControl");%>
        -->
            <a href='http://news.mon.com.vn/login.aspx' title='login'><img style='float: right;width: 150px;'  src="/images/login.png" /></a><a href='http://news.mon.com.vn/?r=1' title='Đăng Ký'><img style='float: right;width: 150px;'  src="/images/join.png" /></a>
        </div>
        <div id='mnews'>
            <span>Tin tức</span>
            <% 
                if (Model.News != null && Model.News.Count > 0)
                {
            %>
            <ol class="list-news ">
                <%
                    foreach (var item in Model.News)
                    {
                %>
                <li><a title="<%= item.ntitle %>" href="/New/Details/<%= item.nID %>">
                    <%= item.ntitle%></a> </li>
                <%
                    }
                %>
            </ol>
            <%
                }
            %>
        </div>
        <div id='mlistbanner'>
            <%
                if (Model.Banners != null && Model.Banners.Count > 0)
                {
                    foreach (var item in Model.Banners)
                    {    
            %>
            <a href='<%= item.bLink %> ' title='<%= item.bTitle %>'>
                <%= Html.Decode(item.bContent) %>
            </a>
            <%
                }
                }
            %>
        </div>
    </div>
</asp:Content>
