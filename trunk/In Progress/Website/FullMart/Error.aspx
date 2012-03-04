<%@ Page Title="" Language="C#" MasterPageFile="~/OneColumn.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="FullMart.Error" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="formPanel" runat="server">
<%=FullMart.Code.DAO.BindingUltilities.GetResourceValue("error") %>

</asp:Content>
