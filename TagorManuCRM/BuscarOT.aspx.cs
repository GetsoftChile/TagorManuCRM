using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using DataTableToExcel;
using iTextSharp.text.pdf;
using iTextSharp.text;
using System.IO;


namespace TagorManuCRM
{
    public partial class BuscarOT : System.Web.UI.Page
    {
        Datos dal = new Datos();
        Comun com = new Comun();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                lblInfo.Text = "";
                divAlerta.Visible = false;

                if (!Page.IsPostBack)
                {
                    string perfil = Session["variableIdPerfil"].ToString();
                    string idUsuario = Session["variableIdUsuario"].ToString();
             
                    usuarioAsig();
                    estado();
                    com.FillArea(ddlArea);

                    if (perfil == "2")
                    {
                        ddlUsuarioAsig.SelectedValue = idUsuario;
                        ddlUsuarioAsig.Enabled = false;
                        chkResumen.Visible = false;
                    }

                    if (perfil=="4")
                    {
                        ddlUsuarioCreacion.SelectedValue = idUsuario;
                        ddlUsuarioCreacion.Enabled = false;
                        chkResumen.Visible = false;
                    }

                    string _tipo = Convert.ToString(Request.QueryString["t"]);
                    if (_tipo != null)
                    {
                        string _estado = Convert.ToString(Request.QueryString["e"]);
                        string _area = Convert.ToString(Request.QueryString["a"]);

                        ddlEstado.SelectedValue = _estado;
                        ddlTipo.SelectedValue = _tipo;
                        ddlArea.SelectedValue = _area;

                        buscarTicket(ddlEstado.SelectedValue, null, ddlTipo.SelectedValue, ddlArea.SelectedValue);

                        divResumen.Visible = false;
                        divGrilla.Visible = true;
                    }

                    string estado_ = Convert.ToString(Request.QueryString["estado"]);
                    if (estado_ != null)
                    {
                        string _area = Convert.ToString(Request.QueryString["a"]);
                        
                    }

                    if (Session["strTituloBuscadorTicket"] == null)
                    {
                        lblTituloBuscadorTicket.Text = "Buscador de SOLPED";
                    }
                    else
                    {
                        lblTituloBuscadorTicket.Text = Session["strTituloBuscadorTicket"].ToString();
                    }

                    

                    Session["strTituloBuscadorTicket"] = null;
                }
            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
                divAlerta.Attributes["class"] = "alert alert-danger";
                divAlerta.Visible = true;
            }
        }

        public string buscarIdUsuario()
        {
            string idUsuario = "";
            foreach (DataRow rowDs in dal.getBuscarUsuario(Session["variableUsuario"].ToString(), null).Tables[0].Rows)
            {
                idUsuario = Convert.ToString(rowDs["ID_USUARIO"]);
            }
            return idUsuario;
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            try
            {
                string buscar = txtBuscar.Text.Trim();
                if (buscar.Length < 1)
                {
                    lblInfo.Text ="Texto de busqueda debe tener al menos 1 caracteres";
                    divAlerta.Attributes["class"] = "alert alert-warning";
                    divAlerta.Visible = true;
                    return;
                }
                string verTodos = string.Empty;// Session["variableVerTodos"].ToString();
                string idUsuario2 = Session["variableIdUsuario"].ToString();

                divGrilla.Visible = true;
                string idUsuario = buscarIdUsuario();

                DataTable dt = new DataTable();

                //dt = dal.getBuscarTicketBuscadorPorIdTicket(txtBuscar.Text.Trim()).Tables[0];
                //BUSCACR ID USUARIO

                if (verTodos == "1")
                {
                    dt = dal.getBuscarTicketBuscadorPorIdTicketUsuario(txtBuscar.Text.Trim(), null).Tables[0];

                }
                else
                {
                    dt = dal.getBuscarTicketBuscadorPorIdTicketUsuario(txtBuscar.Text.Trim(), idUsuario2).Tables[0];
                }


                Session["sessionDtTicket"] = dt;
                grvTickets.DataSource = dt;
                grvTickets.DataBind();

                //buscarGr();
            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
                divAlerta.Attributes["class"] = "alert alert-danger";
                divAlerta.Visible = true;
            }
        }

        protected void btnBuscarPorRut_Click(object sender, EventArgs e)
        {
            try
            {
                string buscar = txtBuscarPorRut.Text.Trim();
                if (buscar.Length < 1)
                {
                    lblInfo.Text = "Texto de busqueda debe tener al menos 1 caracteres";
                    divAlerta.Attributes["class"] = "alert alert-warning";
                    divAlerta.Visible = true;
                    return;
                }

                divGrilla.Visible = true;
                string idUsuario = buscarIdUsuario();
                
                DataTable dt = new DataTable();
                dt = dal.getBuscarTicketBuscadorPorRut(txtBuscarPorRut.Text.Trim()).Tables[0];
                Session["sessionDtTicket"] = dt;
                grvTickets.DataSource = dt;
                grvTickets.DataBind();

                //buscarGr();
            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
                divAlerta.Attributes["class"] = "alert alert-danger";
                divAlerta.Visible = true;
            }
        }


        protected void btnBuscarPorCliente_Click(object sender, EventArgs e)
        {
            try
            {
                string buscar = txtBuscarPorNombreCliente.Text.Trim();
                if (buscar.Length < 1)
                {
                    lblInfo.Text = "Texto de busqueda debe tener al menos 1 caracteres";
                    divAlerta.Attributes["class"] = "alert alert-warning";
                    divAlerta.Visible = true;
                    return;
                }

                divGrilla.Visible = true;
                string idUsuario = buscarIdUsuario();
                DataTable dt = new DataTable();
                dt = dal.getBuscarTicketBuscadorPorCliente(txtBuscarPorNombreCliente.Text.Trim()).Tables[0];
                Session["sessionDtTicket"] = dt;
                grvTickets.DataSource = dt;
                grvTickets.DataBind();


                //buscarGr();
            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
                divAlerta.Attributes["class"] = "alert alert-danger";
                divAlerta.Visible = true;
            }
        }

        void buscarGr()
        {
            divGrilla.Visible = true;
            string idUsuario = buscarIdUsuario();
            DataTable dt = new DataTable();
            dt = dal.getBuscarTicketBuscador(txtBuscar.Text, txtBuscar.Text, idUsuario).Tables[0];
            Session["sessionDtTicket"] = dt;
            grvTickets.DataSource = dt;
            grvTickets.DataBind();
        }

        protected void lbtnIdTicket_Click(object sender, EventArgs e)
        {
            try
            {
                LinkButton lbtn = sender as LinkButton;
                GridViewRow row = (GridViewRow)lbtn.NamingContainer;
                Label _lblIdTicket = (Label)grvTickets.Rows[row.RowIndex].FindControl("lblIdTicket");
                Response.Redirect("SeguimientoOT.aspx?t=" + _lblIdTicket.Text);
            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
                divAlerta.Attributes["class"] = "alert alert-danger";
                divAlerta.Visible = true;
            }
        }

        protected void imgAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("IngresoTicket.aspx");
            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
                divAlerta.Attributes["class"] = "alert alert-danger";
                divAlerta.Visible = true;
            }
        }

        protected void btnBuscarTicket_Click(object sender, EventArgs e)
        {
            try
            {
                if (chkResumen.Checked == true)
                {
                    divResumen.Visible = true;
                    divGrilla.Visible = false;
                    buscarTicketResumen();
                }
                else
                {
                    divResumen.Visible = false;
                    divGrilla.Visible = true;
                    buscarTicket(ddlEstado.SelectedValue,null,ddlTipo.SelectedValue,ddlArea.SelectedValue);
                }
            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
                divAlerta.Attributes["class"] = "alert alert-danger";
                divAlerta.Visible = true;
            }
        }

        void buscarTicket(string idEstado, string nivel1, string tipo, string idArea)
        {
            DataTable dt = new DataTable();
            dt = dal.getBuscarTicketBuscadorParametros(ddlUsuarioCreacion.SelectedValue, ddlUsuarioAsig.SelectedValue, 
                txtFechaDesde.Text, txtFechaHasta.Text, idEstado,  tipo, idArea).Tables[0];

            Session["sessionDtTicket"] = dt;
            grvTickets.DataSource = dt;
            grvTickets.DataBind();
        }

        protected void ddlUsuarioAsig_DataBound(object sender, EventArgs e)
        {
            ddlUsuarioAsig.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Todos", "0"));
        }

        protected void ddlEstado_DataBound(object sender, EventArgs e)
        {
            ddlEstado.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Todos", "0"));
        }

        protected void ddlUsuarioCreacion_DataBound(object sender, EventArgs e)
        {

            ddlUsuarioCreacion.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Todos", "0"));
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

            ddlUsuarioAsig.DataSource = dal.getBuscarUsuarioPorIdZonas(misZonas, activo);
            ddlUsuarioAsig.DataValueField = "ID_USUARIO";
            ddlUsuarioAsig.DataTextField = "USUARIO";
            ddlUsuarioAsig.DataBind();

            ddlUsuarioCreacion.DataSource = dal.getBuscarUsuarioPorIdZonas(misZonas, activo);
            ddlUsuarioCreacion.DataValueField = "ID_USUARIO";
            ddlUsuarioCreacion.DataTextField = "USUARIO";
            ddlUsuarioCreacion.DataBind();
        }

        void estado()
        {
            ddlEstado.DataSource = dal.getBuscarEstadoAtencion();
            ddlEstado.DataValueField = "ID_ESTADO_ATENCION";
            ddlEstado.DataTextField = "ESTADO_ATENCION";
            ddlEstado.DataBind();
        }

        protected void lbtnCantidad_Click(object sender, EventArgs e)
        {
            try
            {
                LinkButton lbtn = sender as LinkButton;
                GridViewRow row = (GridViewRow)lbtn.NamingContainer;
                Label _lblIdEstado = (Label)grvResumen.Rows[row.RowIndex].FindControl("lblIdEstado");

                divGrilla.Visible = true;
                divResumen.Visible = false;
                buscarTicket(_lblIdEstado.Text, null,ddlTipo.SelectedValue,ddlArea.SelectedValue);
            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
                divAlerta.Attributes["class"] = "alert alert-danger";
                divAlerta.Visible = true;
            }
        }

        void buscarTicketResumen()
        {
            grvResumen.DataSource = dal.getBuscarTicketResumen(txtFechaDesde.Text, txtFechaHasta.Text);
            grvResumen.DataBind();

            foreach (GridViewRow grd_Row in grvResumen.Rows)
            {
                LinkButton _btnExportar = (LinkButton)grvResumen.Rows[grd_Row.RowIndex].FindControl("btnExportar");
                ScriptManager scriptManager = ScriptManager.GetCurrent(Page);
                scriptManager.RegisterPostBackControl(_btnExportar);
            }
        }

        protected void btnArchivo_Click(object sender, EventArgs e)
        {
            try
            {
                LinkButton btn = (LinkButton)sender;
                GridViewRow row = (GridViewRow)btn.NamingContainer;
                Label _lblArchivo = (Label)grvTickets.Rows[row.RowIndex].FindControl("lblArchivo");
                ScriptManager.RegisterStartupScript(this, this.GetType(), UniqueID, "window.open('ArchivoOT/" + _lblArchivo.Text + "','_blank');", true);
            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
                divAlerta.Attributes["class"] = "alert alert-danger";
                divAlerta.Visible = true;
            }
        }


        protected void btnArchivo2_Click(object sender, EventArgs e)
        {
            try
            {
                LinkButton btn = (LinkButton)sender;
                GridViewRow row = (GridViewRow)btn.NamingContainer;
                Label _lblArchivo = (Label)grvTickets.Rows[row.RowIndex].FindControl("lblArchivo2");
                ScriptManager.RegisterStartupScript(this, this.GetType(), UniqueID, "window.open('ArchivoOT/" + _lblArchivo.Text + "','_blank');", true);
            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
                divAlerta.Attributes["class"] = "alert alert-danger";
                divAlerta.Visible = true;
            }
        }

        protected void btnExportar_Click(object sender, EventArgs e)
        {
            try
            {
                LinkButton btn = (LinkButton)sender;

                GridViewRow row = (GridViewRow)btn.NamingContainer;
                Label _lblIdEstado = (Label)grvResumen.Rows[row.RowIndex].FindControl("lblIdEstado");

                DataTable dt = new DataTable();
                dt = dal.getBuscarTicketBuscadorParametrosExporte("0", txtFechaDesde.Text, txtFechaHasta.Text, _lblIdEstado.Text).Tables[0];

                Utilidad.ExportDataTableToExcel(dt, "Exporte.xls", "", "", "", "");
            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
                divAlerta.Attributes["class"] = "alert alert-danger";
                divAlerta.Visible = true;
            }
        }

        protected void ibtnObservacion_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                lblObservacionTicket.Text = string.Empty;
                ImageButton btn = (ImageButton)sender;
                GridViewRow row = (GridViewRow)btn.NamingContainer;
                Label _lblObservacion = (Label)grvTickets.Rows[row.RowIndex].FindControl("lblObservacion");

                if (string.IsNullOrEmpty(_lblObservacion.Text))
                {
                    lblObservacionTicket.Text = string.Empty;
                }
                else
                {
                    lblObservacionTicket.Text = _lblObservacion.Text;
                }
                
                ScriptManager.RegisterStartupScript(UpdatePanel2, UpdatePanel2.GetType(), "show", "$(function () { $('#" + Panel1.ClientID + "').modal('show'); });", true);
                UpdatePanel2.Update();
            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
                divAlerta.Attributes["class"] = "alert alert-danger";
                divAlerta.Visible = true;
            }
        }





        protected void imgFirst_Click(object sender, EventArgs e)
        {
            //buscar();
            if (Session["sessionDtTicket"] != null)
            {
                grvTickets.DataSource = Session["sessionDtTicket"];
                grvTickets.DataBind();
            }
            else
            {
                //buscar();
            }
            grvTickets.PageIndex = 0;
            grvTickets.DataBind();
        }

        protected void imgPrev_Click(object sender, EventArgs e)
        {
            //buscar();
            if (Session["sessionDtTicket"] != null)
            {
                grvTickets.DataSource = Session["sessionDtTicket"];
                grvTickets.DataBind();
            }
            else
            {
                //buscar();
            }
            if (grvTickets.PageIndex != 0)
                grvTickets.PageIndex--;
            grvTickets.DataBind();
        }

        protected void imgNext_Click(object sender, EventArgs e)
        {
            //buscar();
            if (Session["sessionDtTicket"] != null)
            {
                grvTickets.DataSource = Session["sessionDtTicket"];
                grvTickets.DataBind();
            }
            else
            {
                //buscar();
            }

            if (grvTickets.PageIndex != (grvTickets.PageCount - 1))
                grvTickets.PageIndex++;
            grvTickets.DataBind();
        }

        protected void imgLast_Click(object sender, EventArgs e)
        {
            //buscar();
            if (Session["sessionDtTicket"] != null)
            {
                grvTickets.DataSource = Session["sessionDtTicket"];
                grvTickets.DataBind();
            }
            else
            {
                //buscar();
            }

            grvTickets.PageIndex = grvTickets.PageCount - 1;
            grvTickets.DataBind();
        }



        protected void paginacion_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label _lblArchivo = (Label)e.Row.FindControl("lblArchivo");
                Label _lblArchivo2 = (Label)e.Row.FindControl("lblArchivo2");

                LinkButton _btnArchivo = (LinkButton)e.Row.FindControl("btnArchivo");
                LinkButton _btnArchivo2 = (LinkButton)e.Row.FindControl("btnArchivo2");
        
                Label _lblEstado = (Label)e.Row.FindControl("lblEstado");

                if (_lblEstado.Text == "PENDIENTE")
                {
                    _lblEstado.CssClass = "label label-danger";
                }
                else if (_lblEstado.Text == "CERRADO")
                {
                    _lblEstado.CssClass = "label label-success";
                }

                if (string.IsNullOrEmpty(_lblArchivo.Text) == true)
                {
                    _btnArchivo.Visible = false;
                }
                else
                {
                    _btnArchivo.Visible = true;
                }

                if (string.IsNullOrEmpty(_lblArchivo2.Text) == true)
                {
                    _btnArchivo2.Visible = false;
                }
                else
                {
                    _btnArchivo2.Visible = true;
                }
            }

            if (e.Row.RowType == DataControlRowType.Pager)
            {
                Label _lblPagina = (Label)e.Row.FindControl("lblPagina");
                Label _lblTotal = (Label)e.Row.FindControl("lblTotal");
                Label _lblTotalRegistros = (Label)e.Row.FindControl("lblTotalRegistros");
                _lblPagina.Text = Convert.ToString(grvTickets.PageIndex + 1);
                _lblTotal.Text = Convert.ToString(grvTickets.PageCount);

                DataTable dt = new DataTable();
                dt = Session["sessionDtTicket"] as DataTable;
                _lblTotalRegistros.Text = dt.Rows.Count.ToString();
            }
        }

        protected void ddlArea_DataBound(object sender, EventArgs e)
        {
           // ddlArea.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Todos", "0"));
        }


        protected void btnBuscarPorRutCi_Click(object sender, EventArgs e)
        {
            try
            {
                //string buscar = txtBuscarPorRutCi.Text.Trim();
                //if (buscar.Length < 1)
                //{
                //    lblInfo.Text = "Texto de busqueda debe tener al menos 1 caracteres";
                //    divAlerta.Attributes["class"] = "alert alert-warning";
                //    divAlerta.Visible = true;
                //    return;
                //}

                //divGrilla.Visible = true;
                //string idUsuario = buscarIdUsuario();

                //DataTable dt = new DataTable();
                //dt = dal.getBuscarTicketBuscadorPorTelefonoCi(txtBuscarPorRutCi.Text.Trim()).Tables[0];
                //Session["sessionDtTicket"] = dt;
                //grvTickets.DataSource = dt;
                //grvTickets.DataBind();

                //buscarGr();
            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
                divAlerta.Attributes["class"] = "alert alert-danger";
                divAlerta.Visible = true;
            }
        }

        protected void btnBuscarEmailCi_Click(object sender, EventArgs e)
        {
            try
            {
                //string buscar = txtBuscarEmailCi.Text.Trim();
                //if (buscar.Length < 1)
                //{
                //    lblInfo.Text = "Texto de busqueda debe tener al menos 1 caracteres";
                //    divAlerta.Attributes["class"] = "alert alert-warning";
                //    divAlerta.Visible = true;
                //    return;
                //}

                //divGrilla.Visible = true;
                //string idUsuario = buscarIdUsuario();

                //DataTable dt = new DataTable();
                //dt = dal.getBuscarTicketBuscadorPorEmailCi(txtBuscarEmailCi.Text.Trim()).Tables[0];
                //Session["sessionDtTicket"] = dt;
                //grvTickets.DataSource = dt;
                //grvTickets.DataBind();

                //buscarGr();
            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
                divAlerta.Attributes["class"] = "alert alert-danger";
                divAlerta.Visible = true;
            }
        }

        protected void ibtnObservacionCli_Click(object sender, ImageClickEventArgs e)
        {
            lblObservacionTicket.Text = string.Empty;

            ImageButton btn = (ImageButton)sender;
            GridViewRow row = (GridViewRow)btn.NamingContainer;
            Label _lblObservacion = (Label)grvTickets.Rows[row.RowIndex].FindControl("lblObservacionCli");

            if (string.IsNullOrEmpty(_lblObservacion.Text))
            {
                lblObservacionTicket.Text = string.Empty;
            }
            else
            {
                lblObservacionTicket.Text = _lblObservacion.Text;
            }

            ScriptManager.RegisterStartupScript(UpdatePanel2, UpdatePanel2.GetType(), "show", "$(function () { $('#" + Panel1.ClientID + "').modal('show'); });", true);
            UpdatePanel2.Update();
        }

        protected void lbtnGenerarPdf_Click(object sender, EventArgs e)
        {
            try
            {
                LinkButton btn = (LinkButton)sender;
                GridViewRow row = (GridViewRow)btn.NamingContainer;
                Label _lblIdTicket = (Label)grvTickets.Rows[row.RowIndex].FindControl("lblIdTicket");
                string ruta = generaPdf(_lblIdTicket.Text);
                //ruta += _lblIdPago.Text + ".pdf";
                ScriptManager.RegisterStartupScript(this, this.GetType(), UniqueID, "window.open('" + ruta + "','_blank');", true);
            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
                divAlerta.Attributes["class"] = "alert alert-danger";
                divAlerta.Visible = true;
            }
            
        }


        public string generaPdf(string idTicket)
        {
            DataTable dt = new DataTable();
            dt = dal.getBuscarTicket(idTicket).Tables[0];
            
            string observacion = string.Empty;
            string usuarioAsignado = string.Empty;
            string usuarioCreacionTicket = string.Empty;
            string usuarioNombreAsignado = string.Empty;
            string usuarioNombreCreacionTicket = string.Empty;
            string nombreSolicitante = string.Empty;
            string telefonoSolicitante = string.Empty;
            string emailSolicitante = string.Empty;
            string estadoTicket = string.Empty;
            string tipo = string.Empty;
            string area = string.Empty;
            string idZona = string.Empty;
            string local = string.Empty;
            string codLocalTitulo = string.Empty;
            string nivel1 = string.Empty;
            string nivel2 = string.Empty;
            string nivel3 = string.Empty;
            string nivel4 = string.Empty;
            
       
            string fechaTicket = string.Empty;

            foreach (DataRow item in dt.Rows)
            {
                observacion = item["OBSERVACION"].ToString();
                tipo = item["CLASE"].ToString();
                idZona = item["ID_ZONA"].ToString();
                usuarioNombreAsignado = item["NOMBRE_ASIGNADO"].ToString();
                usuarioAsignado = item["USUARIO_ASIGNADO"].ToString();
                usuarioCreacionTicket = item["USUARIO_CREACION"].ToString();
                usuarioNombreCreacionTicket = item["NOMBRE_CREACION"].ToString();
                estadoTicket = item["ESTADO_ATENCION"].ToString();
                area = item["AREA"].ToString();
                fechaTicket = item["FECHA"].ToString();
                nivel1 = item["NIVEL_1"].ToString();
                nivel2 = item["NIVEL_2"].ToString();
                nivel3 = item["NIVEL_3"].ToString();
                nivel4 = item["NIVEL_4"].ToString();
                nombreSolicitante = item["SOLICITADO_POR"].ToString();
                telefonoSolicitante = item["TELEFONO_ASOCIADO"].ToString();
                emailSolicitante = item["EMAIL_SOLICITANTE"].ToString();
                local = item["LOCAL"].ToString();
                codLocalTitulo = item["COD_LOCAL"].ToString();
            }
            
            
            DataTable dtHistorico = new DataTable();
            dtHistorico = dal.getBuscarTicketHistorico(idTicket).Tables[0];
            string correlativo = string.Empty;
            string fecha = string.Empty;
            string usuarioCreacion = string.Empty;
            string usuarioAsig = string.Empty;
            string estado = string.Empty;
            string motivoCierre = string.Empty;
            string obs = string.Empty;
            string obsCli = string.Empty;
            
            //AQUIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII
            string titulo = "SOLPED";
            string nombreArchivoPdf = "SOLPED_" + idTicket + ".pdf";
            BaseFont bfTimes = BaseFont.CreateFont(BaseFont.HELVETICA, BaseFont.CP1252, false);

            Font times = new Font(bfTimes, 7, Font.NORMAL);
            Font timesRojo = new Font(bfTimes, 9, Font.BOLD, BaseColor.RED);
            Font timesCorrelativo = new Font(bfTimes, 9, Font.BOLD);
            Font fontCabecera = new Font(bfTimes, 8, Font.BOLD);
            Font fontFirma = new Font(bfTimes, 8, Font.BOLD);
            
            Document doc = new Document(PageSize.A4, 25, 25, 30, 30);
            PdfWriter writePdf = PdfWriter.GetInstance(doc, new FileStream(Server.MapPath("pdfOT/" + nombreArchivoPdf), FileMode.Create));
            doc.Open();
            
            iTextSharp.text.Image jpg = iTextSharp.text.Image.GetInstance(Server.MapPath("assets/img/logo-tagor.png"));
            jpg.ScaleToFit(80, 80);
            jpg.Alignment = iTextSharp.text.Image.ALIGN_LEFT;
            doc.Add(jpg);

            PdfPTable tableNumeroComprobante = new PdfPTable(2);
            PdfPCell celdaNumeroComprobante = new PdfPCell(new Paragraph("Nro.SOLPED :", fontCabecera));
            //celdaNumeroComprobante.HorizontalAlignment = 2;
            PdfPCell celdaNumeroComprobanteFecha = new PdfPCell(new Paragraph("Fecha SOLPED :", fontCabecera));
            PdfPCell celdaCodLocal = new PdfPCell(new Paragraph("LOCAL :", fontCabecera));
            //celdaNumeroComprobanteFecha.HorizontalAlignment = 2;
            tableNumeroComprobante.AddCell(celdaNumeroComprobante);
            tableNumeroComprobante.AddCell(new Paragraph(idTicket, times));

            tableNumeroComprobante.AddCell(celdaNumeroComprobanteFecha);
            tableNumeroComprobante.AddCell(new Paragraph(fechaTicket, times));

            tableNumeroComprobante.AddCell(celdaCodLocal);
            tableNumeroComprobante.AddCell(new Paragraph(codLocalTitulo, fontCabecera));

            tableNumeroComprobante.DefaultCell.Border = Rectangle.NO_BORDER;

            tableNumeroComprobante.HorizontalAlignment = Element.ALIGN_RIGHT;
            tableNumeroComprobante.WidthPercentage = 25.0f;

            foreach (PdfPCell celda in tableNumeroComprobante.Rows[0].GetCells())
            {
                celda.Border = Rectangle.NO_BORDER;
            }

            foreach (PdfPCell celda in tableNumeroComprobante.Rows[1].GetCells())
            {
                celda.Border = Rectangle.NO_BORDER;
                //celda.HorizontalAlignment = 2;
            }
            foreach (PdfPCell celda in tableNumeroComprobante.Rows[2].GetCells())
            {
                celda.Border = Rectangle.NO_BORDER;
                //celda.HorizontalAlignment = 2;
            }

            doc.Add(tableNumeroComprobante);


            Chunk tituloTipoExamen = new Chunk(titulo, FontFactory.GetFont("ARIAL", 12, iTextSharp.text.Font.BOLD));
            tituloTipoExamen.SetUnderline(0.1f, -2f);

            Paragraph par = new Paragraph(tituloTipoExamen);
            par.Alignment = Element.ALIGN_CENTER;
            doc.Add(par);

            //doc.Add(tituloTipoExamen);
            doc.Add(new Paragraph(" ", times));

            Chunk datosDeudor = new Chunk("Datos Solicitante", FontFactory.GetFont("ARIAL", 9, iTextSharp.text.Font.BOLD));
            datosDeudor.SetUnderline(0.1f, -2f);
            doc.Add(datosDeudor);

            PdfPTable tableDatosDeudor = new PdfPTable(8);

            float[] widthsDatosDeudor = new float[] { 50f, 40f, 50f, 70f, 35f, 35f , 25f,50f };
            tableDatosDeudor.SetWidths(widthsDatosDeudor);
            
            PdfPCell cellUsuarioSolicitante = new PdfPCell(new Paragraph("Usuario Solicitante:", fontCabecera));
            cellUsuarioSolicitante.BackgroundColor = BaseColor.LIGHT_GRAY;
            tableDatosDeudor.AddCell(cellUsuarioSolicitante);
            tableDatosDeudor.AddCell(new Paragraph(usuarioCreacionTicket, times));
            PdfPCell cellNombreSolicitante = new PdfPCell(new Paragraph("Nombre Solicitante:", fontCabecera));
            cellNombreSolicitante.BackgroundColor = BaseColor.LIGHT_GRAY;
            tableDatosDeudor.AddCell(cellNombreSolicitante);
            tableDatosDeudor.AddCell(new Paragraph(usuarioNombreCreacionTicket, times));

            PdfPCell cellTelefono = new PdfPCell(new Paragraph("Teléfono:", fontCabecera));
            cellTelefono.BackgroundColor = BaseColor.LIGHT_GRAY;
            tableDatosDeudor.AddCell(cellTelefono);
            tableDatosDeudor.AddCell(new Paragraph(telefonoSolicitante, times));
            PdfPCell cellEmail = new PdfPCell(new Paragraph("Email:", fontCabecera));
            cellEmail.BackgroundColor = BaseColor.LIGHT_GRAY;
            tableDatosDeudor.AddCell(cellEmail);
            tableDatosDeudor.AddCell(new Paragraph(emailSolicitante, times));

            PdfPCell cellUsuarioAsignado = new PdfPCell(new Paragraph("Usuario Asignado :", fontCabecera));
            cellUsuarioAsignado.BackgroundColor = BaseColor.LIGHT_GRAY;
            tableDatosDeudor.AddCell(cellUsuarioAsignado);
            tableDatosDeudor.AddCell(new Paragraph(usuarioAsignado, times));
            PdfPCell cellNombreAsignado = new PdfPCell(new Paragraph("Nombre Usuario Asignado :", fontCabecera));
            cellNombreAsignado.BackgroundColor = BaseColor.LIGHT_GRAY;
            tableDatosDeudor.AddCell(cellNombreAsignado);
            tableDatosDeudor.AddCell(new Paragraph(usuarioNombreAsignado, times));

            PdfPCell cellEstado = new PdfPCell(new Paragraph("Estado :", fontCabecera));
            cellEstado.BackgroundColor = BaseColor.LIGHT_GRAY;
            tableDatosDeudor.AddCell(cellEstado);
            
            tableDatosDeudor.AddCell(new Paragraph(estadoTicket, times));

            PdfPCell cellVacio = new PdfPCell(new Paragraph(" ", fontCabecera));
            cellVacio.BackgroundColor = BaseColor.LIGHT_GRAY;
            tableDatosDeudor.AddCell(cellVacio);
            
            tableDatosDeudor.AddCell(new Paragraph(" ", times));

            tableDatosDeudor.HorizontalAlignment = Element.ALIGN_LEFT;
            tableDatosDeudor.WidthPercentage = 100.0f;
           

            //foreach (PdfPCell celda in tableDatosDeudor.Rows[0].GetCells())
            //{
            //    celda.BackgroundColor = BaseColor.LIGHT_GRAY;
            //    celda.HorizontalAlignment = 1;
            //    celda.Padding = 2;
            //}

            doc.Add(tableDatosDeudor);

            doc.Add(new Paragraph(" ", times));
            doc.Add(new Paragraph(" ", times));


            Chunk datosLocal = new Chunk("Local", FontFactory.GetFont("ARIAL", 9, iTextSharp.text.Font.BOLD));
            datosLocal.SetUnderline(0.1f, -2f);
            doc.Add(datosLocal);

            DataTable dtLocal = new DataTable();
            dtLocal = dal.getBuscarLocalPorId(local).Tables[0];
            string codLocal = string.Empty;
            string nombreLocal = string.Empty;
            string direccionLocal = string.Empty;
            string unidad = string.Empty;
            string comuna = string.Empty;
            string region = string.Empty;
            string zona = string.Empty;
            string telefonoLocal = string.Empty;
            foreach (DataRow item in dt.Rows)
            {
                codLocal = item["COD_LOCAL"].ToString();
                nombreLocal = item["NOMBRE_LOCAL"].ToString();
                direccionLocal = item["DIRECCION"].ToString();
                unidad = item["UNIDAD"].ToString();
                comuna = item["COMUNA"].ToString();
                region = item["REGION"].ToString();
                zona = item["ID_ZONA"].ToString();
                telefonoLocal = item["TELEFONO"].ToString();
            }

            PdfPTable tableDatosLocal = new PdfPTable(4);
            float[] widthsDatosLocal = new float[] { 25f, 45f, 55f, 55f };
            tableDatosLocal.SetWidths(widthsDatosLocal);

            tableDatosLocal.AddCell(new Paragraph("Cod Local:", fontCabecera));
            tableDatosLocal.AddCell(new Paragraph("Nombre Local:", fontCabecera));
            tableDatosLocal.AddCell(new Paragraph("Direccion:", fontCabecera));
            tableDatosLocal.AddCell(new Paragraph("Comuna:", fontCabecera));

            tableDatosLocal.AddCell(new Paragraph(codLocal, times));
            tableDatosLocal.AddCell(new Paragraph(nombreLocal, times));
            tableDatosLocal.AddCell(new Paragraph(direccionLocal, times));
            tableDatosLocal.AddCell(new Paragraph(comuna, times));

            tableDatosLocal.AddCell(new Paragraph("Unidad:", fontCabecera));
            tableDatosLocal.AddCell(new Paragraph("Region:", fontCabecera));
            tableDatosLocal.AddCell(new Paragraph("Zona:", fontCabecera));
            tableDatosLocal.AddCell(new Paragraph("Telefono:", fontCabecera));

            tableDatosLocal.AddCell(new Paragraph(unidad, times));
            tableDatosLocal.AddCell(new Paragraph(region, times));
            tableDatosLocal.AddCell(new Paragraph(zona, times));
            tableDatosLocal.AddCell(new Paragraph(telefonoLocal, times));

            tableDatosLocal.HorizontalAlignment = Element.ALIGN_LEFT;
            tableDatosLocal.WidthPercentage = 100.0f;

            foreach (PdfPCell celda in tableDatosLocal.Rows[0].GetCells())
            {
                celda.BackgroundColor = BaseColor.LIGHT_GRAY;
                celda.HorizontalAlignment = 0;
                celda.Padding = 2;
            }
            foreach (PdfPCell celda in tableDatosLocal.Rows[2].GetCells())
            {
                celda.BackgroundColor = BaseColor.LIGHT_GRAY;
                celda.HorizontalAlignment = 0;
                celda.Padding = 2;
            }

            doc.Add(tableDatosLocal);

            doc.Add(new Paragraph(" ", times));
            doc.Add(new Paragraph(" ", times));

            Chunk datosTipificacion = new Chunk("Mantención", FontFactory.GetFont("ARIAL", 9, iTextSharp.text.Font.BOLD));
            datosTipificacion.SetUnderline(0.1f, -2f);
            doc.Add(datosTipificacion);

            PdfPTable tableDatosTipificacion = new PdfPTable(4);
            float[] widthsDatosTipificacion = new float[] { 25f, 45f, 55f, 55f };
            tableDatosTipificacion.SetWidths(widthsDatosTipificacion);

            string tipoNombre = string.Empty;
            if (tipo == "C")
            {
                tipoNombre = "CORRECTIVA";
            }
            else if (tipo == "CP")
            {
                tipoNombre = "CORRECTIVA PLANIFICADA";
            }
            else if (tipo == "P")
            {
                tipoNombre = "PREVENTIVA";
            }

            tableDatosTipificacion.AddCell(new Paragraph("Tipo :", fontCabecera));
            tableDatosTipificacion.AddCell(new Paragraph("Especialidad :", fontCabecera));
            tableDatosTipificacion.AddCell(new Paragraph(" ", fontCabecera));
            tableDatosTipificacion.AddCell(new Paragraph(" ", fontCabecera));
            tableDatosTipificacion.AddCell(new Paragraph(tipoNombre, times));
            tableDatosTipificacion.AddCell(new Paragraph(area, times));
            tableDatosTipificacion.AddCell(new Paragraph(" ", times));
            tableDatosTipificacion.AddCell(new Paragraph(" ", times));

            if (tipo == "C")
            {
                tableDatosTipificacion.AddCell(new Paragraph("Area :", fontCabecera));
                tableDatosTipificacion.AddCell(new Paragraph("Equipo que presenta falla :", fontCabecera));
                tableDatosTipificacion.AddCell(new Paragraph("Componente :", fontCabecera));
                tableDatosTipificacion.AddCell(new Paragraph("Falla :", fontCabecera));
                tableDatosTipificacion.AddCell(new Paragraph(nivel1, times));
                tableDatosTipificacion.AddCell(new Paragraph(nivel2, times));
                tableDatosTipificacion.AddCell(new Paragraph(nivel3, times));
                tableDatosTipificacion.AddCell(new Paragraph(nivel4, times));
            }
            else if (tipo == "CP")
            {
                tableDatosTipificacion.AddCell(new Paragraph("Area :", fontCabecera));
                tableDatosTipificacion.AddCell(new Paragraph("Equipo que presenta falla :", fontCabecera));
                tableDatosTipificacion.AddCell(new Paragraph("Componente :", fontCabecera));
                tableDatosTipificacion.AddCell(new Paragraph("Falla :", fontCabecera));
                tableDatosTipificacion.AddCell(new Paragraph(nivel1, times));
                tableDatosTipificacion.AddCell(new Paragraph(nivel2, times));
                tableDatosTipificacion.AddCell(new Paragraph(nivel3, times));
                tableDatosTipificacion.AddCell(new Paragraph(nivel4, times));
            }
            else if (tipo == "P")
            {
                tableDatosTipificacion.AddCell(new Paragraph("Area :", fontCabecera));
                tableDatosTipificacion.AddCell(new Paragraph("Equipo a trabajar :", fontCabecera));
                tableDatosTipificacion.AddCell(new Paragraph("Tipo de inspección :", fontCabecera));
                tableDatosTipificacion.AddCell(new Paragraph("Frecuencia :", fontCabecera));
                tableDatosTipificacion.AddCell(new Paragraph(nivel1, times));
                tableDatosTipificacion.AddCell(new Paragraph(nivel2, times));
                tableDatosTipificacion.AddCell(new Paragraph(nivel3, times));
                tableDatosTipificacion.AddCell(new Paragraph(nivel4, times));
            }

            tableDatosTipificacion.HorizontalAlignment = Element.ALIGN_LEFT;
            tableDatosTipificacion.WidthPercentage = 100.0f;

            foreach (PdfPCell celda in tableDatosTipificacion.Rows[0].GetCells())
            {
                celda.BackgroundColor = BaseColor.LIGHT_GRAY;
                celda.HorizontalAlignment = 0;
                celda.Padding = 2;
            }
            foreach (PdfPCell celda in tableDatosTipificacion.Rows[2].GetCells())
            {
                celda.BackgroundColor = BaseColor.LIGHT_GRAY;
                celda.HorizontalAlignment = 0;
                celda.Padding = 2;
            }

            doc.Add(tableDatosTipificacion);
            doc.Add(new Paragraph(" ", times));
            doc.Add(new Paragraph(" ", times));

            Chunk datosObservacionTicket = new Chunk("Descripción general de la SOLPED", FontFactory.GetFont("ARIAL", 9, iTextSharp.text.Font.BOLD));
            datosObservacionTicket.SetUnderline(0.1f, -2f);
            doc.Add(datosObservacionTicket);

            doc.Add(new Paragraph(" ", times));

            PdfPTable tableObs = new PdfPTable(1);
            tableObs.AddCell(new Paragraph("Observacion", fontCabecera));
            tableObs.AddCell(new Paragraph(observacion, times));

            tableObs.HorizontalAlignment = Element.ALIGN_LEFT;
            tableObs.WidthPercentage = 100.0f;

            foreach (PdfPCell celda in tableObs.Rows[0].GetCells())
            {
                celda.BackgroundColor = BaseColor.LIGHT_GRAY;
                celda.HorizontalAlignment = 0;
                celda.Padding = 2;
            }

            doc.Add(tableObs);

            doc.Add(new Paragraph(" ", times));
            doc.Add(new Paragraph(" ", times));

            Chunk datosHistorico = new Chunk("Histórico de la SOLPED", FontFactory.GetFont("ARIAL", 9, iTextSharp.text.Font.BOLD));
            datosHistorico.SetUnderline(0.1f, -2f);
            doc.Add(datosHistorico);


            PdfPTable tableDetalle = new PdfPTable(6);
            tableDetalle.AddCell(new Paragraph("Correlativo", fontCabecera));
            tableDetalle.AddCell(new Paragraph("Fecha", fontCabecera));
            tableDetalle.AddCell(new Paragraph("Usuario Creación", fontCabecera));
            tableDetalle.AddCell(new Paragraph("Usuario Asig", fontCabecera));
            tableDetalle.AddCell(new Paragraph("Estado", fontCabecera));
           
            tableDetalle.AddCell(new Paragraph("Obs", fontCabecera));

            foreach (DataRow item in dtHistorico.Rows)
            {
                tableDetalle.AddCell(new Paragraph(item["CORRELATIVO"].ToString(), times));
                tableDetalle.AddCell(new Paragraph(item["FECHA"].ToString(), times));
                tableDetalle.AddCell(new Paragraph(item["USUARIO"].ToString(), times));
                tableDetalle.AddCell(new Paragraph(item["USUARIO_ASIG"].ToString(), times));
                tableDetalle.AddCell(new Paragraph(item["ESTADO_ATENCION"].ToString(), times));

                tableDetalle.AddCell(new Paragraph(item["OBSERVACION"].ToString(), times));
            }

            float[] widthsDatosDetalle = new float[] { 25f, 30f, 40f, 40f, 40f, 80f };
            tableDetalle.SetWidths(widthsDatosDetalle);

            tableDetalle.HorizontalAlignment = Element.ALIGN_LEFT;
            tableDetalle.WidthPercentage = 100.0f;

            foreach (PdfPCell celda in tableDetalle.Rows[0].GetCells())
            {
                celda.BackgroundColor = BaseColor.LIGHT_GRAY;
                celda.HorizontalAlignment = 1;
                celda.Padding = 2;
            }

            doc.Add(tableDetalle);
            
            doc.Add(new Paragraph(" ", times));
            doc.Close();

            string ruta = "pdfOT/" + nombreArchivoPdf; ;
            return ruta;

        }

        protected void ddlArea_DataBound1(object sender, EventArgs e)
        {
            ddlArea.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Todos", "0"));
        }
        

    }
}