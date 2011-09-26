<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" ValidateRequest="false" Title=".:: Admin Control ::." %>
<%@ Register TagPrefix="FTB" Namespace="FreeTextBoxControls" Assembly="FreeTextBox" %>
<%@ Import Namespace="System.IO" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceMain" Runat="Server">

<asp:Panel ID="panelNewsControl" runat="server">      
    <table class="tblBlockMain">
    <tr>
        <td class="tdBlockBannerLeft">
            <div style="position:relative;float:left;text-align:left;">
                <asp:Label ID="lblBlockBannerCenter" runat="server">Bảng điều khiển</asp:Label>
            </div>
            <div style="text-align:right;padding-right:9px" >
                <asp:Label ID="lblUnit" runat="server"></asp:Label>
            </div>
        </td>                    
    </tr>
    <tr>
        <td class="tdBlockContentCenter">     
           <div style=" padding:9px">
                <table border="0" cellspacing="3" cellpadding="0" style="border:0px; width:100%">
				<tr>
				    <td style="width:20%;" align="center">
				        <table border="0"><tr>
				        <td align="center" onmouseover="this.style.background='#AAFFAA'" onmouseout="this.style.background='#EEEEEE'">
				        <asp:HyperLink ID="hyperLink2" runat="server" Font-Bold="true" NavigateUrl="~/Admin/" >
                            <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/NewsFocus.gif" style="border:0px solid #999999" />
				        </asp:HyperLink>
				        </td>
				        </tr></table>
				    </td>
				    <td style="width:20%;" align="center">
				        <table border="0"><tr>
				        <td align="center" onmouseover="this.style.background='#AAFFAA'" onmouseout="this.style.background='#EEEEEE'">
				        <asp:HyperLink ID="hyperLink3" runat="server" Font-Bold="true" NavigateUrl="~/Admin/?Action=CreateNews" >
                            <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/CreateNews.gif" style="border:0px solid #999999" />
				        </asp:HyperLink>
				        </td>
				        </tr></table>
				    </td>
				    <td style="width:20%;" align="center">
				        <table border="0"><tr>
				        <td align="center" onmouseover="this.style.background='#AAFFAA'" onmouseout="this.style.background='#EEEEEE'">
				        <asp:HyperLink ID="hyperLink1" runat="server" Font-Bold="true" NavigateUrl="~/Admin/?Action=CreateCategory" >
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/CreateCategory.gif" style="border:0px solid #999999" />
				        </asp:HyperLink>
				        </td>
				        </tr></table>
				    </td>
				    <td style="width:20%;" align="center">
				        <table border="0"><tr>
				        <td align="center" onmouseover="this.style.background='#AAFFAA'" onmouseout="this.style.background='#EEEEEE'">
				        <a href="">
                            <asp:Image ID="Image4" runat="server" ImageUrl="~/Images/EventNews.gif" style="border:0px solid #999999" />
				        </a></td>
				        </tr></table>
				    </td>
				    <td style="width:20%;" align="center">
				        <table border="0"><tr>
				        <td align="center" onmouseover="this.style.background='#AAFFAA'" onmouseout="this.style.background='#EEEEEE'">
				        <a href="">
                            <asp:Image ID="Image5" runat="server" ImageUrl="~/Images/ConfigNews.gif" style="border:0px solid #999999" />
				        </a></td>
				        </tr></table>
				    </td>
				    
				</tr>
				<tr>
				    <td align="center" nowrap="nowrap">
				        <asp:HyperLink ID="hyperLinkNewsFocus" runat="server" Font-Bold="true" NavigateUrl="~/Admin/">Quản lý tin tức</asp:HyperLink>
				    </td>
				    <td align="center" nowrap="nowrap">
				        <asp:HyperLink ID="hyperLinkCreateNews" runat="server" Font-Bold="true" NavigateUrl="~/Admin/?Action=CreateNews" >Tạo bản tin</asp:HyperLink>
				    </td>
				    <td align="center" nowrap="nowrap">
				        <asp:HyperLink ID="hyperLinkCreateCategory" runat="server" Font-Bold="true" NavigateUrl="~/Admin/?Action=CreateCategory" >Tạo danh mục</asp:HyperLink>
				    </td>
				    <td align="center" nowrap="nowrap">
				        <asp:HyperLink ID="hyperLinkEventNews" runat="server" Font-Bold="true">Sự kiện</asp:HyperLink>
				    </td>
				    <td align="center" nowrap="nowrap">
				        <asp:HyperLink ID="hyperLinkConfigNews" runat="server" Font-Bold="true">Cấu hình</asp:HyperLink>
				    </td>
				    				   
				    
				</tr>
				</table>
           </div>
        </td>
    </tr>
    </table>
    <br /> 
