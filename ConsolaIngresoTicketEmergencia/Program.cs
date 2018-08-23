using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Data.SqlClient;
using OpenPop.Pop3;
using System.IO;
using System.Text.RegularExpressions;
using System.Data;
using DAL;
using HtmlAgilityPack;

namespace ConsolaIngresoTicketEmergencia
{
    class Program
    {
        static void Main(string[] args)
        {
            Datos dal = new Datos();
            string usuarioSQL = ConfigurationSettings.AppSettings["usuarioSQL"];
            string servidorSQL = ConfigurationSettings.AppSettings["servidorSQL"];
            string passwordSQL = ConfigurationSettings.AppSettings["passwordSQL"];
            string bd = ConfigurationSettings.AppSettings["bdSQL"];
            string email = ConfigurationSettings.AppSettings["emailGmail1"];
            string pass = ConfigurationSettings.AppSettings["passGmail1"];
            string hostname = "mail.tagor.cl";
            int port = 995;
            bool useSsl = true;
            string cnnStr = "Data Source=" + servidorSQL + ";Initial Catalog=" + bd + ";User ID=" + usuarioSQL + ";Password=" + passwordSQL + "";
            string username = email;
            
            //creamos el objeto
            //ConnectPop3 oCP3 = new ConnectPop3();
            //invocamos el metodo para obtener mensajes
            Console.WriteLine("Descargando correos...");
            
            Pop3Client client = new Pop3Client();
            client.Connect(hostname, port, useSsl);
            client.Authenticate(email, pass);
            int messageCount = client.GetMessageCount();
            
            //List<OpenPop.Mime.Message> allMessages = new List<OpenPop.Mime.Message>(messageCount);
            for (int i = messageCount; i > 0; i--)
            {
                try
                {
                    int cont = i;
                    Console.WriteLine(cont);
                    //allMessages.Add(client.GetMessage(i));
              
                    OpenPop.Mime.Message oMessage = client.GetMessage(i);
                    string idGmail = oMessage.Headers.MessageId;

                    DataTable dt = new DataTable();
                    dt = dal.getBuscarEmailCasilla(idGmail).Tables[0];
                    if (dt.Rows.Count > 0)
                    {
                        continue;
                    }
                    
                    string subject = oMessage.Headers.Subject;
                    string from = oMessage.Headers.From.MailAddress.Address;
                    string cc = oMessage.Headers.From.MailAddress.Address;
                    string copy = string.Empty;
                    if (from != "noreply@moreapp.com")
                    {
                        continue;
                    }

                    string fechaCorreo = oMessage.Headers.Date;
                    DateTime date;
                    try
                    {
                        date = Convert.ToDateTime(fechaCorreo);
                    }
                    catch (Exception ex)
                    {
                        string ccc = ex.Message;
                        continue;
                    }
                    Console.WriteLine(oMessage.Headers.MessageId);
                    
                    string para = string.Empty;
                    foreach (var item in oMessage.Headers.To)
                    {
                        para += item.MailAddress.Address + ";";
                    }

                    para = para.Remove(para.Length - 1);

                    //Console.WriteLine(username);
                    string to = username;
                    StringBuilder builder = new StringBuilder();
                    OpenPop.Mime.MessagePart plainText = oMessage.FindFirstPlainTextVersion();
                    OpenPop.Mime.MessagePart htmlText = oMessage.FindFirstHtmlVersion();
                    string bodyHtml = htmlText.GetBodyAsText();
                    string textoPlano = plainText.GetBodyAsText();
                    string texto = HtmlToPlainText(bodyHtml);

                    int index = texto.IndexOf("Local");
                    string local = texto.Substring(index - 4, 4);
                    Console.WriteLine(local);

                    DataTable dtLocal = new DataTable();
                    dtLocal = dal.getBuscarLocalPorCod(local).Tables[0];
                    string idLocal = string.Empty;
                    string idSucursal = string.Empty;
                    string idZona = string.Empty;
                    foreach (DataRow item in dtLocal.Rows)
                    {
                        idLocal = item["ID_LOCAL"].ToString();
                        if (item["REGION"].ToString().Trim() == "Valparaíso")
                        {
                            idSucursal = "3";
                        } else if (item["REGION"].ToString().Trim() == "Region Metropolitana")
                        {
                            idSucursal = "2";
                        }
                        idZona = item["ID_ZONA"].ToString();
                    }
                    
                    HtmlDocument doc = new HtmlDocument();
                    doc.LoadHtml(bodyHtml);
                    HtmlNodeCollection ImageNodes = doc.DocumentNode.SelectNodes("//span");

                    DataTable dtTabla = new DataTable();
                    dtTabla.Columns.Add("TEXTO");
                    string textoHtm = string.Empty;
                    foreach (HtmlNode Node in ImageNodes)
                    {
                        string htm = Node.InnerText.Replace("&nbsp;", " ").Replace(":", "").Trim();
                        if (htm != string.Empty)
                        {
                            textoHtm += htm + ";";
                            DataRow toInsert = dtTabla.NewRow();
                            dtTabla.Rows.Add(htm);
                        }
                    }
                    
                    string comentario = string.Empty;
                    string nroReporte = string.Empty;
                    string fallaOAnomalia = string.Empty;
                    string supuestaArea = string.Empty;
                    string telefono = string.Empty;
                    string solicitadoPor = string.Empty;
                    if (!string.IsNullOrEmpty(dtTabla.Rows[5]["TEXTO"].ToString()))
                    {
                        nroReporte = dtTabla.Rows[1]["TEXTO"].ToString();
                        fallaOAnomalia = dtTabla.Rows[2]["TEXTO"].ToString();
                        supuestaArea = dtTabla.Rows[10]["TEXTO"].ToString();
                        telefono = dtTabla.Rows[18]["TEXTO"].ToString();
                        solicitadoPor = dtTabla.Rows[14]["TEXTO"].ToString();
                    }

                    string tipo = "C";
                    //string tipo = string.Empty;
                    //int ddd = fallaOAnomalia.IndexOf("Falla Técnica");
                    //if (fallaOAnomalia.IndexOf("Falla Técnica") > 0)
                    //{
                    //    tipo = "C";
                    //}
                    //else if (fallaOAnomalia.IndexOf("Falla Técnica") == -1)
                    //{
                    //    tipo = "CP";
                    //}
                    string idArea = string.Empty;
                    if (supuestaArea == "Facility Servicios Sanitarios")
                    {
                        idArea = "2";
                    }
                    else /*if (supuestaArea=="")*/
                    {
                        idArea = "1";
                    }
                    
                    foreach (DataRow item in dtTabla.Rows)
                    {
                        comentario += item["TEXTO"].ToString() + "\r\n";
                    }

                    if (plainText != null)
                    {
                        // We found some plaintext!
                        builder.Append(plainText.GetBodyAsText());
                    }
                    else
                    {
                        // Might include a part holding html instead
                        OpenPop.Mime.MessagePart html = oMessage.FindFirstHtmlVersion();
                        if (html != null)
                        {
                            // We found some html!
                            builder.Append(html.GetBodyAsText());
                        }
                    }

                    foreach (var copia in oMessage.Headers.Cc)
                    {
                        copy = copia.MailAddress.Address + ";";
                    }

                    StringBuilder sb = new StringBuilder();
                    sb.Append("stp_IngresarEmailCasilla '" + idGmail + "','" + from
                        + "','" + subject + "','" + builder + "','" + date.ToString() + "','','" + para + "','" + bodyHtml + "','" + copy + "',''");

                    setQuery(cnnStr, sb.ToString());

                    string fileName = string.Empty;
                    int cantidadAdjuntos = oMessage.FindAllAttachments().Count;
                    string archivo1 = string.Empty;
                    string archivo2 = string.Empty;
                    int contador = 0;
                    foreach (var attachment in oMessage.FindAllAttachments())
                    {
                        contador++;

                        string filePath = ConfigurationSettings.AppSettings["adjunto"];
                        fileName = idGmail + "_" + attachment.FileName.Replace("?", "");
                        filePath = filePath + fileName;
                        FileStream Stream = new FileStream(@filePath, FileMode.Create);
                        BinaryWriter BinaryStream = new BinaryWriter(Stream);
                        BinaryStream.Write(attachment.Body);
                        BinaryStream.Close();

                        if (contador == 1)
                        {
                            archivo1 = fileName;
                        }
                        if (contador == 2)
                        {
                            archivo2 = fileName;
                        }

                        string sql = "stp_IngresarAdjuntoEmail '" + idGmail + "','" + fileName + "','" + fileName + "'";
                        setQuery(cnnStr, sql);
                    }
                    IngresarOT(tipo, idLocal, idArea, idSucursal, comentario, telefono, solicitadoPor, idZona, archivo1, archivo2);
                }
                catch (Exception ex)
                {
                    string sss = ex.Message;
                }
            }
            int cantidad = messageCount;
            Console.WriteLine("Cantidad de msj: " + cantidad.ToString());
            //Console.ReadKey();

        }

