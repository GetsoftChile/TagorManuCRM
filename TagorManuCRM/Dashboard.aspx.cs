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
    public partial class Dashboard : System.Web.UI.Page
    {
        Comun com = new Comun();
        Datos dal = new Datos();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!this.Page.IsPostBack)
                {
                    Sucursal();
                    Perfil();
                    com.FillArea(ddlArea);
                    
                    Buscar();
                }
            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
                divAlerta.Visible = true;
            }
        }
        void Sucursal()
        {
            ddlSucursal.DataSource = dal.getBuscarSucursal("1");
            ddlSucursal.DataValueField = "ID_SUCURSAL";
            ddlSucursal.DataTextField = "NOMBRE_SUCURSAL";
            ddlSucursal.DataBind();
        }
        void Perfil()
        {
            string idUsuario = Session["variableIdUsuario"].ToString();
            string idPerfil = Session["variableIdPerfil"].ToString();
            string idAreaUsuario = Session["variableIdArea"].ToString();
            string idSucursal = Session["variableIdSucursal"].ToString();

            if (idPerfil=="2" )
            {
                divSolicitudOT.Visible = false;
                ddlArea.Enabled = false;
                if (String.IsNullOrEmpty(idAreaUsuario))
                {
                    lblInfo.Text = "No tiene asignada el area, favor de comunicarse con el administrador.";
                    divAlerta.Visible = true;
                    return;
                }
                else
                {
                    ddlArea.SelectedValue = idAreaUsuario;
                }
                ddlSucursal.Enabled = false;
                if (String.IsNullOrEmpty(idSucursal))
                {
                    lblInfo.Text = "No tiene asignada una sucursal, favor de comunicarse con el administrador.";
                    divAlerta.Visible = true;
                    return;
                }
                else
                {
                    ddlSucursal.SelectedValue = idSucursal;
                }
            }
            else
            {
                divSolicitudOT.Visible = true;
                ddlArea.Enabled = true;
            }

            if (idPerfil == "5")
            {
                ddlArea.Enabled = false;
                if (String.IsNullOrEmpty(idAreaUsuario))
                {
                    lblInfo.Text = "No tiene asignada el area, favor de comunicarse con el administrador.";
                    divAlerta.Visible = true;
                    return;
                }
                else
                {
                    ddlArea.SelectedValue = idAreaUsuario;
                }
                ddlSucursal.Enabled = false;
                if (String.IsNullOrEmpty(idSucursal))
                {
                    lblInfo.Text = "No tiene asignada una sucursal, favor de comunicarse con el administrador.";
                    divAlerta.Visible = true;
                    return;
                }
                else
                {
                    ddlSucursal.SelectedValue = idSucursal;
                }
            }

            if (idPerfil=="3")
            {
                ddlSucursal.Enabled = false;
                if (String.IsNullOrEmpty(idSucursal))
                {
                    lblInfo.Text = "No tiene asignada una sucursal, favor de comunicarse con el administrador.";
                    divAlerta.Visible = true;
                    return;
                }
                else
                {
                    ddlSucursal.SelectedValue = idSucursal;
                }
            }
            if (idPerfil == "6")
            {
                ddlSucursal.Enabled = false;
                if (String.IsNullOrEmpty(idSucursal))
                {
                    lblInfo.Text = "No tiene asignada una sucursal, favor de comunicarse con el administrador.";
                    divAlerta.Visible = true;
                    return;
                }
                else
                {
                    ddlSucursal.SelectedValue = idSucursal;
                }
            }
        }

        void Buscar()
        {
            string idUsuario = Session["variableIdUsuario"].ToString();
            string idPerfil = Session["variableIdPerfil"].ToString();
            string idSucursal = ddlSucursal.SelectedValue;
            if (idSucursal=="0")
            {
                idSucursal = null;
            }
            if (idPerfil != "2")
            {
                idUsuario = null;

            }
            string idArea = ddlArea.SelectedValue;
            if (idArea=="0")
            {
                idArea = null;
            }
            
            DataTable dt = new DataTable();
            dt = dal.getGenerarDashboard(idUsuario, idArea, "C", idPerfil, idSucursal).Tables[0];
            foreach (DataRow item in dt.Rows)
            {
                lbtnOTCorrectivasPendientes.Text= item["TOTAL_ABIERTOS"].ToString();
                lbtnOTCorrectivasCerradas.Text = item["TOTAL_CERRADOS"].ToString();
            }
            dt.Clear();
            dt = dal.getGenerarDashboard(idUsuario, idArea, "P", idPerfil, idSucursal).Tables[0];
            foreach (DataRow item in dt.Rows)
            {
                lbtnOTPreventivoPendiente.Text = item["TOTAL_ABIERTOS"].ToString();
                lbtnOTPreventivoCerrado.Text = item["TOTAL_CERRADOS"].ToString();
            }
            dt.Clear();
            dt = dal.getGenerarDashboard(idUsuario, idArea, "CP", idPerfil, idSucursal).Tables[0];
            foreach (DataRow item in dt.Rows)
            {
                lbtnOTCorrectivoPlanificadoPendiente.Text = item["TOTAL_ABIERTOS"].ToString();
                lbtnOTCorrectivoPlanificadoCerrado.Text = item["TOTAL_CERRADOS"].ToString();
            }
        }

        protected void lbtnEmergencias_Click(object sender, EventArgs e)
        {
            try
            {
                ScriptManager.RegisterStartupScript(UpdatePanel2, UpdatePanel2.GetType(), "show", "$(function () { $('#" + Panel1.ClientID + "').modal('show'); });", true);
                UpdatePanel2.Update();
            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
                divAlerta.Visible = true;
            }
        }

        protected void lbtnVerNumeros_Click(object sender, EventArgs e)
        {
            try
            {
                ScriptManager.RegisterStartupScript(UpdatePanel2, UpdatePanel2.GetType(), "show", "$(function () { $('#" + Panel1.ClientID + "').modal('show'); });", true);
                UpdatePanel2.Update();
            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
                divAlerta.Visible = true;
            }
        }

        protected void lbtnSolicitudOrdenTrabajo_Click(object sender, EventArgs e)
        {
            try
            {
                Session["strTituloBuscadorTicket"] = null;
                Response.Redirect("IngresoOT.aspx");
            }
            catch (Exception ex)
            {
                divAlerta.Visible = true;
                lblInfo.Text = ex.Message;
            }
        }

        protected void lbtnSolicitudOT_Click(object sender, EventArgs e)
        {
            try
            {
                Session["strTituloBuscadorTicket"] = null;
                Response.Redirect("IngresoOT.aspx");
            }
            catch (Exception ex)
            {
                divAlerta.Visible = true;
                lblInfo.Text = ex.Message;
            }
        }

        protected void lbtnBuscarOT_Click(object sender, EventArgs e)
        {
            try
            {
                Session["strTituloBuscadorTicket"] = null;
                Response.Redirect("BuscarOT.aspx");
            }
            catch (Exception ex)
            {
                divAlerta.Visible = true;
                lblInfo.Text = ex.Message;
            }
        }

        protected void lbtnBuscarOT2_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("BuscarOT.aspx");

            }
            catch (Exception ex)
            {
                divAlerta.Visible = true;
                lblInfo.Text = ex.Message;
            }
        }

        protected void lbtnOTCorrectivasPendientes_Click(object sender, EventArgs e)
        {
            try
            {
                Session["strTituloBuscadorTicket"] = "SOLPED Correctivas Pendientes";
                string idArea = ddlArea.SelectedValue;

                Response.Redirect("BuscarOT.aspx?t=C&e=1&a=" + idArea);
            }
            catch (Exception ex)
            {
                divAlerta.Visible = true;
                lblInfo.Text = ex.Message;
            }
        }

        protected void lbtnOTCorrectivasCerradas_Click(object sender, EventArgs e)
        {
            try
            {
                string idArea = ddlArea.SelectedValue;
                Session["strTituloBuscadorTicket"] = "SOLPED Correctivas Cerradas";
                Response.Redirect("BuscarOT.aspx?t=C&e=3&a=" + idArea);
            }
            catch (Exception ex)
            {
                divAlerta.Visible = true;
                lblInfo.Text = ex.Message;
            }
        }

        protected void lbtnOTCorrectivoPlanificadoPendiente_Click(object sender, EventArgs e)
        {
            try
            {
                Session["strTituloBuscadorTicket"] = "SOLPED Correctivas Planificadas Pendientes";
                Response.Redirect("BuscarOT.aspx?t=CP&e=1&a=" + ddlArea.SelectedValue);
            }
            catch (Exception ex)
            {
                divAlerta.Visible = true;
                lblInfo.Text = ex.Message;
            }
        }
        
        protected void lbtnOTCorrectivoPlanificadoCerrado_Click(object sender, EventArgs e)
        {
            try
            {
                Session["strTituloBuscadorTicket"] = "SOLPED Correctivas Planificadas Cerradas";
                Response.Redirect("BuscarOT.aspx?t=CP&e=3&a=" + ddlArea.SelectedValue);
            }
            catch (Exception ex)
            {
                divAlerta.Visible = true;
                lblInfo.Text = ex.Message;
            }
        }
        
        protected void lbtnOTPreventivoPendiente_Click(object sender, EventArgs e)
        {
            try
            {
                Session["strTituloBuscadorTicket"] = "SOLPED Preventivas Pendientes";
                Response.Redirect("BuscarOT.aspx?t=P&e=1&a=" + ddlArea.SelectedValue);
            }
            catch (Exception ex)
            {
                divAlerta.Visible = true;
                lblInfo.Text = ex.Message;
            }
        }
        
        protected void lbtnOTPreventivoCerrado_Click(object sender, EventArgs e)
        {
            try
            {
                Session["strTituloBuscadorTicket"] = "SOLPED Preventivas Cerradas";
                Response.Redirect("BuscarOT.aspx?t=P&e=3&a=" + ddlArea.SelectedValue);
            }
            catch (Exception ex)
            {
                divAlerta.Visible = true;
                lblInfo.Text = ex.Message;
            }
        }

        protected void ddlArea_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                Buscar();
            }
            catch (Exception ex)
            {
                divAlerta.Visible = true;
                lblInfo.Text = ex.Message;
            }
        }

        protected void ddlArea_DataBound(object sender, EventArgs e)
        {
            ddlArea.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Todos", "0"));
        }

        protected void ddlSucursal_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                Buscar();
            }
            catch (Exception ex)
            {
                divAlerta.Visible = true;
                lblInfo.Text = ex.Message;
            }
        }

        protected void ddlSucursal_DataBound(object sender, EventArgs e)
        {
            ddlSucursal.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Todos", "0"));
        }
    }
}