</asp:Panel>

<asp:Panel ID="PanelNewsCreated" runat="server">  
    <asp:DataList Width="100%" ID="DataList1" runat="server" DataSourceID="ObjectDataSourceGetCategory">
    <ItemTemplate>
        <table class="tblBlockMain">
        <tr>
            <td class="tdBlockBannerLeft" style="vertical-align:middle; padding-top:6px">                
                <div style="position:relative;padding-left:9px; float:left;text-align:left;">
                  <asp:Label ID="lblTenDanhmuc" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                </div>
                <div style="text-align:right;padding-right:9px; vertical-align:middle;" >
                    <asp:HyperLink ID="HyperLinkEdit" runat="server" Font-Bold="true" NavigateUrl='<%# "~/Admin/?Action=EditCategory&CatID=" + Eval("ID") %>'>
                        <asp:Image ID="ImageEdit" ToolTip="Sứa danh mục" runat="server" ImageUrl="~/Images/edit.gif" />
                    </asp:HyperLink>
                    <asp:HyperLink ID="HyperLinkelete" runat="server" Font-Bold="true" NavigateUrl='<%# "~/Admin/?Action=DeleteCategory&ID=" + Eval("ID") %>'>
                        <asp:Image ID="ImageDelete" ToolTip="Xóa danh mục" runat="server" ImageUrl="~/Images/delete.gif" />
                    </asp:HyperLink>
                </div>
            </td>                    
           
        </tr>
        <tr>
            <td class="tdBlockContentCenter">     
               <div style=" padding:9px">
               <asp:label ID="NewsCatID" Text='<%# Eval("ID") %>' Visible="false" runat="server"></asp:label>
                    <asp:GridView ID="GridView1" CellPadding="6" Width="100%" runat="server" GridLines="Both"  AutoGenerateColumns="false" AllowPaging="true" PageSize="20" DataSourceID="ObjectDataSourceAllNewsInCategory">
                        <Columns>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                <asp:Label ID="Label3" runat="server" Text="ID"></asp:Label>                   
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblNewsID" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                            </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <Columns>
                            <asp:TemplateField ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle">
                                <HeaderTemplate>
                                <asp:Label ID="Label3" runat="server" Text="Tiêu đề"></asp:Label>                   
                            </HeaderTemplate>
                            <ItemTemplate>
                            <asp:HyperLink ID="hyperLink1" runat="server" NavigateUrl='<%# "~/?ID="+Eval("ID") %>'>               
                                <asp:Label ID="lblTieude" runat="server" Text='<%# Eval("Title") %>'></asp:Label>
                                <asp:Label ID="Label7" runat="server" Text='<%# " - " + Convert.ToDateTime(Eval("CreationTime")).ToShortDateString() %>' SkinID="lblDateTime"></asp:Label>                            
                            </asp:HyperLink>
                            </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>                        
                        <Columns>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                <asp:Label ID="Label3" runat="server" Text="Ngày sửa"></asp:Label>                   
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblThoidiemchinhsua" runat="server" Text='<%# Eval("LastModification") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>                              
                        <Columns>
                            <asp:TemplateField ItemStyle-Wrap="false">
                                <HeaderTemplate>
                                <asp:Label ID="Label3" runat="server" Text="Chức năng"></asp:Label>                   
                                </HeaderTemplate>
                                <ItemTemplate>                                
                                    <asp:HyperLink ID="HyperLinkEdit" runat="server" Font-Bold="true" NavigateUrl='<%# "~/Admin/?Action=EditNews&ID=" + Eval("ID") %>'>
                                        <asp:Image ID="ImageEdit" ToolTip="Sứa bản tin" runat="server" ImageUrl="~/Images/edit.gif" />
                                    </asp:HyperLink>
                                    <asp:HyperLink ID="HyperLinkelete" runat="server" Font-Bold="true" NavigateUrl='<%# "~/Admin/?Action=DeleteNews&ID=" + Eval("ID") %>'>
                                        <asp:Image ID="ImageDelete" ToolTip="Xóa bản tin" runat="server" ImageUrl="~/Images/delete.gif" />
                                    </asp:HyperLink>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        
                   </asp:GridView>
               </div>
            </td>
        </tr>
            
        </table>     
        <br />
        <asp:ObjectDataSource ID="ObjectDataSourceAllNewsInCategory" runat="server" SelectMethod="GetNewsOfCategory"  TypeName="CoolNews.Business.NewsService">
            <SelectParameters>
                <asp:ControlParameter ControlID="NewsCatID" Name="CatID" PropertyName="Text" Type="Int64" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </ItemTemplate>
    </asp:DataList>      
    <asp:ObjectDataSource ID="ObjectDataSourceGetCategory" runat="server" TypeName="CoolNews.Business.CategoryService" SelectMethod="GetCategories" >
    </asp:ObjectDataSource>
