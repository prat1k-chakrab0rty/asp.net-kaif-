<%@ Page Title="" Language="C#" MasterPageFile="~/Guest.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="ruralCompany.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="style/styleRegister.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="main">
    <p class="sign" align="center">Sign up</p>
    <form class="form1">
      <asp:TextBox runat="server" id="TextBox_name" class="name" type="text" align="center" placeholder="Name"/>
        <asp:TextBox runat="server" id="TextBox_email" class="email" type="email" align="center" placeholder="E-mail" />
        <asp:TextBox runat="server" id="TextBox_mobile" class="mobile" type="text" align="center" placeholder="Mobile number" />
        
        <asp:TextBox runat="server" id="TextBox_address" class="address" type="text" align="center" placeholder="Address (Door no., street, area)" />
        <asp:TextBox runat="server" id="TextBox_zipcode" class="zipcode" type="text" align="center" placeholder="ZipCode" />
        <asp:TextBox runat="server" id="TextBox_city" class="city" type="text" align="center" placeholder="City" />
        <asp:TextBox runat="server" id="TextBox_locality" class="locality" type="text" align="center" placeholder="Locality" />
        <asp:DropDownList ID="DropDownList_role" CssClass="role" runat="server" DataSourceID="role" DataTextField="role" DataValueField="role">
        </asp:DropDownList>
        <asp:SqlDataSource ID="role" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\ruralCompany.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT role FROM roles WHERE (Id &gt;= 2)"></asp:SqlDataSource>
      <asp:TextBox runat="server" id="TextBox_password" class="pass" type="password" align="center" placeholder="Password"/>
      <asp:TextBox runat="server" id="TextBox_conPassword" class="pass" type="password" align="center" placeholder="Confirm Password"/>
      <asp:Button runat="server" class="submit" onclick="submit_onclick" align="center" Text="Sign up" />
      <p class="already" align="center">
          <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/CustLogin.aspx">Already registered?</asp:HyperLink></p>
            
                
    </div>


</asp:Content>
