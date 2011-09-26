<%@ Page Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" Title=".:: News Show ::." %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceLeft" Runat="Server">
    <div style="width:200px">
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceMain" Runat="Server">
<asp:Panel ID="PanelNews" runat="server">
<asp:DataList ID="DataListGetNewsByID" runat="server" DataSourceID="ObjectDataSourceNewsGetByID">
<ItemTemplate>
    <table border="0" cellpadding="0" cellspacing="6" width="100%">
        <tr>
            <td style="text-align:left; vertical-align:top">
            <asp:Label ID="lblNewsIDSelected" runat="server" Text='<%#Eval("ID")%>' Visible="false"></asp:Label>
            <asp:Label ID="lblHeader" runat="server" Text='<%# Eval("Title") %>' Font-Bold="true" Font-Size="Small" ></asp:Label>
            <asp:Label ID="Label3" runat="server" Text='<%# " - " + System.DateTime.Parse(Eval("CreationTime").ToString()).ToShortDateString() %>' SkinID="lblDateTime"></asp:Label>
            <br />
            </td>                    
        </tr>
        <tr>
            <td style="text-align:justify; vertical-align:top">
                <asp:Image SkinID="imageThumbLeft" Width="180" ID="Image1" runat="server" Visible='<%# Eval("Picture").ToString().Trim()!=""%>' ImageUrl='<%# "~/NewsData/" + Eval("Picture").ToString() %>' />
                <asp:Label ID="lblMota" runat="server" Text='<%#Eval("Excerpt") %>' Font-Bold="true"></asp:Label>                    
            </td>
        </tr>
        <tr>
            <td style="text-align:justify; vertical-align:top">
            <asp:Label ID="lblNoidung" runat="server" Text='<%# Eval("Body") %>'></asp:Label>
            </td>
        </tr>
    </table>
    <hr />
    <div style="text-align:left; padding-left:10px;"> 
        <asp:HyperLink ID="lblCatIDSelected" runat="server" Text="Quay về danh mục cha" Font-Bold="true" NavigateUrl='<%#"~/Category/?ID=" + Eval("CatID")%>' >
        </asp:HyperLink>
    </div>
</ItemTemplate>
</asp:DataList>
<asp:ObjectDataSource ID="ObjectDataSourceNewsGetByID" runat="server" SelectMethod="GetNewsByID" TypeName="CoolNews.Business.NewsService">
    <SelectParameters>
        <asp:QueryStringParameter Name="ID" QueryStringField="ID" Type="Int64" />       
    </SelectParameters>
</asp:ObjectDataSource>
<br />
</asp:Panel>
</asp:Content>