</asp:Panel>

<asp:Panel ID="PanelCreateNews" runat="server" Visible="false">  
 <table class="tblBlockMain">
        <tr>
            <td class="tdBlockBannerLeft">
                <asp:Label ID="lblCreateEditNews" runat="server"></asp:Label>
            </td>                    
           
        </tr>
        <tr>
            <td class="tdBlockContentCenter">     
               <div style=" padding:9px">
                <table style="border-collapse:collapse;" cellspacing="0" cellpadding="3" width="100%">
                    <tr>
                        <td class="tdLeftTable">                        
                            <asp:Label ID="lblTieuDe" runat="server" Text="Tiêu đề"></asp:Label>
                        </td>
                        <td class="tdRightTable">
                            <asp:TextBox ID="txtTieuDe" runat="server" Width="350"></asp:TextBox>
                            <asp:Label ID="Label8" runat="server" Text="Label"></asp:Label>
                        </td>                                        
                    </tr>                              
                    <tr>
                        <td class="tdLeftTable">
                            <asp:Label ID="lblChude" runat="server" Text="Chủ đề"></asp:Label>
                        </td>
                        <td class="tdRightTable">
                            <asp:DropDownList ID="listChude" DataValueField="ID" DataTextField="Name"  runat="server" DataSourceID="ObjectDataSourceNewsCourseCat">
                            </asp:DropDownList>
                            <asp:ObjectDataSource ID="ObjectDataSourceNewsCourseCat" runat="server" SelectMethod="GetCategories" TypeName="CoolNews.Business.CategoryService" DataObjectTypeName="CoolNews.Business.Entities.Category" >
                            </asp:ObjectDataSource>
                            
                        </td>                                        
                    </tr>           
                    <tr>
                        <td class="tdLeftTable">
                            <asp:Label ID="lblMota" runat="server" Text="Phần mở đầu"></asp:Label>
                        </td>
                        <td class="tdRightTable">
                            <asp:TextBox ID="txtMota" runat="server" Width="350" Height="150" TextMode="MultiLine"></asp:TextBox>
                        </td>                                        
                    </tr>                              
                    <tr>
                        <td class="tdLeftTable">
                            <asp:Label ID="lblNoidung" runat="server" Text="Phần nội dung"></asp:Label>
                        </td>
                        <td class="tdRightTable">
                            <ftb:freetextbox runat="server" ID="txtNoiDung" StartMode="DesignMode"></ftb:freetextbox><br />
                        </td>                                        
                    </tr>                              
                    <tr>
                        <td class="tdLeftTable">
                            <asp:Label ID="lbl" runat="server" Text="Từ khóa"></asp:Label>
                        </td>
                        <td class="tdRightTable">
                            <asp:TextBox ID="txtTukhoa" runat="server" Width="300"></asp:TextBox>
                            <asp:Label ID="lblNhaptukhoa" runat="server" Text='VD: News, Tin tức, Việt Nam, ... ' SkinID="lblError"></asp:Label>
                        </td>                                        
                    </tr>                              
                    <tr>
                        <td class="tdLeftTable">
                            <asp:Label ID="lblHinhminhhoa" runat="server" Text="Hình minh họa"></asp:Label>
                        </td>
                        <td class="tdRightTable">
                            <asp:Panel ID="PanelHinhMinhHoa" runat="server">                            
                                <asp:Image id="imgCurrentAvatar" runat="server" ImageUrl="~/Images/NoImages.jpg"></asp:Image>
                                <br />
                                <asp:CheckBox ID="checkDel" runat="server" Text="Xóa hình minh họa" />
                                <br /><br />
                            </asp:Panel>
                            <input id="inputHinhMinhHoa" type="file" runat="server" />                                  
                        </td>                                        
                    </tr>               
                    <tr>
                        <td class="tdLeftTable">
                            <asp:Label ID="lblNguontin" runat="server" Text="Nguồn tin"></asp:Label>
                        </td>
                        <td class="tdRightTable">
                            <asp:TextBox ID="txtNguontin" runat="server"></asp:TextBox>
                        </td>                                        
                    </tr> 
                    <tr>
                        <td class="tdLeftTable">
                            
                        </td>
                        <td class="tdRightTable">
                        <div style="text-align:right; padding-right:15px">
                            <asp:Button ID="btnTaomoi" runat="server" Text="Tạo mới" OnClick="btnTaomoi_Click"/>
                            <asp:Button ID="btnLuuthaydoi" runat="server" Text="Lưu thay đổi" OnClick="btnLuuthaydoi_Click"/>                            
                        </div>
                        </td>                                        
                    </tr>
                </table>                
               </div>
            </td>           
        </tr>            
        </table>    
        <br /> 
