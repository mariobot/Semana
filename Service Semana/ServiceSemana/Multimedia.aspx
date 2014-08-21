<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Multimedia.aspx.cs" Inherits="ServiceSemana.Multimedia" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td colspan="2" align="center">
                        <asp:Button ID="btnPreviews" Text="<< Anterior" runat="server" 
                            onclick="btnPreviews_Click" />
                        <asp:Label ID="lblPagina" Text="" runat="server" />
                        <asp:Button ID="btnNext" Text="Siguiente >>" runat="server" 
                            onclick="btnNext_Click"  />
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
                    <asp:Repeater ID="repeaterMultimedia" runat="server">
                            <HeaderTemplate></HeaderTemplate>
                            <ItemTemplate>
                                <a href='http://www.semana.com<%# Eval("UrlFriendly") %>' target="_blank">
                                    <div id="node1">
                                        <div id="node3">
                                            (<%# Eval("AnteTitulo") %>)
                                            <strong><%# Eval("Titulo") %></strong>
                                        </div>
                                        <!-- #node3 end TITULO -->
                                        <div id="node2">
                                            <asp:Image ID="Image1" ImageUrl='<%# Eval("RutaImagen") %>' Width="100px"
                                                Height="100px" runat="server" />
                                        </div>
                                        <!-- #node2 end IMAGEN -->
                                        <div id="node3">
                                            <%# Eval("Resumen") %>
                                        </div>
                                        <!-- #node4 end  RESUMEN-->
                                    </div>
                                    <!-- #node1 end -->
                                </a>
                            </ItemTemplate>
                            <FooterTemplate></FooterTemplate>
                        </asp:Repeater>

                        <asp:GridView ID="gridMultimedias" runat="server" />
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
