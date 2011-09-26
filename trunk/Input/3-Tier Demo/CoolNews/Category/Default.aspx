<%@ Page Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" Title=".:: News Category ::." %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceLeft" Runat="Server">
    <div class="" style="width:200px;"> 
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceMain" Runat="Server">
<%
    CoolNews.Entities.Category cat = CoolNews.Business.CategoryService.GetCategoryByID(Convert.ToInt64(Request.QueryString["ID"]));
    hyperLinkNewsCategory.Text=cat.Name;
%>
<table width="100%">
    <tr>
        <td class="tdBlockBannerLeftBorder">
            <asp:HyperLink ID="hyperLinkNewsCategory" runat="server" ></asp:HyperLink>
        </td>                    
   </tr>
    <tr>
        <td class="tdBlockContentLeft">
        <asp:GridView PageSize="10" runat="server" ShowFooter="false" ShowHeader="false" GridLines="None" AllowPaging="true" AutoGenerateColumns="false" DataSourceID="ObjectDataSourceNewsTopInCategory">
         <Columns>
         <asp:TemplateField>        
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
        </asp:TemplateField>    
        </Columns>           
        </asp:GridView> 
        <asp:ObjectDataSource ID="ObjectDataSourceNewsTopInCategory" runat="server" SelectMethod="GetNewsOfCategory" TypeName="CoolNews.Business.NewsService" >
            <SelectParameters>
            <asp:QueryStringParameter Name="CatID" QueryStringField="ID" Type="Int64" />
            </SelectParameters>
        </asp:ObjectDataSource>                    
        
        <div style="text-align:left; padding-bottom:6px;"></div>
        </td>
    </tr>
    </table>  
    <br /> 
</asp:Content>

