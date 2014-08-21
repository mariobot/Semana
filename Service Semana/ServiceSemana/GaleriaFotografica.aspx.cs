using System;
using System.Collections.Generic;
using System.Web.Script.Serialization;
using System.Web.Services;
using ServiceSemana.Model;
using ServiceSemana.ServiceSemana2;

namespace ServiceSemana
{
    public partial class GaleriaFotografica : System.Web.UI.Page
    {
        ServiceSemana2.wsItemSoapClient SearchSemana = new wsItemSoapClient();
        
        int pagina;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack){
                pagina = 1;
                Session["page"] = pagina;
                lblPagina.Text = "Pagina: << " + pagina + " >>";
                ConsultarFotografias();
            }
            else
                pagina = (int)Session["page"];
            
        }

        protected void ConsultarFotografias() {

            // 5 es para las fotografias. 
            //{title:'', sortBy:'FechaPublicacion', asc:false, idTipoItem:5, idSeccion:0, calculadora:false, pageNumber:0, pageSize:20}
            getItemsRequestBody ItemsRequestBody = new getItemsRequestBody("", "FechaPublicacion", false, 5, 0, false, Convert.ToInt16(Session["page"]), 10);
            getItemsRequest ItemsRequest = new getItemsRequest(ItemsRequestBody);

            getItemsResponse ItemsResponse = SearchSemana.getItems(ItemsRequest);

            string JSonReady = RemoveFromEnd(ItemsResponse.Body.getItemsResult, "}] {Total");
             
            JavaScriptSerializer jss = new JavaScriptSerializer();
            List<Noticia> ImagesList = jss.Deserialize<List<Noticia>>(JSonReady);

            repeaterGaleria.DataSource = ImagesList;
            repeaterGaleria.DataBind();
        }

        protected void btnSiguiente_Click(object sender, EventArgs e)
        {
            pagina = (int)Session["page"] + 1;
            lblPagina.Text = "Pagina: << " + pagina + " >>";
            Session["page"] = pagina;

            ConsultarFotografias();
        }

        protected void btnAnterior_Click(object sender, EventArgs e)
        {   
            if((int)Session["page"]!= 1)
                pagina = (int)Session["page"] - 1;

            lblPagina.Text = "Pagina: << " + pagina + " >>";
            Session["page"] = pagina;

            ConsultarFotografias();
        }

        [WebMethod()]
        static public List<Foto> wsGaleria(string idGaleria) {

            wsItemSoapClient SearchSemana = new wsItemSoapClient();

            getGaleriaRequestBody GaleriaRequestBody = new getGaleriaRequestBody(idGaleria, "1");
            getGaleriaRequest GaleriaRequest = new getGaleriaRequest(GaleriaRequestBody);

            getGaleriaResponse GaleriaResponse = SearchSemana.getGaleria(GaleriaRequest);

            JavaScriptSerializer jss = new JavaScriptSerializer();
            List<Foto> FotosList = jss.Deserialize<List<Foto>>(GaleriaResponse.Body.getGaleriaResult);

            return FotosList;
        }

        public static string RemoveFromEnd(string s, string suffix)
        {
            // se eliminan los 11 caracteres finales que corresponden a {Total:999}
            if (s.Contains(suffix))
                return s.Substring(0, s.Length - 11);
            else
                return s;
        }
    }
}