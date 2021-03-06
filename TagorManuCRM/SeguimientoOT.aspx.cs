﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iTextSharp.text;
using iTextSharp.text.pdf;
using DAL;
using System.Data;
using System.Net.Mail;
using System.IO;
using System.Drawing;
using System.Drawing.Drawing2D;

namespace TagorManuCRM
{
    public partial class SeguimientoOT : System.Web.UI.Page
    {
        Datos dal = new Datos();
        Comun com = new Comun();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                ScriptManager scriptManager = ScriptManager.GetCurrent(this.Page);
                scriptManager.RegisterPostBackControl(this.btnGrabarGestion);
                btnGrabarGestion.Attributes.Add("OnClick", string.Format("this.disabled = true; {0};", ClientScript.GetPostBackEventReference(btnGrabarGestion, null)));
                
                divAlerta.Visible = false;
                lblInfo.Text = "";

                if (!this.Page.IsPostBack)
                {
                    buscarEstado();
                    //area();
                    string perfil = Session["variableIdPerfil"].ToString();

                    if (perfil == "1")
                    {
                        txtObservacion.Enabled = true;
                    }
                    else
                    {
                        txtObservacion.Enabled = false;
                    }

                    string _numeroTicket = Convert.ToString(Request.QueryString["t"]);
                    if (_numeroTicket == null)
                    {
                        divPanelHistoricoCaso.Visible = false;
                    }
                    else
                    {
                        divPanelHistoricoCaso.Visible = true;
                        buscarCaso(_numeroTicket);
                        hfNumeroTicket.Value = _numeroTicket;
                    }

                    string usuario = Session["variableUsuario"].ToString();
                    string usuarioAsignado = lblUsuarioAsig.Text;

                    if (usuario == usuarioAsignado)
                    {
                        divIngresoGestion.Visible = true;
                    }
                    else
                    {
                        if (perfil == "1" || perfil == "5" || perfil == "3")
                        {
                            divIngresoGestion.Visible = true;
                        }
                        else
                        {
                            divIngresoGestion.Visible = false;
                        }
                    }

                    if (ddlEstado.SelectedValue == "4")
                    {
                        divFechaAgendamiento.Visible = true;
                        txtFechaAgendamiento.Visible = true;
                        txtFechaAgendamiento.Enabled = true;
                        divObservacionCliente.Visible = true;
                        txtObservacionCliente.Visible = true;
                    }
                    //esto es para inicializar con esta regla, ya que siempre el estado es igual al ultimo ingreso
                    //entonces si llega a tener un cambio de estado hay que verlo en el evento del drpdownlist donde cambia estado
                    //entonces si cambia de estado  el atributo del boton btnGrabarGestion cambia a nulo
                    //btnGrabarGestion.OnClientClick = "return confirm(' La SOLPED ya se encuentra en estado " + lblEstadoTicket.Text + ", ¿Está seguro de ingresar el ticket nuevamente con estado " + ddlEstado.SelectedItem.ToString() + "?');";
                }
            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
                divAlerta.Visible = true;
            }
        }
        

        protected void ddlEstado_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (lblEstadoTicket.Text == ddlEstado.SelectedItem.ToString())
                {
                    //btnGrabarGestion.OnClientClick = "return confirm(' El ticket ya se encuentra en estado " + lblEstadoTicket.Text + ", ¿Está seguro de ingresar el ticket nuevamente con estado " + ddlEstado.SelectedItem.ToString() + "?');";
                }
                else
                {
                    btnGrabarGestion.OnClientClick = null;
                }

                if (ddlEstado.SelectedValue == "4")
                {
                    divFechaAgendamiento.Visible = true;
                    txtFechaAgendamiento.Visible = true;
                    txtFechaAgendamiento.Enabled = true;
                    divObservacionCliente.Visible = true;
                    divOT.Visible = false;
                }
                else if (ddlEstado.SelectedValue == "3")
                {
                    divFechaAgendamiento.Visible = false;
                    txtFechaAgendamiento.Visible = false;
                    txtFechaAgendamiento.Enabled = false;
                    divObservacionCliente.Visible = true;
                    divOT.Visible = true;
                }
                else
                {
                    divObservacionCliente.Visible = false;
                    divFechaAgendamiento.Visible = false;
                    txtFechaAgendamiento.Visible = false;
                    txtFechaAgendamiento.Enabled = false;
                    txtFechaAgendamiento.Text = string.Empty;
                    txtObservacionCliente.Text = string.Empty;
                    divOT.Visible = false;
                }

            }
            catch (Exception ex)
            {
                lblInfo.Text = "Error: " + ex.Message;
                divAlerta.Visible = true;
            }
        }
        

        protected void ddlArea_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                //usuarioDerivar();
            }
            catch (Exception ex)
            {
                lblInfo.Text = "Error: " + ex.Message;
                divAlerta.Visible = true;
            }
        }
        

        void buscarCaso(string numeroTicket)
        {
            DataTable dt = new DataTable();
            dt = dal.getBuscarTicket(numeroTicket).Tables[0];
     
            string idTicket = string.Empty;
            string tipo = string.Empty;
            string idLocal = string.Empty;
            string idArea = string.Empty;
            foreach (DataRow item in dt.Rows)
            {
                lblIdTicket.Text = "SOLPED: " + item["ID_ATENCION"].ToString();
                idTicket = item["ID_ATENCION"].ToString();
                
                idArea = item["ID_AREA"].ToString();
                lblIdArea.Text = idArea;
                txtObservacion.Text = item["OBSERVACION"].ToString();
                lblNombreCliente.Text = item["SOLICITADO_POR"].ToString();
                lblTelefonoCliente.Text = item["TELEFONO_ASOCIADO"].ToString();
                lblEmailCliente.Text = item["EMAIL"].ToString();
                lblUsuarioAsig.Text = item["USUARIO_ASIGNADO"].ToString();
                
                lblEstadoTicket.Text = item["ESTADO_ATENCION"].ToString();
                if (lblEstadoTicket.Text=="PENDIENTE")
                {
                    lblEstadoTicket.CssClass = "label label-danger";
                }
                else if (lblEstadoTicket.Text == "CERRADO")
                {
                    lblEstadoTicket.CssClass = "label label-success";
                }
                lblIdEstadoTicket.Text = item["ID_ESTADO_ATENCION"].ToString();
                hfIdTipificacion.Value = item["ID_TIPIFICACION"].ToString();
                idLocal= item["LOCAL"].ToString();
                lblIdLocal.Text = idLocal;
                DataTable dtLocal = new DataTable();
                dtLocal = dal.getBuscarLocalPorId(idLocal).Tables[0];
                string idZona = string.Empty;
                foreach (DataRow itemLocal in dtLocal.Rows)
                {

                    lblCodLocal.Text = itemLocal["COD_LOCAL"].ToString();
                    
                    lblNombreLocal.Text = itemLocal["NOMBRE_LOCAL"].ToString();
                    lblComunaLocal.Text = itemLocal["COMUNA"].ToString();
                    lblRegionLocal.Text = itemLocal["REGION"].ToString();
                    lblDireccionLocal.Text = itemLocal["DIRECCION"].ToString();
                    lblTelefonoLocal.Text = itemLocal["TELEFONO"].ToString();
                    lblIdZona.Text = itemLocal["ID_ZONA"].ToString();
                }
                tipo = item["CLASE"].ToString();
                if (tipo == "C" || tipo == "CP")
                {
                    lblNombreNivel1.Text = "Area";
                    lblNombreNivel2.Text = "Equipo que presenta falla";
                    lblNombreNivel3.Text = "Componente";
                    lblNombreNivel4.Text = "Falla";

                    if (tipo=="C")
                    {
                        lblTipo.Text = "Correctiva";
                     
                    }
                    else if (tipo == "CP")
                    {
                        lblTipo.Text = "Correctiva Planificada";
                    }
                    
                }
                else if (tipo == "P")
                {
                    lblNombreNivel1.Text = "Area";
                    lblNombreNivel2.Text = "Equipo a trabajar";
                    lblNombreNivel3.Text = "Tipo de inspección";
                    lblNombreNivel4.Text = "Falla";

                    lblTipo.Text = "Preventiva";
                    
                }
                lblArea.Text = item["AREA"].ToString();
                string perfil = Session["variableIdPerfil"].ToString();
                lblNivel1.Text = item["NIVEL_1"].ToString();
                lblNivel2.Text = item["NIVEL_2"].ToString();
                lblNivel3.Text = item["NIVEL_3"].ToString();
                lblNivel4.Text = item["NIVEL_4"].ToString();

                if (item["RUTA_ARCHIVO"].ToString() == string.Empty)
                {
                    ibtnArchivo.Visible = false;
                }
                else
                {
                    ibtnArchivo.Visible = true;
                }

                lblRutaArchivo.Text = "ArchivoOT/"+item["RUTA_ARCHIVO"].ToString();
                hfIdUsuarioCreacion.Value = item["ID_USUARIO_CREACION"].ToString();

                foreach (DataRow row in dal.getBuscarUsuarioPorId(hfIdUsuarioCreacion.Value).Tables[0].Rows)
                {
                    lblUsuarioCreacion.Text = row["USUARIO"].ToString() + " / " + row["NOMBRE"].ToString();
                }
            }
            
            DataTable dtHistorico = new DataTable();
            dtHistorico = dal.getBuscarTicketHistorico(numeroTicket).Tables[0];
       
            string idUsuarioAsignado = string.Empty;
            foreach (DataRow item in dtHistorico.Rows)
            {
                ddlEstado.SelectedValue = item["ID_ESTADO_ATENCION"].ToString();
                idUsuarioAsignado = item["ID_USUARIO_ASIG"].ToString();
            }
            usuarioDerivar(idArea);
            ddlDerivar.SelectedValue = idUsuarioAsignado;

            grvGestiones.DataSource = dtHistorico;
            grvGestiones.DataBind();

            //mostrar estado detenido dependiendo la tipificacion
            //DataTable dtTip = new DataTable();
            //dtTip = dal.getBuscarTipificacionPorId(hfIdTipificacion.Value).Tables[0];
            //foreach (DataRow item in dtTip.Rows)
            //{
            //    if (item["DETENIDO"].ToString() != "1")
            //    {
            //        System.Web.UI.WebControls.ListItem removeItem = ddlEstado.Items.FindByValue("2");
            //        ddlEstado.Items.Remove(removeItem);
            //    }
            //    break;
            //}
        }

        protected void paginacion_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label _lblArchivo1 = (Label)e.Row.FindControl("lblArchivo1");
                Label _lblArchivo2 = (Label)e.Row.FindControl("lblArchivo2");
                Label _lblArchivoOT = (Label)e.Row.FindControl("lblArchivoOT");

                ImageButton _ibtnArchivo1 = (ImageButton)e.Row.FindControl("ibtnArchivo1");
                ImageButton _ibtnArchivo2 = (ImageButton)e.Row.FindControl("ibtnArchivo2");
                ImageButton _ibtnArchivoOT = (ImageButton)e.Row.FindControl("ibtnArchivoOT");

                if (string.IsNullOrEmpty(_lblArchivo1.Text) == true)
                {
                    _ibtnArchivo1.Visible = false;
                }
                else
                {
                    _ibtnArchivo1.Visible = true;
                }

                if (string.IsNullOrEmpty(_lblArchivo2.Text) == true)
                {
                    _ibtnArchivo2.Visible = false;
                }
                else
                {
                    _ibtnArchivo2.Visible = true;
                }

                if (string.IsNullOrEmpty(_lblArchivoOT.Text) == true)
                {
                    _ibtnArchivoOT.Visible = false;
                }
                else
                {
                    _ibtnArchivoOT.Visible = true;
                }

                Label _lblEstado = (Label)e.Row.FindControl("lblEstado");

                if (_lblEstado.Text == "PENDIENTE")
                {
                    _lblEstado.CssClass = "label label-danger";
                }
                else if (_lblEstado.Text == "CERRADO")
                {
                    _lblEstado.CssClass = "label label-success";
                }
                else if (_lblEstado.Text == "PROGRAMADO")
                {
                    _lblEstado.CssClass = "label label-warning";
                }
                else if (_lblEstado.Text == "EN PROCESO")
                {
                    _lblEstado.CssClass = "label label-info";
                }
            }
        }

        protected void ibtnArchivo_Click(object sender, EventArgs e)
        {
            try
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), UniqueID, "window.open('" + lblRutaArchivo.Text + "','_blank');", true);
            }
            catch (Exception ex)
            {
                lblInfo.Text = "Error: " + ex.Message;
                divAlerta.Visible = true;
            }
        }

        protected void ibtnArchivo1_Click(object sender, EventArgs e)
        {
            try
            {
                ImageButton img = (ImageButton)sender;
                GridViewRow row = (GridViewRow)img.NamingContainer;
                Label _lblArchivo1 = (Label)grvGestiones.Rows[row.RowIndex].FindControl("lblArchivo1");

                ScriptManager.RegisterStartupScript(this, this.GetType(), UniqueID, "window.open('" + _lblArchivo1.Text + "','_blank');", true);
            }
            catch (Exception ex)
            {
                lblInfo.Text = "Error: " + ex.Message;
                divAlerta.Visible = true;
            }
        }

        protected void ibtnArchivo2_Click(object sender, EventArgs e)
        {
            try
            {
                ImageButton img = (ImageButton)sender;
                GridViewRow row = (GridViewRow)img.NamingContainer;
                Label _lblArchivo2 = (Label)grvGestiones.Rows[row.RowIndex].FindControl("lblArchivo2");

                ScriptManager.RegisterStartupScript(this, this.GetType(), UniqueID, "window.open('" + _lblArchivo2.Text + "','_blank');", true);
            }
            catch (Exception ex)
            {
                lblInfo.Text = "Error: " + ex.Message;
                divAlerta.Visible = true;
            }
        }

        //llenar los Ddl
        void buscarEstado()
        {
            ddlEstado.DataSource = dal.getBuscarEstadoAtencion();
            ddlEstado.DataTextField = "ESTADO_ATENCION";
            ddlEstado.DataValueField = "ID_ESTADO_ATENCION";
            ddlEstado.DataBind();
        }
        void usuarioDerivar(string idArea)
        {
            
            string misZonas = lblIdZona.Text;
            string activo = "1";
            string perfil = Session["variableIdPerfil"].ToString();
            string idUsuario = Session["variableIdUsuario"].ToString();

            //foreach (DataRow item in dal.getBuscarZonaPorIdUsuario(idUsuario).Tables[0].Rows)
            //{
            //    misZonas += item["ID_ZONA"].ToString() + ",";
            //}

            //if (misZonas != string.Empty)
            //{
            //    misZonas = misZonas.TrimEnd(',');
            //}

            //ddlDerivar.DataSource = dal.getBuscarUsuarioPorIdArea(idArea);
            ddlDerivar.DataSource= dal.getBuscarUsuarioPorIdZonas(misZonas, activo);
            ddlDerivar.DataValueField = "ID_USUARIO";
            ddlDerivar.DataTextField = "NOMBRE";
            ddlDerivar.DataBind();

        }

        //Para los DDL Opciones por defecto.
        protected void ddlEstado_DataBound(object sender, EventArgs e)
        {
            ddlEstado.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Seleccione", "0"));
        }
        

        protected void ddlDerivar_DataBound(object sender, EventArgs e)
        {
            ddlDerivar.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Seleccione", "0"));
        }

        protected void btnGrabarGestion_Click(object sender, EventArgs e)
        {
            try
            {
                string numeroTicket = hfNumeroTicket.Value;
                string usuario = Session["variableIdUsuario"].ToString();
                int idPerfil = Convert.ToInt32(Session["variableIdPerfil"]);

                if (ddlEstado.SelectedValue == "0" || ddlDerivar.SelectedValue == "0" || txtObservacionGestion.Text == string.Empty)
                {
                    lblInfo.Text = "Los campos ESTADO, DERIBAR y OBSERVACIÓN deben completarse para crear la gestión";
                    divAlerta.Attributes["class"] = "alert alert-warning";
                    divAlerta.Visible = true;
                    return;
                }


                if (idPerfil==2)
                {
                    if (ddlEstado.SelectedValue=="4")
                    {
                        lblInfo.Text = "Estimado, solo los supervisores pueden programar una mantención, favor proceder a seleccionar el estado EN PROCESO";
                        divAlerta.Attributes["class"] = "alert alert-warning";
                        divAlerta.Visible = true;
                        return;
                    }
                }

                if (lblIdEstadoTicket.Text == "3")
                {
                    if (ddlEstado.SelectedValue=="3")
                    {
                        lblInfo.Text = "La SOLPED ya se encuentra en estado CERRADO, no puede volver a cerrarla";
                        divAlerta.Attributes["class"] = "alert alert-warning";
                        divAlerta.Visible = true;
                        return;
                    }
                }

                


                if (ddlEstado.SelectedValue == "4")
                {
                    if (txtFechaAgendamiento.Text == string.Empty)
                    {
                        lblInfo.Text = "";
                        divAlerta.Attributes["class"] = "alert alert-warning";
                        divAlerta.Visible = true;
                        return;
                    }
                }

                if (ddlEstado.SelectedValue=="3")
                {
                    if (lblIdEstadoTicket.Text != "2")
                    {
                        lblInfo.Text = "La SOLPED no se puede cerrar si no hay una gestion EN PROCESO.";
                        divAlerta.Attributes["class"] = "alert alert-warning";
                        divAlerta.Visible = true;
                        return;
                    }

                    if (!fuOrdenTrabajo.HasFile)
                    {
                        lblInfo.Text = "Favor ingresar la fotografia de la OT";
                        divAlerta.Attributes["class"] = "alert alert-warning";
                        divAlerta.Visible = true;
                        return;
                    }

                    if (string.IsNullOrEmpty(txtObservacionCliente.Text))
                    {
                        lblInfo.Text = "Favor ingresar la observacion al cliente.";
                        divAlerta.Attributes["class"] = "alert alert-warning";
                        divAlerta.Visible = true;
                        return;
                    }

                    string extension = System.IO.Path.GetExtension(fuOrdenTrabajo.FileName.ToLower());

                    if (extension != ".jpg" && extension != ".png" && extension != ".gif" && extension != ".jpeg")
                    {
                        Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "Alert", "alert('Porfavor seleccionar una imagen/fotografia para OT .jpg, .jpeg, .png, .gif!')", true);
                        return;
                    }
                }

                //if (ddlEstado.SelectedValue == lblIdEstadoTicket.Text)
                //{
                //    //El ticket ya se encuentra en estado PENDIENTE, Está seguro de ingresar el ticket nuevamente con estado PENDIENTE
                //    lblInfo.Text = "La OT ya se encuentra en estado " + lblEstadoTicket.Text + ", Está seguro de ingresar el ticket nuevamente con estado " + lblEstadoTicket.Text;
                //    divAlerta.Attributes["class"] = "alert alert-warning";
                //    divAlerta.Visible = true;
                //}
                
                string idUsuarioAsig = ddlDerivar.SelectedValue;
                string idUsuarioCreacion = hfIdUsuarioCreacion.Value;
                
                string correlativo = string.Empty;
                string fechaAgendamiento = string.Empty;
                fechaAgendamiento = txtFechaAgendamiento.Text.Trim();
                if (fechaAgendamiento==string.Empty)
                {
                    fechaAgendamiento = null;
                }
                string obsCliente = txtObservacionCliente.Text.Trim();
                if (string.IsNullOrEmpty(obsCliente))
                {
                    obsCliente = null;
                }

                correlativo = dal.setIngresarTicketHistorico(numeroTicket, usuario, idUsuarioAsig, ddlEstado.SelectedValue, txtObservacionGestion.Text, fechaAgendamiento, obsCliente);
                dal.setEditarTicket(numeroTicket, ddlEstado.SelectedValue, idUsuarioAsig, fechaAgendamiento, null);
                dal.setEditarGestionPorId(numeroTicket, txtObservacion.Text);

                if (ddlDerivar.SelectedValue != "0")
                {
                    string idEmpleado = ddlDerivar.SelectedValue;
                    DataTable dtEmpleado = new DataTable();
                    dtEmpleado = dal.getBuscarUsuarioPorId(idEmpleado).Tables[0];

                    string email = string.Empty;
                    foreach (DataRow item in dtEmpleado.Rows)
                    {
                        email = item["EMAIL"].ToString();
                    }
                }

                //dos por seguimiento...
                if (fuArchivo1.HasFile)
                {
                    string carpeta = "archivosGestion/" + numeroTicket + "_" + fuArchivo1.FileName;
                    fuArchivo1.SaveAs(Server.MapPath(carpeta));
                    dal.setEditarRutaArchivoAtencionHistorico(Convert.ToInt16(numeroTicket), Convert.ToInt16(correlativo), carpeta, "","");
                }

                if (fuArchivo2.HasFile)
                {
                    string carpeta = "archivosGestion/" + numeroTicket + "_" + fuArchivo2.FileName;
                    fuArchivo2.SaveAs(Server.MapPath(carpeta));
                    dal.setEditarRutaArchivoAtencionHistorico(Convert.ToInt16(numeroTicket), Convert.ToInt16(correlativo), "", carpeta,"");
                }

                string adjuntoOT = string.Empty;
                if (fuOrdenTrabajo.HasFile)
                {
                    
                        string carpeta = "archivosGestion/" + numeroTicket + "_OT_" + fuOrdenTrabajo.FileName;
                        fuOrdenTrabajo.SaveAs(Server.MapPath(carpeta));
                        adjuntoOT = carpeta;
                        dal.setEditarRutaArchivoAtencionHistorico(Convert.ToInt16(numeroTicket), Convert.ToInt16(correlativo), "", "", carpeta);
                    
                    
                }


                buscarCaso(hfNumeroTicket.Value);
                EnviarEmails(ddlEstado.SelectedValue, numeroTicket, usuario, fechaAgendamiento, lblTipo.Text,lblIdLocal.Text,lblIdArea.Text,adjuntoOT);
                

                lblInfo.Text = "Gestión histórica creada correctamete";
                divAlerta.Attributes["class"] = "alert alert-success";
                divAlerta.Visible = true;

                //Response.AddHeader("REFRESH", "3;URL=SeguimientoOT.aspx?t=" + numeroTicket);
                // Response.Redirect("SeguimientoTicket.aspx?t=" + numeroTicket);
                //divAlerta.Attributes.Add("class", "alert alert-success");
            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
                divAlerta.Visible = true;
            }

        }

        void EnviarEmails(string estado, string numeroTicket,string usuario, string fechaAgendamiento, string tipoOT, string local, string idArea, string adjunto)
        {
            string resultado = string.Empty;
            if (estado == "3") //estado cerrado
            {
                string body = "Estimado,   <br>";
                body += "Te informamos que la SOLPED N° " + numeroTicket + " ha sido resuelto con la siguiente solución:";
                body += "<br><br><b>Observación de la solución: " + txtObservacionGestion.Text + "</b>";
                body += "<br><br>";
                body += "<b><u>Información de la Atención:</u></b>";
                body += "<br>N° de SOLPED: " + numeroTicket;
                body += "<br>Fecha: " + DateTime.Now.ToString("G");
                body += "<br>Observación de la SOLPED: " + txtObservacion.Text;

                body += "<br><br>";
                body += "<table style='width:100%' border='1'><tr><td><img src='http://190.96.2.126/eot/assets/img/logo-tagor.png' width='15%' alt='Firma Logo' /></td>";
                body += "<td>Mantenimiento Tagor <br>Cerro El Plomo 5931, oficina 612, , Las Condes, Santiago, Chile<br>+56 22 762 2572<br>info@tagor.cl</td></tr></table>";


                string idUsuarioAsignado = string.Empty;
                string email = string.Empty;
                DataTable dtUsuarios = new DataTable();
                dtUsuarios = dal.getBuscarUsuarioAsignadoPorIdLocalIdPerfil(local, "5", idArea).Tables[0];
                foreach (DataRow item in dtUsuarios.Rows)
                {
                    idUsuarioAsignado = item["ID_USUARIO"].ToString();
                    email = item["EMAIL"].ToString();
                    break;
                }

                if (!string.IsNullOrEmpty(lblEmailCliente.Text.Trim()))
                {
                    com.EnviarEmailSSLImplicito(lblEmailCliente.Text.Trim(), body.Replace("\r\n", "<br>"), "RESOLUCION SOLPED N " + numeroTicket + ", SERVICIO AL CLIENTE TAGOR", adjunto);
                }

                if (!string.IsNullOrEmpty(email))
                {
                    com.EnviarEmailSSLImplicito(email, body.Replace("\r\n", "<br>"), "RESOLUCION SOLPED N " + numeroTicket + ", SERVICIO AL CLIENTE TAGOR", adjunto);
                }
                
                if (tipoOT== "Correctiva")
                {
                    body = string.Empty;
                    body += "Estimado,   <br>";
                    body += "Te informamos que la SOLPED N° " + numeroTicket + " ha sido resuelto con la siguiente solución:";
                    body += "<br><br><b>Observación de la solución: " + txtObservacionCliente.Text + "</b>";
                    body += "<br><br>";
                    body += "<b><u>Información de la Atención:</u></b>";
                    body += "<br>N° de SOLPED: " + numeroTicket;
                    body += "<br>Fecha: " + DateTime.Now.ToString("G");
                    body += "<br>Observación de la SOLPED: " + txtObservacion.Text;

                    body += "<br><br>";
                    body += "<table style='width:100%' border='1'><tr><td><img src='http://190.96.2.126/eot/assets/img/logo-tagor.png' width='15%' alt='Firma Logo' /></td>";
                    body += "<td>Mantenimiento Tagor <br>Cerro El Plomo 5931, oficina 612, , Las Condes, Santiago, Chile<br>+56 22 762 2572<br>info@tagor.cl</td></tr></table>";

                    DataTable dt = new DataTable();
                    dt = dal.getBuscarEmailPorTicket(numeroTicket).Tables[0];
                    string emails = string.Empty;
                    foreach (DataRow item in dt.Rows)
                    {
                        emails = item["EMAIL_ORIGEN"].ToString();
                        break;
                    }

                    if (emails.Trim() != string.Empty)
                    {
                        com.EnviarEmailSSLImplicito(emails.Trim(), body.Replace("\r\n", "<br>"), "RESOLUCION SOLPED N° " + numeroTicket + ", SERVICIO CLIENTE TAGOR", adjunto);
                        //com.EnviarEmail(emails.Trim(), body.Replace("\r\n", "<br>"), "Resolucion OT N° " + numeroTicket + ", SERVICIO CLIENTE TAGOR");
                    }
                }
                
            }
            else if (estado == "1") //estado pendiente
            {
                string idEmpleado = ddlDerivar.SelectedValue;
                DataTable dtEmpleado = new DataTable();
                dtEmpleado = dal.getBuscarUsuarioPorId(idEmpleado).Tables[0];

                string email = string.Empty;
                foreach (DataRow item in dtEmpleado.Rows)
                {
                    email = item["EMAIL"].ToString();
                }

                string bodyResolutor = "Estimado(a) Usuario:";
                bodyResolutor += "<br><br>";
                bodyResolutor += "Se ha generado la siguiente SOLPED para su gestión:";
                bodyResolutor += "<br><br>Comentario: ";
                bodyResolutor += "<b>" + txtObservacion.Text + "</b>";
                bodyResolutor += "<br><br>";
                bodyResolutor += "Le agradecemos revisar a la brevedad";
                bodyResolutor += "<br> " + "http://190.96.2.126/eot/SeguimientoOT.aspx?t=" + numeroTicket;
                bodyResolutor += "<br><br>";
                bodyResolutor += "<br>Muchas gracias!";
                bodyResolutor += "<br><b>Equipo de Servicio al Cliente Tagor.</b>";
                bodyResolutor += "<br><br>";
                bodyResolutor += "<table style='width:100%' border='1'><tr><td><img src='http://190.96.2.126/eot/assets/img/logo-tagor.png' width='20%' alt='Firma Logo' /></td>";
                bodyResolutor += "<td>Mantenimiento Tagor <br>Cerro El Plomo 5931, oficina 612, , Las Condes, Santiago, Chile<br>+56 22 762 2572<br>info@tagor.cl</td></tr></table>";

                if (idEmpleado != usuario)
                {
                    if (email != string.Empty)
                    {
                        //resultado = com.EnviarEmail(email, bodyResolutor.Replace("\r\n", "<br>"), " OT N° " + numeroTicket + " , Se ha generado el siguiente caso para su gestión. ");
                        com.EnviarEmailSSLImplicito(email, bodyResolutor.Replace("\r\n", "<br>"), " SOLPED N° " + numeroTicket + " , Se ha generado el siguiente caso para su gestión. ", adjunto);
                    }
                }
            }
            else if (estado == "4")
            {
                string idEmpleado = ddlDerivar.SelectedValue;
                DataTable dtEmpleado = new DataTable();
                dtEmpleado = dal.getBuscarUsuarioPorId(idEmpleado).Tables[0];

                string email = string.Empty;
                foreach (DataRow item in dtEmpleado.Rows)
                {
                    email = item["EMAIL"].ToString();
                }

                string body = "Estimado,   <br>";
                body += "Te informamos que la SOLPED N " + numeroTicket + " ha sido programada para su gestión:";
                body += "<br><br><b>Fecha de Programación: </b>" + fechaAgendamiento;
                body += "<br><br><b>Observación de la gestión: </b>" + txtObservacionGestion.Text;
                body += "<br><br>";
                body += "<b><u>Información de la Atención:</u></b>";
                body += "<br>N° de OT: " + numeroTicket;
                body += "<br>Fecha: " + DateTime.Now.ToString("G");
                body += "<br>Observación de la OT: " + txtObservacion.Text;

                body += "<br><br>";
                body += "<table style='width:100%' border='1'><tr><td><img src='http://190.96.2.126/eot/assets/img/logo-tagor.png' width='20%' alt='Firma Logo' /></td>";
                body += "<td>Mantenimiento Tagor <br>Cerro El Plomo 5931, oficina 612, , Las Condes, Santiago, Chile<br>+56 22 762 2572<br>info@tagor.cl</td></tr></table>";

                com.EnviarEmailSSLImplicito(email, body.Replace("\r\n", "<br>"), "Respuesta Programación OT N° " + numeroTicket + ", SERVICIO CLIENTE TAGOR", adjunto);
                
                if (tipoOT == "Correctiva")
                {
                    body = string.Empty;
                    body = "Estimado,   <br>";
                    body += "Te informamos que la SOLPED N° " + numeroTicket + " ha sido programada para su gestión:";
                    body += "<br><br><b>Fecha de Programación: </b>" + fechaAgendamiento;
                    body += "<br><br><b>Observación de la gestión: </b>" + txtObservacionCliente.Text;
                    body += "<br><br>";
                    body += "<b><u>Información de la Atención:</u></b>";
                    body += "<br>N° de OT: " + numeroTicket;
                    body += "<br>Fecha: " + DateTime.Now.ToString("G");
                    body += "<br>Observación de la OT: " + txtObservacion.Text;

                    body += "<br><br>";
                    body += "<table style='width:100%' border='1'><tr><td><img src='http://190.96.2.126/eot/assets/img/logo-tagor.png' width='20%' alt='Firma Logo' /></td>";
                    body += "<td>Mantenimiento Tagor <br>Cerro El Plomo 5931, oficina 612, , Las Condes, Santiago, Chile<br>+56 22 762 2572<br>info@tagor.cl</td></tr></table>";


                    DataTable dt = new DataTable();
                    dt = dal.getBuscarEmailPorTicket(numeroTicket).Tables[0];
                    string emails = string.Empty;
                    foreach (DataRow item in dt.Rows)
                    {
                        emails = item["EMAIL_ORIGEN"].ToString();
                        break;
                    }
                    if (emails.Trim() != string.Empty)
                    {
                        com.EnviarEmailSSLImplicito(emails, body.Replace("\r\n", "<br>"), "Respuesta Programación OT N° " + numeroTicket + ", SERVICIO CLIENTE TAGOR", adjunto);
                    }
                }
            }
            else if(estado == "2")
            {
                string idUsuarioAsignado = string.Empty;
                string email = string.Empty;
                DataTable dtUsuarios = new DataTable();
                dtUsuarios = dal.getBuscarUsuarioAsignadoPorIdLocalIdPerfil(local, "5", idArea).Tables[0];

                if (dtUsuarios.Rows.Count == 0)
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

                string body = "Estimado,   <br>";
                body += "Te informamos que la SOLPED N° " + numeroTicket + " se encuentran <b>EN PROCESO</b>:";
                body += "<br>Fecha de Ejecución: " + DateTime.Now.ToString("G");
                body += "<br><br><b>Observación de la gestión: </b>" + txtObservacionGestion.Text.Replace("\r\n", "<br>");
                body += "<br><br>";
                body += "<b><u>Información de la Atención:</u></b>";
                body += "<br>N° de OT: " + numeroTicket;
                body += "<br>Fecha : " + DateTime.Now.ToString("G");
                body += "<br>Observación de la OT: " + txtObservacion.Text;

                body += "<br><br>";
                body += "<table style='width:100%' border='1'><tr><td><img src='http://190.96.2.126/eot/assets/img/logo-tagor.png' width='20%' alt='Firma Logo' /></td>";
                body += "<td>Mantenimiento Tagor <br>Cerro El Plomo 5931, oficina 612, , Las Condes, Santiago, Chile<br>+56 22 762 2572<br>info@tagor.cl</td></tr></table>";

                com.EnviarEmailSSLImplicito(email, body.Replace("\r\n", "<br>"), "SOLPED EN PROCESO  N° " + numeroTicket + ", SERVICIO CLIENTE TAGOR", adjunto);
            }
        }

        public void GenerateThumbNail(string sourcefile, string destinationfile, int width, int height)
        {
            System.Drawing.Image image = System.Drawing.Image.FromFile(Server.MapPath(sourcefile));



            int srcWidth = image.Width;
            int srcHeight = image.Height;
            int thumbWidth = image.Width / 4;
            int thumbHeight = image.Height / 4;
            Bitmap bmp;

            bmp = new Bitmap(thumbWidth, thumbHeight);

            System.Drawing.Graphics gr = System.Drawing.Graphics.FromImage(bmp);
            gr.SmoothingMode = System.Drawing.Drawing2D.SmoothingMode.HighQuality;
            gr.CompositingQuality = System.Drawing.Drawing2D.CompositingQuality.HighQuality;
            gr.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.High;
            System.Drawing.Rectangle rectDestination = new System.Drawing.Rectangle(0, 0, thumbWidth, thumbHeight);
            //
            gr.SmoothingMode = SmoothingMode.HighQuality;
            //

            gr.DrawImage(image, rectDestination, 0, 0, srcWidth, srcHeight, GraphicsUnit.Pixel);

            bmp.Save(Server.MapPath(destinationfile));
            bmp.Dispose();
            image.Dispose();
            gr.Flush();
        }


        protected void lbtnGenerarPdf_Click(object sender, EventArgs e)
        {
            try
            {
                string ruta = generaPdf(hfNumeroTicket.Value);
                ScriptManager.RegisterStartupScript(this, this.GetType(), UniqueID, "window.open('" + ruta + "','_blank');", true);
            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
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

            iTextSharp.text.Font times = new iTextSharp.text.Font(bfTimes, 7, iTextSharp.text.Font.NORMAL);
            iTextSharp.text.Font timesRojo = new iTextSharp.text.Font(bfTimes, 9, iTextSharp.text.Font.BOLD, BaseColor.RED);
            iTextSharp.text.Font timesCorrelativo = new iTextSharp.text.Font(bfTimes, 9, iTextSharp.text.Font.BOLD);
            iTextSharp.text.Font fontCabecera = new iTextSharp.text.Font(bfTimes, 8, iTextSharp.text.Font.BOLD);
            iTextSharp.text.Font fontFirma = new iTextSharp.text.Font(bfTimes, 8, iTextSharp.text.Font.BOLD);

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

            tableNumeroComprobante.DefaultCell.Border = iTextSharp.text.Rectangle.NO_BORDER;

            tableNumeroComprobante.HorizontalAlignment = Element.ALIGN_RIGHT;
            tableNumeroComprobante.WidthPercentage = 25.0f;

            foreach (PdfPCell celda in tableNumeroComprobante.Rows[0].GetCells())
            {
                celda.Border = iTextSharp.text.Rectangle.NO_BORDER;
            }

            foreach (PdfPCell celda in tableNumeroComprobante.Rows[1].GetCells())
            {
                celda.Border = iTextSharp.text.Rectangle.NO_BORDER;
                //celda.HorizontalAlignment = 2;
            }
            foreach (PdfPCell celda in tableNumeroComprobante.Rows[2].GetCells())
            {
                celda.Border = iTextSharp.text.Rectangle.NO_BORDER;
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

        protected void ibtnArchivoOT_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                ImageButton img = (ImageButton)sender;
                GridViewRow row = (GridViewRow)img.NamingContainer;
                Label _lblArchivoOT = (Label)grvGestiones.Rows[row.RowIndex].FindControl("lblArchivoOT");

                ScriptManager.RegisterStartupScript(this, this.GetType(), UniqueID, "window.open('" + _lblArchivoOT.Text + "','_blank');", true);
            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
                divAlerta.Visible = true;
            }
        }
        
    }
}