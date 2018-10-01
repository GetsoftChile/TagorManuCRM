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
                    com.FillProyecto(ddlProyecto);
                    com.FillSucursal(ddlSucursal);
                    Material();
                    TipoMaterial();
                    Buscar(Convert.ToInt32(hfId.Value));

                    DateTime Hoy = DateTime.Today;
                    string fecha_actual = Hoy.ToLongDateString();
                    lblFechaHoy.Text = fecha_actual;

                }

            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
                divAlerta.Visible = true;
            }
        }

        void Buscar(int IdSolicitud) {

            string idUsuario=Session["variableIdUsuario"].ToString();
            lblNombreUsuario.Text = Session["variableNomUsuario"].ToString() + " " + Session["variableApeUsuario"].ToString();
            lblEmailUsuario.Text = Session["variableEmail"].ToString();


            DataTable dt = new DataTable();
            dt = dalCom.GetBuscarSolicitudCompraPorId(IdSolicitud).Tables[0];
            foreach (DataRow item in dt.Rows)
            {
                ddlProyecto.SelectedValue = item["CodObra"].ToString();
                ddlSucursal.SelectedValue= item["IdSucursal"].ToString();
                idUsuario= item["IdUsuarioCreacion"].ToString();
                lblEstado.Text= item["NombreEstadoSC"].ToString();
                lblIdEstado.Text=item["IdEstado"].ToString();
                lblFechaSolicitud.Text = item["FechaCreacion"].ToString();

                foreach (DataRow row in dal.getBuscarUsuarioPorId(idUsuario).Tables[0].Rows)
                {
                    lblNombreUsuario.Text = row["NOMBRE"].ToString();
                    lblEmailUsuario.Text = row["EMAIL"].ToString();
                }
            }

            grvMateriales.DataSource = dalCom.GetBuscarMaterialPorSolicitud(IdSolicitud);
            grvMateriales.DataBind();

            lblNumeroSolicitud.Text = IdSolicitud.ToString();
        }

        void Material()
        {
            ddlMaterial.DataSource = dalCom.GetBuscarMaterialPorTipo(ddlTipo.SelectedValue);
            ddlMaterial.DataValueField = "IdMaterial";
            ddlMaterial.DataTextField="Nombre";
            ddlMaterial.DataBind();
        }

        void TipoMaterial()
        {
            ddlTipo.DataSource = dalCom.GetBuscarTipoMaterial(null);
            ddlTipo.DataValueField = "IdTipo";
            ddlTipo.DataTextField = "NombreTipo";
            ddlTipo.DataBind();

            ddlTipoAgregar.DataSource = dalCom.GetBuscarTipoMaterial(null);
            ddlTipoAgregar.DataValueField = "IdTipo";
            ddlTipoAgregar.DataTextField = "NombreTipo";
            ddlTipoAgregar.DataBind();
            
        }

        protected void ddlProyecto_DataBound(object sender, EventArgs e)
        {
            ddlProyecto.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Seleccione", "0"));
        }

        protected void ddlSucursal_DataBound(object sender, EventArgs e)
        {
            ddlSucursal.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Seleccione", "0"));
        }

        protected void ddlTipo_DataBound(object sender, EventArgs e)
        {
            ddlTipo.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Seleccione", "0"));
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {

            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
                divAlerta.Visible = true;
            }
        }
        

        protected void ddlTipo_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                Material();
            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
                divAlerta.Visible = true;
            }

        }

        protected void ddlMaterial_DataBound(object sender, EventArgs e)
        {
            ddlMaterial.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Seleccione", "0"));
        }

        protected void ddlTipoAgregar_DataBound(object sender, EventArgs e)
        {
            ddlTipoAgregar.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Seleccione", "0"));
        }

        protected void lbtnAgregar_Click(object sender, EventArgs e)
        {
            try
            {
                string idUsuario = Session["variableIdUsuario"].ToString();
                string idSolicitud = string.Empty;
                if (hfId.Value=="0")
                {
                    idSolicitud = dalCom.SetInSolicitudCompra("1", ddlProyecto.SelectedValue, null, "1", idUsuario, idUsuario, ddlSucursal.SelectedValue);
                    hfId.Value = idSolicitud;
                }
                else
                {
                    dalCom.SetUpSolicitudCompra(hfId.Value,ddlSucursal.SelectedValue,ddlProyecto.SelectedValue,lblIdEstado.Text);
                }

                dalCom.SetInMaterialSolicitud(hfId.Value, ddlMaterial.SelectedValue, txtCantidad.Text);
                
                Buscar(Convert.ToInt32(hfId.Value));

                LimpiarMaterial();

                lblInfo.Text = "Material/herramienta o equipo agregado correctamente.";
                divAlerta.Attributes["class"] = "alert alert-success";
                divAlerta.Visible = true;
            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
                divAlerta.Visible = true;
            }

        }

        protected void grvMateriales_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }


        protected void btnEliminarMaterial_Click(object sender, EventArgs e)
        {
            try
            {
                LinkButton lbtn = sender as LinkButton;
                GridViewRow row = (GridViewRow)lbtn.NamingContainer;
                Label _lblCorrelativo = (Label)grvMateriales.Rows[row.RowIndex].FindControl("lblCorrelativo");

                dalCom.SetDelMaterialSolicitud(hfId.Value, _lblCorrelativo.Text);
                Buscar(Convert.ToInt32(hfId.Value));

                lblInfo.Text = "Material/herramienta o equipo eliminada correctamente.";
                divAlerta.Attributes["class"] = "alert alert-success";
                divAlerta.Visible = true;
            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
                divAlerta.Visible = true;
            }
        }

        protected void lbtnNuevoMaterial_Click(object sender, EventArgs e)
        {
            try
            {
                DivAgregarMaterial.Visible = true;
                LimpiarMaterial();
            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
                divAlerta.Visible = true;
            }
        }

        void LimpiarMaterial()
        {
            txtMaterial.Text = string.Empty;
            txtUnidad.Text = string.Empty;
            ddlTipoAgregar.ClearSelection();

            txtCantidad.Text = "0";
        }

        protected void lbtnGrabarMaterial_Click(object sender, EventArgs e)
        {
            try
            {
                LimpiarMaterial();
                DivAgregarMaterial.Visible = false;
            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
                divAlerta.Visible = true;
            }
        }
    }
}