﻿<%@ Page Title="" Language="C#" MasterPageFile="~/OneColumn.Master" AutoEventWireup="true"
    CodeBehind="ShopRegister.aspx.cs" Inherits="FullMart.ShopRegister" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/themes/style/register.css" rel="stylesheet" type="text/css" />
    <script src="/themes/script/register.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="formPanel" runat="server">
    <div class="block clear">
    </div>
    <asp:Panel ID="pnTC" runat="server">
        <div id="policyuser" class="pl">
            <div class="ptitle">
                User's Policy
            </div>
            <div class="description">
                <asp:Label ID="txtTC" runat="server" Text=""></asp:Label>
            </div>
            <div class="agree block center">
                <button>
                    Agree</button>
                <button>
                    Don't Agree</button>
            </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="pnReg" runat="server">
        <div class="freg block center b shadow">
            <div class="ftitle">
                <div class="ftitle">
                </div>
                <div class="ftitle">
                </div>
                <div class="ftitle">
                </div>
            </div>
            <asp:Label ID="txtmessage" runat="server" Text=""></asp:Label>
            <div id="reguser" class="block">
                <div id="freguser" class="formular">
                    <table class="tbf">
                        <tr>
                            <td>
                                <%=FullMart.Code.DAO.BindingUltilities.GetResourceValue("username") %><span style="color: red">*</span>
                            </td>
                            <td>
                                <asp:TextBox ID="txtUserName" CssClass="validate[required]" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="This field request"
                                    ControlToValidate="txtUserName" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                <br style="clear: both" />
                                <span id="checkUSn">
                                    <%=FullMart.Code.DAO.BindingUltilities.GetResourceValue("check") %></span>&nbsp;<span
                                        id="checkUSnn"></span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <%=FullMart.Code.DAO.BindingUltilities.GetResourceValue("firstname") %><span style="color: red">*</span>
                            </td>
                            <td>
                                <asp:TextBox ID="txtFname" CssClass="validate[required]" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtFname"
                                    ErrorMessage="This field request"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <%=FullMart.Code.DAO.BindingUltilities.GetResourceValue("lastname") %><span style="color: red">*</span>
                            </td>
                            <td>
                                <asp:TextBox ID="txtLname" CssClass="validate[required]" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtLname"
                                    ErrorMessage="This field request"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Email<span style="color: red">*</span>
                            </td>
                            <td>
                                <asp:TextBox ID="txtmail" CssClass="validate[required,custom[email]]" runat="server"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtmail"
                                    ErrorMessage="Input correct mail format" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="This field request"
                                    ControlToValidate="txtmail"></asp:RequiredFieldValidator>
                                <br style="clear: both" />
                                <span id="checkUS">Check</span>&nbsp;<span id="uscheckm"></span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <%=FullMart.Code.DAO.BindingUltilities.GetResourceValue("password") %><span style="color: red">*</span>
                            </td>
                            <td>
                                <asp:TextBox ID="txtPass" CssClass="validate[required,custom[passl]]" TextMode="Password"
                                    runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="This field request"
                                    ControlToValidate="txtPass"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <%=FullMart.Code.DAO.BindingUltilities.GetResourceValue("confirmpassword") %><span
                                    style="color: red">*</span>
                            </td>
                            <td>
                                <asp:TextBox ID="txtpasscf" CssClass="validate[required,funcCall[ckmk]]" TextMode="Password"
                                    runat="server"></asp:TextBox>
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPass"
                                    ControlToValidate="txtpasscf" ErrorMessage="Password confirm incorrect" SetFocusOnError="True"></asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Website
                            </td>
                            <td>
                                <asp:TextBox ID="txtWebsite" Text="" runat="server"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Please input correct format website"
                                    ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?" ControlToValidate="txtWebsite"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <%=FullMart.Code.DAO.BindingUltilities.GetResourceValue("yourlocation") %>
                            </td>
                            <td>
                                <asp:DropDownList ID="drlState" runat="server" DataSourceID="dsState" DataTextField="StateName"
                                    DataValueField="id">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="dsState" runat="server" ConnectionString="<%$ ConnectionStrings:FullMartConnectionString %>"
                                    ProviderName="<%$ ConnectionStrings:FullMartConnectionString.ProviderName %>"
                                    SelectCommand="GetStates" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                                <td>
                                    <%=FullMart.Code.DAO.BindingUltilities.GetResourceValue("phone") %>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtmobile" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                        <asp:Panel ID="panelExtraInfo" runat="server" Visible="false">                            
                            <tr>
                                <td>
                                    <%=FullMart.Code.DAO.BindingUltilities.GetResourceValue("yourbirthday") %><span style="color: red">*</span>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtbirthday" CssClass="ubirthday" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <%=FullMart.Code.DAO.BindingUltilities.GetResourceValue("yourUC") %>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtUC" CssClass="validate[required]" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <%=FullMart.Code.DAO.BindingUltilities.GetResourceValue("uclass") %><span style="color: red">*</span>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtClass" CssClass="validate[required]" runat="server"></asp:TextBox>
                            </tr>
                            <tr>
                                <td>
                                    Yahoo/Skype
                                </td>
                                <td>
                                    <asp:TextBox ID="txtyahoo" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <%=FullMart.Code.DAO.BindingUltilities.GetResourceValue("yourwishlist") %>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtWishlist" TextMode="MultiLine" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                        </asp:Panel>
                        <tr>
                            <td>
                                <%=FullMart.Code.DAO.BindingUltilities.GetResourceValue("captcha") %>
                            </td>
                            <td>
                                <p id='veryu' class='very' title="reload image">
                                    ABjs</p>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <%=FullMart.Code.DAO.BindingUltilities.GetResourceValue("entercaptcha") %><span style="color: red">*</span>
                            </td>
                            <td>
                                <input class="validate[required,funcCall[ckcap]]" type="text" id="freguserckcap"
                                    name="freguserckcap" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <asp:Button ID="cmdCreateUSer" CssClass="cmdbt" runat="server" Text="Sign up" OnClick="cmdCreateUSer_Click" />
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="pnSuccess" runat="server">
        <div style="text-align: center; font-size: 20px; width: 1000px;" class="center block bgwt">
            <asp:Label ID="txtActionInform" runat="server" Text="Register Successful!"></asp:Label>
        </div>
    </asp:Panel>
    <div class="block clear">
    </div>
</asp:Content>
