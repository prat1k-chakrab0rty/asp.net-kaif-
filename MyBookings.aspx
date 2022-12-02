<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="MyBookings.aspx.cs" Inherits="ruralCompany.MyBookings" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="style/styleHome.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h3>My Bookings</h3>
    <asp:GridView ID="GridView_MyBookings" runat="server" CssClass="mydatagrid" PagerStyle-CssClass="pager" HeaderStyle-CssClass="gridviewheader" RowStyle-CssClass="rows" AllowPaging="True" AutoGenerateSelectButton="True" OnSelectedIndexChanged="GridView_MyBookings_SelectedIndexChanged" />
    <asp:Label ID="Label_Rating" runat="server" Text="Select rating for this provider" Visible="False"></asp:Label>
&nbsp;&nbsp;
    <asp:DropDownList ID="DropDownList_Rating" runat="server" Visible="False">
        <asp:ListItem>1</asp:ListItem>
        <asp:ListItem>2</asp:ListItem>
        <asp:ListItem>3</asp:ListItem>
        <asp:ListItem>4</asp:ListItem>
        <asp:ListItem>5</asp:ListItem>
    </asp:DropDownList>
&nbsp;&nbsp;
    <asp:Label ID="Label_Comments" runat="server" Text="Comments" Visible="False"></asp:Label>
&nbsp;
    <asp:TextBox ID="TextBox_Comments" runat="server" Height="45px" Visible="False" Width="126px"></asp:TextBox>
&nbsp;<asp:Button ID="Button_Submit" runat="server" CssClass="button" OnClick="Button_Submit_Click" Text="Submit" Visible="False" />


&nbsp;<asp:Label ID="Label_DateTime" runat="server" Visible="False"></asp:Label>

    
</asp:Content>
