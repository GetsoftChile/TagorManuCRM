using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using iTextSharp.text.pdf;
using iTextSharp.text;
using System.IO;

namespace TagorManuCRM
{
    public partial class IngresoOT : System.Web.UI.Page
    {
        Comun com = new Comun();
        Datos dal = new Datos();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                divAlerta.Visible = false;
                ScriptManager scriptManager = ScriptManager.GetCurrent(this.Page);
                scriptManager.RegisterPostBackControl(this.btnGrabar);

                btnGrabar.Attributes.Add("OnClick", string.Format("this.disabled = true; {0};", ClientScript.GetPostBackEventReference(btnGrabar, null)));

                if (!this.Page.IsPostBack)
                {
                    string idUsuario = Session["variableIdUsuario"].ToString();
                    string idPerfil = Session["variableIdPerfil"].ToString();
                    //Area();
                    com.FillArea(ddlArea);
                    Zona();
                    Local();
                    infoUsuario();
                    buscarTicketPorIdUsuarioCreacion();
                }
            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
                divAlerta.Visible = true;
            }
        }

        void Area()
        {
            ddlArea.DataSource = dal.getBuscarArea();
            ddlArea.DataValueField = "ID_AREA";
            ddlArea.DataTextField = "AREA";
            ddlArea.DataBind();
        }

        void Zona()
        {
            string idUsuario = Session["variableIdUsuario"].ToString();
            ddlZona.DataSource = dal.getBuscarZonaPorIdUsuario(idUsuario);
            ddlZona.DataValueField = "ID_ZONA";
            ddlZona.DataTextField = "ZONA";
            ddlZona.DataBind();
        }

        void Local()
        {
            ddlLocal.DataSource = dal.getBuscarLocalPorZona(ddlZona.SelectedValue);
            ddlLocal.DataValueField = "ID_LOCAL";
            ddlLocal.DataTextField = "LOCAL";
            ddlLocal.DataBind();
        }

        void infoUsuario()
        {
            lblUsuario.Text = Session["variableUsuario"].ToString();
            lblNombreUsuario.Text= Session["variableNomUsuario"].ToString() + " " + Session["variableApeUsuario"].ToString();
            string idLocal = Session["variableIdLocal"].ToString();
            DataTable dt = new DataTable();
            dt = dal.getBuscarLocalPorId(idLocal).Tables[0];
            foreach (DataRow item in dt.Rows)
            {
                lblCodLocal.Text = item["COD_LOCAL"].ToString();
                lblLocal.Text = item["NOMBRE_LOCAL"].ToString();
                lblDireccionLocal.Text = item["DIRECCION"].ToString();
                lblTelefonoLocal.Text = item["TELEFONO"].ToString();

            }
        }

        void buscarTicketPorIdUsuarioCreacion()
        {
            string idLocal = Session["variableIdLocal"].ToString();
            string idUsuarioCreacion = Session["variableIdUsuario"].ToString();
            DataTable dt = new DataTable();
            dt = dal.getBuscarTicketBuscadorParametros(idUsuarioCreacion, null, null, null,null,null,null, null).Tables[0];
            Session["sessionDtTicket"] = dt;
            grvTickets.DataSource = dt;
            grvTickets.DataBind();
        }

        protected void ddlNivel1_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                string idPerfil = Session["variableIdPerfil"].ToString();
                string perfilAtento = string.Empty;
                if (idPerfil == "2")
                {
                    perfilAtento = "1";
                }
                else
                {
                    perfilAtento = null;
                }
                Nivel2();
                ddlNivel3.Items.Clear();
                ddlNivel4.Items.Clear();
            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
                divAlerta.Visible = true;

            }
        }

        protected void ddlNivel2_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                string idPerfil = Session["variableIdPerfil"].ToString();
                string perfilAtento = string.Empty;
                if (idPerfil == "2")
                {
                    perfilAtento = "1";
                }
                else
                {
                    perfilAtento = null;
                }
                Nivel3();
                ddlNivel4.Items.Clear();
                //divTicketSeleccionar.Visible = false;
                //rblTransRecado.Enabled = true;
            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
                divAlerta.Visible = true;

            }
        }

        protected void ddlNivel3_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                string idPerfil = Session["variableIdPerfil"].ToString();
                
                Nivel4();
            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
                divAlerta.Attributes["class"] = "alert alert-danger";
                divAlerta.Visible = true;
            }
        }


        protected void ddlNivel4_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                //DataTable dtDeriva = new DataTable();

                //dtDeriva = dal.getBuscarTipificacionPorIdEstatusIdSubEstatusIdEstatusGestion(ddlNivel1.SelectedValue, ddlNivel2.SelectedValue, ddlNivel3.SelectedValue, ddlNivel4.SelectedValue).Tables[0];
                //string deriva = "";
                //string insistencia = "";
                //string obligatorioCli = string.Empty;
                //foreach (DataRow item in dtDeriva.Rows)
                //{
                //    deriva = item["DERIVA"].ToString();
                //    insistencia = item["INSISTENCIA"].ToString();
                //}

                //if (deriva == "1")
                //{
                //    string comentario = "";
                //    comentario += "Nombre:";
                //    comentario += "\r\n Teléfono:";
                //    comentario += "\r\n Motivo:";
                //    comentario += "\r\n PT:";
                //    comentario += "\r\n Nº de Póliza:";
                //    comentario += "\r\n Datos de la cuenta del pagador:";
                //    comentario += "\r\n Observación:";

                //    //txtComentario.Text = comentario;
                //}
                //else
                //{
                //    //txtComentario.Text = "";
                //}

                
            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
                divAlerta.Attributes["class"] = "alert alert-danger";
                divAlerta.Visible = true;
            }
        }


        protected void ddlNivel1_DataBound(object sender, EventArgs e)
        {
            ddlNivel1.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Seleccione", "0"));
        }

        protected void ddlNivel2_DataBound(object sender, EventArgs e)
        {
            ddlNivel2.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Seleccione", "0"));
        }

        protected void ddlNivel3_DataBound(object sender, EventArgs e)
        {
            ddlNivel3.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Seleccione", "0"));
        }

        protected void ddlNivel4_DataBound(object sender, EventArgs e)
        {
            ddlNivel4.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Seleccione", "0"));
        }

        void Nivel1()
        {
            ddlNivel1.DataSource = dal.getBuscarNivel1(ddlTipoOT.SelectedValue,ddlArea.SelectedValue);
            ddlNivel1.DataValueField = "NIVEL_1";
            ddlNivel1.DataTextField = "NIVEL_1";
            ddlNivel1.DataBind();
        }
        void Nivel2()
        {
            ddlNivel2.DataSource = dal.getBuscarNivel2(ddlTipoOT.SelectedValue, ddlArea.SelectedValue, ddlNivel1.SelectedValue);
            ddlNivel2.DataValueField = "NIVEL_2";
            ddlNivel2.DataTextField = "NIVEL_2";
            ddlNivel2.DataBind();
        }
        void Nivel3()
        {
            ddlNivel3.DataSource = dal.getBuscarNivel3(ddlTipoOT.SelectedValue, ddlArea.SelectedValue, ddlNivel1.SelectedValue, ddlNivel2.SelectedValue);
            ddlNivel3.DataValueField = "NIVEL_3";
            ddlNivel3.DataTextField = "NIVEL_3";
            ddlNivel3.DataBind();
        }
        void Nivel4()
        {
            ddlNivel4.DataSource = dal.getBuscarNivel4(ddlTipoOT.SelectedValue, ddlArea.SelectedValue, ddlNivel1.SelectedValue, ddlNivel2.SelectedValue, ddlNivel3.SelectedValue);
            ddlNivel4.DataValueField = "NIVEL_4";
            ddlNivel4.DataTextField = "NIVEL_4";
            ddlNivel4.DataBind();
        }

        //void nivel1()
        //{
            
        //    ddlNivel1.DataSource = dal.getBuscarNivel1(ddlTipoOT.SelectedValue);
        //    ddlNivel1.DataValueField = "NIVEL_1";
        //    ddlNivel1.DataTextField = "NIVEL_1";
        //    ddlNivel1.DataBind();

        //    ddlNivel2.Items.Clear();
        //    ddlNivel3.Items.Clear();
        //    ddlNivel4.Items.Clear();
        //}

        //void nivel2()
        //{

        //    //ddlNivel2.DataSource = dal.getBuscarSubEstatus(ddlNivel1.SelectedValue);
        //    ddlNivel2.DataSource = dal.getBuscarNivel2(ddlTipoOT.SelectedValue, ddlNivel1.SelectedValue);
        //    ddlNivel2.DataValueField = "NIVEL_2";
        //    ddlNivel2.DataTextField = "NIVEL_2";
        //    ddlNivel2.DataBind();

        //    ddlNivel3.Items.Clear();
        //    ddlNivel4.Items.Clear();
        //}

        //void nivel3()
        //{
        //    //ddlNivel3.DataSource = dal.getNivel3(ddlNivel1.SelectedValue, ddlNivel2.SelectedValue);
        //    ddlNivel3.DataSource = dal.getBuscarNivel3(null, null,null,null, ddlNivel1.SelectedValue, ddlNivel2.SelectedValue);
        //    ddlNivel3.DataValueField = "NIVEL_3";
        //    ddlNivel3.DataTextField = "NIVEL_3";
        //    ddlNivel3.DataBind();

        //    ddlNivel4.Items.Clear();
        //}

        //void nivel4()
        //{
            
        //    //ddlNivel4.DataSource = dal.getNivel4(ddlNivel1.SelectedValue, ddlNivel2.SelectedValue, ddlNivel3.SelectedValue);
        //    ddlNivel4.DataSource = dal.getBuscarNivel4(null, null, null, null, ddlNivel1.SelectedValue, ddlNivel2.SelectedValue, ddlNivel3.SelectedValue);
        //    ddlNivel4.DataValueField = "NIVEL_4";
        //    ddlNivel4.DataTextField = "NIVEL_4";
        //    ddlNivel4.DataBind();
        //}

        

        protected void ddlTipoOT_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                string tipo = ddlTipoOT.SelectedValue;
                if (tipo=="C")
                {
                    lblNivel1.Text = "Area";
                    lblNivel2.Text = "Equipo que presenta falla";
                    lblNivel3.Text = "Componente";
                    lblNivel4.Text = "Falla";

                    divTipificacion.Visible = true;
                    divFechaAgendamiento.Visible = false;
                    txtFechaAgendamiento.Text = string.Empty;
                }
                else if (tipo == "CP")
                {
                    lblNivel1.Text = "Area";
                    lblNivel2.Text = "Equipo que presenta falla";
                    lblNivel3.Text = "Componente";
                    lblNivel4.Text = "Falla";

                    divTipificacion.Visible = true;
                    divFechaAgendamiento.Visible = true;
                    txtFechaAgendamiento.Text = string.Empty;

                }
                else if (tipo=="P")
                {
                    lblNivel1.Text = "Area";
                    lblNivel2.Text = "Equipo a trabajar";
                    lblNivel3.Text = "Tipo de inspección";
                    lblNivel4.Text = "Frecuencia";
                    divFechaAgendamiento.Visible = true;
                    txtFechaAgendamiento.Text = string.Empty;
                    divTipificacion.Visible = true;
                    
                }
                else if (tipo=="0")
                {
                    divTipificacion.Visible = false;
                }

                Nivel1();
            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
                divAlerta.Attributes["class"] = "alert alert-danger";
                divAlerta.Visible = true;
            }
        }
        
        protected void btnGrabar_Click(object sender, EventArgs e)
        {
            try
            {

                if (ddlTipoOT.SelectedValue == "0")
                {
                    lblInfo.Text = "El tipo es obligatorio";
                    divAlerta.Visible = true;
                    return;
                }

                if (ddlArea.SelectedValue == "0")
                {
                    lblInfo.Text = "El area es obligatorio";
                    divAlerta.Visible = true;
                    return;
                }

                if (ddlNivel1.SelectedValue == "0")
                {
                    lblInfo.Text = lblNivel1.Text + " es obligatorio";
                    divAlerta.Visible = true;
                    return;
                }
                if (ddlNivel2.SelectedValue == "0")
                {
                    lblInfo.Text = lblNivel2.Text + " es obligatorio";
                    divAlerta.Visible = true;
                    return;
                }
                if (ddlNivel3.SelectedValue == "0")
                {
                    lblInfo.Text = lblNivel3.Text + " es obligatorio";
                    divAlerta.Visible = true;
                    return;
                }
                if (ddlNivel4.SelectedValue == "0")
                {
                    lblInfo.Text = lblNivel4.Text + " es obligatorio";
                    divAlerta.Visible = true;
                    return;
                }

                string idUsuario = Session["variableIdUsuario"].ToString();
                string idLocal = ddlLocal.SelectedValue;
                string idZona = ddlZona.SelectedValue;
                string idTipificacion = string.Empty;
                string tipo = string.Empty;
                string clase = ddlTipoOT.SelectedValue;
                string idUsuarioAsignado = string.Empty;
                string ruta1 = string.Empty;
                string ruta2 = string.Empty;
                string idArea = ddlArea.SelectedValue;
                
                DataTable dtTipificacion1 = new DataTable();
                dtTipificacion1 = dal.getBuscarTipificacionPorIdEstatusIdSubEstatusIdEstatusGestion(ddlNivel1.SelectedValue, ddlNivel2.SelectedValue, ddlNivel3.SelectedValue, ddlNivel4.SelectedValue).Tables[0];

                foreach (DataRow item in dtTipificacion1.Rows)
                {
                    idTipificacion = item["ID_TIPIFICACION"].ToString();
                    //tipo = item["TIPO"].ToString();
                    //clase = item["CLASE"].ToString();//Es el tipo
                    //idUsuarioAsignado = item["ID_USUARIO_ESC_N1"].ToString();
                    //idArea = item["ID_AREA"].ToString();
                }


                //MUY IMPORTANTE
                string email = string.Empty;
                tipo = ddlTipoOT.SelectedValue;
                if (tipo == "C")//si es correctivo se le asigna al supervisor
                {
                    DataTable dtUsuarios = new DataTable();
                    dtUsuarios = dal.getBuscarUsuarioAsignadoPorIdLocalIdPerfil(idLocal, "5", idArea).Tables[0];

                    if (dtUsuarios.Rows.Count==0)
                    {
                        lblInfo.Text = "No se puede ingresar la SOLPED. <br> Razon: No hay un supervisor asignado al local seleccionado";
                        divAlerta.Visible = true;
                        return;
                    }

                    foreach (DataRow item in dtUsuarios.Rows)
                    {
                        idUsuarioAsignado = item["ID_USUARIO"].ToString();
                        email = item["EMAIL"].ToString();
                        break;
                    }
                }
                else if (tipo == "CP")
                {
                    DataTable dtUsuarios = new DataTable();
                    dtUsuarios = dal.getBuscarUsuarioAsignadoPorIdLocalIdPerfil(idLocal, "3", null).Tables[0];

                    if (dtUsuarios.Rows.Count == 0)
                    {
                        lblInfo.Text = "No se puede ingresar la SOLPED. <br> Razon: No hay un coordinador asignado al local seleccionado";
                        divAlerta.Visible = true;
                        return;
                    }

                    foreach (DataRow item in dtUsuarios.Rows)
                    {
                        idUsuarioAsignado = item["ID_USUARIO"].ToString();
                        email = item["EMAIL"].ToString();
                        break;
                    }

                    if (string.IsNullOrEmpty(txtFechaAgendamiento.Text))
                    {
                        lblInfo.Text = "La fecha de agendamiento es obligatoria cuando es de tipo Correctiva Planificada";
                        divAlerta.Visible = true;
                        return;
                    }
                }
                else if (tipo == "P")//si es preventivo se le asigna al coordinador de tagor
                {
                    DataTable dtUsuarios = new DataTable();
                    dtUsuarios = dal.getBuscarUsuarioAsignadoPorIdLocalIdPerfil(idLocal, "3", null).Tables[0];

                    if (dtUsuarios.Rows.Count == 0)
                    {
                        lblInfo.Text = "No se puede ingresar la SOLPED. <br> Razon: No hay un coordinador asignado al local seleccionado";
                        divAlerta.Visible = true;
                        return;
                    }

                    foreach (DataRow item in dtUsuarios.Rows)
                    {
                        idUsuarioAsignado = item["ID_USUARIO"].ToString();
                        email = item["EMAIL"].ToString();
                        break;
                    }

                    if (string.IsNullOrEmpty(txtFechaAgendamiento.Text))
                    {
                        lblInfo.Text = "La fecha de agendamiento es obligatoria cuando es de tipo Preventiva";
                        divAlerta.Visible = true;
                        return;
                    }
                }
                /////////////////////////////////////////////////

                //ingreso OT
                

                if (ddlTipoOT.SelectedValue == "C")
                {
                    txtFechaAgendamiento.Text = string.Empty;
                }

                //AQUI
                string idSucursal = string.Empty;
                idSucursal = Session["variableIdSucursal"].ToString();

                string ticket = dal.setIngresarOT(idTipificacion, idUsuario, idUsuarioAsignado, "1", txtComentario.Text.Trim(),
                    "D", ddlNivel1.SelectedValue, "1", tipo, idLocal, txtTelefono.Text.Trim(),
                    txtSolicitadoPor.Text.Trim(), idZona, ddlArea.SelectedValue, txtFechaAgendamiento.Text, idSucursal);
                //FIN ingreso

                dal.setIngresarTicketHistorico(ticket, idUsuario, idUsuarioAsignado, "1", 
                    txtComentario.Text, txtFechaAgendamiento.Text);

                if (fuArchivo.HasFile)
                {
                    ruta1 = ticket + "_" + fuArchivo.FileName;
                    fuArchivo.SaveAs(Server.MapPath("ArchivoOT/"+ruta1));
                    dal.setEditarRutaArchivoGestion(Convert.ToInt32(ticket), ruta1);
                }

                if (fuArchivo2.HasFile)
                {
                    ruta2 = ticket + "_" + fuArchivo2.FileName;
                    fuArchivo2.SaveAs(Server.MapPath("ArchivoOT/" + ruta2));
                    dal.setEditarRutaArchivoGestion2(Convert.ToInt32(ticket), ruta2);
                }

                buscarTicketPorIdUsuarioCreacion();

                string bodyResolutor = "Estimado(a) Usuario:<br>";
                bodyResolutor += "Se ha generado la siguiente SOLPED con Nº " + ticket + " para su gestión:";
                bodyResolutor += "<br><br>Observacion: <b>";
                bodyResolutor += txtComentario.Text = "</b>";
                bodyResolutor += "<br>";
                bodyResolutor += "Le agradecemos revisar a la brevedad en el sistema de mantenimiento de Tagor.​";
                bodyResolutor += "http://190.96.2.126/eot/SeguimientoOT.aspx?t=" + ticket;
                bodyResolutor += "<br><br>";
                bodyResolutor += "<table style='width:100%' border='1'><tr><td><img src='http://190.96.2.126/eot/assets/img/logo-tagor.png' width='20%' alt='Firma Logo' /></td>";
                bodyResolutor += "<td>Mantenimiento Tagor <br>Cerro El Plomo 5931, oficina 612, , Las Condes, Santiago, Chile<br>+56 22 762 2572<br>info@tagor.cl</td></tr></table>";

                com.EnviarEmail(email, bodyResolutor.Replace("\r\n", "<br>"), "Nueva OT Nº" + ticket);

                lblInfo.Text ="Se generó el siguiente número de OT " + ticket;
                divAlerta.Attributes["class"] = "alert alert-success";
                divAlerta.Visible = true;

                Response.AddHeader("REFRESH", "4;URL=IngresoOT.aspx");

            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
                divAlerta.Attributes["class"] = "alert alert-danger";
                divAlerta.Visible = true;
            }
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

                if (_lblEstado.Text=="PENDIENTE")
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

        protected void ddlArea_DataBound(object sender, EventArgs e)
        {
            ddlArea.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Seleccione", "0"));
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

            float[] widthsDatosDeudor = new float[] { 50f, 40f, 50f, 70f, 35f, 35f, 25f, 50f };
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


        //public string generaPdf(string idTicket)
        //{
        //    DataTable dt = new DataTable();
        //    dt = dal.getBuscarTicket(idTicket).Tables[0];

        //    string observacion = string.Empty;
        //    string usuarioAsignado = string.Empty;
        //    string usuarioCreacionTicket = string.Empty;
        //    string usuarioNombreAsignado = string.Empty;
        //    string usuarioNombreCreacionTicket = string.Empty;
        //    string nombreSolicitante = string.Empty;
        //    string telefonoSolicitante = string.Empty;
        //    string emailSolicitante = string.Empty;
        //    string estadoTicket = string.Empty;
        //    string tipo = string.Empty;
        //    string area = string.Empty;
        //    string idZona = string.Empty;
        //    string local = string.Empty;

        //    string nivel1 = string.Empty;
        //    string nivel2 = string.Empty;
        //    string nivel3 = string.Empty;
        //    string nivel4 = string.Empty;


        //    string fechaTicket = string.Empty;

        //    foreach (DataRow item in dt.Rows)
        //    {
        //        observacion = item["OBSERVACION"].ToString();
        //        tipo = item["CLASE"].ToString();
        //        idZona = item["ID_ZONA"].ToString();
        //        usuarioNombreAsignado = item["NOMBRE_ASIGNADO"].ToString();
        //        usuarioAsignado = item["USUARIO_ASIGNADO"].ToString();
        //        usuarioCreacionTicket = item["USUARIO_CREACION"].ToString();
        //        usuarioNombreCreacionTicket = item["NOMBRE_CREACION"].ToString();
        //        estadoTicket = item["ESTADO_ATENCION"].ToString();
        //        area = item["AREA"].ToString();
        //        fechaTicket = item["FECHA"].ToString();
        //        nivel1 = item["NIVEL_1"].ToString();
        //        nivel2 = item["NIVEL_2"].ToString();
        //        nivel3 = item["NIVEL_3"].ToString();
        //        nivel4 = item["NIVEL_4"].ToString();
        //        nombreSolicitante = item["SOLICITADO_POR"].ToString();
        //        telefonoSolicitante = item["TELEFONO_ASOCIADO"].ToString();
        //        emailSolicitante = item["EMAIL_SOLICITANTE"].ToString();
        //    }


        //    DataTable dtHistorico = new DataTable();
        //    dtHistorico = dal.getBuscarTicketHistorico(idTicket).Tables[0];
        //    string correlativo = string.Empty;
        //    string fecha = string.Empty;
        //    string usuarioCreacion = string.Empty;
        //    string usuarioAsig = string.Empty;
        //    string estado = string.Empty;
        //    string motivoCierre = string.Empty;
        //    string obs = string.Empty;
        //    string obsCli = string.Empty;

        //    //AQUIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII
        //    string titulo = "SOLPED";
        //    string nombreArchivoPdf = "SOLPED_" + idTicket + ".pdf";
        //    BaseFont bfTimes = BaseFont.CreateFont(BaseFont.HELVETICA, BaseFont.CP1252, false);

        //    Font times = new Font(bfTimes, 7, Font.NORMAL);
        //    Font timesRojo = new Font(bfTimes, 9, Font.BOLD, BaseColor.RED);
        //    Font timesCorrelativo = new Font(bfTimes, 9, Font.BOLD);
        //    Font fontCabecera = new Font(bfTimes, 8, Font.BOLD);
        //    Font fontFirma = new Font(bfTimes, 8, Font.BOLD);

        //    Document doc = new Document(PageSize.A4, 25, 25, 30, 30);
        //    PdfWriter writePdf = PdfWriter.GetInstance(doc, new FileStream(Server.MapPath("pdfOT/" + nombreArchivoPdf), FileMode.Create));
        //    doc.Open();

        //    iTextSharp.text.Image jpg = iTextSharp.text.Image.GetInstance(Server.MapPath("assets/img/logo-tagor.png"));
        //    jpg.ScaleToFit(80, 80);
        //    jpg.Alignment = iTextSharp.text.Image.ALIGN_LEFT;
        //    doc.Add(jpg);

        //    PdfPTable tableNumeroComprobante = new PdfPTable(2);
        //    PdfPCell celdaNumeroComprobante = new PdfPCell(new Paragraph("Nro.SOLPED :", fontCabecera));
        //    //celdaNumeroComprobante.HorizontalAlignment = 2;
        //    PdfPCell celdaNumeroComprobanteFecha = new PdfPCell(new Paragraph("Fecha SOLPED :", fontCabecera));
        //    //celdaNumeroComprobanteFecha.HorizontalAlignment = 2;
        //    tableNumeroComprobante.AddCell(celdaNumeroComprobante);
        //    tableNumeroComprobante.AddCell(new Paragraph(idTicket, times));

        //    tableNumeroComprobante.AddCell(celdaNumeroComprobanteFecha);
        //    tableNumeroComprobante.AddCell(new Paragraph(fechaTicket, times));

        //    tableNumeroComprobante.DefaultCell.Border = Rectangle.NO_BORDER;

        //    tableNumeroComprobante.HorizontalAlignment = Element.ALIGN_RIGHT;
        //    tableNumeroComprobante.WidthPercentage = 25.0f;

        //    foreach (PdfPCell celda in tableNumeroComprobante.Rows[0].GetCells())
        //    {
        //        celda.Border = Rectangle.NO_BORDER;
        //    }

        //    foreach (PdfPCell celda in tableNumeroComprobante.Rows[1].GetCells())
        //    {
        //        celda.Border = Rectangle.NO_BORDER;
        //        //celda.HorizontalAlignment = 2;
        //    }

        //    doc.Add(tableNumeroComprobante);


        //    Chunk tituloTipoExamen = new Chunk(titulo, FontFactory.GetFont("ARIAL", 12, iTextSharp.text.Font.BOLD));
        //    tituloTipoExamen.SetUnderline(0.1f, -2f);

        //    Paragraph par = new Paragraph(tituloTipoExamen);
        //    par.Alignment = Element.ALIGN_CENTER;
        //    doc.Add(par);

        //    //doc.Add(tituloTipoExamen);
        //    doc.Add(new Paragraph(" ", times));

        //    Chunk datosDeudor = new Chunk("Datos Solicitante", FontFactory.GetFont("ARIAL", 9, iTextSharp.text.Font.BOLD));
        //    datosDeudor.SetUnderline(0.1f, -2f);
        //    doc.Add(datosDeudor);

        //    PdfPTable tableDatosDeudor = new PdfPTable(8);

        //    float[] widthsDatosDeudor = new float[] { 50f, 40f, 50f, 70f, 35f, 35f, 25f, 50f };
        //    tableDatosDeudor.SetWidths(widthsDatosDeudor);

        //    PdfPCell cellUsuarioSolicitante = new PdfPCell(new Paragraph("Usuario Solicitante:", fontCabecera));
        //    cellUsuarioSolicitante.BackgroundColor = BaseColor.LIGHT_GRAY;
        //    tableDatosDeudor.AddCell(cellUsuarioSolicitante);
        //    tableDatosDeudor.AddCell(new Paragraph(usuarioCreacionTicket, times));
        //    PdfPCell cellNombreSolicitante = new PdfPCell(new Paragraph("Nombre Solicitante:", fontCabecera));
        //    cellNombreSolicitante.BackgroundColor = BaseColor.LIGHT_GRAY;
        //    tableDatosDeudor.AddCell(cellNombreSolicitante);
        //    tableDatosDeudor.AddCell(new Paragraph(usuarioNombreCreacionTicket, times));

        //    PdfPCell cellTelefono = new PdfPCell(new Paragraph("Teléfono:", fontCabecera));
        //    cellTelefono.BackgroundColor = BaseColor.LIGHT_GRAY;
        //    tableDatosDeudor.AddCell(cellTelefono);
        //    tableDatosDeudor.AddCell(new Paragraph(telefonoSolicitante, times));
        //    PdfPCell cellEmail = new PdfPCell(new Paragraph("Email:", fontCabecera));
        //    cellEmail.BackgroundColor = BaseColor.LIGHT_GRAY;
        //    tableDatosDeudor.AddCell(cellEmail);
        //    tableDatosDeudor.AddCell(new Paragraph(emailSolicitante, times));

        //    PdfPCell cellUsuarioAsignado = new PdfPCell(new Paragraph("Usuario Asignado :", fontCabecera));
        //    cellUsuarioAsignado.BackgroundColor = BaseColor.LIGHT_GRAY;
        //    tableDatosDeudor.AddCell(cellUsuarioAsignado);
        //    tableDatosDeudor.AddCell(new Paragraph(usuarioAsignado, times));
        //    PdfPCell cellNombreAsignado = new PdfPCell(new Paragraph("Nombre Usuario Asignado :", fontCabecera));
        //    cellNombreAsignado.BackgroundColor = BaseColor.LIGHT_GRAY;
        //    tableDatosDeudor.AddCell(cellNombreAsignado);
        //    tableDatosDeudor.AddCell(new Paragraph(usuarioNombreAsignado, times));

        //    PdfPCell cellEstado = new PdfPCell(new Paragraph("Estado :", fontCabecera));
        //    cellEstado.BackgroundColor = BaseColor.LIGHT_GRAY;
        //    tableDatosDeudor.AddCell(cellEstado);

        //    tableDatosDeudor.AddCell(new Paragraph(estadoTicket, times));

        //    PdfPCell cellVacio = new PdfPCell(new Paragraph(" ", fontCabecera));
        //    cellVacio.BackgroundColor = BaseColor.LIGHT_GRAY;
        //    tableDatosDeudor.AddCell(cellVacio);

        //    tableDatosDeudor.AddCell(new Paragraph(" ", times));

        //    tableDatosDeudor.HorizontalAlignment = Element.ALIGN_LEFT;
        //    tableDatosDeudor.WidthPercentage = 100.0f;


        //    //foreach (PdfPCell celda in tableDatosDeudor.Rows[0].GetCells())
        //    //{
        //    //    celda.BackgroundColor = BaseColor.LIGHT_GRAY;
        //    //    celda.HorizontalAlignment = 1;
        //    //    celda.Padding = 2;
        //    //}

        //    doc.Add(tableDatosDeudor);
        //    doc.Add(new Paragraph(" ", times));
        //    doc.Add(new Paragraph(" ", times));

        //    Chunk datosTipificacion = new Chunk("Mantención", FontFactory.GetFont("ARIAL", 9, iTextSharp.text.Font.BOLD));
        //    datosTipificacion.SetUnderline(0.1f, -2f);
        //    doc.Add(datosTipificacion);


        //    PdfPTable tableDatosTipificacion = new PdfPTable(4);
        //    float[] widthsDatosTipificacion = new float[] { 25f, 45f, 55f, 55f };
        //    tableDatosTipificacion.SetWidths(widthsDatosTipificacion);

        //    tableDatosTipificacion.AddCell(new Paragraph("Tipo :", fontCabecera));
        //    tableDatosTipificacion.AddCell(new Paragraph("Area :", fontCabecera));
        //    tableDatosTipificacion.AddCell(new Paragraph(" ", fontCabecera));
        //    tableDatosTipificacion.AddCell(new Paragraph(" ", fontCabecera));
        //    tableDatosTipificacion.AddCell(new Paragraph(tipo, times));
        //    tableDatosTipificacion.AddCell(new Paragraph(area, times));
        //    tableDatosTipificacion.AddCell(new Paragraph(" ", times));
        //    tableDatosTipificacion.AddCell(new Paragraph(" ", times));

        //    if (tipo == "C")
        //    {
        //        tableDatosTipificacion.AddCell(new Paragraph("Area :", fontCabecera));
        //        tableDatosTipificacion.AddCell(new Paragraph("Equipo que presenta falla :", fontCabecera));
        //        tableDatosTipificacion.AddCell(new Paragraph("Componente :", fontCabecera));
        //        tableDatosTipificacion.AddCell(new Paragraph("Falla :", fontCabecera));
        //        tableDatosTipificacion.AddCell(new Paragraph(nivel1, times));
        //        tableDatosTipificacion.AddCell(new Paragraph(nivel2, times));
        //        tableDatosTipificacion.AddCell(new Paragraph(nivel3, times));
        //        tableDatosTipificacion.AddCell(new Paragraph(nivel4, times));
        //    }
        //    else if (tipo == "CP")
        //    {
        //        tableDatosTipificacion.AddCell(new Paragraph("Area :", fontCabecera));
        //        tableDatosTipificacion.AddCell(new Paragraph("Equipo que presenta falla :", fontCabecera));
        //        tableDatosTipificacion.AddCell(new Paragraph("Componente :", fontCabecera));
        //        tableDatosTipificacion.AddCell(new Paragraph("Falla :", fontCabecera));
        //        tableDatosTipificacion.AddCell(new Paragraph(nivel1, times));
        //        tableDatosTipificacion.AddCell(new Paragraph(nivel2, times));
        //        tableDatosTipificacion.AddCell(new Paragraph(nivel3, times));
        //        tableDatosTipificacion.AddCell(new Paragraph(nivel4, times));
        //    }
        //    else if (tipo == "P")
        //    {
        //        tableDatosTipificacion.AddCell(new Paragraph("Area :", fontCabecera));
        //        tableDatosTipificacion.AddCell(new Paragraph("Equipo a trabajar :", fontCabecera));
        //        tableDatosTipificacion.AddCell(new Paragraph("Tipo de inspección :", fontCabecera));
        //        tableDatosTipificacion.AddCell(new Paragraph("Frecuencia :", fontCabecera));
        //        tableDatosTipificacion.AddCell(new Paragraph(nivel1, times));
        //        tableDatosTipificacion.AddCell(new Paragraph(nivel2, times));
        //        tableDatosTipificacion.AddCell(new Paragraph(nivel3, times));
        //        tableDatosTipificacion.AddCell(new Paragraph(nivel4, times));
        //    }

        //    tableDatosTipificacion.HorizontalAlignment = Element.ALIGN_LEFT;
        //    tableDatosTipificacion.WidthPercentage = 100.0f;

        //    foreach (PdfPCell celda in tableDatosTipificacion.Rows[0].GetCells())
        //    {
        //        celda.BackgroundColor = BaseColor.LIGHT_GRAY;
        //        celda.HorizontalAlignment = 0;
        //        celda.Padding = 2;
        //    }

        //    doc.Add(tableDatosTipificacion);
        //    doc.Add(new Paragraph(" ", times));
        //    doc.Add(new Paragraph(" ", times));

        //    Chunk datosObservacionTicket = new Chunk("Descripción general de la SOLPED", FontFactory.GetFont("ARIAL", 9, iTextSharp.text.Font.BOLD));
        //    datosObservacionTicket.SetUnderline(0.1f, -2f);
        //    doc.Add(datosObservacionTicket);

        //    doc.Add(new Paragraph(" ", times));

        //    PdfPTable tableObs = new PdfPTable(1);
        //    tableObs.AddCell(new Paragraph("Observacion", fontCabecera));
        //    tableObs.AddCell(new Paragraph(observacion, times));

        //    tableObs.HorizontalAlignment = Element.ALIGN_LEFT;
        //    tableObs.WidthPercentage = 100.0f;

        //    foreach (PdfPCell celda in tableObs.Rows[0].GetCells())
        //    {
        //        celda.BackgroundColor = BaseColor.LIGHT_GRAY;
        //        celda.HorizontalAlignment = 0;
        //        celda.Padding = 2;
        //    }

        //    doc.Add(tableObs);

        //    doc.Add(new Paragraph(" ", times));
        //    doc.Add(new Paragraph(" ", times));

        //    Chunk datosHistorico = new Chunk("Histórico de la SOLPED", FontFactory.GetFont("ARIAL", 9, iTextSharp.text.Font.BOLD));
        //    datosHistorico.SetUnderline(0.1f, -2f);
        //    doc.Add(datosHistorico);


        //    PdfPTable tableDetalle = new PdfPTable(6);
        //    tableDetalle.AddCell(new Paragraph("Correlativo", fontCabecera));
        //    tableDetalle.AddCell(new Paragraph("Fecha", fontCabecera));
        //    tableDetalle.AddCell(new Paragraph("Usuario Creación", fontCabecera));
        //    tableDetalle.AddCell(new Paragraph("Usuario Asig", fontCabecera));
        //    tableDetalle.AddCell(new Paragraph("Estado", fontCabecera));

        //    tableDetalle.AddCell(new Paragraph("Obs", fontCabecera));

        //    foreach (DataRow item in dtHistorico.Rows)
        //    {
        //        tableDetalle.AddCell(new Paragraph(item["CORRELATIVO"].ToString(), times));
        //        tableDetalle.AddCell(new Paragraph(item["FECHA"].ToString(), times));
        //        tableDetalle.AddCell(new Paragraph(item["USUARIO"].ToString(), times));
        //        tableDetalle.AddCell(new Paragraph(item["USUARIO_ASIG"].ToString(), times));
        //        tableDetalle.AddCell(new Paragraph(item["ESTADO_ATENCION"].ToString(), times));

        //        tableDetalle.AddCell(new Paragraph(item["OBSERVACION"].ToString(), times));
        //    }

        //    float[] widthsDatosDetalle = new float[] { 25f, 30f, 40f, 40f, 40f, 80f };
        //    tableDetalle.SetWidths(widthsDatosDetalle);

        //    tableDetalle.HorizontalAlignment = Element.ALIGN_LEFT;
        //    tableDetalle.WidthPercentage = 100.0f;

        //    foreach (PdfPCell celda in tableDetalle.Rows[0].GetCells())
        //    {
        //        celda.BackgroundColor = BaseColor.LIGHT_GRAY;
        //        celda.HorizontalAlignment = 1;
        //        celda.Padding = 2;
        //    }

        //    doc.Add(tableDetalle);

        //    doc.Add(new Paragraph(" ", times));
        //    doc.Close();

        //    string ruta = "pdfOT/" + nombreArchivoPdf; ;
        //    return ruta;

        //}


        //public string generaPdf(string idTicket)
        //{
        //    DataTable dt = new DataTable();
        //    dt = dal.getBuscarTicket(idTicket).Tables[0];
        //    string rutCliente = "";
        //    string observacion = string.Empty;
        //    string usuarioAsignado = string.Empty;
        //    string estadoTicket = string.Empty;
        //    string nivel1 = string.Empty;
        //    string nivel2 = string.Empty;
        //    string nivel3 = string.Empty;
        //    string nivel4 = string.Empty;
        //    string telefono = string.Empty;
        //    string email = string.Empty;
        //    string nombreCliente = string.Empty;
        //    string fechaTicket = string.Empty;

        //    foreach (DataRow item in dt.Rows)
        //    {
        //        rutCliente = item["RUT_CLIENTE"].ToString();
        //        observacion = item["OBSERVACION"].ToString();

        //        usuarioAsignado = item["USUARIO_ASIGNADO"].ToString();
        //        estadoTicket = item["ESTADO_ATENCION"].ToString();

        //        fechaTicket = item["FECHA"].ToString();

        //        nivel1 = item["NIVEL_1"].ToString();
        //        nivel2 = item["NIVEL_2"].ToString();
        //        nivel3 = item["NIVEL_3"].ToString();
        //        nivel4 = item["NIVEL_4"].ToString();
        //    }

        //    string nombres, paterno, materno, segmentoCliente, fechaCompra, sernac, msj, celular, fijo, local;
        //    int? codError;
        //    string dv = string.Empty;

        //    if (!string.IsNullOrEmpty(rutCliente.Trim()))
        //    {
        //        Comun com = new Comun();
        //        rutCliente = com.formatearRutSinPuntos(rutCliente);
        //    }

        //    String[] arRut = rutCliente.Split('-');
        //    for (int i = 0; i < arRut.Length; i++)
        //    {
        //        rutCliente = arRut[0];
        //        if (arRut.Length > 0)
        //        {
        //            dv = arRut[1];
        //        }
        //    }

        //    //datos.getBuscarCliente(1, Convert.ToInt32(rutCliente), dv, "CRM", out nombres, out paterno, out materno, out segmentoCliente, out email, out celular, out fijo, out fechaCompra, out local, out sernac, out codError, out msj);
        //    //if (nombres == "null")
        //    //{
        //    //    nombres = string.Empty;
        //    //}
        //    //if (paterno == "null")
        //    //{
        //    //    paterno = string.Empty;
        //    //}
        //    //if (materno == "null")
        //    //{
        //    //    materno = string.Empty;
        //    //}
        //    //if (segmentoCliente == "null")
        //    //{
        //    //    segmentoCliente = string.Empty;
        //    //}
        //    //if (email == "null")
        //    //{
        //    //    email = string.Empty;
        //    //}
        //    //if (fechaCompra == "null")
        //    //{
        //    //    fechaCompra = string.Empty;
        //    //}
        //    //if (sernac == "null")
        //    //{
        //    //    sernac = string.Empty;
        //    //}
        //    //if (celular == "null")
        //    //{
        //    //    celular = string.Empty;
        //    //}
        //    //if (fijo == "null")
        //    //{
        //    //    fijo = string.Empty;
        //    //}
        //    //if (local == "null")
        //    //{
        //    //    local = string.Empty;
        //    //}


        //    //nombreCliente = nombres + " " + paterno + " " + materno;
        //    //telefono = celular;
        //    rutCliente = rutCliente + "-" + dv;

        //    DataTable dtHistorico = new DataTable();
        //    dtHistorico = dal.getBuscarTicketHistorico(idTicket).Tables[0];
        //    string correlativo = string.Empty;
        //    string fecha = string.Empty;
        //    string usuarioCreacion = string.Empty;
        //    string usuarioAsig = string.Empty;
        //    string estado = string.Empty;
        //    string motivoCierre = string.Empty;
        //    string obs = string.Empty;
        //    string obsCli = string.Empty;

        //    //AQUIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII
        //    string titulo = "TICKET";
        //    string nombreArchivoPdf = "ticket_" + idTicket + ".pdf";
        //    BaseFont bfTimes = BaseFont.CreateFont(BaseFont.HELVETICA, BaseFont.CP1252, false);

        //    Font times = new Font(bfTimes, 7, Font.NORMAL);
        //    Font timesRojo = new Font(bfTimes, 9, Font.BOLD, BaseColor.RED);
        //    Font timesCorrelativo = new Font(bfTimes, 9, Font.BOLD);
        //    Font fontCabecera = new Font(bfTimes, 8, Font.BOLD);
        //    Font fontFirma = new Font(bfTimes, 8, Font.BOLD);

        //    Document doc = new Document(PageSize.A4, 25, 25, 30, 30);
        //    PdfWriter writePdf = PdfWriter.GetInstance(doc, new FileStream(Server.MapPath("pdfOT/" + nombreArchivoPdf), FileMode.Create));
        //    doc.Open();

        //    iTextSharp.text.Image jpg = iTextSharp.text.Image.GetInstance(Server.MapPath("assets/img/logo-tagor.png"));
        //    jpg.ScaleToFit(80, 80);
        //    jpg.Alignment = iTextSharp.text.Image.ALIGN_LEFT;
        //    doc.Add(jpg);

        //    PdfPTable tableNumeroComprobante = new PdfPTable(2);
        //    PdfPCell celdaNumeroComprobante = new PdfPCell(new Paragraph("Nro.OT :", fontCabecera));
        //    //celdaNumeroComprobante.HorizontalAlignment = 2;
        //    PdfPCell celdaNumeroComprobanteFecha = new PdfPCell(new Paragraph("Fecha OT :", fontCabecera));
        //    //celdaNumeroComprobanteFecha.HorizontalAlignment = 2;
        //    tableNumeroComprobante.AddCell(celdaNumeroComprobante);
        //    tableNumeroComprobante.AddCell(new Paragraph(idTicket, times));

        //    tableNumeroComprobante.AddCell(celdaNumeroComprobanteFecha);
        //    tableNumeroComprobante.AddCell(new Paragraph(fechaTicket, times));

        //    tableNumeroComprobante.DefaultCell.Border = Rectangle.NO_BORDER;

        //    tableNumeroComprobante.HorizontalAlignment = Element.ALIGN_RIGHT;
        //    tableNumeroComprobante.WidthPercentage = 25.0f;

        //    foreach (PdfPCell celda in tableNumeroComprobante.Rows[0].GetCells())
        //    {
        //        celda.Border = Rectangle.NO_BORDER;
        //    }

        //    foreach (PdfPCell celda in tableNumeroComprobante.Rows[1].GetCells())
        //    {
        //        celda.Border = Rectangle.NO_BORDER;
        //        //celda.HorizontalAlignment = 2;
        //    }

        //    doc.Add(tableNumeroComprobante);


        //    Chunk tituloTipoExamen = new Chunk(titulo, FontFactory.GetFont("ARIAL", 12, iTextSharp.text.Font.BOLD));
        //    tituloTipoExamen.SetUnderline(0.1f, -2f);

        //    Paragraph par = new Paragraph(tituloTipoExamen);
        //    par.Alignment = Element.ALIGN_CENTER;
        //    doc.Add(par);

        //    //doc.Add(tituloTipoExamen);
        //    doc.Add(new Paragraph(" ", times));

        //    Chunk datosDeudor = new Chunk("Datos Solicitante", FontFactory.GetFont("ARIAL", 9, iTextSharp.text.Font.BOLD));
        //    datosDeudor.SetUnderline(0.1f, -2f);
        //    doc.Add(datosDeudor);

        //    PdfPTable tableDatosDeudor = new PdfPTable(6);

        //    float[] widthsDatosDeudor = new float[] { 35f, 85f, 50f, 55f, 35f, 35f };
        //    tableDatosDeudor.SetWidths(widthsDatosDeudor);

        //    tableDatosDeudor.AddCell(new Paragraph("Id :", fontCabecera));
        //    tableDatosDeudor.AddCell(new Paragraph(rutCliente, times));
        //    tableDatosDeudor.AddCell(new Paragraph("Nombre :", fontCabecera));
        //    tableDatosDeudor.AddCell(new Paragraph(nombreCliente, times));

        //    tableDatosDeudor.AddCell(new Paragraph("Teléfono :", fontCabecera));
        //    tableDatosDeudor.AddCell(new Paragraph(telefono, times));
        //    tableDatosDeudor.AddCell(new Paragraph("Email :", fontCabecera));
        //    tableDatosDeudor.AddCell(new Paragraph(email, times));

        //    tableDatosDeudor.AddCell(new Paragraph("Usuario Asignado :", fontCabecera));
        //    tableDatosDeudor.AddCell(new Paragraph(usuarioAsignado, times));
        //    tableDatosDeudor.AddCell(new Paragraph("Estado :", fontCabecera));
        //    tableDatosDeudor.AddCell(new Paragraph(estadoTicket, times));

        //    tableDatosDeudor.HorizontalAlignment = Element.ALIGN_LEFT;
        //    tableDatosDeudor.WidthPercentage = 100.0f;

        //    doc.Add(tableDatosDeudor);
        //    doc.Add(new Paragraph(" ", times));
        //    doc.Add(new Paragraph(" ", times));

        //    Chunk datosTipificacion = new Chunk("Tipificación", FontFactory.GetFont("ARIAL", 9, iTextSharp.text.Font.BOLD));
        //    datosTipificacion.SetUnderline(0.1f, -2f);
        //    doc.Add(datosTipificacion);


        //    PdfPTable tableDatosTipificacion = new PdfPTable(4);
        //    float[] widthsDatosTipificacion = new float[] { 25f, 45f, 55f, 55f };
        //    tableDatosTipificacion.SetWidths(widthsDatosTipificacion);

        //    tableDatosTipificacion.AddCell(new Paragraph("Tipo :", fontCabecera));
        //    tableDatosTipificacion.AddCell(new Paragraph("Gestión :", fontCabecera));
        //    tableDatosTipificacion.AddCell(new Paragraph("Categoría de la gestión :", fontCabecera));
        //    tableDatosTipificacion.AddCell(new Paragraph("Detalle de la categoría :", fontCabecera));
        //    tableDatosTipificacion.AddCell(new Paragraph(nivel1, times));
        //    tableDatosTipificacion.AddCell(new Paragraph(nivel2, times));
        //    tableDatosTipificacion.AddCell(new Paragraph(nivel3, times));
        //    tableDatosTipificacion.AddCell(new Paragraph(nivel4, times));

        //    tableDatosTipificacion.HorizontalAlignment = Element.ALIGN_LEFT;
        //    tableDatosTipificacion.WidthPercentage = 100.0f;

        //    foreach (PdfPCell celda in tableDatosTipificacion.Rows[0].GetCells())
        //    {
        //        celda.BackgroundColor = BaseColor.LIGHT_GRAY;
        //        celda.HorizontalAlignment = 0;
        //        celda.Padding = 2;
        //    }

        //    doc.Add(tableDatosTipificacion);
        //    doc.Add(new Paragraph(" ", times));
        //    doc.Add(new Paragraph(" ", times));

        //    Chunk datosObservacionTicket = new Chunk("Descripción general de la OT", FontFactory.GetFont("ARIAL", 9, iTextSharp.text.Font.BOLD));
        //    datosObservacionTicket.SetUnderline(0.1f, -2f);
        //    doc.Add(datosObservacionTicket);

        //    doc.Add(new Paragraph(" ", times));

        //    PdfPTable tableObs = new PdfPTable(1);
        //    tableObs.AddCell(new Paragraph("Observacion", fontCabecera));
        //    tableObs.AddCell(new Paragraph(observacion, times));

        //    tableObs.HorizontalAlignment = Element.ALIGN_LEFT;
        //    tableObs.WidthPercentage = 100.0f;

        //    foreach (PdfPCell celda in tableObs.Rows[0].GetCells())
        //    {
        //        celda.BackgroundColor = BaseColor.LIGHT_GRAY;
        //        celda.HorizontalAlignment = 0;
        //        celda.Padding = 2;
        //    }

        //    doc.Add(tableObs);

        //    doc.Add(new Paragraph(" ", times));
        //    doc.Add(new Paragraph(" ", times));

        //    Chunk datosHistorico = new Chunk("Histórico de la OT", FontFactory.GetFont("ARIAL", 9, iTextSharp.text.Font.BOLD));
        //    datosHistorico.SetUnderline(0.1f, -2f);
        //    doc.Add(datosHistorico);


        //    PdfPTable tableDetalle = new PdfPTable(7);
        //    tableDetalle.AddCell(new Paragraph("Correlativo", fontCabecera));
        //    tableDetalle.AddCell(new Paragraph("Fecha", fontCabecera));
        //    tableDetalle.AddCell(new Paragraph("Usuario Creación", fontCabecera));
        //    tableDetalle.AddCell(new Paragraph("Usuario Asig", fontCabecera));
        //    tableDetalle.AddCell(new Paragraph("Estado", fontCabecera));
        //    tableDetalle.AddCell(new Paragraph("Motivo Cierre", fontCabecera));
        //    tableDetalle.AddCell(new Paragraph("Obs", fontCabecera));

        //    foreach (DataRow item in dtHistorico.Rows)
        //    {
        //        tableDetalle.AddCell(new Paragraph(item["CORRELATIVO"].ToString(), times));
        //        tableDetalle.AddCell(new Paragraph(item["FECHA"].ToString(), times));
        //        tableDetalle.AddCell(new Paragraph(item["USUARIO"].ToString(), times));
        //        tableDetalle.AddCell(new Paragraph(item["USUARIO_ASIG"].ToString(), times));
        //        tableDetalle.AddCell(new Paragraph(item["ESTADO_ATENCION"].ToString(), times));
        //        tableDetalle.AddCell(new Paragraph(item["NOM_MOTIVO_CIERRE"].ToString(), times));
        //        tableDetalle.AddCell(new Paragraph(item["OBSERVACION"].ToString(), times));
        //    }

        //    float[] widthsDatosDetalle = new float[] { 25f, 50f, 50f, 50f, 50f, 20f, 60f };
        //    tableDetalle.SetWidths(widthsDatosDetalle);

        //    tableDetalle.HorizontalAlignment = Element.ALIGN_LEFT;
        //    tableDetalle.WidthPercentage = 100.0f;

        //    foreach (PdfPCell celda in tableDetalle.Rows[0].GetCells())
        //    {
        //        celda.BackgroundColor = BaseColor.LIGHT_GRAY;
        //        celda.HorizontalAlignment = 1;
        //        celda.Padding = 2;
        //    }

        //    doc.Add(tableDetalle);

        //    //foreach (DataRow item in dtHistorico.Rows)
        //    //{
        //    //    correlativo = item["CORRELATIVO"].ToString();
        //    //    fecha = item["FECHA"].ToString();
        //    //    usuarioCreacion = item["USUARIO"].ToString();
        //    //    usuarioAsig = item["USUARIO_ASIG"].ToString();
        //    //    estado = item["ESTADO_ATENCION"].ToString();
        //    //    motivoCierre = item["NOM_MOTIVO_CIERRE"].ToString();
        //    //    obs = item["OBSERVACION"].ToString();
        //    //    obsCli = item["OBSERVACION_CLIENTE"].ToString();
        //    //}
        //    doc.Add(new Paragraph(" ", times));
        //    doc.Close();

        //    string ruta = "pdfOT/" + nombreArchivoPdf; ;
        //    return ruta;

        //}


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

        protected void ddlArea_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                Nivel1();
                Nivel2();
                Nivel3();
                Nivel4();
            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
                divAlerta.Attributes["class"] = "alert alert-danger";
                divAlerta.Visible = true;
            }
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

        protected void ddlLocal_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                //DataTable dt = new DataTable();
                //dt = dal.getBuscarLocalPorId(ddlLocal.SelectedValue).Tables[0];
                //foreach (DataRow item in dt.Rows)
                //{
                //    lblCodLocal.Text = item["COD_LOCAL"].ToString();
                //    lblDireccionLocal.Text = item["COD_LOCAL"].ToString();
                //}
                //divLocal.Visible = true;

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