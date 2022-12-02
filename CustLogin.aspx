<%@ Page Title="" Language="C#" MasterPageFile="~/Guest.Master" AutoEventWireup="true" CodeBehind="CustLogin.aspx.cs" Inherits="ruralCompany.CustLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="style/styleLogin.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<div class="main">
    <p class="sign" align="center">Sign in</p>
    <form class="form1">
      <asp:TextBox runat="server" ID="TextBox_un" class="un " type="text" align="center" placeholder="Username"/>
      <asp:TextBox runat="server" ID="TextBox_pass" class="pass" type="password" align="center" placeholder="Password"/>
      <asp:Button runat="server" OnClick="login_Click" class="submit" align="center" Text="Sign in" />
      <p class="forgot" align="center"><a href="#">Forgot Password?</a></p>
        <p class="errorLabel" align="center">
            <asp:Label ID="Label1" runat="server" Visible="False"></asp:Label>
        </p>
            
                
    </div>

</asp:Content>


