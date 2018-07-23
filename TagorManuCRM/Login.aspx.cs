using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;

namespace TagorManuCRM
{
    public partial class Login : System.Web.UI.Page
    {
        Datos dal = new Datos();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!this.Page.IsPostBack)
                {

                }
            }
            catch (Exception ex)
            {
                divAlerta.Visible = true;
                lblError.Text = ex.Message;
            }
        }

        protected void BtnIngresar_Click(object sender, EventArgs e)
        {
            string valor = dal.getValUsuario(TxtUsuario.Value.Trim(), TxtPassword.Value.Trim());
            DataTable dt = dal.getBuscarUsuarioPorLogin(TxtUsuario.Value).Tables[0];
            string idUsuario = "";
            string nomUsuario = "";
            string idPerfil = "";
            string perfil = "";
            string apeUsuario = "";
            string usuario = "";
            string imagen = "";
            string idLocal = string.Empty;
            string idEmpresa = string.Empty;
            string empresa = string.Empty;
            string activo = string.Empty;
            string idArea = string.Empty;
            string idSucursal = string.Empty;
            //nomUsuario = row["NOMBRES"].ToString();
            //perfil = row["PERFIL"].ToString();

            foreach (DataRow item in dt.Rows)
            {
                idUsuario = item["ID_USUARIO"].ToString();
                usuario = item["USUARIO"].ToString();
                idPerfil = item["ID_PERFIL"].ToString();
                perfil = item["PERFIL"].ToString();
                nomUsuario = item["NOMBRE"].ToString();
                imagen = item["RUTA_FOTO"].ToString();
                //idLocal = item["ID_LOCAL"].ToString();
                idEmpresa = item["ID_EMPRESA"].ToString();
                empresa = item["EMPRESA"].ToString();
                activo = item["ACTIVO"].ToString();
                idArea= item["ID_AREA"].ToString();
                idSucursal = item["ID_SUCURSAL"].ToString();
            }



            if (valor == "1")
            {
                Session["variableUsuario"] = usuario;
                if (imagen == string.Empty)
                {
                    imagen = "assets/img/user-blank.jpg";
                }
                Session["variableImagenUsuario"] = imagen;
                Session["variablePerfil"] = perfil;
                Session["variableIdPerfil"] = idPerfil;
                Session["variableIdUsuario"] = idUsuario;
                Session["variableFechaSession"] = DateTime.Now.ToString("G");
                Session["variableNomUsuario"] = nomUsuario;
                Session["variableApeUsuario"] = apeUsuario;
                Session["variableIdLocal"] = idLocal;
                Session["variableIdEmpresa"] = idEmpresa;
                Session["variableEmpresa"] = empresa;
                Session["variableIdSucursal"] = idSucursal;
                Session["variableIdArea"] = idArea;

                if (activo == "True")
                {
                    Response.Redirect("Dashboard.aspx");
                }
                else
                {
                    divAlerta.Visible = true;
                    lblError.Text = "El usuario no se encuentra activo. Favor comunicarse con el administrador.";
                    return;
                }
            }
            else
            {
                //error de usuario
                divAlerta.Visible = true;
                lblError.Text = "Nombre de usuario y/o contraseña no valida";
            }
        }
    }
}