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
    public partial class Material : System.Web.UI.Page
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
            grvMateriales.DataSource = dalCom.getBuscarMaterial(null);
            grvMateriales.DataBind();
            grvMateriales.HeaderRow.TableSection = TableRowSection.TableHeader;
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            try
            {

                LinkButton btn = (LinkButton)sender;
                GridViewRow row = (GridViewRow)btn.NamingContainer;
                
                Label _lblIdMaterial = (Label)grvMateriales.Rows[row.RowIndex].FindControl("lblIdMaterial");
                Response.Redirect("NewMaterial.aspx?Id=" + _lblIdMaterial.Text);
            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
                divAlerta.Attributes["class"] = "alert alert-danger";
                divAlerta.Visible = true;
            }
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                LinkButton btn = (LinkButton)sender;
                GridViewRow row = (GridViewRow)btn.NamingContainer;

                Label _lblIdMaterial = (Label)grvMateriales.Rows[row.RowIndex].FindControl("lblIdMaterial");
                dalCom.setEliminarMaterial(_lblIdMaterial.Text);

                Buscar();

                lblInfo.Text = "Material Eliminado Correctamente";
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

        protected void bntNuevo_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("NewMaterial.aspx?id=0");
            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
                divAlerta.Attributes["class"] = "alert alert-danger";
                divAlerta.Visible = true;
            }
        }
        

        protected void grvMateriales_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }
        
        protected void btnExportar_Click(object sender, EventArgs e)
        {

        }
    }
}