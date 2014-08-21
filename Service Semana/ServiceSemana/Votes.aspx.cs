using System;

namespace ServiceSemana
{
    public partial class Votes : System.Web.UI.Page
    {
        ServiceSemana2.wsItemSoapClient _WS = new ServiceSemana2.wsItemSoapClient();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnVotar_Click(object sender, EventArgs e)
        {
            txtResult.Text = "";
            if (txtNoVotos.Text != string.Empty)
	        {
                ServiceSemana2.addVoteRequestBody addVoteRequesBody = new ServiceSemana2.addVoteRequestBody(1162, 5170); 
                ServiceSemana2.addVoteRequest addVoteRequest = new ServiceSemana2.addVoteRequest(addVoteRequesBody);

                for (int i = 0; i < Convert.ToInt16(txtNoVotos.Text); i++)
			    {
			        ServiceSemana2.addVoteResponse addVoteResponse = _WS.addVote(addVoteRequest);
                    txtResult.Text += i + "Votos" + Environment.NewLine;
			    }

                _WS.Close();
	        }
        }
    }
}