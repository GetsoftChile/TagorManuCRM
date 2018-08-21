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
            //List<OpenPop.Mime.Message> lstMensajes = oCP3.getMensajes();
            Console.WriteLine("Descargando correos...");
            //List<OpenPop.Mime.Message> lstMensajes = oCP3.FetchAllMessages();

            
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
                    string subject = oMessage.Headers.Subject;
                    string from = oMessage.Headers.From.MailAddress.Address;
                    string cc = oMessage.Headers.From.MailAddress.Address;
                    string copy = string.Empty;
                    if (from != "noreply@moreapp.com")
                    {
                        continue;
                    }

                    string fe = oMessage.Headers.Date;

                    DateTime date;
                    try
                    {
                        date = Convert.ToDateTime(fe);
                    }
                    catch (Exception ex)
                    {
                        string ccc = ex.Message;
                        continue;
                    }
                    Console.WriteLine(oMessage.Headers.MessageId);
                    string idGmail = oMessage.Headers.MessageId;
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
                            //toInsert.
                            dtTabla.Rows.Add(htm);
                        }
                    }

                    string fkjns = dtTabla.Rows.Count.ToString();
                    if (fkjns == "27")
                    {
                        string djdjdj = "";
                    }
                    Console.WriteLine(fkjns);

                    string comentario = string.Empty;
                    //string nroReporte = string.Empty;
                    //if (!string.IsNullOrEmpty(dtTabla.Rows[5]["TEXTO"].ToString()))
                    //{
                    //    comentario = dtTabla.Rows[4]["TEXTO"].ToString();
                    //    nroReporte = dtTabla.Rows[1]["TEXTO"].ToString();
                    //}

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
                    
                    string fileName = string.Empty;
                    foreach (var attachment in oMessage.FindAllAttachments())
                    {
                        //string filePath = Path.Combine(@"C:\adjuntos", attachment.FileName);
                        string filePath = ConfigurationSettings.AppSettings["adjunto"];
                        filePath = filePath + attachment.FileName.Replace("?","");
                        fileName = attachment.FileName.Replace("?", "");
                        FileStream Stream = new FileStream(@filePath, FileMode.Create);
                        BinaryWriter BinaryStream = new BinaryWriter(Stream);
                        BinaryStream.Write(attachment.Body);
                        BinaryStream.Close();

                        string sql = "stp_IngresarAdjuntoEmail '" + idGmail + "','" + fileName + "','" + filePath + "'";
                        setQuery(cnnStr, sql);
                        //if (attachment.FileName.Equals("blabla.pdf"))
                        //{
                        //    FileStream Stream = new FileStream(filePath, FileMode.Create);
                        //    BinaryWriter BinaryStream = new BinaryWriter(Stream);
                        //    BinaryStream.Write(attachment.Body);
                        //    BinaryStream.Close();
                        //}
                    }

                    foreach (var copia in oMessage.Headers.Cc)
                    {
                        copy = copia.MailAddress.Address + ";";
                    }

                    //Console.WriteLine(builder.ToString());
                    //
                    StringBuilder sb = new StringBuilder();
                    sb.Append("stp_IngresarEmailCasilla '" + idGmail + "','" + from 
                        + "','" + subject + "','" + builder + "','" + date.ToString() + "','','" + para + "','" + bodyHtml + "','" + copy + "'");
                    //sb.Append(" '" + idGmail + "','" + from + "','" + subject + "','" + builder + "','" + date.ToString() + "',0,getdate(),'" + to + "'");
                    //@idEmail varchar(250),@fromed varchar(250), @subject varchar(250),
                    //@body varchar(max),@date varchar(20),@tipificado varchar(250),@emailOrigen varchar(250),
                    //@bodyHtml varchar(max),@copy varchar(250)

                    setQuery(cnnStr, sb.ToString());
                }
                catch (Exception ex)
                {
                    string sss = ex.Message;
                }
            }
            int cantidad = messageCount;
            Console.WriteLine("Cantidad de msj: " + cantidad.ToString());
            Console.ReadKey();

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
