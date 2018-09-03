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
    public partial class Mensaje : System.Web.UI.Page
    {
        Datos dal = new Datos();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Page.IsPostBack)
                {
                    DataTable dt = new DataTable();
                    dt = dal.getBuscarMensaje("1").Tables[0];
                    foreach (DataRow item in dt.Rows)
                    {
                        txtMensaje.Text = item["MENSAJE"].ToString();
                    }
                }
            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
                divAlerta.Attributes["class"] = "alert alert-danger";
                divAlerta.Visible = true;
            }
        }

        protected void btnGrabarMensaje_Click(object sender, EventArgs e)
        {
            try
            {
                string mensaje = txtMensaje.Text;
                dal.setIngresarMensaje("1", mensaje, "1");

                lblInfo.Text = "Mensaje guardado correctamente";
                divAlerta.Attributes["class"] = "alert alert-success";
                divAlerta.Visible = true;
            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
                divAlerta.Attributes["class"] = "alert alert-danger";
                divAlerta.Visible = true;
            }
        }
    }
}