        static void IngresarOT(string tipo, string idLocal, string idArea, string idSucursal, string comentario, string telefono, string solicitadoPor,
            string idZona, string archivo1, string archivo2)
        {
            Datos dal = new Datos();
            //MUY IMPORTANTE
            string email = string.Empty;
            string idUsuarioAsignado = string.Empty;
            if (tipo == "C")//si es correctivo se le asigna al supervisor
            {
                DataTable dtUsuarios = new DataTable();
                dtUsuarios = dal.getBuscarUsuarioAsignadoPorIdLocalIdPerfil(idLocal, "5", idArea).Tables[0];

                if (dtUsuarios.Rows.Count == 0)
                {
                    //lblInfo.Text = "No se puede ingresar la SOLPED. <br> Razon: No hay un supervisor asignado al local seleccionado";
                    //divAlerta.Visible = true;
                    return;
                }

                foreach (DataRow item in dtUsuarios.Rows)
                {
                    idUsuarioAsignado = item["ID_USUARIO"].ToString();
                    email = item["EMAIL"].ToString();
                    break;
                }
            }
            else if (tipo == "CP")
            {
                DataTable dtUsuarios = new DataTable();
                dtUsuarios = dal.getBuscarUsuarioAsignadoPorIdLocalIdPerfil(idLocal, "3", null).Tables[0];

                if (dtUsuarios.Rows.Count == 0)
                {
                    //lblInfo.Text = "No se puede ingresar la SOLPED. <br> Razon: No hay un coordinador asignado al local seleccionado";
                    //divAlerta.Visible = true;
                    return;
                }

                foreach (DataRow item in dtUsuarios.Rows)
                {
                    idUsuarioAsignado = item["ID_USUARIO"].ToString();
                    email = item["EMAIL"].ToString();
                    break;
                }

                //if (string.IsNullOrEmpty(txtFechaAgendamiento.Text))
                //{
                //    lblInfo.Text = "La fecha de agendamiento es obligatoria cuando es de tipo Correctiva Planificada";
                //    divAlerta.Visible = true;
                //    return;
                //}
            }

            /////////////////////////////////////////////////

            //ingreso OT


            //if (ddlTipoOT.SelectedValue == "C")
            //{
            //    txtFechaAgendamiento.Text = string.Empty;
            //}

            //AQUI
            string idTipificacion = string.Empty;
            if (idArea=="1")
            {
                idTipificacion = "281";
            }
            else if (idArea=="2")
            {
                idTipificacion = "282";
                    
            }
            string idUsuario = "0";

            string ticket = dal.setIngresarOT(idTipificacion, idUsuario, idUsuarioAsignado, "1", comentario,
                "D", "EMERGENCIA", "1", tipo, idLocal, telefono,
                solicitadoPor, idZona, idArea, null, idSucursal);
            //FIN ingreso

            dal.setIngresarTicketHistorico(ticket, idUsuario, idUsuarioAsignado, "1",
                comentario, null);

            if (archivo1 != string.Empty)
            {

                dal.setEditarRutaArchivoGestion(Convert.ToInt32(ticket), archivo1);
            }

            if (archivo2 != string.Empty)
            {
              
                dal.setEditarRutaArchivoGestion2(Convert.ToInt32(ticket), archivo2);
            }
            
            string bodyResolutor = "Estimado(a) Usuario:<br>";
            bodyResolutor += "Se ha generado la siguiente SOLPED a través del sistema con Nº " + ticket + " para su gestión:";
            bodyResolutor += "<br><br>Observacion: <b>";
            bodyResolutor += comentario + "</b>";
            bodyResolutor += "<br>";
            bodyResolutor += "Le agradecemos revisar a la brevedad en el sistema de mantenimiento de Tagor.​";
            bodyResolutor += "http://190.96.2.126/eot/SeguimientoOT.aspx?t=" + ticket;
            bodyResolutor += "<br><br>";
            bodyResolutor += "<table style='width:100%' border='1'><tr><td><img src='http://190.96.2.126/eot/assets/img/logo-tagor.png' width='20%' alt='Firma Logo' /></td>";
            bodyResolutor += "<td>Mantenimiento Tagor <br>Cerro El Plomo 5931, oficina 612, , Las Condes, Santiago, Chile<br>+56 22 762 2572<br>info@tagor.cl</td></tr></table>";

            TagorManuCRM.Comun com = new TagorManuCRM.Comun();
            com.EnviarEmail(email, bodyResolutor.Replace("\r\n", "<br>"), "EMERGENCIA - Nueva OT Nº" + ticket);
        }

