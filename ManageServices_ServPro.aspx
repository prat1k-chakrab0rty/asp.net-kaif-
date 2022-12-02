<%@ Page Title="" Language="C#" MasterPageFile="~/ServPro.Master" AutoEventWireup="true" CodeBehind="ManageServices_ServPro.aspx.cs" Inherits="ruralCompany.ManageServices_ServPro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="style/styleHome.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h3>Manage Services</h3>

    <asp:GridView ID="GridView_ManageServices" runat="server" CssClass="mydatagrid" PagerStyle-CssClass="pager" HeaderStyle-CssClass="gridviewheader" RowStyle-CssClass="rows" AllowPaging="True" AutoGenerateSelectButton="True" OnSelectedIndexChanged="GridView_ManageServices_SelectedIndexChanged"/>

    <br />
    <h3>
        <asp:Button ID="Button_DeleteService" runat="server" CssClass="button" OnClick="Button_DeleteService_Click" Text="Delete Service" />
&nbsp;<asp:Button ID="Button_ChangeStatus" runat="server" CssClass="button" OnClick="Button_ChangeStatus_Click" Text="Change Status" />
&nbsp;
        &nbsp;<asp:Label ID="Label_ServName" runat="server" Visible="False"></asp:Label>
    </h3>
    <h3>Add new service</h3>
    <p>
        <asp:Label ID="Label_Service" runat="server" Text="Service"></asp:Label>
&nbsp; <asp:DropDownList ID="DropDownList_Service" runat="server" DataSourceID="services" DataTextField="serviceName" DataValueField="serviceName" AppendDataBoundItems="True" CssClass="ddl">
            <Items>
       <asp:ListItem Text="Select" Value="" />
   </Items>
        </asp:DropDownList>
        &nbsp;
        <asp:Label ID="Label_Status" runat="server" Text="Status  "></asp:Label>
        <asp:DropDownList ID="DropDownList_Status" runat="server" CssClass="ddl">
            <asp:ListItem Value="I">Inactive</asp:ListItem>
            <asp:ListItem Value="A">Active</asp:ListItem>
        </asp:DropDownList>
&nbsp;<asp:Button ID="Button_AddService" runat="server" CssClass="button" OnClick="Button_AddService_Click" Text="ADD" />
&nbsp;<asp:SqlDataSource ID="services" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\ruralCompany.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT DISTINCT [serviceName] FROM [services]"></asp:SqlDataSource>
    </p>

</asp:Content>
