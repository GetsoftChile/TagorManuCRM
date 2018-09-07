using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text.RegularExpressions;
using System.Net.Mail;
using System.Web.UI.WebControls;
using DAL;
using System.Data;
using iTextSharp.text.pdf;
using iTextSharp.text;
using System.IO;
using System.Web.UI;

namespace TagorManuCRM
{
    public class Comun
    {
        Datos dal = new Datos();

        public static bool esHoraValida(string hora)
        {
            Regex r = new Regex(@"([0-1][0-9]|2[0-3]):[0-5][0-9]");
            Match m = r.Match(hora);
            return m.Success;
        }

        public bool IsNumeric(string s)
        {
            float output;
            return float.TryParse(s, out output);
        }

        public static string Right(string param, int length)
        {
            int value = param.Length - length;
            string result = param.Substring(value, length);
            return result;
        }

        public static string Left(string param, int length)
        {
            string result = param.Substring(0, length);
            return result;
        }

        public void separaRut(string rutConDv,out string rut, out string digito)
        {
            string rutCliente = rutConDv.Trim();
            string dv = string.Empty;
            
            String[] arRut = rutCliente.Split('-');
            for (int i = 0; i < arRut.Length; i++)
            {
                rutCliente = arRut[0];
                if (arRut.Length > 0)
                {
                    dv = arRut[1];
                }
            }
            rut = rutCliente;
            digito = dv;
        }

        public String formatearRutSinPuntos(String rut)
        {
            int cont = 0;
            String format;
            if (rut.Length == 0)
            {
                return "";
            }
            else
            {
                rut = rut.Replace(".", "");
                rut = rut.Replace("-", "");

                format = "-" + rut.Substring(rut.Length - 1);
                for (int i = rut.Length - 2; i >= 0; i--)
                {
                    format = rut.Substring(i, 1) + format;

                    cont++;
                    if (cont == 3 && i != 0)
                    {
                        format = "" + format;
                        cont = 0;
                    }
                }
                return format;
            }
        }

        public String formatearRutConPuntos(String rut)
        {
            int cont = 0;
            String format;
            if (rut.Length == 0)
            {
                return "";
            }
            else
            {
                rut = rut.Replace(".", "");
                rut = rut.Replace("-", "");
                format = "-" + rut.Substring(rut.Length - 1);
                for (int i = rut.Length - 2; i >= 0; i--)
                {
                    format = rut.Substring(i, 1) + format;

                    cont++;
                    if (cont == 3 && i != 0)
                    {
                        format = "." + format;
                        cont = 0;
                    }
                }
                return format;
            }
        }

        public bool verificaRut(int rut, string dv)
        {
            int Digito;
            int Contador;
            int Multiplo;
            int Acumulador;
            string RutDigito;

            Contador = 2;
            Acumulador = 0;

            while (rut != 0)
            {
                Multiplo = (rut % 10) * Contador;
                Acumulador = Acumulador + Multiplo;
                rut = rut / 10;
                Contador = Contador + 1;

                if (Contador == 8)
                {
                    Contador = 2;
                }
            }

            Digito = 11 - (Acumulador % 11);
            RutDigito = Digito.ToString().Trim();
            if (Digito == 10)
            {
                RutDigito = "K";
            }
            if (Digito == 11)
            {
                RutDigito = "0";
            }

            if (RutDigito.ToString() == dv.ToString())
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        

        public string EnviarEmail(string email, string body, string sub)
        {
            System.Net.Mail.MailMessage correo = new System.Net.Mail.MailMessage();

            correo.From = new MailAddress("<notificaciones@tagor.cl>");
            string bodyEmail = body;

            String[] AMailto = email.Split(';');
            foreach (String mail in AMailto)
            {
                correo.To.Add(new MailAddress(mail));
            }

            correo.Subject = sub;
            correo.IsBodyHtml = true;
            correo.Body = bodyEmail;

            //port = "25" userName = "notificaciones@getsoft.cl" password = "nuevaetica123!"
            SmtpClient client = new SmtpClient();
            client.Credentials = new System.Net.NetworkCredential("notificaciones@tagor.cl", "notificaciones123**");
            client.Host = "mail.tagor.cl";
            client.Port = 3535;
            
            string resultado = string.Empty;
            
            try
            {
                client.Send(correo);
                resultado = "ENVIADO";
            }
            catch (SmtpException ex)
            {
                resultado = "ERROR ENVIO CORREO: " + ex.InnerException.Message;
            }
            
            return resultado;
        }
        
        public bool validarRut(string rut)
        {
            bool validacion = false;
            try
            {
               int index = rut.IndexOf("-");
               if (index == -1)
               {
                   validacion = false;
                   return validacion;
               }
                rut = rut.ToUpper();
                rut = rut.Replace(".", "");
                rut = rut.Replace("-", "");
                int rutAux = int.Parse(rut.Substring(0, rut.Length - 1));

                char dv = char.Parse(rut.Substring(rut.Length - 1, 1));

                int m = 0, s = 1;
                for (; rutAux != 0; rutAux /= 10)
                {
                    s = (s + rutAux % 10 * (9 - m++ % 6)) % 11;
                }
                if (dv == (char)(s != 0 ? s + 47 : 75))
                {
                    validacion = true;
                }
            }
            catch (Exception)
            {
            }
            return validacion;
        }

        public void FillArea(DropDownList ddlArea)
        {
            ddlArea.DataSource = dal.getBuscarArea();
            ddlArea.DataValueField = "ID_AREA";
            ddlArea.DataTextField = "AREA";
            ddlArea.DataBind();
        }

        public void FillCategoriaServicio(DropDownList ddlCategoriaServicio)
        {
            ddlCategoriaServicio.DataSource = dal.getBuscarCategoriaServicio("1");
            ddlCategoriaServicio.DataValueField = "ID_CATEGORIA_SERVICIO";
            ddlCategoriaServicio.DataTextField = "NOMBRE_CATEGORIA_SERVICIO";
            ddlCategoriaServicio.DataBind();
        }

        public void FillSucursal(DropDownList ddlSucursal)
        {
            ddlSucursal.DataSource = dal.getBuscarSucursal("1");
            ddlSucursal.DataValueField = "ID_SUCURSAL";
            ddlSucursal.DataTextField = "NOMBRE_SUCURSAL";
            ddlSucursal.DataBind();
        }

        public bool ValidarPaginaPerfil(string idPerfil, string pagina)
        {
            bool validacion = false;
            if (idPerfil == "1")
            {
                
            }
            if (idPerfil == "2")
            {
                if (pagina != "Usuarios.aspx")
                {
                    validacion = true;
                    
                }
            }
            if (idPerfil == "3")
            {

            }
            if (idPerfil == "4")
            {

            }
            if (idPerfil == "5")
            {

            }
            if (idPerfil == "6")
            {

            }

            return validacion;
        }
    }
}