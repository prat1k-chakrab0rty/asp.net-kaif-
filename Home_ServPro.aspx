<%@ Page Title="" Language="C#" MasterPageFile="~/ServPro.Master" AutoEventWireup="true" CodeBehind="Home_ServPro.aspx.cs" Inherits="ruralCompany.Home_ServPro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="style/styleHome.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h3>Manage Bookings</h3>

    <asp:GridView ID="GridView_MyBookings" runat="server" CssClass="mydatagrid" PagerStyle-CssClass="pager" HeaderStyle-CssClass="gridviewheader" RowStyle-CssClass="rows" AllowPaging="True" AutoGenerateSelectButton="True" OnSelectedIndexChanged="GridView_MyBookings_SelectedIndexChanged"/>

<br />
<asp:Button ID="Button_Accept" runat="server" CssClass="button" OnClick="Button_Accept_Click" Text="Accept" />
&nbsp;<asp:Button ID="Button_Reject" runat="server" CssClass="button" OnClick="Button_Reject_Click" Text="Reject" />
&nbsp;<asp:Button ID="Button_Completed" runat="server" CssClass="button" Text="Change status to completed." OnClick="Button_Completed_Click" />
&nbsp;<asp:Label ID="Label_DateTime" runat="server" Visible="False"></asp:Label>

    <br />
    <br />
    <asp:Label ID="Label_Rating" runat="server" Text="Select rating for this customer" Visible="False"></asp:Label>
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

</asp:Content>
