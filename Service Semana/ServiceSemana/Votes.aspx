<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Votes.aspx.cs" Inherits="ServiceSemana.Votes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label Text="Indique el numero de veces que quiere votar" runat="server" />
    <asp:TextBox runat="server" ID="txtNoVotos" Text="10" />
    <asp:Button Text="Votar multiples veces." runat="server" ID="btnVotar" OnClick="btnVotar_Click" />
    <hr />
    <asp:TextBox runat="server" TextMode="MultiLine" ID="txtResult" Columns="40" Rows="40" />
</asp:Content>
