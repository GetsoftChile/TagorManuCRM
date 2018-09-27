using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using TagorManuCRM;

namespace ModCompras
{
    public partial class NewMaterial : System.Web.UI.Page
    {
        Datos dal = new Datos();
        Comun com = new Comun();
        DatosModCom dalCom = new DatosModCom();

        protected void Page_Load(object sender, EventArgs e)
        {
            lblInfo.Text = "";
            divAlerta.Visible = false;

            try
            {
                if (!this.Page.IsPostBack)
                {
                    string _Id = Convert.ToString(Request.QueryString["Id"]);
                    hfId.Value = _Id;
                    Buscar();
                }

            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
                divAlerta.Visible = true;
            }
        }


        void Buscar()
        {
            DataTable dt = new DataTable();
            dt = dalCom.getBuscarMaterial(hfId.Value).Tables[0];
            foreach (DataRow item in dt.Rows)
            {
                txtMaterial.Text = item["Nombre"].ToString();
                txtUnidad.Text = item["Unidad"].ToString();
                ddlTipo.SelectedValue = item["Tipo"].ToString();
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                string idUsuario = Session["variableIdUsuario"].ToString();
                dalCom.setInUpMaterial(hfId.Value, txtMaterial.Text.Trim(), ddlTipo.SelectedValue, txtUnidad.Text.Trim(), idUsuario, idUsuario);
                Buscar();
 
                lblInfo.Text = "Material guardado correctamente";
                divAlerta.Attributes["class"] = "alert alert-success";
                divAlerta.Visible = true;

                Response.Redirect("Material.aspx");
            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
                divAlerta.Attributes["class"] = "alert alert-danger";
                divAlerta.Visible = true;
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Material.aspx");
        }

        protected void ddlProyecto_DataBound(object sender, EventArgs e)
        {

        }
    }
}