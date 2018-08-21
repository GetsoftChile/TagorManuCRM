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
    public partial class DetalleOT : System.Web.UI.Page
    {
        Datos dal = new Datos();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                lblInfo.Text = "";
                divAlerta.Visible = false;

                ScriptManager scriptManager = ScriptManager.GetCurrent(this.Page);
                scriptManager.RegisterPostBackControl(this.lbtnExportar);

                if (!Page.IsPostBack)
                {
                    string _detalle = Convert.ToString(Request.QueryString["Detalle"]);
                    if (_detalle == "1")
                    {
                        string _estado = Convert.ToString(Request.QueryString["e"]);
                        string _area = Convert.ToString(Request.QueryString["a"]);
                        string _fechaDesde = Convert.ToString(Request.QueryString["fechaDesde"]);
                        string _fechaHasta = Convert.ToString(Request.QueryString["fechaHasta"]);
                        string _Nivel1 = Convert.ToString(Request.QueryString["Nivel1"]);
                        string _idSucursal = Convert.ToString(Request.QueryString["idSucursal"]);
                        string _idZona = Convert.ToString(Request.QueryString["idZona"]);
                        string _idLocal = Convert.ToString(Request.QueryString["idLocal"]);
                        string _idUsuarioAsignado = Convert.ToString(Request.QueryString["idUsuarioAsignado"]);

                        DataTable dt = new DataTable();
                        dt = dal.getBuscarDetalleOt(_idUsuarioAsignado, _fechaDesde, _fechaHasta, _area, _idSucursal, _idZona,
                            _idLocal, _estado, _Nivel1).Tables[0];

                        Session["sessionDtTicketDetalle"] = dt;
                        grvTickets.DataSource = dt;
                        grvTickets.DataBind();
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


        protected void imgFirst_Click(object sender, EventArgs e)
        {
            //buscar();
            if (Session["sessionDtTicketDetalle"] != null)
            {
                grvTickets.DataSource = Session["sessionDtTicketDetalle"];
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
            if (Session["sessionDtTicketDetalle"] != null)
            {
                grvTickets.DataSource = Session["sessionDtTicketDetalle"];
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
            if (Session["sessionDtTicketDetalle"] != null)
            {
                grvTickets.DataSource = Session["sessionDtTicketDetalle"];
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
            if (Session["sessionDtTicketDetalle"] != null)
            {
                grvTickets.DataSource = Session["sessionDtTicketDetalle"];
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
            string perfil = Session["variableIdPerfil"].ToString();

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
                dt = Session["sessionDtTicketDetalle"] as DataTable;
                _lblTotalRegistros.Text = dt.Rows.Count.ToString();
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
        
        protected void lbtnGenerarPdf_Click(object sender, EventArgs e)
        {
            try
            {
                LinkButton btn = (LinkButton)sender;
                GridViewRow row = (GridViewRow)btn.NamingContainer;
                Label _lblIdTicket = (Label)grvTickets.Rows[row.RowIndex].FindControl("lblIdTicket");
                
                BuscarOT pdf = new BuscarOT();
                string ruta = pdf.generaPdf(_lblIdTicket.Text);
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


        protected void lbtnExportar_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = new DataTable();
                dt = Session["sessionDtTicketDetalle"] as DataTable;
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

    }
}