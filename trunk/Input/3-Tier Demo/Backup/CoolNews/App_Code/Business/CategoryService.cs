using System;
using System.Data;
using System.Configuration;
using System.Collections.Generic;

using CoolNews.Entities;
using CoolNews.Data;

namespace CoolNews.Business
{
    /// <summary>
    /// Summary description for CategoryService
    /// </summary>
    public class CategoryService
    {
        public CategoryService()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        public static void CreateCategory(Category category)
        {            
            CategoryDAO categoryDAO = new CategoryDAO();
            categoryDAO.CreateCategory(category);
        }

        public static void UpdateCategory(Category category)
        {           
            CategoryDAO categoryDAO = new CategoryDAO();
            categoryDAO.UpdateCategory(category);            
        }

        public static void DeleteCategory(Category category)
        {
            CategoryDAO categoryDAO = new CategoryDAO();
            categoryDAO.DeleteCategory(category);
        }

        public static Category GetCategoryByID(long ID)
        {
            CategoryDAO categoryDAO = new CategoryDAO();
            return categoryDAO.GetCategoryByID(ID);
        }

        public static List<Category> GetCategories()
        {
            CategoryDAO categoryDAO = new CategoryDAO();
            return categoryDAO.GetCategories();
        }        
    }
}