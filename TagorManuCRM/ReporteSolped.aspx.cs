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
                    Sucursal();
                    Zona();
                    Local();
                    //zonas(idUsuario);
                    //foreach (ListItem fila in chkZonas.Items)
                    //{
                    //    fila.Selected = true;
                    //}
                    usuarioAsig();
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
                dt = dal.getBuscarTicketExporte(ddlUsuario.SelectedValue, txtFechaDesde.Text.Trim(), txtFechaHasta.Text.Trim(),
                ddlArea.SelectedValue, ddlSucursal.SelectedValue, ddlZonas.SelectedValue, ddlLocal.SelectedValue, ddlEstado.SelectedValue).Tables[0];

                //Utilidad.ExportDataTableToExcel(dt, "exporte_gestiones.xls", "", "", "", "");

                Response.ContentType = "Application/x-msexcel";
                Response.AddHeader("content-disposition", "attachment;filename=exporte_OT.csv");
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

        //void zonas(string idUsuario)
        //{
        //    DataTable dt = new DataTable();
        //    dt = dal.getBuscarZonaPorIdUsuario(idUsuario).Tables[0];
        //    chkZonas.DataSource = dt;
        //    chkZonas.DataTextField = "ID_ZONA";
        //    chkZonas.DataValueField = "ID_ZONA";
        //    chkZonas.DataBind();
        //}

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
            //string idZona = string.Empty;
            //foreach (ListItem fila in chkZonas.Items)
            //{
            //    if (fila.Selected == true)
            //    {
            //        idZona += fila.Value.ToString() + ",";
            //    }
            //}
            //idZona = idZona.TrimEnd(',');

            DataTable dtTiempoResolucion = new DataTable();
            dtTiempoResolucion = dal.getBuscarAVGTiempoResolucion(ddlUsuario.SelectedValue, txtFechaDesde.Text.Trim(), txtFechaHasta.Text.Trim(),
                ddlArea.SelectedValue, ddlSucursal.SelectedValue, ddlZonas.SelectedValue, ddlLocal.SelectedValue, ddlEstado.SelectedValue, "C").Tables[0];

            //grvCorrectiva.DataSource = dtTiempoResolucion;
            //grvCorrectiva.DataBind();
            foreach (DataRow item in dtTiempoResolucion.Rows)
            {
                lblAvgTiempoResolucionCorrectiva.Text = item["DIAS"].ToString() + ":" + item["HORAS"].ToString() + ":" + item["MINUTOS"].ToString() + ":" + item["SEGUNDOS"].ToString();
            }
            dtTiempoResolucion.Clear();
            dtTiempoResolucion = dal.getBuscarAVGTiempoResolucion(ddlUsuario.SelectedValue, txtFechaDesde.Text.Trim(), txtFechaHasta.Text.Trim(),
                ddlArea.SelectedValue, ddlSucursal.SelectedValue, ddlZonas.SelectedValue, ddlLocal.SelectedValue, ddlEstado.SelectedValue, "CP").Tables[0];
            foreach (DataRow item in dtTiempoResolucion.Rows)
            {
                lblAvgTiempoResolucionCorrectivaPlanificada.Text =  item["DIAS"].ToString() + ":" + item["HORAS"].ToString() + ":" + item["MINUTOS"].ToString() + ":" + item["SEGUNDOS"].ToString();
            }
            dtTiempoResolucion.Clear();
            dtTiempoResolucion = dal.getBuscarAVGTiempoResolucion(ddlUsuario.SelectedValue, txtFechaDesde.Text.Trim(), txtFechaHasta.Text.Trim(),
                ddlArea.SelectedValue, ddlSucursal.SelectedValue, ddlZonas.SelectedValue, ddlLocal.SelectedValue, ddlEstado.SelectedValue, "P").Tables[0];
            foreach (DataRow item in dtTiempoResolucion.Rows)
            {
                lblAvgTiempoResolucionPreventiva.Text = item["DIAS"].ToString() + ":" + item["HORAS"].ToString() + ":" + item["MINUTOS"].ToString() + ":" + item["SEGUNDOS"].ToString();
            }

            DataTable dt = new DataTable();
            dt = dal.getReporteTickets(ddlUsuario.SelectedValue, txtFechaDesde.Text.Trim(), txtFechaHasta.Text.Trim(), 
                ddlArea.SelectedValue, ddlSucursal.SelectedValue, ddlZonas.SelectedValue, ddlLocal.SelectedValue, ddlEstado.SelectedValue).Tables[0];
            grvAtencionCliente.DataSource = dt;
            grvAtencionCliente.DataBind();

            grvDetallePorUsuario.DataSource = dal.getReporteTicketsPorUsuario(ddlUsuario.SelectedValue, txtFechaDesde.Text.Trim(), txtFechaHasta.Text.Trim(),
                ddlArea.SelectedValue, ddlSucursal.SelectedValue, ddlZonas.SelectedValue, ddlLocal.SelectedValue, ddlEstado.SelectedValue);
            grvDetallePorUsuario.DataBind();
        }

        void buscarDetallePorUsuario()
        {
            //string idZona = string.Empty;
            //foreach (ListItem fila in chkZonas.Items)
            //{
            //    if (fila.Selected == true)
            //    {
            //        idZona += fila.Value.ToString() + ",";
            //    }
            //}
            //idZona = idZona.TrimEnd(',');
            DataTable dt = new DataTable();
            dt = dal.getReporteTicketsPorUsuario(ddlUsuario.SelectedValue, txtFechaDesde.Text.Trim(), txtFechaHasta.Text.Trim(),
                ddlArea.SelectedValue, ddlSucursal.SelectedValue, ddlZonas.SelectedValue, ddlLocal.SelectedValue, ddlEstado.SelectedValue).Tables[0];
            grvAtencionCliente.DataSource = dt;
            grvAtencionCliente.DataBind();
        }


        void grafico()
        {
            //string idZona = string.Empty;
            //foreach (ListItem fila in chkZonas.Items)
            //{
            //    if (fila.Selected == true)
            //    {
            //        idZona += fila.Value.ToString() + ",";
            //    }
            //}
            //idZona = idZona.TrimEnd(',');
            string idZona = ddlZonas.SelectedValue;
            DataTable dt = new DataTable();
            dt = dal.getCantidadTicketPorTipoYArea(ddlUsuario.SelectedValue, txtFechaDesde.Text.Trim(), txtFechaHasta.Text.Trim(),
                ddlArea.SelectedValue, ddlSucursal.SelectedValue, ddlZonas.SelectedValue, ddlLocal.SelectedValue, ddlEstado.SelectedValue).Tables[0];
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
                Label _lblIdNivel1 = (Label)grvAtencionCliente.Rows[row.RowIndex].FindControl("lblIdNivel1");
                string nivel1 = _lblIdNivel1.Text;
                string fechaDesde = txtFechaDesde.Text;
                string fechaHasta = txtFechaHasta.Text;
                string idSucursal = ddlSucursal.SelectedValue;
                string idZona = ddlZonas.SelectedValue;
                string idLocal = ddlLocal.SelectedValue;
                string idUsuarioAsignado = ddlUsuario.SelectedValue;

                //string idUsuario = ddlUsuario.SelectedValue;

                //Response.Redirect("BuscarOT.aspx?estado=" + idEstadoTicket + "&a=" + idArea + "&fechaDesde=" + fechaDesde + "&fechaHasta=" + fechaHasta);
                Response.Redirect("DetalleOT.aspx?Detalle=1&e=" + idEstadoTicket + "&a=" + idArea + 
                    "&fechaDesde=" + fechaDesde + "&fechaHasta=" + fechaHasta + 
                    "&Nivel1="+ nivel1 + "&idSucursal=" + idSucursal + "&idZona=" + idZona + "&idLocal=" + idLocal +
                    "&idUsuarioAsignado=" + idUsuarioAsignado);
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
                string idArea = ddlArea.SelectedValue;
                LinkButton lbtn = sender as LinkButton;
                GridViewRow row = (GridViewRow)lbtn.NamingContainer;
                Label _lblIdNivel1 = (Label)grvAtencionCliente.Rows[row.RowIndex].FindControl("lblIdNivel1");
                string nivel1 = _lblIdNivel1.Text;
                string fechaDesde = txtFechaDesde.Text;
                string fechaHasta = txtFechaHasta.Text;
                string idSucursal = ddlSucursal.SelectedValue;
                string idZona = ddlZonas.SelectedValue;
                string idLocal = ddlLocal.SelectedValue;
                string idUsuarioAsignado = ddlUsuario.SelectedValue;

                //string idUsuario = ddlUsuario.SelectedValue;

                //Response.Redirect("BuscarOT.aspx?estado=" + idEstadoTicket + "&a=" + idArea + "&fechaDesde=" + fechaDesde + "&fechaHasta=" + fechaHasta);
                Response.Redirect("DetalleOT.aspx?Detalle=1&e=" + idEstadoTicket + "&a=" + idArea +
                    "&fechaDesde=" + fechaDesde + "&fechaHasta=" + fechaHasta +
                    "&Nivel1=" + nivel1 + "&idSucursal=" + idSucursal + "&idZona=" + idZona + "&idLocal=" + idLocal +
                    "&idUsuarioAsignado=" + idUsuarioAsignado);
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
                string idEstadoTicket = "0";
                string idArea = ddlArea.SelectedValue;
                LinkButton lbtn = sender as LinkButton;
                GridViewRow row = (GridViewRow)lbtn.NamingContainer;
                Label _lblIdNivel1 = (Label)grvAtencionCliente.Rows[row.RowIndex].FindControl("lblIdNivel1");
                string nivel1 = _lblIdNivel1.Text;
                string fechaDesde = txtFechaDesde.Text;
                string fechaHasta = txtFechaHasta.Text;
                string idSucursal = ddlSucursal.SelectedValue;
                string idZona = ddlZonas.SelectedValue;
                string idLocal = ddlLocal.SelectedValue;
                string idUsuarioAsignado = ddlUsuario.SelectedValue;

                //string idUsuario = ddlUsuario.SelectedValue;

                //Response.Redirect("BuscarOT.aspx?estado=" + idEstadoTicket + "&a=" + idArea + "&fechaDesde=" + fechaDesde + "&fechaHasta=" + fechaHasta);
                Response.Redirect("DetalleOT.aspx?Detalle=1&e=" + idEstadoTicket + "&a=" + idArea +
                    "&fechaDesde=" + fechaDesde + "&fechaHasta=" + fechaHasta +
                    "&Nivel1=" + nivel1 + "&idSucursal=" + idSucursal + "&idZona=" + idZona + "&idLocal=" + idLocal +
                    "&idUsuarioAsignado=" + idUsuarioAsignado);
            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
                divAlerta.Attributes["class"] = "alert alert-warning";
                divAlerta.Visible = true;
            }
        }

        protected void grvDetallePorUsuario_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void lbtnPendientePorUsuario_Click(object sender, EventArgs e)
        {
            try
            {
                string idEstadoTicket = "1";
                string idArea = ddlArea.SelectedValue;
                LinkButton lbtn = sender as LinkButton;
                GridViewRow row = (GridViewRow)lbtn.NamingContainer;
                Label _lblIdUsuario = (Label)grvDetallePorUsuario.Rows[row.RowIndex].FindControl("lblIdUsuario");
                string nivel1 = "";
                string fechaDesde = txtFechaDesde.Text;
                string fechaHasta = txtFechaHasta.Text;
                string idSucursal = ddlSucursal.SelectedValue;
                string idZona = ddlZonas.SelectedValue;
                string idLocal = ddlLocal.SelectedValue;
                string idUsuarioAsignado = _lblIdUsuario.Text;

                //string idUsuario = ddlUsuario.SelectedValue;

                //Response.Redirect("BuscarOT.aspx?estado=" + idEstadoTicket + "&a=" + idArea + "&fechaDesde=" + fechaDesde + "&fechaHasta=" + fechaHasta);
                Response.Redirect("DetalleOT.aspx?Detalle=1&e=" + idEstadoTicket + "&a=" + idArea +
                    "&fechaDesde=" + fechaDesde + "&fechaHasta=" + fechaHasta +
                    "&Nivel1=" + nivel1 + "&idSucursal=" + idSucursal + "&idZona=" + idZona + "&idLocal=" + idLocal +
                    "&idUsuarioAsignado=" + idUsuarioAsignado);
            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
                divAlerta.Attributes["class"] = "alert alert-warning";
                divAlerta.Visible = true;
            }
        }

        protected void lbtnCerradoPorUsuario_Click(object sender, EventArgs e)
        {
            try
            {
                string idEstadoTicket = "3";
                string idArea = ddlArea.SelectedValue;
                LinkButton lbtn = sender as LinkButton;
                GridViewRow row = (GridViewRow)lbtn.NamingContainer;
                Label _lblIdUsuario = (Label)grvDetallePorUsuario.Rows[row.RowIndex].FindControl("lblIdUsuario");
                string nivel1 = "";
                string fechaDesde = txtFechaDesde.Text;
                string fechaHasta = txtFechaHasta.Text;
                string idSucursal = ddlSucursal.SelectedValue;
                string idZona = ddlZonas.SelectedValue;
                string idLocal = ddlLocal.SelectedValue;
                string idUsuarioAsignado = _lblIdUsuario.Text;

                //string idUsuario = ddlUsuario.SelectedValue;

                //Response.Redirect("BuscarOT.aspx?estado=" + idEstadoTicket + "&a=" + idArea + "&fechaDesde=" + fechaDesde + "&fechaHasta=" + fechaHasta);
                Response.Redirect("DetalleOT.aspx?Detalle=1&e=" + idEstadoTicket + "&a=" + idArea +
                    "&fechaDesde=" + fechaDesde + "&fechaHasta=" + fechaHasta +
                    "&Nivel1=" + nivel1 + "&idSucursal=" + idSucursal + "&idZona=" + idZona + "&idLocal=" + idLocal +
                    "&idUsuarioAsignado=" + idUsuarioAsignado);
            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
                divAlerta.Attributes["class"] = "alert alert-warning";
                divAlerta.Visible = true;
            }
        }

        protected void lbtnTotalPorUsuario_Click(object sender, EventArgs e)
        {
            try
            {
                string idEstadoTicket = "0";
                string idArea = ddlArea.SelectedValue;
                LinkButton lbtn = sender as LinkButton;
                GridViewRow row = (GridViewRow)lbtn.NamingContainer;
                Label _lblIdUsuario = (Label)grvDetallePorUsuario.Rows[row.RowIndex].FindControl("lblIdUsuario");
                string nivel1 = "";
                string fechaDesde = txtFechaDesde.Text;
                string fechaHasta = txtFechaHasta.Text;
                string idSucursal = ddlSucursal.SelectedValue;
                string idZona = ddlZonas.SelectedValue;
                string idLocal = ddlLocal.SelectedValue;
                string idUsuarioAsignado = _lblIdUsuario.Text;

                //string idUsuario = ddlUsuario.SelectedValue;
                //Response.Redirect("BuscarOT.aspx?estado=" + idEstadoTicket + "&a=" + idArea + "&fechaDesde=" + fechaDesde + "&fechaHasta=" + fechaHasta);
                Response.Redirect("DetalleOT.aspx?Detalle=1&e=" + idEstadoTicket + "&a=" + idArea +
                    "&fechaDesde=" + fechaDesde + "&fechaHasta=" + fechaHasta +
                    "&Nivel1=" + nivel1 + "&idSucursal=" + idSucursal + "&idZona=" + idZona + "&idLocal=" + idLocal +
                    "&idUsuarioAsignado=" + idUsuarioAsignado);
            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
                divAlerta.Attributes["class"] = "alert alert-warning";
                divAlerta.Visible = true;
            }
        }

        protected void ddlUsuario_DataBound(object sender, EventArgs e)
        {
            ddlUsuario.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Todos", "0"));
        }

        void usuarioAsig()
        {
            string misZonas = string.Empty;
            string activo = "1";
            string perfil = Session["variableIdPerfil"].ToString();
            string idUsuario = Session["variableIdUsuario"].ToString();

            foreach (DataRow item in dal.getBuscarZonaPorIdUsuario(idUsuario).Tables[0].Rows)
            {
                misZonas = item["ID_ZONA"].ToString() + ",";
            }

            if (misZonas != string.Empty)
            {
                misZonas = misZonas.TrimEnd(',');
            }


            ddlUsuario.DataSource = dal.getBuscarUsuarioPorIdZonas(misZonas, activo);
            //ddlUsuario.DataSource = dal.getBuscarUsuarioPorId(null);
            ddlUsuario.DataValueField = "ID_USUARIO";
            ddlUsuario.DataTextField = "USUARIO";
            ddlUsuario.DataBind();
            
        }


        protected void ddlZona_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                Local();
            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
                divAlerta.Attributes["class"] = "alert alert-danger";
                divAlerta.Visible = true;
            }
        }

        protected void ddlZonas_DataBound(object sender, EventArgs e)
        {
            ddlZonas.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Todas", "0"));
        }

        void Zona()
        {
            string idUsuario = Session["variableIdUsuario"].ToString();
            ddlZonas.DataSource = dal.getBuscarZonaPorIdUsuario(idUsuario);
            ddlZonas.DataValueField = "ID_ZONA";
            ddlZonas.DataTextField = "ID_ZONA";
            ddlZonas.DataBind();
        }

        protected void ddlSucursal_DataBound(object sender, EventArgs e)
        {
            ddlSucursal.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Todos", "0"));
        }

        void Sucursal()
        {
            ddlSucursal.DataSource = dal.getBuscarSucursal("1");
            ddlSucursal.DataValueField = "ID_SUCURSAL";
            ddlSucursal.DataTextField = "NOMBRE_SUCURSAL";
            ddlSucursal.DataBind();
        }

        protected void ddlLocal_DataBound(object sender, EventArgs e)
        {
            ddlLocal.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Todos", "0"));
        }

        
        void Local()
        {
            //DataTable dt = new DataTable();
            //dt = dal.getBuscarLocalPorZona(ddlZonas.SelectedValue).Tables[0];
            //ddlLocal.DataSource = dt;
            //ddlLocal.DataValueField = "ID_LOCAL";
            //ddlLocal.DataTextField = "LOCAL";
            //ddlLocal.DataBind();

            string idUsuario = Session["variableIdUsuario"].ToString();
            string idPerfil = Session["variableIdPerfil"].ToString();
            if (idPerfil == "4")
            {
                ddlLocal.DataSource = dal.getBuscarLocalPorZona(ddlZonas.SelectedValue, idUsuario);
                ddlLocal.DataValueField = "ID_LOCAL";
                ddlLocal.DataTextField = "LOCAL";
                ddlLocal.DataBind();
            }
            else
            {
                ddlLocal.DataSource = dal.getBuscarLocalPorZona(ddlZonas.SelectedValue, "0");
                ddlLocal.DataValueField = "ID_LOCAL";
                ddlLocal.DataTextField = "LOCAL";
                ddlLocal.DataBind();
            }
        }
    }
}