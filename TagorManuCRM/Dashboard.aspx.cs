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

                    DateTime Hoy = DateTime.Today;
                    int ano = Hoy.Year;
                    int mes = Hoy.Month;

                    ddlAno.SelectedValue = ano.ToString();
                    //ddlMes.SelectedValue = mes.ToString();

                    com.FillArea(ddlArea);
                    com.FillCategoriaServicio(ddlCategoriaServicio);
                    Buscar();
                    
                    DataTable dt = new DataTable();
                    dt = dal.getBuscarMensaje("1").Tables[0];
                    foreach (DataRow item in dt.Rows)
                    {
                        lblMensaje.Text = item["MENSAJE"].ToString().Replace("\r\n", "<br>");
                    }
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
        //void Local()
        //{
        //    ddlLocal.DataSource = dal.getBuscarLocalPorZona(null, null);
        //    ddlLocal.DataValueField = "ID_SUCURSAL";
        //    ddlLocal.DataTextField = "NOMBRE_SUCURSAL";
        //    ddlLocal.DataBind();
        //}
        

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
                ddlArea.Enabled = true;
                if (String.IsNullOrEmpty(idAreaUsuario))
                {
                    lblInfo.Text = "No tiene asignada el area, favor de comunicarse con el administrador.";
                    divAlerta.Visible = true;
                    return;
                }
                else
                {
                    //ddlArea.SelectedValue = idAreaUsuario;
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
            if (idPerfil == "3")
            {
                ddlSucursal.Enabled = true;
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
            if (idPerfil == "4")
            {
                divContador.Visible = false;
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

            string idCategoriaServicio = ddlCategoriaServicio.SelectedValue;
            if (idCategoriaServicio=="0")
            {
                idCategoriaServicio = null;
            }

            string mes = ddlMes.SelectedValue;
            if (mes=="0")
            {
                mes = null;
            }

            string ano = ddlAno.SelectedValue;
            if (ano=="0")
            {
                ano = null;
            }
            
            DataTable dt = new DataTable();
            dt = dal.getGenerarDashboard(idUsuario, idArea, "C", idPerfil, idSucursal, idCategoriaServicio,mes,ano).Tables[0];
            foreach (DataRow item in dt.Rows)
            {
                lbtnOTCorrectivasPendientes.Text= item["TOTAL_ABIERTOS"].ToString();
                lbtnOTCorrectivasEnProceso.Text= item["TOTAL_ENPROCESO"].ToString();
                lbtnOTCorrectivasProgramadas.Text = item["TOTAL_PROGRAMADO"].ToString();
                lbtnOTCorrectivasCerradas.Text = item["TOTAL_CERRADOS"].ToString();
            }
            dt.Clear();
            dt = dal.getGenerarDashboard(idUsuario, idArea, "P", idPerfil, idSucursal, idCategoriaServicio, mes, ano).Tables[0];
            foreach (DataRow item in dt.Rows)
            {
                lbtnOTPreventivoPendiente.Text = item["TOTAL_ABIERTOS"].ToString();
                lbtnOTPreventivoEnProceso.Text = item["TOTAL_ENPROCESO"].ToString();
                lbtnOTPreventivoProgramadas.Text = item["TOTAL_PROGRAMADO"].ToString();
                lbtnOTPreventivoCerrado.Text = item["TOTAL_CERRADOS"].ToString();
            }
            dt.Clear();
            dt = dal.getGenerarDashboard(idUsuario, idArea, "CP", idPerfil, idSucursal, idCategoriaServicio, mes, ano).Tables[0];
            foreach (DataRow item in dt.Rows)
            {
                lbtnOTCorrectivoPlanificadoPendiente.Text = item["TOTAL_ABIERTOS"].ToString();
                lbtnOTCorrectivoPlanificadoEnProceso.Text = item["TOTAL_ENPROCESO"].ToString();
                lbtnOTCorrectivoPlanificadoProgramadas.Text = item["TOTAL_PROGRAMADO"].ToString();
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
                string idSucursal = ddlSucursal.SelectedValue;
                string idCategoriaServicio = ddlCategoriaServicio.SelectedValue;
                string mes = ddlMes.SelectedValue;
                string ano = ddlAno.SelectedValue;
                Response.Redirect("BuscarOT.aspx?t=C&e=1&a=" + idArea + "&s=" + idSucursal + "&cs=" + idCategoriaServicio + "&mes=" + mes + "&ano=" + ano);
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
                string idSucursal = ddlSucursal.SelectedValue;
                string idArea = ddlArea.SelectedValue;
                string idCategoriaServicio = ddlCategoriaServicio.SelectedValue;
                string mes = ddlMes.SelectedValue;
                string ano = ddlAno.SelectedValue;
                Session["strTituloBuscadorTicket"] = "SOLPED Correctivas Cerradas";
                //Response.Redirect("BuscarOT.aspx?t=C&e=3&a=" + idArea + "&s=" + idSucursal + "&cs=" + idCategoriaServicio);
                Response.Redirect("BuscarOT.aspx?t=C&e=3&a=" + idArea + "&s=" + idSucursal + "&cs=" + idCategoriaServicio + "&mes=" + mes + "&ano=" + ano);
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
                string idSucursal = ddlSucursal.SelectedValue;
                string idCategoriaServicio = ddlCategoriaServicio.SelectedValue;
                string mes = ddlMes.SelectedValue;
                string ano = ddlAno.SelectedValue;
                Session["strTituloBuscadorTicket"] = "SOLPED Correctivas Planificadas Pendientes";
                //Response.Redirect("BuscarOT.aspx?t=CP&e=1&a=" + ddlArea.SelectedValue + "&s=" + idSucursal + "&cs="+ idCategoriaServicio);
                Response.Redirect("BuscarOT.aspx?t=CP&e=1&a=" + ddlArea.SelectedValue + "&s=" + idSucursal + "&cs=" + idCategoriaServicio + "&mes=" + mes + "&ano=" + ano);
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
                string idSucursal = ddlSucursal.SelectedValue;
                string idCategoriaServicio = ddlCategoriaServicio.SelectedValue;
                string mes = ddlMes.SelectedValue;
                string ano = ddlAno.SelectedValue;
                Session["strTituloBuscadorTicket"] = "SOLPED Correctivas Planificadas Cerradas";
                //Response.Redirect("BuscarOT.aspx?t=CP&e=3&a=" + ddlArea.SelectedValue + "&s=" + idSucursal + "&cs=" + idCategoriaServicio);
                Response.Redirect("BuscarOT.aspx?t=CP&e=3&a=" + ddlArea.SelectedValue + "&s=" + idSucursal + "&cs=" + idCategoriaServicio + "&mes=" + mes + "&ano=" + ano);
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
                string idSucursal = ddlSucursal.SelectedValue;
                string idCategoriaServicio = ddlCategoriaServicio.SelectedValue;
                string mes = ddlMes.SelectedValue;
                string ano = ddlAno.SelectedValue;
                Session["strTituloBuscadorTicket"] = "SOLPED Preventivas Pendientes";
                //Response.Redirect("BuscarOT.aspx?t=P&e=1&a=" + ddlArea.SelectedValue + "&s=" + idSucursal + "&cs=" + idCategoriaServicio);
                Response.Redirect("BuscarOT.aspx?t=P&e=1&a=" + ddlArea.SelectedValue + "&s=" + idSucursal + "&cs=" + idCategoriaServicio + "&mes=" + mes + "&ano=" + ano);
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
                string idSucursal = ddlSucursal.SelectedValue;
                string idCategoriaServicio = ddlCategoriaServicio.SelectedValue;
                string mes = ddlMes.SelectedValue;
                string ano = ddlAno.SelectedValue;
                Session["strTituloBuscadorTicket"] = "SOLPED Preventivas Cerradas";
                //Response.Redirect("BuscarOT.aspx?t=P&e=3&a=" + ddlArea.SelectedValue + "&s=" + idSucursal + "&cs=" + idCategoriaServicio);
                Response.Redirect("BuscarOT.aspx?t=P&e=3&a=" + ddlArea.SelectedValue + "&s=" + idSucursal + "&cs=" + idCategoriaServicio + "&mes=" + mes + "&ano=" + ano);
            }
            catch (Exception ex)
            {
                divAlerta.Visible = true;
                lblInfo.Text = ex.Message;
            }
        }

        protected void lbtnOTCorrectivasProgramadas_Click(object sender, EventArgs e)
        {
            try
            {
                Session["strTituloBuscadorTicket"] = "SOLPED Correctivas Programadas";
                string idArea = ddlArea.SelectedValue;
                string idSucursal = ddlSucursal.SelectedValue;
                string idCategoriaServicio = ddlCategoriaServicio.SelectedValue;
                string mes = ddlMes.SelectedValue;
                string ano = ddlAno.SelectedValue;
                //Response.Redirect("BuscarOT.aspx?t=C&e=4&a=" + idArea + "&s=" + idSucursal + "&cs=" + idCategoriaServicio);
                Response.Redirect("BuscarOT.aspx?t=C&e=4&a=" + idArea + "&s=" + idSucursal + "&cs=" + idCategoriaServicio + "&mes=" + mes + "&ano=" + ano);
            }
            catch (Exception ex)
            {
                divAlerta.Visible = true;
                lblInfo.Text = ex.Message;
            }
        }

        protected void lbtnOTCorrectivasEnProceso_Click(object sender, EventArgs e)
        {
            try
            {
                Session["strTituloBuscadorTicket"] = "SOLPED Correctivas En Proceso";
                string idArea = ddlArea.SelectedValue;
                string idSucursal = ddlSucursal.SelectedValue;
                string idCategoriaServicio = ddlCategoriaServicio.SelectedValue;
                string mes = ddlMes.SelectedValue;
                string ano = ddlAno.SelectedValue;
                //Response.Redirect("BuscarOT.aspx?t=C&e=2&a=" + idArea + "&s=" + idSucursal + "&cs=" + idCategoriaServicio);
                Response.Redirect("BuscarOT.aspx?t=C&e=2&a=" + idArea + "&s=" + idSucursal + "&cs=" + idCategoriaServicio + "&mes=" + mes + "&ano=" + ano);
            }
            catch (Exception ex)
            {
                divAlerta.Visible = true;
                lblInfo.Text = ex.Message;
            }
        }

        protected void lbtnOTCorrectivoPlanificadoProgramadas_Click(object sender, EventArgs e)
        {
            try
            {
                Session["strTituloBuscadorTicket"] = "SOLPED Correctivas Planificadas Programadas";
                string idArea = ddlArea.SelectedValue;
                string idSucursal = ddlSucursal.SelectedValue;
                string idCategoriaServicio = ddlCategoriaServicio.SelectedValue;
                string mes = ddlMes.SelectedValue;
                string ano = ddlAno.SelectedValue;
                //Response.Redirect("BuscarOT.aspx?t=CP&e=4&a=" + idArea + "&s=" + idSucursal + "&cs=" + idCategoriaServicio);
                Response.Redirect("BuscarOT.aspx?t=CP&e=4&a=" + idArea + "&s=" + idSucursal + "&cs=" + idCategoriaServicio + "&mes=" + mes + "&ano=" + ano);
            }
            catch (Exception ex)
            {
                divAlerta.Visible = true;
                lblInfo.Text = ex.Message;
            }
        }

        protected void lbtnOTCorrectivoPlanificadoEnProceso_Click(object sender, EventArgs e)
        {
            try
            {
                Session["strTituloBuscadorTicket"] = "SOLPED Correctivas Planificadas En Proceso";
                string idArea = ddlArea.SelectedValue;
                string idSucursal = ddlSucursal.SelectedValue;
                string idCategoriaServicio = ddlCategoriaServicio.SelectedValue;
                string mes = ddlMes.SelectedValue;
                string ano = ddlAno.SelectedValue;
                //Response.Redirect("BuscarOT.aspx?t=CP&e=2&a=" + idArea + "&s=" + idSucursal + "&cs=" + idCategoriaServicio);
                Response.Redirect("BuscarOT.aspx?t=CP&e=2&a=" + idArea + "&s=" + idSucursal + "&cs=" + idCategoriaServicio + "&mes=" + mes + "&ano=" + ano);
            }
            catch (Exception ex)
            {
                divAlerta.Visible = true;
                lblInfo.Text = ex.Message;
            }
        }

        protected void lbtnOTPreventivoProgramadas_Click(object sender, EventArgs e)
        {
            try
            {
                Session["strTituloBuscadorTicket"] = "SOLPED Preventivo Programada";
                string idArea = ddlArea.SelectedValue;
                string idSucursal = ddlSucursal.SelectedValue;
                string idCategoriaServicio = ddlCategoriaServicio.SelectedValue;
                string mes = ddlMes.SelectedValue;
                string ano = ddlAno.SelectedValue;
                //Response.Redirect("BuscarOT.aspx?t=P&e=4&a=" + idArea + "&s=" + idSucursal + "&cs=" + idCategoriaServicio);
                Response.Redirect("BuscarOT.aspx?t=P&e=4&a=" + idArea + "&s=" + idSucursal + "&cs=" + idCategoriaServicio + "&mes=" + mes + "&ano=" + ano);
            }
            catch (Exception ex)
            {
                divAlerta.Visible = true;
                lblInfo.Text = ex.Message;
            }

        }

        protected void lbtnOTPreventivoEnProceso_Click(object sender, EventArgs e)
        {
            try
            {
                Session["strTituloBuscadorTicket"] = "SOLPED Preventivo En Proceso";
                string idArea = ddlArea.SelectedValue;
                string idSucursal = ddlSucursal.SelectedValue;
                string idCategoriaServicio = ddlCategoriaServicio.SelectedValue;
                string mes = ddlMes.SelectedValue;
                string ano = ddlAno.SelectedValue;
                //Response.Redirect("BuscarOT.aspx?t=P&e=2&a=" + idArea + "&s=" + idSucursal + "&cs=" + idCategoriaServicio);
                Response.Redirect("BuscarOT.aspx?t=P&e=2&a=" + idArea + "&s=" + idSucursal + "&cs=" + idCategoriaServicio + "&mes=" + mes + "&ano=" + ano);
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

       
        protected void ddlCategoriaServicio_DataBound(object sender, EventArgs e)
        {

            ddlCategoriaServicio.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Todos", "0"));
        }

        protected void ddlCategoriaServicio_SelectedIndexChanged(object sender, EventArgs e)
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

        protected void ddlMes_SelectedIndexChanged(object sender, EventArgs e)
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

        protected void ddlAno_SelectedIndexChanged(object sender, EventArgs e)
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
    }
}