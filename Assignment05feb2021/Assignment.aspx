<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Assignment.aspx.cs" Inherits="Assignment05feb2021.Assignment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
    &nbsp;<asp:DropDownList ID="ddlCountries" runat="server" AutoPostBack="True"  
        DataTextField="CountryName" DataValueField="CountryId" OnSelectedIndexChanged="ddlCountries_SelectedIndexChanged">
        </asp:DropDownList>
        <br />
        <br />
        <br />
        <br />
        <asp:DropDownList ID="ddlStates" runat="server" AutoPostBack="True"  
            DataTextField="StateName" DataValueField="StateId" OnSelectedIndexChanged="ddlStates_SelectedIndexChanged">
        </asp:DropDownList>
        <br />
        <br />
        <br />
&nbsp;<br />
        <asp:DropDownList ID="ddlCities" runat="server"
            DataTextField="CityName" DataValueField="CityId">
        </asp:DropDownList>
    </form>
</body>
</html>
