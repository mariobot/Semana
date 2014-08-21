namespace ServiceSemana.Model
{
    public class Noticia
    {
        public string Id { get; set; }
        public string IdEdicion { get; set; }
        public string IdTipoItem { get; set; }
        public string IdSeccion { get; set; }
        public string AnteTitulo { get; set; }
        public string Titulo { get; set; }
        public string Resumen { get; set; }
        public string RutaImagen { get; set; }
        public string UrlFriendly { get; set; }
        public string FechaUltimaModificacion { get; set; }
    }
}