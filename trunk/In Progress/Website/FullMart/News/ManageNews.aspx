<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ManageNews.aspx.cs" Inherits="FullMart.ManageNews" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Right" runat="server">
    <div class="acontent block"><a href="CreateNews.aspx"><img src="/themes/images/upload.png" /></a>
    <div class="acontent b block">
        <p class="atitle">
            Manager News</p>
        <div class="MNews">
            <table cellpadding="0" cellspacing="0">
                <thead>
                    <tr>
                        <th>
                            ID
                        </th>
                        <th>
                            News title
                        </th>
                        <th>
                            Post date
                        </th>
                        <th>
                            Poster
                        </th>
                    </tr>
                    
                </thead>
                <tbody>
                    <asp:Repeater ID="rpNewsList" runat="server" DataSourceID="dsNewsList">
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <div class="cmdUser">
                                        <a href="/viewNews.aspx?ID=<%# Eval("ID") %>" target="_blank">
                                            <button class="Uview left">
                                            </button>
                                        </a><a href="editp.aspx?id=<%# Eval("ID") %>" target="_blank">
                                            <button class="Uedit left">
                                            </button>
                                        </a>
                                        <button class="Udelete left">
                                        </button>
                                        <div class="clear">
                                        </div>
                                    </div>
                                    <%# Eval("ID") %>
                                </td>
                                <td>
                                    <a href="/viewNews.aspx?ID=<%# Eval("ID") %>" target="_Blank">
                                        <%# Eval("Title") %></a>
                                </td>
                                <td>
                                    <%# Eval("CREATEDATE") %>
                                </td>
                                <td>
                                    <%# Eval("Poster") %>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
               
                    <asp:SqlDataSource ID="dsNewsList" runat="server" ConnectionString="<%$ ConnectionStrings:FullMartConnectionString %>"
                        SelectCommandType="StoredProcedure" SelectCommand="GetAllNews"></asp:SqlDataSource>
                </tbody>
            </table>

        </div>
        
        <div class="clear">
        </div>
    </div>

    <div id="cfdeleten">
        <p><center>Do you want to delete New : <span></span> ?</center></p>
        <input type="hidden" />
        <center><button>Yes</button><button>No</button></center>
      </div>
    </div>
</asp:Content>
