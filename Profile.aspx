<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="ruralCompany.Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

     <link href="style/styleProfile.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="main">
    <p class="sign" align="center">Profile</p>
    <form class="form1">
        <span><asp:Label ID="Label1" runat="server" Text="Name" CssClass="sign" Font-Size="Medium" Font-Strikeout="False"></asp:Label>
      <asp:TextBox runat="server" id="TextBox_name" class="name" type="text" align="center" placeholder="Name"/><br /></span>
        
        <span><asp:Label ID="Label2" runat="server" Text="Email" CssClass="sign" Font-Size="Medium" Font-Strikeout="False"></asp:Label> 
        <asp:TextBox runat="server" id="TextBox_email" class="email" type="email" align="center" placeholder="E-mail" /><br />
        </span>
       <span><asp:Label ID="Label3" runat="server" Text="Mobile" CssClass="sign" Font-Size="Medium" Font-Strikeout="False"></asp:Label>
        <asp:TextBox runat="server" id="TextBox_mobile" class="mobile" type="text" align="center" placeholder="Mobile number" /><br />
        </span>
        <span><asp:Label ID="Label4" runat="server" Text="Address" CssClass="sign" Font-Size="Medium" Font-Strikeout="False"></asp:Label>
        <asp:TextBox runat="server" id="TextBox_address" class="address" type="text" align="center" placeholder="Address (Door no., street, area)" /><br />
        </span>
        <span><asp:Label ID="Label5" runat="server" Text="Zipcode" CssClass="sign" Font-Size="Medium" Font-Strikeout="False"></asp:Label>
        <asp:TextBox runat="server" id="TextBox_zipcode" class="zipcode" type="text" align="center" placeholder="ZipCode" /><br />
        </span>
        <span><asp:Label ID="Label6" runat="server" Text="City" CssClass="sign" Font-Size="Medium" Font-Strikeout="False"></asp:Label>
        <asp:TextBox runat="server" id="TextBox_city" class="city" type="text" align="center" placeholder="City" /><br />
        </span>
        <span><asp:Label ID="Label7" runat="server" Text="Locality" CssClass="sign" Font-Size="Medium" Font-Strikeout="False"></asp:Label>
        <asp:TextBox runat="server" id="TextBox_locality" class="locality" type="text" align="center" placeholder="Locality" /><br />
        </span>
        <span><asp:Label ID="Label8" runat="server" Text="Role" CssClass="sign" Font-Size="Medium" Font-Strikeout="False"></asp:Label>
        <asp:DropDownList ID="DropDownList_role" CssClass="role" runat="server" DataSourceID="role" DataTextField="role" DataValueField="role">
        </asp:DropDownList><br />
        <asp:SqlDataSource ID="role" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\ruralCompany.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT role FROM roles WHERE (Id &gt;= 2)"></asp:SqlDataSource>
        </span>
        <span><asp:Label ID="Label9" runat="server" Text="Password" CssClass="sign" Font-Size="Medium" Font-Strikeout="False"></asp:Label>
      <asp:TextBox runat="server" id="TextBox_password" class="pass" type="password" align="center" placeholder="Password"/><br /></span>
        
        <span><asp:Label ID="Label10" runat="server" Text="Confirm" CssClass="sign" Font-Size="Medium" Font-Strikeout="False"></asp:Label>
      <asp:TextBox runat="server" id="TextBox_conPassword" class="pass" type="password" align="center" placeholder="Confirm Password"/><br /></span>
        
      <asp:Button runat="server" class="submit" align="center" Text="Save changes" ID="Button_Submit" OnClick="Button_Submit_Click" />
      
            
                
    </div>

</asp:Content>
