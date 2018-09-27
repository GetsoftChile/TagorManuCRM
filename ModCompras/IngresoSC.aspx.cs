using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using TagorManuCRM;

namespace ModCompras
{
    public partial class IngresoSC : System.Web.UI.Page
    {
        Datos dal = new Datos();
        Comun com = new Comun();
        DatosModCom dalCom = new DatosModCom();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                lblInfo.Text = "";
                divAlerta.Visible = false;

                if (!this.Page.IsPostBack)
                {
                    string _Id = Convert.ToString(Request.QueryString["Id"]);
                    hfId.Value = _Id;
                    Proyecto();
                    Sucursal();
                    Buscar();
                }

            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
                divAlerta.Visible = true;
            }
        }

        void Buscar() {

        }

        void Proyecto() {
            com.FillProyecto(ddlProyecto);
        }

        void Sucursal() {
            com.FillSucursal(ddlSucursal);
        }

        protected void ddlProyecto_DataBound(object sender, EventArgs e)
        {
            ddlProyecto.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Seleccione", "0"));
        }

        protected void ddlSucursal_DataBound(object sender, EventArgs e)
        {
            ddlSucursal.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Seleccione", "0"));
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {

        }
    }
}