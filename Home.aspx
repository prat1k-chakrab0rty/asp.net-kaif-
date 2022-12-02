<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="ruralCompany.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="style/styleHome.css" rel="stylesheet" />
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <asp:Label ID="Label_Service" runat="server" Text="Service"></asp:Label>
&nbsp;<asp:DropDownList ID="DropDownList_Service" runat="server" DataSourceID="services" DataTextField="serviceName" DataValueField="serviceName" AppendDataBoundItems="True" CssClass="ddl">
            <Items>
       <asp:ListItem Text="Select" Value="" />
   </Items>
        </asp:DropDownList>
        &nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label_Filter" runat="server" Text="Filter by"></asp:Label>
&nbsp;<asp:DropDownList ID="DropDownList_FilterBy" runat="server" CssClass="ddl">
            <asp:ListItem Value="0">--select--</asp:ListItem>
            <asp:ListItem Value="1">Provider</asp:ListItem>
            <asp:ListItem Value="2">City</asp:ListItem>
        </asp:DropDownList>
        <asp:TextBox ID="TextBox_FilterBy" runat="server" placeholder="Enter search keyword"></asp:TextBox>
&nbsp;</p>
    <p>
        <asp:Button ID="Button_Search" runat="server" Text="Search" OnClick="Button_Search_Click" CssClass="button" />
        <asp:SqlDataSource ID="services" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\ruralCompany.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT DISTINCT [serviceName] FROM [services]"></asp:SqlDataSource>
    </p>
    <p>
        <asp:Button ID="Button_Steps" runat="server" Text="Hide steps to book:" CssClass="button" OnClick="Button_Steps_Click" />
    </p>
    <div id="steps"><asp:Label ID="Label1" runat="server" Text="1. Hover on the desired service provider for the 'select' button to appear in the first column. Click on it."></asp:Label>
    <br /><asp:Label ID="Label2" runat="server" Text="2. Describe your issue in the textarea provided." Visible="False"></asp:Label>
    <br /><asp:Label ID="Label3" runat="server" Text="3. Click on book button." Visible="False"></asp:Label>
    <br /><asp:Label ID="Label4" runat="server" Text="Congratulations. If you have followed the steps correctly, your booking is captured successfully." Visible="False"></asp:Label></div>
        
        
    <p>
        <asp:GridView ID="GridView_SearchResults" runat="server" CssClass="mydatagrid" PagerStyle-CssClass="pager" HeaderStyle-CssClass="gridviewheader" RowStyle-CssClass="rows" AllowPaging="True" AutoGenerateSelectButton="True" OnSelectedIndexChanged="GridView_SearchResults_SelectedIndexChanged">
            
<HeaderStyle CssClass="gridviewheader"></HeaderStyle>

<PagerStyle CssClass="pager"></PagerStyle>

<RowStyle CssClass="rows"></RowStyle>
        </asp:GridView>
        <textarea id="TextArea_Description" cols="20" name="TextArea_Description" rows="2" placeholder="Describe your issue."></textarea><asp:Label ID="Label_Name" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="Label_Serv" runat="server" Visible="False"></asp:Label>
    </p>
    <p>
        <asp:Button ID="Button_Book" runat="server" CssClass="button" Text="Book" OnClick="Button_Book_Click" />
    </p>
    
</asp:Content>
