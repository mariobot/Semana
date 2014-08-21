using System;
using System.Collections.Generic;
using System.Web.Script.Serialization;
using System.Web.UI.WebControls;
using ServiceSemana.Model;
using ServiceSemana.ServiceSemana2;

namespace ServiceSemana
{
    public partial class ConsultaCategoria : System.Web.UI.Page
    {   
        ServiceSemana2.wsItemSoap SearchSemana = new ServiceSemana2.wsItemSoapClient();

        int pagina;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack){
                pagina = 1;
                lblPagina.Text = "Pagina: << " + pagina + " >>";
                Session["page"] = pagina;
                ConsultarNoticia();
            }
            else
                pagina = (int)Session["page"];
        }

        protected void ConsultarNoticia() {

            int categoria = Convert.ToInt16(Menu1.SelectedValue);

            getItemsBySeccionRequestBody SeccionBody = new getItemsBySeccionRequestBody();
            getItemsBySeccionRequest SeccionRequest = new getItemsBySeccionRequest(SeccionBody);

            SeccionRequest.Body.bImpresa = true;
            SeccionRequest.Body.bOnLine = true;
            SeccionRequest.Body.idSeccion = categoria;
            SeccionRequest.Body.pageNumber = (int)Session["page"];
            SeccionRequest.Body.pageSize = 20;
            SeccionRequest.Body.what = "";

            getItemsBySeccionResponse SeccionResponse = SearchSemana.getItemsBySeccion(SeccionRequest);
            
            JavaScriptSerializer jss = new JavaScriptSerializer();
            List<Noticia> AreasList = jss.Deserialize<List<Noticia>>(SeccionResponse.Body.getItemsBySeccionResult);
            
            fuck.DataSource = AreasList;
            fuck.DataBind();

            repeaterNoticias.DataSource = AreasList;
            repeaterNoticias.DataBind();
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {   
            pagina = (int)Session["page"] + 1;
            lblPagina.Text = "Pagina: << " + pagina + " >>";
            Session["page"] = pagina;

            ConsultarNoticia();
        }

        protected void btnPreviews_Click(object sender, EventArgs e)
        {
            if ((int)Session["page"] != 1)
                pagina = (int)Session["page"] - 1 ;
            lblPagina.Text = "Pagina: << " + pagina + " >>";
            Session["page"] = pagina;

            ConsultarNoticia();
        }

        protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
        {
            pagina = 1;
            lblPagina.Text = "Pagina: << " + pagina + " >>";
            Session["page"] = pagina;
            ConsultarNoticia();
        }
    }
}