</asp:Panel>

<asp:Panel ID="panelCreateCategory" runat="server" Visible="false">      
<table class="tblBlockMain">
<tr>
    <td class="tdBlockBannerCenter">
        <asp:Label ID="lblCreateCategory" runat="server"></asp:Label>
    </td>                    
</tr>
<tr>
    <td class="tdBlockContentCenter">     
       <div style=" padding:9px">
            <asp:Label ID="lblError" runat="server" SkinID="lblError"></asp:Label>
            <table style="border-collapse:collapse;" cellspacing="0" cellpadding="3" width="100%">
                <tr>
                    <td class="tdLeftTable">
                        <asp:Label ID="lblTendanhmuc" runat="server" Text="Tên danh mục"></asp:Label>
                    </td>
                    <td class="tdRightTable">
                        <asp:TextBox ID="txtTendanhmuc" runat="server"  Width="300"></asp:TextBox>
                    </td>                                        
                </tr>        
                <tr>
                    <td class="tdLeftTable">
                        <asp:Label ID="Label4" runat="server" Text="Mô tả"></asp:Label>
                    </td>
                    <td class="tdRightTable">
                        <asp:TextBox ID="txtMotadanhmuc" runat="server" TextMode="MultiLine" Height="150" Width="300"></asp:TextBox>
                    </td>                                        
                </tr>                  
                <tr>
                    <td class="tdLeftTable">
                        
                    </td>
                    <td class="tdRightTable">
                        <asp:Button ID="btnCreateNewsCourseCat" runat="server" Text="Tạo mới" OnClick="btnCreateNewsCourseCat_Click"/>
                        <asp:Button ID="btnEditNewsCourseCat" runat="server" Text="Lưu thay đổi" OnClick="btnEditNewsCourseCat_Click"/>
                        
                    </td>                                        
                </tr>                                                  
            </table>
       
       </div>
    </td>
</tr>
</table>
</asp:Panel>

</asp:Content>

