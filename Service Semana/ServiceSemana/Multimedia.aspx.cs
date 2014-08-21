using System;
using System.Collections.Generic;
using System.Web.Script.Serialization;
using ServiceSemana.Model;
using ServiceSemana.ServiceSemana2;

namespace ServiceSemana
{
    public partial class Multimedia : System.Web.UI.Page
    {
        wsItemSoapClient SemanaSearch = new wsItemSoapClient();
        
        int pagina;

        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {   
                pagina = 1;
                lblPagina.Text = "Pagina: << " + pagina + " >>";
                ConsultarMultimedia();
                Session["pagina"] = pagina;
            }
            else {
                pagina = (int)Session["pagina"];
            }
        }

        protected void ConsultarMultimedia() {

            getMultimediasRequestBody MultimediasRequestBody = new getMultimediasRequestBody(Convert.ToInt16(Session["pagina"]), 20);
            getMultimediasRequest MultimediasRequest = new getMultimediasRequest(MultimediasRequestBody);

            getMultimediasResponse MultimediasResponse = SemanaSearch.getMultimedias(MultimediasRequest);

            JavaScriptSerializer jss = new JavaScriptSerializer();
            List<Noticia> NoticiasList = jss.Deserialize<List<Noticia>>(MultimediasResponse.Body.getMultimediasResult);
            
            repeaterMultimedia.DataSource = NoticiasList;
            repeaterMultimedia.DataBind();
        }

        protected void btnPreviews_Click(object sender, EventArgs e)
        {
            pagina = (int)Session["pagina"];
            
            if (pagina != 1)
                pagina = pagina - 1;
            lblPagina.Text = "Pagina: << " + pagina + " >>";
            Session["pagina"] = pagina;

            ConsultarMultimedia();
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            pagina = (int)Session["pagina"] + 1;
            lblPagina.Text = "Pagina: << " + pagina + " >>";
            Session["pagina"] = pagina;

            ConsultarMultimedia();
        }
    }
}