<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="ConsultaCategoria.aspx.cs" Inherits="ServiceSemana.ConsultaCategoria" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script src="Scripts/jquery-ui-1.9.1.custom.min.js" type="text/javascript"></script>
    <link href="Styles/jquery-ui/jquery-ui-1.9.1.custom.min.css" rel="stylesheet" type="text/css" />
    <link href="Styles/jquery-ui/jquery-ui-1.9.1.custom.css" rel="stylesheet"
        type="text/css" />
    <script type="text/javascript">
        $(document).ready(function () {
            
        });
        function showNews(idArticulo) {            
            var content = $('#' + idArticulo + '').html();
            $("#dialog").html(content);
            $("#dialog").dialog({ width: 750, height: 600, modal: true, title: 'Noticia', open: true });            
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td colspan="2">
                        <asp:Menu ID="Menu1" runat="server" Font-Size="X-Large" OnMenuItemClick="Menu1_MenuItemClick" Orientation="Horizontal" StaticSubMenuIndent="16px">                            
                            <DynamicHoverStyle BackColor="#99CCFF" />
                            <DynamicMenuItemStyle BackColor="#99CCFF" />
                            <DynamicSelectedStyle BackColor="#66CCFF" />
                            <Items>
                                <asp:MenuItem Selected="True" Text="Nacional" Value="3"></asp:MenuItem>
                                <asp:MenuItem Text="Economia" Value="4"></asp:MenuItem>
                                <asp:MenuItem Text="Mundo" Value="5"></asp:MenuItem>
                                <asp:MenuItem Text="Gente" Value="8"></asp:MenuItem>
                                <asp:MenuItem Text="Cultura" Value="6"></asp:MenuItem>
                                <asp:MenuItem Text="Deportes" Value="20"></asp:MenuItem>
                                <asp:MenuItem Text="Opinion" Value="10"></asp:MenuItem>
                                <asp:MenuItem Text="Especiales" Value="16"></asp:MenuItem>
                            </Items>
                            <StaticSelectedStyle BackColor="#99CCFF" />
                        </asp:Menu>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <asp:Button ID="btnPreviews" Text="<< Anterior" runat="server" onclick="btnPreviews_Click" />
                        <asp:Label ID="lblPagina" Text="" runat="server" Font-Size=X-Large />
                        <asp:Button ID="btnNext" Text="Siguiente >>" runat="server" 
                            onclick="btnNext_Click" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Repeater ID="repeaterNoticias" runat="server">
                            <HeaderTemplate></HeaderTemplate>
                            <ItemTemplate>
                                <a href="#" onclick="showNews('<%#Eval("Id")%> ')">
                                    <div id="node1">
                                        <div id="node3">
                                            <strong><%# Eval("Titulo") %></strong>
                                        </div>
                                        <!-- #node3 end TITULO -->
                                        <div id="node2">
                                            <asp:Image ID="Image1" ImageUrl='<%# Eval("RutaImagen") %>' Width="100px"
                                                Height="100px" runat="server" />
                                        </div>
                                        <!-- #node2 end IMAGEN -->
                                        <div id="node4">
                                            <%# Eval("Resumen") %>
                                        </div>
                                        <!-- #node4 end  RESUMEN-->
                                        <div id='<%# Eval("Id") %>' style="display:none;">
                                            <asp:Image ID="Image2" ImageUrl='<%# Eval("RutaImagen") %>' Width="100px"
                                                Height="100px" runat="server" />
                                            <%# Eval("Resumen") %>
                                        </div>
                                    </div>
                                    <!-- #node1 end -->
                                </a>
                            </ItemTemplate>
                            <FooterTemplate></FooterTemplate>
                        </asp:Repeater>
                    </td>
                </tr> 
                <asp:GridView ID="fuck" runat="server" AutoGenerateColumns="true" Visible="false" />               
            </table>
            <div id="dialog" style="display: none; font-size: 10px;">
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
