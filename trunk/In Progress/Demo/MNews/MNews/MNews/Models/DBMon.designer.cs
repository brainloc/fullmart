﻿#pragma warning disable 1591
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.1
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MNews.Models
{
	using System.Data.Linq;
	using System.Data.Linq.Mapping;
	using System.Data;
	using System.Collections.Generic;
	using System.Reflection;
	using System.Linq;
	using System.Linq.Expressions;
	using System.ComponentModel;
	using System;
	
	
	[global::System.Data.Linq.Mapping.DatabaseAttribute(Name="dbMON")]
	public partial class DBMonDataContext : System.Data.Linq.DataContext
	{
		
		private static System.Data.Linq.Mapping.MappingSource mappingSource = new AttributeMappingSource();
		
    #region Extensibility Method Definitions
    partial void OnCreated();
    partial void InsertBanner(Banner instance);
    partial void UpdateBanner(Banner instance);
    partial void DeleteBanner(Banner instance);
    partial void InsertSlider(Slider instance);
    partial void UpdateSlider(Slider instance);
    partial void DeleteSlider(Slider instance);
    partial void InsertCollumn(Collumn instance);
    partial void UpdateCollumn(Collumn instance);
    partial void DeleteCollumn(Collumn instance);
    partial void InsertContact(Contact instance);
    partial void UpdateContact(Contact instance);
    partial void DeleteContact(Contact instance);
    partial void InsertNew(New instance);
    partial void UpdateNew(New instance);
    partial void DeleteNew(New instance);
    partial void InsertPage(Page instance);
    partial void UpdatePage(Page instance);
    partial void DeletePage(Page instance);
    partial void InsertSlide(Slide instance);
    partial void UpdateSlide(Slide instance);
    partial void DeleteSlide(Slide instance);
    #endregion
		
		public DBMonDataContext() : 
				base(global::System.Configuration.ConfigurationManager.ConnectionStrings["dbMONConnectionString"].ConnectionString, mappingSource)
		{
			OnCreated();
		}
		
		public DBMonDataContext(string connection) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public DBMonDataContext(System.Data.IDbConnection connection) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public DBMonDataContext(string connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public DBMonDataContext(System.Data.IDbConnection connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public System.Data.Linq.Table<Banner> Banners
		{
			get
			{
				return this.GetTable<Banner>();
			}
		}
		
		public System.Data.Linq.Table<Slider> Sliders
		{
			get
			{
				return this.GetTable<Slider>();
			}
		}
		
		public System.Data.Linq.Table<Collumn> Collumns
		{
			get
			{
				return this.GetTable<Collumn>();
			}
		}
		
		public System.Data.Linq.Table<Contact> Contacts
		{
			get
			{
				return this.GetTable<Contact>();
			}
		}
		
		public System.Data.Linq.Table<New> News
		{
			get
			{
				return this.GetTable<New>();
			}
		}
		
		public System.Data.Linq.Table<Page> Pages
		{
			get
			{
				return this.GetTable<Page>();
			}
		}
		
		public System.Data.Linq.Table<Slide> Slides
		{
			get
			{
				return this.GetTable<Slide>();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.Banner")]
	public partial class Banner : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private int _bID;
		
		private string _bLink;
		
		private string _bTitle;
		
		private string _bContent;
		
		private int _bPage;
		
		private EntityRef<Page> _Page;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnbIDChanging(int value);
    partial void OnbIDChanged();
    partial void OnbLinkChanging(string value);
    partial void OnbLinkChanged();
    partial void OnbTitleChanging(string value);
    partial void OnbTitleChanged();
    partial void OnbContentChanging(string value);
    partial void OnbContentChanged();
    partial void OnbPageChanging(int value);
    partial void OnbPageChanged();
    #endregion
		
		public Banner()
		{
			this._Page = default(EntityRef<Page>);
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_bID", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
		public int bID
		{
			get
			{
				return this._bID;
			}
			set
			{
				if ((this._bID != value))
				{
					if (this._Page.HasLoadedOrAssignedValue)
					{
						throw new System.Data.Linq.ForeignKeyReferenceAlreadyHasValueException();
					}
					this.OnbIDChanging(value);
					this.SendPropertyChanging();
					this._bID = value;
					this.SendPropertyChanged("bID");
					this.OnbIDChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_bLink", DbType="Char(200)")]
		public string bLink
		{
			get
			{
				return this._bLink;
			}
			set
			{
				if ((this._bLink != value))
				{
					this.OnbLinkChanging(value);
					this.SendPropertyChanging();
					this._bLink = value;
					this.SendPropertyChanged("bLink");
					this.OnbLinkChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_bTitle", DbType="NVarChar(150)")]
		public string bTitle
		{
			get
			{
				return this._bTitle;
			}
			set
			{
				if ((this._bTitle != value))
				{
					this.OnbTitleChanging(value);
					this.SendPropertyChanging();
					this._bTitle = value;
					this.SendPropertyChanged("bTitle");
					this.OnbTitleChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_bContent", DbType="NText NOT NULL", CanBeNull=false, UpdateCheck=UpdateCheck.Never)]
		public string bContent
		{
			get
			{
				return this._bContent;
			}
			set
			{
				if ((this._bContent != value))
				{
					this.OnbContentChanging(value);
					this.SendPropertyChanging();
					this._bContent = value;
					this.SendPropertyChanged("bContent");
					this.OnbContentChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_bPage", DbType="Int NOT NULL")]
		public int bPage
		{
			get
			{
				return this._bPage;
			}
			set
			{
				if ((this._bPage != value))
				{
					this.OnbPageChanging(value);
					this.SendPropertyChanging();
					this._bPage = value;
					this.SendPropertyChanged("bPage");
					this.OnbPageChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.AssociationAttribute(Name="Page_Banner", Storage="_Page", ThisKey="bID", OtherKey="pID", IsForeignKey=true)]
		public Page Page
		{
			get
			{
				return this._Page.Entity;
			}
			set
			{
				Page previousValue = this._Page.Entity;
				if (((previousValue != value) 
							|| (this._Page.HasLoadedOrAssignedValue == false)))
				{
					this.SendPropertyChanging();
					if ((previousValue != null))
					{
						this._Page.Entity = null;
						previousValue.Banner = null;
					}
					this._Page.Entity = value;
					if ((value != null))
					{
						value.Banner = this;
						this._bID = value.pID;
					}
					else
					{
						this._bID = default(int);
					}
					this.SendPropertyChanged("Page");
				}
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.Slider")]
	public partial class Slider : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private int _sID;
		
		private string _stitle;
		
		private string _scontent;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnsIDChanging(int value);
    partial void OnsIDChanged();
    partial void OnstitleChanging(string value);
    partial void OnstitleChanged();
    partial void OnscontentChanging(string value);
    partial void OnscontentChanged();
    #endregion
		
		public Slider()
		{
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_sID", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
		public int sID
		{
			get
			{
				return this._sID;
			}
			set
			{
				if ((this._sID != value))
				{
					this.OnsIDChanging(value);
					this.SendPropertyChanging();
					this._sID = value;
					this.SendPropertyChanged("sID");
					this.OnsIDChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_stitle", DbType="NVarChar(250)")]
		public string stitle
		{
			get
			{
				return this._stitle;
			}
			set
			{
				if ((this._stitle != value))
				{
					this.OnstitleChanging(value);
					this.SendPropertyChanging();
					this._stitle = value;
					this.SendPropertyChanged("stitle");
					this.OnstitleChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_scontent", DbType="NText NOT NULL", CanBeNull=false, UpdateCheck=UpdateCheck.Never)]
		public string scontent
		{
			get
			{
				return this._scontent;
			}
			set
			{
				if ((this._scontent != value))
				{
					this.OnscontentChanging(value);
					this.SendPropertyChanging();
					this._scontent = value;
					this.SendPropertyChanged("scontent");
					this.OnscontentChanged();
				}
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.Collumn")]
	public partial class Collumn : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private int _cID;
		
		private string _cText;
		
		private string _cLink;
		
		private string _cCo;
		
		private int _cindex;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OncIDChanging(int value);
    partial void OncIDChanged();
    partial void OncTextChanging(string value);
    partial void OncTextChanged();
    partial void OncLinkChanging(string value);
    partial void OncLinkChanged();
    partial void OncCoChanging(string value);
    partial void OncCoChanged();
    partial void OncindexChanging(int value);
    partial void OncindexChanged();
    #endregion
		
		public Collumn()
		{
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_cID", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
		public int cID
		{
			get
			{
				return this._cID;
			}
			set
			{
				if ((this._cID != value))
				{
					this.OncIDChanging(value);
					this.SendPropertyChanging();
					this._cID = value;
					this.SendPropertyChanged("cID");
					this.OncIDChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_cText", DbType="NVarChar(150) NOT NULL", CanBeNull=false)]
		public string cText
		{
			get
			{
				return this._cText;
			}
			set
			{
				if ((this._cText != value))
				{
					this.OncTextChanging(value);
					this.SendPropertyChanging();
					this._cText = value;
					this.SendPropertyChanged("cText");
					this.OncTextChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_cLink", DbType="NChar(250) NOT NULL", CanBeNull=false)]
		public string cLink
		{
			get
			{
				return this._cLink;
			}
			set
			{
				if ((this._cLink != value))
				{
					this.OncLinkChanging(value);
					this.SendPropertyChanging();
					this._cLink = value;
					this.SendPropertyChanged("cLink");
					this.OncLinkChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_cCo", DbType="NVarChar(250) NOT NULL", CanBeNull=false)]
		public string cCo
		{
			get
			{
				return this._cCo;
			}
			set
			{
				if ((this._cCo != value))
				{
					this.OncCoChanging(value);
					this.SendPropertyChanging();
					this._cCo = value;
					this.SendPropertyChanged("cCo");
					this.OncCoChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_cindex", DbType="Int NOT NULL")]
		public int cindex
		{
			get
			{
				return this._cindex;
			}
			set
			{
				if ((this._cindex != value))
				{
					this.OncindexChanging(value);
					this.SendPropertyChanging();
					this._cindex = value;
					this.SendPropertyChanged("cindex");
					this.OncindexChanged();
				}
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.Contact")]
	public partial class Contact : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private int _cID;
		
		private string _cEmail;
		
		private string _cTel;
		
		private string _cContent;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OncIDChanging(int value);
    partial void OncIDChanged();
    partial void OncEmailChanging(string value);
    partial void OncEmailChanged();
    partial void OncTelChanging(string value);
    partial void OncTelChanged();
    partial void OncContentChanging(string value);
    partial void OncContentChanged();
    #endregion
		
		public Contact()
		{
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_cID", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
		public int cID
		{
			get
			{
				return this._cID;
			}
			set
			{
				if ((this._cID != value))
				{
					this.OncIDChanging(value);
					this.SendPropertyChanging();
					this._cID = value;
					this.SendPropertyChanged("cID");
					this.OncIDChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_cEmail", DbType="Char(50)")]
		public string cEmail
		{
			get
			{
				return this._cEmail;
			}
			set
			{
				if ((this._cEmail != value))
				{
					this.OncEmailChanging(value);
					this.SendPropertyChanging();
					this._cEmail = value;
					this.SendPropertyChanged("cEmail");
					this.OncEmailChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_cTel", DbType="Char(12)")]
		public string cTel
		{
			get
			{
				return this._cTel;
			}
			set
			{
				if ((this._cTel != value))
				{
					this.OncTelChanging(value);
					this.SendPropertyChanging();
					this._cTel = value;
					this.SendPropertyChanged("cTel");
					this.OncTelChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_cContent", DbType="NChar(10)")]
		public string cContent
		{
			get
			{
				return this._cContent;
			}
			set
			{
				if ((this._cContent != value))
				{
					this.OncContentChanging(value);
					this.SendPropertyChanging();
					this._cContent = value;
					this.SendPropertyChanged("cContent");
					this.OncContentChanged();
				}
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.News")]
	public partial class New : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private int _nID;
		
		private string _ntitle;
		
		private System.DateTime _nDate;
		
		private string _nContent;
		
		private string _npreview;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnnIDChanging(int value);
    partial void OnnIDChanged();
    partial void OnntitleChanging(string value);
    partial void OnntitleChanged();
    partial void OnnDateChanging(System.DateTime value);
    partial void OnnDateChanged();
    partial void OnnContentChanging(string value);
    partial void OnnContentChanged();
    partial void OnnpreviewChanging(string value);
    partial void OnnpreviewChanged();
    #endregion
		
		public New()
		{
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_nID", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
		public int nID
		{
			get
			{
				return this._nID;
			}
			set
			{
				if ((this._nID != value))
				{
					this.OnnIDChanging(value);
					this.SendPropertyChanging();
					this._nID = value;
					this.SendPropertyChanged("nID");
					this.OnnIDChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_ntitle", DbType="NVarChar(250) NOT NULL", CanBeNull=false)]
		public string ntitle
		{
			get
			{
				return this._ntitle;
			}
			set
			{
				if ((this._ntitle != value))
				{
					this.OnntitleChanging(value);
					this.SendPropertyChanging();
					this._ntitle = value;
					this.SendPropertyChanged("ntitle");
					this.OnntitleChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_nDate", DbType="DateTime NOT NULL")]
		public System.DateTime nDate
		{
			get
			{
				return this._nDate;
			}
			set
			{
				if ((this._nDate != value))
				{
					this.OnnDateChanging(value);
					this.SendPropertyChanging();
					this._nDate = value;
					this.SendPropertyChanged("nDate");
					this.OnnDateChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_nContent", DbType="NText NOT NULL", CanBeNull=false, UpdateCheck=UpdateCheck.Never)]
		public string nContent
		{
			get
			{
				return this._nContent;
			}
			set
			{
				if ((this._nContent != value))
				{
					this.OnnContentChanging(value);
					this.SendPropertyChanging();
					this._nContent = value;
					this.SendPropertyChanged("nContent");
					this.OnnContentChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_npreview", DbType="NText NOT NULL", CanBeNull=false, UpdateCheck=UpdateCheck.Never)]
		public string npreview
		{
			get
			{
				return this._npreview;
			}
			set
			{
				if ((this._npreview != value))
				{
					this.OnnpreviewChanging(value);
					this.SendPropertyChanging();
					this._npreview = value;
					this.SendPropertyChanged("npreview");
					this.OnnpreviewChanged();
				}
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.Pages")]
	public partial class Page : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private int _pID;
		
		private string _pName;
		
		private string _pContent;
		
		private System.Nullable<int> _pSpage;
		
		private EntityRef<Banner> _Banner;
		
		private EntitySet<Page> _Pages;
		
		private EntityRef<Page> _Page1;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnpIDChanging(int value);
    partial void OnpIDChanged();
    partial void OnpNameChanging(string value);
    partial void OnpNameChanged();
    partial void OnpContentChanging(string value);
    partial void OnpContentChanged();
    partial void OnpSpageChanging(System.Nullable<int> value);
    partial void OnpSpageChanged();
    #endregion
		
		public Page()
		{
			this._Banner = default(EntityRef<Banner>);
			this._Pages = new EntitySet<Page>(new Action<Page>(this.attach_Pages), new Action<Page>(this.detach_Pages));
			this._Page1 = default(EntityRef<Page>);
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_pID", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
		public int pID
		{
			get
			{
				return this._pID;
			}
			set
			{
				if ((this._pID != value))
				{
					this.OnpIDChanging(value);
					this.SendPropertyChanging();
					this._pID = value;
					this.SendPropertyChanged("pID");
					this.OnpIDChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_pName", DbType="NVarChar(250) NOT NULL", CanBeNull=false)]
		public string pName
		{
			get
			{
				return this._pName;
			}
			set
			{
				if ((this._pName != value))
				{
					this.OnpNameChanging(value);
					this.SendPropertyChanging();
					this._pName = value;
					this.SendPropertyChanged("pName");
					this.OnpNameChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_pContent", DbType="NText", UpdateCheck=UpdateCheck.Never)]
		public string pContent
		{
			get
			{
				return this._pContent;
			}
			set
			{
				if ((this._pContent != value))
				{
					this.OnpContentChanging(value);
					this.SendPropertyChanging();
					this._pContent = value;
					this.SendPropertyChanged("pContent");
					this.OnpContentChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_pSpage", DbType="Int")]
		public System.Nullable<int> pSpage
		{
			get
			{
				return this._pSpage;
			}
			set
			{
				if ((this._pSpage != value))
				{
					if (this._Page1.HasLoadedOrAssignedValue)
					{
						throw new System.Data.Linq.ForeignKeyReferenceAlreadyHasValueException();
					}
					this.OnpSpageChanging(value);
					this.SendPropertyChanging();
					this._pSpage = value;
					this.SendPropertyChanged("pSpage");
					this.OnpSpageChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.AssociationAttribute(Name="Page_Banner", Storage="_Banner", ThisKey="pID", OtherKey="bID", IsUnique=true, IsForeignKey=false)]
		public Banner Banner
		{
			get
			{
				return this._Banner.Entity;
			}
			set
			{
				Banner previousValue = this._Banner.Entity;
				if (((previousValue != value) 
							|| (this._Banner.HasLoadedOrAssignedValue == false)))
				{
					this.SendPropertyChanging();
					if ((previousValue != null))
					{
						this._Banner.Entity = null;
						previousValue.Page = null;
					}
					this._Banner.Entity = value;
					if ((value != null))
					{
						value.Page = this;
					}
					this.SendPropertyChanged("Banner");
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.AssociationAttribute(Name="Page_Page", Storage="_Pages", ThisKey="pID", OtherKey="pSpage")]
		public EntitySet<Page> Pages
		{
			get
			{
				return this._Pages;
			}
			set
			{
				this._Pages.Assign(value);
			}
		}
		
		[global::System.Data.Linq.Mapping.AssociationAttribute(Name="Page_Page", Storage="_Page1", ThisKey="pSpage", OtherKey="pID", IsForeignKey=true)]
		public Page Page1
		{
			get
			{
				return this._Page1.Entity;
			}
			set
			{
				Page previousValue = this._Page1.Entity;
				if (((previousValue != value) 
							|| (this._Page1.HasLoadedOrAssignedValue == false)))
				{
					this.SendPropertyChanging();
					if ((previousValue != null))
					{
						this._Page1.Entity = null;
						previousValue.Pages.Remove(this);
					}
					this._Page1.Entity = value;
					if ((value != null))
					{
						value.Pages.Add(this);
						this._pSpage = value.pID;
					}
					else
					{
						this._pSpage = default(Nullable<int>);
					}
					this.SendPropertyChanged("Page1");
				}
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
		
		private void attach_Pages(Page entity)
		{
			this.SendPropertyChanging();
			entity.Page1 = this;
		}
		
		private void detach_Pages(Page entity)
		{
			this.SendPropertyChanging();
			entity.Page1 = null;
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.Slide")]
	public partial class Slide : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private int _slID;
		
		private string _slImage;
		
		private string _slLink;
		
		private string _slText;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnslIDChanging(int value);
    partial void OnslIDChanged();
    partial void OnslImageChanging(string value);
    partial void OnslImageChanged();
    partial void OnslLinkChanging(string value);
    partial void OnslLinkChanged();
    partial void OnslTextChanging(string value);
    partial void OnslTextChanged();
    #endregion
		
		public Slide()
		{
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_slID", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
		public int slID
		{
			get
			{
				return this._slID;
			}
			set
			{
				if ((this._slID != value))
				{
					this.OnslIDChanging(value);
					this.SendPropertyChanging();
					this._slID = value;
					this.SendPropertyChanged("slID");
					this.OnslIDChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_slImage", DbType="NChar(200) NOT NULL", CanBeNull=false)]
		public string slImage
		{
			get
			{
				return this._slImage;
			}
			set
			{
				if ((this._slImage != value))
				{
					this.OnslImageChanging(value);
					this.SendPropertyChanging();
					this._slImage = value;
					this.SendPropertyChanged("slImage");
					this.OnslImageChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_slLink", DbType="NChar(200) NOT NULL", CanBeNull=false)]
		public string slLink
		{
			get
			{
				return this._slLink;
			}
			set
			{
				if ((this._slLink != value))
				{
					this.OnslLinkChanging(value);
					this.SendPropertyChanging();
					this._slLink = value;
					this.SendPropertyChanged("slLink");
					this.OnslLinkChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_slText", DbType="NVarChar(100) NOT NULL", CanBeNull=false)]
		public string slText
		{
			get
			{
				return this._slText;
			}
			set
			{
				if ((this._slText != value))
				{
					this.OnslTextChanging(value);
					this.SendPropertyChanging();
					this._slText = value;
					this.SendPropertyChanged("slText");
					this.OnslTextChanged();
				}
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
	}
}
#pragma warning restore 1591
