using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using MNews.Helpers;

namespace MNews.Models
{
	public class HomeViewModel
	{
		public HomeViewModel()
		{
			
		}
		public List<string> TitleCollumns
		{
			get
			{
				List<string> result = new List<string>();
				foreach (var item in Collumns)
				{
					if (!result.Contains(item.cCo))
					{
						result.Add(item.cCo);
					}
				}
				return result;
			}
			set
			{

			}
		}
		public List<Collumn> Collumns { get; set; }
		public List<Banner> Banners { get; set; }
		public List<New> News { get; set; }
		public List<Slide> Slides { get; set; }
		public List<Slider> Sliders { get; set; }
	}

	public class PageViewModel
	{
		public List<string> ListTitle { get; set; }
		public List<int> ListID { get; set; }
		public Page CurrentPage { get; set; }
		public List<Banner> ListBanner { get; set; }
	}

	public class MenuViewModel
	{
		public List<MenuNode> Menus { get; set; }
	}

	public class NewViewModel
	{
		public IPagedList<New> News { get; set; }
		public List<Banner> Banners { get; set; }
	}

	public class MenuNode
	{
		public string Title { get; set; }
		public string Url  { get; set; }
	}

	public class UploadFile
	{
		public string FileName { get; set; }
		public string Type { get; set; }
		public string Path { get; set; }
	}
	//public class Contact
	//{
	//    public string cEmail { get; set; }
	//    public string cPhone { get; set; }
	//    public string cContent { get; set; }
	//}
}