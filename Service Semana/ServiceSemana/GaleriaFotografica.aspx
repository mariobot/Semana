<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GaleriaFotografica.aspx.cs" Inherits="ServiceSemana.GaleriaFotografica" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    
    <script type="text/javascript">
        
    
    </script>
    

    <script type="text/javascript">
        function showPictures(idGaleria) {
            $.ajax({
                type: "POST",
                url: "GaleriaFotografica.aspx/wsGaleria",
                data: "{idGaleria:" + idGaleria + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    //var items = (typeof response) == 'string' ? eval('(' + response + ')') : response;
                    var items = response.d;
                    var name = '';
                    var outputHtml = '';
                    //alert(response.d[0].FotoGrande);
                    for (var i = 0; i < items.length; i++) {
                        outputHtml += '<a class="gallery" href="' + items[i].Url + '"><img src="' + items[i].Url + '" style="max-height:100px;height:100px"></a>';
                    };
                    $("#Pictures").html(outputHtml);                    
                    $('a.gallery').colorbox({ opacity:0.5 , rel:'group1' });
                    
                },
                error: function (result) {
                    alert('ERROR ' + result.status + ' ' + result.statusText);
                }
            });
        }
        
        
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
   
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td>
                        
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <asp:Button ID="btnAnterior" Text="<< Anterior" runat="server" 
                            onclick="btnAnterior_Click" />
                        <asp:Label ID="lblPagina" Text="" runat="server" />
                        <asp:Button ID="btnSiguiente" Text="Siguiente >>" runat="server" 
                            onclick="btnSiguiente_Click" />
                    </td>
                </tr>
                <tr>
                    <td><br /></td>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div id="Pictures"></div>
                        <asp:GridView ID="GridGaleria" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Repeater ID="repeaterGaleria" runat="server">
                            <HeaderTemplate>
                            </HeaderTemplate>
                            
                            <ItemTemplate>
                                <a href="#">
                                    <div id="node1" onclick="showPictures(<%# Eval("Id") %>)">
                                        <div id="node3">
                                            <strong>
                                                <%# Eval("Titulo") %></strong>
                                        </div>
                                        <!-- #node3 end TITULO -->
                                        <div id="node2">
                                            <asp:Image ID="Image1" ImageUrl='<%# Eval("RutaImagen ") %>' Width="150px"
                                                Height="150px" runat="server" />
                                        </div>
                                        <!-- #node2 end IMAGEN -->
                                        <div id="node4">
                                            <%--<%# Eval("Resumen") %>--%>
                                        </div>
                                        <!-- #node4 end  RESUMEN-->
                                        </div>
                                    </div>
                                    <!-- #node1 end -->
                                </a>
                            </ItemTemplate>

                            <FooterTemplate>
                            </FooterTemplate>
                        </asp:Repeater>
                    </td>
                </tr>
            </table>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
