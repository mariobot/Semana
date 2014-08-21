<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="ConsultaImages.aspx.cs" Inherits="ServiceSemana.ConsultaImages" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    
    <script type="text/javascript">
        $(document).ready(function () {
            $('a.gallery').colorbox({ rel: 'gallery', transition: "none", width: "75%", height: "75%" });
        });

        function pageLoad() {
            var isAsyncPostback = Sys.WebForms.PageRequestManager.getInstance().get_isInAsyncPostBack();
            if (isAsyncPostback) {
                //Examples of how to assign the ColorBox event to elements
                $('a.gallery').colorbox({ rel: 'gallery', transition: "none", width: "75%", height: "75%" });
            }
        }
      
    </script>
    
    <style type="text/css">
        .style1
        {
            width: 135px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">    
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td class="style1">
                    <br />
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                    <br />
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <asp:Repeater ID="repeaterPictures" runat="server">
                            <HeaderTemplate>                                
                            </HeaderTemplate>
                            <ItemTemplate>
                                <a class="gallery" href='<%# Eval("RutaImagen") %>' >
                                    <asp:Image ID="Image1" ImageUrl='<%# Eval("RutaImagen") %>' runat="server"
                                        Width="150px" Height="150px" ToolTip='<%# Eval("Titulo") %>' />
                                </a>
                            </ItemTemplate>
                            <FooterTemplate>
                            </FooterTemplate>
                        </asp:Repeater>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        </td>
                </tr>
                <tr>
                    <td class="style1">
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
