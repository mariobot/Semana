using System;
using System.Collections.Generic;
using System.Web.Script.Serialization;
using ServiceSemana.Model;
using ServiceSemana.ServiceSemana2;

namespace ServiceSemana
{
    public partial class ConsultaImages : System.Web.UI.Page
    {
        ServiceSemana2.wsItemSoap SearchSemana = new ServiceSemana2.wsItemSoapClient();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)                            
                ConsultarImagenes();
            
            
        }       

        protected void ConsultarImagenes() {

            //{title:'', sortBy:'FechaPublicacion', asc:false, idTipoItem:1, idSeccion:34, calculadora:false, pageNumber:0, pageSize:20}
            getItemsRequestBody ItemsRequestBody = new getItemsRequestBody("", "FechaPublicacion", false, 1, 34, false, 0, 20);
            getItemsRequest ItemsRequest = new getItemsRequest(ItemsRequestBody);

            getItemsResponse ItemsResponse = SearchSemana.getItems(ItemsRequest);
            
            string JSonReady = RemoveFromEnd(ItemsResponse.Body.getItemsResult, "}] {Total");

            JavaScriptSerializer jss = new JavaScriptSerializer();

            List<Noticia> NoticiasList = jss.Deserialize<List<Noticia>>(JSonReady);

            repeaterPictures.DataSource = NoticiasList;
            repeaterPictures.DataBind();
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