<script runat="server">
    CoolNews.Entities.Category newsCat = new CoolNews.Entities.Category();
    CoolNews.Entities.News news = new CoolNews.Entities.News();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                PanelCreateNews.Visible = false;
                if (Request.QueryString["Action"] == "EditNews" || Request.QueryString["Action"] == "CreateNews" || Request.QueryString["Action"] == "DeleteNews")
                {
                    Load_Edit_Create_News(true, Request.QueryString["Action"]);
                    PanelNewsCreated.Visible = false;                   
                }
                else if (Request.QueryString["Action"] == "EditCategory" || Request.QueryString["Action"] == "CreateCategory" || Request.QueryString["Action"] == "DeleteCategory")
                {
                    PanelCreateNews.Visible = false;
                    PanelNewsCreated.Visible = false; 
                    Load_CreateNewsCategories(true, Request.QueryString["Action"]);                            
                }

            }
            catch (FormatException)
            {
                Response.Redirect("~/");
            }
        }
    }
 
    #region  Bang tao danh muc moi
    private void Load_CreateNewsCategories(bool visible, string action)
    {
        panelCreateCategory.Visible = visible;
        try
        {
            DirectoryInfo dirLanguage = new DirectoryInfo(Server.MapPath(@"~\" + @"Languages"));
            if (visible && (action == "CreateCategory"))
            {

                btnCreateNewsCourseCat.Visible = true;
                btnEditNewsCourseCat.Visible = false;                
                lblCreateCategory.Text="Tạo danh mục mới";
            }
            if ((visible) && (action == "EditCategory"))
            {
                newsCat = CoolNews.Business.CategoryService.GetCategoryByID(Convert.ToInt64(Request.QueryString["CatID"]));
                lblCreateCategory.Text = "Sửa danh mục";
                btnCreateNewsCourseCat.Visible = false;
                btnEditNewsCourseCat.Visible = true;
                txtTendanhmuc.Text = newsCat.Name;
                txtMotadanhmuc.Text = newsCat.Description;
            }
            if ((visible) && (action == "DeleteCategory"))
            {
                try
                {
                    newsCat = CoolNews.Business.CategoryService.GetCategoryByID(Convert.ToInt64(Request.QueryString["ID"]));
                    CoolNews.Business.CategoryService.DeleteCategory(newsCat);                    
                    Response.Redirect("~/Admin/");
                }
                catch
                {
                    Response.Redirect("~/Admin/");
                }
            }
        }
        catch
        {
        }
    }
    #endregion    
    
    private void Load_Edit_Create_News(bool visible, string action)
    {
        PanelCreateNews.Visible = visible;
        try
        {
            //Tao moi
            if ((visible) && (action == "CreateNews"))
            {
                lblCreateEditNews.Text = "Tạo bản tin mới";
                PanelHinhMinhHoa.Visible = false;
                btnTaomoi.Visible = true;
                btnLuuthaydoi.Visible = false;                
            }
            //Chinh sua
            if ((visible) && (action == "EditNews"))
            {
                news = CoolNews.Business.NewsService.GetNewsByID(Convert.ToInt64(Request.QueryString["ID"]));
                lblCreateEditNews.Text = "Sửa bản tin";
                btnTaomoi.Visible = false;
                btnLuuthaydoi.Visible = true;
                PanelHinhMinhHoa.Visible = true;
                txtTieuDe.Text = news.Title;
                listChude.SelectedValue = news.CatID.ToString();
                txtMota.Text = news.Excerpt;
                txtNoiDung.Text = news.Body;
                txtTukhoa.Text = news.Keywords;
                if (news.Picture == "")
                {
                    imgCurrentAvatar.ImageUrl = "~/Images/NoImages.jpg";
                    checkDel.Enabled = false;
                    checkDel.Text = "Không có hình minh họa";
                }
                else
                {
                    imgCurrentAvatar.ImageUrl = "~/NewsData/" + news.Picture;
                    checkDel.Enabled = true;
                    checkDel.Text = "Xóa hình minh họa";
                }
                txtNguontin.Text = news.Authors;                
            }
            if ((visible) && (action == "DeleteNews"))
            {
                try
                {
                    news = CoolNews.Business.NewsService.GetNewsByID(Convert.ToInt64(Request.QueryString["ID"]));
                    DirectoryInfo dir = new DirectoryInfo(Server.MapPath(@"~\" + @"NewsData"));
                    try
                    {
                        File.Delete(dir + "\\" + news.Picture);
                        File.Delete(dir + "\\" + news.Picture + "_thumb.jpg");
                    }
                    catch
                    {
                    }
                    CoolNews.Business.NewsService.DeleteNews(news);
                    Response.Redirect("~/Admin/");
                }
                catch
                {
                    Response.Redirect("~/Admin/");
                }
            }

        }
        catch
        {
        }
    }
    
      protected void btnTaomoi_Click(object sender, EventArgs e)
      {
        //try
        //{
            news.CatID = Convert.ToInt64(listChude.SelectedItem.Value.Trim());
            news.Title = txtTieuDe.Text.Trim();
            news.Excerpt = txtMota.Text.Trim();
            news.Body = txtNoiDung.Text;
            news.Keywords = txtTukhoa.Text.Trim();
            if (inputHinhMinhHoa.PostedFile.FileName != "")
            {
                            news.Picture = CoolNews.Business.NewsService.uploadNewsImages(inputHinhMinhHoa.PostedFile.FileName, inputHinhMinhHoa, 70, 70, Request.PhysicalApplicationPath + "NewsData\\");
            }             
            news.Authors = txtNguontin.Text.Trim();
            bool titleIsOccupied = CoolNews.Business.NewsService.CheckTitle(news);
            if (titleIsOccupied == false)
            {
                Label8.Text = "";
                CoolNews.Business.NewsService.CreateNews(news);
                Response.Redirect("~/Admin/");
            }
            else
            {                
                Label8.Text = "Tiêu đề này đã tồn tại!";                
            }            
        //}
        //catch
        //{
            //Response.Redirect("~/Admin/");
        //}
      }
    protected void btnLuuthaydoi_Click(object sender, EventArgs e)
    {
        try
        {
            news = CoolNews.Business.NewsService.GetNewsByID(Convert.ToInt64(Request.QueryString["ID"]));
            news.CatID = Convert.ToInt64(listChude.SelectedItem.Value.Trim());
            news.Title = txtTieuDe.Text.Trim();
            news.Excerpt = txtMota.Text.Trim();
            news.Body = txtNoiDung.Text;
            news.Keywords = txtTukhoa.Text.Trim();
            DirectoryInfo dir = new DirectoryInfo(Server.MapPath(@"~\" + @"NewsData"));
            if (checkDel.Checked == true && inputHinhMinhHoa.PostedFile.FileName == "")
            {
                File.Delete(dir + "\\" + news.Picture);
                File.Delete(dir + "\\" + news.Picture + "_thumb.jpg");
                news.Picture = "";
            }
            else if (inputHinhMinhHoa.PostedFile.FileName != "")
            {
                try
                {
                    File.Delete(dir + "\\" + news.Picture);
                    File.Delete(dir + "\\" + news.Picture + "_thumb.jpg");
                }
                catch
                {
                }
                news.Picture = CoolNews.Business.NewsService.uploadNewsImages(inputHinhMinhHoa.PostedFile.FileName, inputHinhMinhHoa, 70, 70, Request.PhysicalApplicationPath + "NewsData\\");
            }
            news.Authors = txtNguontin.Text.Trim();            
            CoolNews.Business.NewsService.UpdateNews(news);
            Response.Redirect("~/Admin/");
        }
        catch
        {
        }
    }
    protected void btnCreateNewsCourseCat_Click(object sender, EventArgs e)
    {
        try
        {
            newsCat.Name = txtTendanhmuc.Text;
            newsCat.Description = txtMotadanhmuc.Text;            
            CoolNews.Business.CategoryService.CreateCategory(newsCat); 
            Response.Redirect("~/Admin/");
        }
        catch
        {
            Response.Redirect("~/Admin/");
        }
    }
    protected void btnEditNewsCourseCat_Click(object sender, EventArgs e)
    {
        newsCat = CoolNews.Business.CategoryService.GetCategoryByID(Convert.ToInt64(Request.QueryString["CatID"]));
        newsCat.Name = txtTendanhmuc.Text;
        newsCat.Description = txtMotadanhmuc.Text;
        CoolNews.Business.CategoryService.UpdateCategory(newsCat);
        Response.Redirect("~/Admin/");
    }


    protected void Page_PreInit(object sender, EventArgs e)
    {
        if (Session["Theme"].ToString() != "")
        
        {
            Page.Theme = Session["Theme"].ToString();
        }
    }
</script>
