using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using DataTableToExcel;

namespace TagorManuCRM
{
    public partial class ReporteSolped : System.Web.UI.Page
    {
        public string consultaStr;
        Datos dal = new Datos();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!this.Page.IsPostBack)
                {
                    string idPerfil = Session["variableIdPerfil"].ToString();
                    string idUsuario = Session["variableIdUsuario"].ToString();

                    area();
                    Estado();
                    zonas(idUsuario);
                    
                    foreach (ListItem fila in chkZonas.Items)
                    {
                        fila.Selected = true;
                    }

                    buscar();
                    grafico();
                }
            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
                divAlerta.Attributes["class"] = "alert alert-warning";
                divAlerta.Visible = true;
            }
        }

        protected void lbtnBuscar_Click(object sender, EventArgs e)
        {
            try
            {
                buscar();
                grafico();
            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
                divAlerta.Attributes["class"] = "alert alert-danger";
                divAlerta.Visible = true;
            }
        }

        protected void btnExcel_Click(object sender, EventArgs e)
        {
            try
            {
                //string idUsuario = ddlUsuario.SelectedValue;
                DataTable dt = new DataTable();
                dt = dal.getBuscarTicketExporte(null, txtFechaDesde.Text, txtFechaHasta.Text, null).Tables[0];

                //Utilidad.ExportDataTableToExcel(dt, "exporte_gestiones.xls", "", "", "", "");

                Response.ContentType = "Application/x-msexcel";
                Response.AddHeader("content-disposition", "attachment;filename=exporte_ticket.csv");
                //Response.Charset = "UTF-8";
                Response.ContentEncoding = Encoding.Unicode;
                Response.Write(Utilidad.ExportToCSVFile(dt));
                Response.End();
            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
                divAlerta.Attributes["class"] = "alert alert-danger";
                divAlerta.Visible = true;
            }
        }

        void zonas(string idUsuario)
        {
            DataTable dt = new DataTable();
            dt = dal.getBuscarZonaPorIdUsuario(idUsuario).Tables[0];
            chkZonas.DataSource = dt;
            chkZonas.DataTextField = "ID_ZONA";
            chkZonas.DataValueField = "ID_ZONA";
            chkZonas.DataBind();
        }

        void area()
        {
            ddlArea.DataSource = dal.getBuscarArea();
            ddlArea.DataValueField = "ID_AREA";
            ddlArea.DataTextField = "AREA";
            ddlArea.DataBind();
        }

        void Estado()
        {
            ddlEstado.DataSource = dal.getBuscarEstadoAtencion();
            ddlEstado.DataTextField = "ESTADO_ATENCION";
            ddlEstado.DataValueField = "ID_ESTADO_ATENCION";
            ddlEstado.DataBind();
        }

        void buscar()
        {
            DataTable dt = new DataTable();
            dt = dal.getReporteTickets(null, txtFechaDesde.Text, txtFechaHasta.Text, null, ddlArea.SelectedValue).Tables[0];
            grvAtencionCliente.DataSource = dt;
            grvAtencionCliente.DataBind();
        }

        void grafico()
        {
            //string dataPointConsulta = "";
            string idZona = string.Empty;
            foreach (ListItem fila in chkZonas.Items)
            {
                if (fila.Selected == true)
                {
                    idZona += fila.Value.ToString() + ",";
                }
            }

            idZona = idZona.TrimEnd(',');

            DataTable dt = new DataTable();
            dt = dal.getCantidadTicketPorTipoYArea(txtFechaDesde.Text, txtFechaHasta.Text, ddlEstado.SelectedValue, ddlArea.SelectedValue, idZona).Tables[0];
            if (dt.Rows.Count == 0)
            {
                return;
            }

            StringBuilder sbConsulta = new StringBuilder();
            int cantitdadTicket = 0;
            //int cerradoCD = 0;
            foreach (DataRow item in dt.Rows)
            {
                string escalamiento = item["NIVEL_1"].ToString();
                if (escalamiento != "TOTAL")
                {
                    cantitdadTicket = Convert.ToInt32(item["CantidadTicket"].ToString());
                }
                sbConsulta.Append("{label: '"+ escalamiento + "', y: parseInt('" + cantitdadTicket + "')},");
            }
            //inicializa los valores en vacio para el grafico

            //string strConsulta = "[{label: '0', y: parseInt('0')}]";
            string strConsulta = "[{label: '0', y: parseInt('0')}]";

            if (sbConsulta.ToString() != "")
            {
                strConsulta = "[" + sbConsulta.ToString().Remove(sbConsulta.ToString().Length - 1) + "]";
            }
            consultaStr = strConsulta;
            string script3;
            script3 = "<script type=text/javascript>ejemplo();</script>";
            ScriptManager.RegisterStartupScript(this, typeof(Page), "ejemplo", script3, false);
        }

        protected void ddlArea_DataBound(object sender, EventArgs e)
        {
            ddlArea.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Todos", "0"));
        }

        protected void ddlEstado_DataBound(object sender, EventArgs e)
        {
            ddlEstado.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Todos", "0"));
        }

        

        protected void grvAtencionCliente_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void lbtnPendiente_Click(object sender, EventArgs e)
        {
            try
            {
                string idEstadoTicket = "1";
                string idArea = ddlArea.SelectedValue;
                LinkButton lbtn = sender as LinkButton;
                GridViewRow row = (GridViewRow)lbtn.NamingContainer;
                //Label _lblIdNivel1 = (Label)grvAtencionCliente.Rows[row.RowIndex].FindControl("lblIdNivel1");
                
                string fechaDesde = txtFechaDesde.Text;
                string fechaHasta = txtFechaHasta.Text;
                //string idUsuario = ddlUsuario.SelectedValue;

                Response.Redirect("BuscarOT.aspx?estado=" + idEstadoTicket + "&a=" + idArea + "&fechaDesde=" + fechaDesde + "&fechaHasta=" + fechaHasta);

            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
                divAlerta.Attributes["class"] = "alert alert-danger";
                divAlerta.Visible = true;
            }
        }

        protected void lbtnCerrado_Click(object sender, EventArgs e)
        {
            try
            {
                string idEstadoTicket = "3";
                LinkButton lbtn = sender as LinkButton;
                GridViewRow row = (GridViewRow)lbtn.NamingContainer;
                Label _lblIdNivel1 = (Label)grvAtencionCliente.Rows[row.RowIndex].FindControl("lblIdNivel1");
                Label _lblConEscalamiento = (Label)grvAtencionCliente.Rows[row.RowIndex].FindControl("lblConEscalamiento");

                string fechaDesde = txtFechaDesde.Text;
                string fechaHasta = txtFechaHasta.Text;
                //string idUsuario = ddlUsuario.SelectedValue;

                Response.Redirect("BuscarOT.aspx?estado=" + idEstadoTicket + "&idEstatus=" + _lblIdNivel1.Text + "&escalamiento=" + _lblConEscalamiento.Text + "&fechaDesde=" + fechaDesde + "&fechaHasta=" + fechaHasta + "&user=" );

            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
                divAlerta.Attributes["class"] = "alert alert-warning";
                divAlerta.Visible = true;
            }
        }

        protected void lbtnTotal_Click(object sender, EventArgs e)
        {
            try
            {
                LinkButton lbtn = sender as LinkButton;
                GridViewRow row = (GridViewRow)lbtn.NamingContainer;
                Label _lblIdNivel1 = (Label)grvAtencionCliente.Rows[row.RowIndex].FindControl("lblIdNivel1");
                Label _lblEscalamiento = (Label)grvAtencionCliente.Rows[row.RowIndex].FindControl("lblEscalamiento");
                Label _lblConEscalamiento = (Label)grvAtencionCliente.Rows[row.RowIndex].FindControl("lblConEscalamiento");

                string fechaDesde = txtFechaDesde.Text;
                string fechaHasta = txtFechaHasta.Text;
                //string idUsuario = ddlUsuario.SelectedValue;

                if (_lblEscalamiento.Text.ToUpper() == "TOTAL")
                {
                    Session["strTituloBuscadorTicket"] = "Detalle";
                    Response.Redirect("BuscarOT.aspx?fechaDesde=" + fechaDesde + "&fechaHasta=" + fechaHasta + "&user=");
                }
                else
                {
                    Session["strTituloBuscadorTicket"] = "Detalle";
                    Response.Redirect("BuscarOT.aspx?idEstatus=" + _lblIdNivel1.Text + "&escalamiento=" + _lblConEscalamiento.Text + "&fechaDesde=" + fechaDesde + "&fechaHasta=" + fechaHasta + "&user=");
                }
            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
                divAlerta.Attributes["class"] = "alert alert-warning";
                divAlerta.Visible = true;
            }
        }
    }
}