        private static string HtmlToPlainText(string html)
        {
            const string tagWhiteSpace = @"(>|$)(\W|\n|\r)+<";//matches one or more (white space or line breaks) between '>' and '<'
            const string stripFormatting = @"<[^>]*(>|$)";//match any character between '<' and '>', even when end tag is missing
            const string lineBreak = @"<(br|BR)\s{0,1}\/{0,1}>";//matches: <br>,<br/>,<br />,<BR>,<BR/>,<BR />
            var lineBreakRegex = new Regex(lineBreak, RegexOptions.Multiline);
            var stripFormattingRegex = new Regex(stripFormatting, RegexOptions.Multiline);
            var tagWhiteSpaceRegex = new Regex(tagWhiteSpace, RegexOptions.Multiline);

            var text = html;
            //Decode html specific characters
            text = System.Net.WebUtility.HtmlDecode(text);
            //Remove tag whitespace/line breaks
            text = tagWhiteSpaceRegex.Replace(text, "><");
            //Replace <br /> with line breaks
            text = lineBreakRegex.Replace(text, Environment.NewLine);
            //Strip formatting
            text = stripFormattingRegex.Replace(text, string.Empty);

            return text;
        }

        static void setQuery(string ConnectionString, string SQL)
        {
            SqlConnection conn = new SqlConnection(ConnectionString);
            conn.Open();

            SqlCommand cmd = new SqlCommand(SQL, conn);
            cmd.CommandTimeout = 99999999;
            try
            {
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                string ddd = ex.Message;
            }

            conn.Close();
        }
        

    }
}
