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
    public partial class Usuarios : System.Web.UI.Page
    {
        Datos dal = new Datos();
        Comun com = new Comun();
        protected void Page_Load(object sender, EventArgs e)
        {
            lblInfo.Text = "";
            divAlerta.Visible = false;

            //string ruta="AdminLTE-2.3.0/dist/img/user2-160x160.jpg";
            //imgUsuario.Src = Session["variableImagenUsuario"].ToString();

            try
            {
                if (!this.Page.IsPostBack)
                {
                    string perfil = Session["variablePerfil"].ToString();
                    string idPerfil = Session["variableIdPerfil"].ToString();

                    if (idPerfil != "1")
                    {
                        Response.Redirect("Dashboard.aspx");
                    }

                    BuscarPerfil();
                    Empresa();
                    //Area();
                    com.FillArea(ddlArea);
                    Zona();
                    Sucursales();
                    Buscar();
                }
            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
                divAlerta.Visible = true;
            }
        }

        void Sucursales()
        {
            ddlSucursal.DataSource = dal.getBuscarSucursal("1");
            ddlSucursal.DataTextField = "NOMBRE_SUCURSAL";
            ddlSucursal.DataValueField = "ID_SUCURSAL";
            ddlSucursal.DataBind();
        }

        void Zona()
        {
            chkZona.DataSource = dal.getBuscarZona(null, null);
            chkZona.DataValueField = "ID_ZONA";
            chkZona.DataTextField = "ZONA";
            chkZona.DataBind();
        }

        void Empresa()
        {
            ddlEmpresa.DataSource = dal.getBuscarEmpresa(null);
            ddlEmpresa.DataTextField = "EMPRESA";
            ddlEmpresa.DataValueField = "ID_EMPRESA";
            ddlEmpresa.DataBind();
        }

        void BuscarPerfil()
        {
            ddlPerfil.DataSource = dal.getBuscarPerfil(null);
            ddlPerfil.DataValueField = "ID_PERFIL";
            ddlPerfil.DataTextField = "NOM_PERFIL";
            ddlPerfil.DataBind();
        }

        void Area()
        {
            ddlArea.DataSource = dal.getBuscarArea();
            ddlArea.DataValueField = "ID_AREA";
            ddlArea.DataTextField = "AREA";
            ddlArea.DataBind();
        }


        protected void grvUsuarios_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowIndex == 0)
            {
                e.Row.RowType = DataControlRowType.Header;
            }
        }

        void Limpiar()
        {
            txtClave.Attributes.Add("Value", "");
            txtLogin.Text = string.Empty;
            txtNombres.Text = string.Empty;
            txtEmail.Text = string.Empty;
            hfIdUsuario.Value = string.Empty;
            ddlActivo.ClearSelection();
            ddlPerfil.ClearSelection();

            chkZona.ClearSelection();
        }

        void Buscar()
        {
            grvUsuarios.DataSource = dal.getBuscarUsuario(null, null);
            grvUsuarios.DataBind();
            grvUsuarios.HeaderRow.TableSection = TableRowSection.TableHeader;
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            try
            {
                divImagenUsuario.Visible = false;
                Limpiar();
                MostrarFormulario();
            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
                divAlerta.Attributes["class"] = "alert alert-danger";
                divAlerta.Visible = true;
            }
        }

        void MostrarFormulario()
        {
            divUsuarios.Visible = false;
            divAddEditUsuario.Visible = true;
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            try
            {
                divEmpresa.Visible = false;

                LinkButton btn = (LinkButton)sender;
                GridViewRow row = (GridViewRow)btn.NamingContainer;

                Label _lblIdUsuario = (Label)grvUsuarios.Rows[row.RowIndex].FindControl("lblIdUsuario");
                Label _lblClave = (Label)grvUsuarios.Rows[row.RowIndex].FindControl("lblClave");
                Label _lblNombres = (Label)grvUsuarios.Rows[row.RowIndex].FindControl("lblNombres");
                Label _lblUsuario = (Label)grvUsuarios.Rows[row.RowIndex].FindControl("lblUsuario");
                Label _lblActivo = (Label)grvUsuarios.Rows[row.RowIndex].FindControl("lblActivo");
                Label _lblEmail = (Label)grvUsuarios.Rows[row.RowIndex].FindControl("lblEmail");
                Label _lblPerfil = (Label)grvUsuarios.Rows[row.RowIndex].FindControl("lblIdPerfil");
                Label _lblIdEmpresa = (Label)grvUsuarios.Rows[row.RowIndex].FindControl("lblIdEmpresa");
                Label _lblIdArea = (Label)grvUsuarios.Rows[row.RowIndex].FindControl("lblIdArea");
                Label _lblIdSucursal = (Label)grvUsuarios.Rows[row.RowIndex].FindControl("lblIdSucursal");
                Label _lblIdGrupo = (Label)grvUsuarios.Rows[row.RowIndex].FindControl("lblIdGrupo");
  
                Label _lblRutaFoto = (Label)grvUsuarios.Rows[row.RowIndex].FindControl("lblRutaFoto");

                Limpiar();
                hfIdUsuario.Value = _lblIdUsuario.Text;

                txtLogin.Text = _lblUsuario.Text;
                txtNombres.Text = _lblNombres.Text;
                txtClave.Attributes.Add("Value", _lblClave.Text);

                //ddlActivo.SelectedValue = "1";
                divImagenUsuario.Visible = true;

                if (_lblPerfil.Text != string.Empty)
                {
                    ddlPerfil.SelectedValue = _lblPerfil.Text;
                }
                if (_lblIdSucursal.Text != string.Empty)
                {
                    ddlSucursal.SelectedValue = _lblIdSucursal.Text;
                }

                if (_lblIdEmpresa.Text != string.Empty)
                {
                    ddlEmpresa.SelectedValue = _lblIdEmpresa.Text;
                }

                //if (ddlPerfil.SelectedValue == "3")
                //{
                //    divEmpresa.Visible = true;
                //}
                //else
                //{
                //    divEmpresa.Visible = false;
                //}

                if (_lblIdArea.Text != string.Empty)
                {
                    ddlArea.SelectedValue = _lblIdArea.Text;
                }


                if (_lblPerfil.Text == "2" || _lblPerfil.Text == "5")
                {
                    divArea.Visible = true;
                }
                else
                {
                    divArea.Visible = false;
                }


                if (_lblActivo.Text != string.Empty)
                {
                    if (_lblActivo.Text == "False")
                    {
                        ddlActivo.SelectedValue = "0";
                    }
                    else
                    {
                        ddlActivo.SelectedValue = "1";
                    }
                }

                txtEmail.Text = _lblEmail.Text;
                imgUsuario.Src = _lblRutaFoto.Text;

                foreach (DataRow item in dal.getBuscarZonaPorIdUsuario(_lblIdUsuario.Text).Tables[0].Rows)
                {
                    string idZona = Convert.ToString(item["ID_ZONA"]);
                    
                    foreach (ListItem fila in chkZona.Items)
                    {
                        if (idZona == fila.Value.ToString())
                        {
                            fila.Selected = true;
                        }
                    }
                }


                MostrarFormulario();
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

                Label _lblIdUsuario = (Label)grvUsuarios.Rows[row.RowIndex].FindControl("lblIdUsuario");

                dal.setEliminarZonasPorUsuario(_lblIdUsuario.Text);
                dal.setEliminarUsuario(_lblIdUsuario.Text);
                Buscar();

                lblInfo.Text = "Usuario Eliminado Correctamente";
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
        protected void Cancelar_Click(object sender, EventArgs e)
        {
            Buscar();
            Limpiar();
            divUsuarios.Visible = true;
            divAddEditUsuario.Visible = false;

        }

        protected void Guardar_Click(object sender, EventArgs e)
        {
            string mensaje;
            try
            {
                mensaje = string.Empty;
                if (hfIdUsuario.Value != string.Empty)
                {
                    dal.setEditarUsuario(hfIdUsuario.Value, txtLogin.Text, txtClave.Text, txtEmail.Text, ddlPerfil.SelectedValue, txtNombres.Text, ddlActivo.SelectedValue, "1", ddlArea.SelectedValue,ddlSucursal.SelectedValue);
                    dal.setEliminarZonasPorUsuario(hfIdUsuario.Value);
                    string idZona = string.Empty;
                    foreach (ListItem fila in chkZona.Items)
                    {
                        if (fila.Selected == true)
                        {
                            idZona = fila.Value.ToString();
                            dal.setIngresarZonaPorUsuario(idZona, hfIdUsuario.Value);
                        }
                    }

                    mensaje = "Usuario Editado Correctamente";
                }
                else
                {
                    string valor = dal.setIngresarUsuario(txtLogin.Text, txtClave.Text, txtEmail.Text, ddlPerfil.SelectedValue, txtNombres.Text, ddlActivo.SelectedValue, "1", ddlArea.SelectedValue,ddlSucursal.SelectedValue);
                    string idZona = string.Empty;
                    foreach (ListItem fila in chkZona.Items)
                    {
                        if (fila.Selected==true)
                        {
                            idZona = fila.Value.ToString();
                            dal.setIngresarZonaPorUsuario(idZona, valor);
                        }
                    }

                    if (valor == "9999")
                    {
                        mensaje = "El usuario ingresado ya existe en el sistema";
                    }
                    else
                    {
                        mensaje = "Usuario Creado Correctamente";

                    }
                }

                Buscar();
                divUsuarios.Visible = true;
                divAddEditUsuario.Visible = false;

                lblInfo.Text = mensaje;
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

        protected void btnSubirImagen_Click(object sender, EventArgs e)
        {
            try
            {
                if (fluFotoUsuario.HasFile)
                {
                    string carpeta = "assets/img/" + "Perfil_" + hfIdUsuario.Value + "_" + fluFotoUsuario.FileName;
                    fluFotoUsuario.SaveAs(Server.MapPath(carpeta));
                    int IdUsuario = Convert.ToInt16(hfIdUsuario.Value);
                    dal.setEditarRutaFotoUsuario(IdUsuario, carpeta);
                    string idUsuario = Session["variableIdUsuario"].ToString();

                    //cambia inmediatamente si es el usuario actual.
                    if (idUsuario == hfIdUsuario.Value)
                    {
                        Session["variableImagenUsuario"] = carpeta;
                        imgUsuario.Src = carpeta;
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

        protected void ddlEmpresa_DataBound(object sender, EventArgs e)
        {
            ddlEmpresa.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Seleccione", "0"));
        }
        protected void ddlSucursal_DataBound(object sender, EventArgs e)
        {
            ddlSucursal.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Seleccione", "0"));
        }
        //protected void ddlGrupo_DataBound(object sender, EventArgs e)
        //{
        //    ddlGrupo.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Seleccione", "0"));
        //}

        protected void ddlArea_DataBound(object sender, EventArgs e)
        {
            ddlArea.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Seleccione", "0"));
        }

        protected void ddlPerfil_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (ddlPerfil.SelectedValue == "2" || ddlPerfil.SelectedValue == "5")
                {
                    divArea.Visible = true;
                }
                else
                {
                    divArea.Visible = false;
                }
            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
                divAlerta.Attributes["class"] = "alert alert-danger";
                divAlerta.Visible = true;
            }
        }


        protected void ibtnExportarExcel_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = new DataTable();
                dt = dal.getBuscarUsuarioExporte().Tables[0];
                //Utilidad.ExportDataTableToExcel(dt, "exporte.xls", "", "", "", "");
                //Utilidad.ExportDataTableToExcel(dt, "exporte.xls", "", "", "", "");
                Response.ContentType = "Application/x-msexcel";
                Response.AddHeader("content-disposition", "attachment;filename=" + "exporte_usuario" + ".csv");
                Response.ContentEncoding = Encoding.Unicode;
                Response.Write(Utilidad.ExportToCSVFile(dt));
                Response.End();
                //Utilidad.ExportDataTableToExcel(dt, "Exporte.xls", "", "", "", "");
            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
                divAlerta.Attributes["class"] = "alert alert-danger";
                divAlerta.Visible = true;
            }
        }

        protected void grvUsuarios_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    Label _lblIdUsuario = (Label)e.Row.FindControl("lblIdUsuario");
                    Label _lblZonas = (Label)e.Row.FindControl("lblZonas");
                    
                    Label _lblActivo = (Label)e.Row.FindControl("lblActivo");
                    Label _lblActivo2 = (Label)e.Row.FindControl("lblActivo2");
                    
                    DataTable dt = new DataTable();
                    dt = dal.getBuscarZonaPorIdUsuario(_lblIdUsuario.Text).Tables[0];
                    foreach (DataRow item in dt.Rows)
                    {
                        _lblZonas.Text += item["ID_ZONA"].ToString() + ",";
                    }

                    _lblZonas.Text = _lblZonas.Text.TrimEnd(',');

                    if (_lblActivo.Text == "True")
                    {
                        _lblActivo2.CssClass = "label label-success";
                    }
                    else
                    {
                        _lblActivo2.CssClass = "label label-danger";
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
    }
}