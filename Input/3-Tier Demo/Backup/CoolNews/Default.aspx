<%@ Page Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" Title=".:: CoolNews ::." %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceLeft" Runat="Server">
    <div class="" style="width:200px;"> 
    </div>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceMain" Runat="Server">
<asp:Panel ID="PanelCategory" runat="server">
<asp:DataList RepeatDirection="Horizontal" RepeatColumns="2" RepeatLayout="Table" ItemStyle-VerticalAlign="Top" ID="dataListGetNewsData" Width="100%" runat="server" DataSourceID="ObjectDataSourceGetNewsCatID">                
<ItemTemplate> 
    <table width="100%">
    <tr>
        <td class="tdBlockBannerLeftBorder">
            <asp:HyperLink ID="hyperLinkNewsCourseCategory" runat="server" NavigateUrl='<%# "~/Category/?ID="+Eval("ID") %>'><%#Eval("Name")%></asp:HyperLink></td>                    
    </tr>
    <tr>
        <td class="tdBlockContentLeft">
        <asp:Label ID="lblCatIDSelected" runat="server" Text='<%#Eval("ID")%>' Visible="false"></asp:Label>
        <asp:DataList Width="100%" ItemStyle-Width="100%" ItemStyle-Wrap="true" ID="dataListNewsTopInCategory" runat="server" DataSourceID="ObjectDataSourceNewsTopInCategory">
        <ItemTemplate>                                                          
            <table border="0" width="100%">
                <tr>
                    <td align="left" valign="top" style=" width:100%;">
                        <asp:HyperLink ID="hyperLinkNewsCourseCategory" runat="server" NavigateUrl='<%# "~/News/?ID="+Eval("ID") %>'>               
                            <asp:Image ID="Image1" SkinID="imageThumbLeft" Width="70" Height="70" runat="server" Visible='<%# Eval("Picture").ToString().Trim()!=""%>' ImageUrl='<%# "~/NewsData/" + Eval("Picture").ToString() + "_thumb.jpg" %>' />
                        </asp:HyperLink>  
                        <asp:HyperLink ID="hyperLink1" runat="server" NavigateUrl='<%# "~/News/?ID="+Eval("ID") %>'>               
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("Title") %>' Font-Bold="true"></asp:Label>
                        </asp:HyperLink>  
                        <asp:Label ID="Label3" SkinID="lblDateTime" runat="server" Text='<%# " - " + System.DateTime.Parse(Eval("CreationTime").ToString()).ToShortDateString() %>'></asp:Label>
                        <br />
                        <div style=" text-align:justify">
                        <asp:Label ID="Label4" runat="server" Text='<%#Eval("Excerpt") %>'></asp:Label>
                        </div>
                    </td>                                    
                </tr>                                
            </table>                            
        </ItemTemplate>                
        </asp:DataList> 
        <asp:ObjectDataSource ID="ObjectDataSourceNewsTopInCategory" runat="server" SelectMethod="GetNewsTopOfCategory" TypeName="CoolNews.Business.NewsService" >
            <SelectParameters>
            <asp:ControlParameter ControlID="lblCatIDSelected" Name="CatID" PropertyName="Text" Type="Int64" />
            </SelectParameters>
        </asp:ObjectDataSource>                    
        <asp:DataList ItemStyle-Width="100%" ID="dataListNewsTopNewInCategory" Width="100%" runat="server" DataSourceID="ObjectDataSourceNewsTopNewInCategory">
        <ItemTemplate>
        <div style="text-align:left; padding-left:6px;"  >                                                       
            <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/dot.gif" />
            <asp:HyperLink ID="hyperLink19" ToolTip='<%#Eval("Title")%>' runat="server" NavigateUrl='<%# "~/News/?ID="+Eval("ID") %>'>               
                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Title") %>'></asp:Label>
                <asp:Label ID="LabelTimeDate1" runat="server" Text='<%# " (" + System.DateTime.Parse(Eval("CreationTime").ToString()).ToShortDateString() + ")" %>' SkinID="lblDateTime"></asp:Label>
            </asp:HyperLink>
        </div>
        </ItemTemplate>                
        </asp:DataList> 
        <asp:ObjectDataSource ID="ObjectDataSourceNewsTopNewInCategory" runat="server" SelectMethod="GetNewsTopNewInCategoryByCatID" TypeName="CoolNews.Business.NewsService" >
            <SelectParameters>
                <asp:ControlParameter ControlID="lblCatIDSelected" Name="CatID" PropertyName="Text" Type="Int64" />               
            </SelectParameters>
        </asp:ObjectDataSource>
        <div style="text-align:left; padding-bottom:6px;"></div>
        </td>
    </tr>
    </table>  
    <br />
</ItemTemplate>
</asp:DataList>
<asp:ObjectDataSource ID="ObjectDataSourceGetNewsCatID"  SelectMethod="GetCategories" TypeName="CoolNews.Business.CategoryService" runat="server" >
</asp:ObjectDataSource> 
</asp:Panel>
</asp:Content>
<script runat="server">
    
    protected void Page_PreInit(object sender, EventArgs e)
    {
        if (Session["Theme"].ToString() != "")
        {
            Page.Theme = Session["Theme"].ToString();
        }
    }
    
</script>