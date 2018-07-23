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
    public partial class Contrasena : System.Web.UI.Page
    {
        Datos dal = new Datos();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!this.Page.IsPostBack)
                {
                    lblUsuario.Text = Session["variableUsuario"].ToString();
                    lblNombre.Text = Session["variableNomUsuario"].ToString() + " " + Session["variableApeUsuario"].ToString();
                    hfIdUsuario.Value = Session["variableIdUsuario"].ToString();
                    string contrasena = string.Empty;
                    DataTable dt = new DataTable();
                    dt = dal.getBuscarUsuarioPorId(hfIdUsuario.Value).Tables[0];
                    foreach (DataRow item in dt.Rows)
                    {
                        contrasena = item["CONTRASENA"].ToString();
                    }
                   
                    txtContrasena.Attributes.Add("Value", contrasena);
                }
            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
                divAlerta.Visible = true;
            }
        }

        protected void lbtnGrabar_Click(object sender, EventArgs e)
        {
            try
            {
                string clave = txtContrasena.Text.Trim();
                if ((txtContrasena.Text != string.Empty) && (clave.Length >= 5))
                {
                    dal.setEditarContrasena(hfIdUsuario.Value, txtContrasena.Text.Trim());
                    lblInfo.Text = "Su Contraseña fue correctamente actualizada";
                    divAlerta.Attributes["class"] = "alert alert-success";
                    divAlerta.Visible = true;
                }
                else
                {

                    lblInfo.Text = "Debe ingresar una contraseña valida";
                    divAlerta.Attributes["class"] = "alert alert-danger";
                    divAlerta.Visible = true;
                }
            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
                divAlerta.Visible = true;
            }
        }
    }
}