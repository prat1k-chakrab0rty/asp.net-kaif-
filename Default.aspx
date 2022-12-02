<%@ Page Title="" Language="C#" MasterPageFile="~/Guest.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ruralCompany.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="style/style1.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Welcome to The Rural Company🙏🏼</h2>
    <div class="gridServices">
        <div class="row1">
        <div class="carpenter">
            <img src="Images/carpenter.png" />
            <span>Carpenter</span>
        </div>
        <div class="cleaning">
            <img src="Images/cleaning.png" />
            <span>Home Cleaning</span>
        </div>
        <div class="electrician">
            <img src="Images/electrician.png" />
            <span>Electrician</span>
        </div>
        <div class="paint">
            <img src="Images/paint.png" />
            <span>Home Painting</span>
        </div></div>
        <div class="row2"><div class="pest-control">
            <img src="Images/pest-control.png" />
            <span>Pest Control</span>
        </div>
        <div class="plumber">
            <img src="Images/plumber.png" />
            <span>Plumber</span>
        </div>
        <div class="repair">
            <img src="Images/repair.png" />
            <span>Appliance Repair</span>
        </div></div>
    </div>
</asp:Content>
