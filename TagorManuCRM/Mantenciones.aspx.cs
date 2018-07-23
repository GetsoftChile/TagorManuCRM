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
    public partial class Mantenciones : System.Web.UI.Page
    {
        Datos dal = new Datos();

        protected void Page_Load(object sender, EventArgs e)
        {
            lblInfo.Text = "";
            divAlerta.Visible = false;

            try
            {
                if (!this.Page.IsPostBack)
                {
                    area();
                    Buscar();
                }
            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
                divAlerta.Visible = true;
            }
        }

        void Buscar()
        {
            grvMantenciones.DataSource = dal.getBuscarConfiguracion();
            grvMantenciones.DataBind();
            grvMantenciones.HeaderRow.TableSection = TableRowSection.TableHeader;
        }

        void Limpiar() {
            TxtNivel1.Text = string.Empty;
            TxtNivel2.Text = string.Empty;
            TxtNivel3.Text = string.Empty;
            TxtNivel4.Text = string.Empty;
            ddlTipo.ClearSelection();
            ddlArea.ClearSelection();
            ddlNivel1.ClearSelection();
            ddlNivel2.ClearSelection();
            ddlNivel3.ClearSelection();
            ddlNivel4.ClearSelection();
            hfIdMantencion.Value = string.Empty;
        }

        void MostrarFormulario()
        {
            divMantenciones.Visible = false;
            divAddEditMantencion.Visible = true;
        }

        void Nivel1()
        {
            ddlNivel1.DataSource = dal.getBuscarNivel1(ddlTipo.SelectedValue,ddlArea.SelectedValue);
            ddlNivel1.DataValueField = "NIVEL_1";
            ddlNivel1.DataTextField = "NIVEL_1";
            ddlNivel1.DataBind();
        }
        void Nivel2()
        {
            ddlNivel2.DataSource = dal.getBuscarNivel2(ddlTipo.SelectedValue, ddlArea.SelectedValue, ddlNivel1.SelectedValue);
            ddlNivel2.DataValueField = "NIVEL_2";
            ddlNivel2.DataTextField = "NIVEL_2";
            ddlNivel2.DataBind();
        }
        void Nivel3()
        {
            ddlNivel3.DataSource = dal.getBuscarNivel3(ddlTipo.SelectedValue, ddlArea.SelectedValue, ddlNivel1.SelectedValue, ddlNivel2.SelectedValue);
            ddlNivel3.DataValueField = "NIVEL_3";
            ddlNivel3.DataTextField = "NIVEL_3";
            ddlNivel3.DataBind();
        }
        void Nivel4()
        {
            ddlNivel4.DataSource = dal.getBuscarNivel4(ddlTipo.SelectedValue, ddlArea.SelectedValue, ddlNivel1.SelectedValue, ddlNivel2.SelectedValue, ddlNivel3.SelectedValue);
            ddlNivel4.DataValueField = "NIVEL_4";
            ddlNivel4.DataTextField = "NIVEL_4";
            ddlNivel4.DataBind();
        }

        protected void bntNuevo_Click(object sender, EventArgs e)
        {
            try
            {
                Limpiar();
                MostrarFormulario();
            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
                divAlerta.Visible = true;
            }
        }

        protected void ibtnExportarExcel_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                DataTable dt = new DataTable();
                dt = dal.getBuscarConfiguracionExporte().Tables[0];
                //Utilidad.ExportDataTableToExcel(dt, "exporte.xls", "", "", "", "");
                //Utilidad.ExportDataTableToExcel(dt, "exporte.xls", "", "", "", "");
                Response.ContentType = "Application/x-msexcel";
                Response.AddHeader("content-disposition", "attachment;filename=" + "exporte" + ".csv");
                Response.ContentEncoding = Encoding.Unicode;
                Response.Write(Utilidad.ExportToCSVFile(dt));
                Response.End();
                //Utilidad.ExportDataTableToExcel(dt, "Exporte.xls", "", "", "", "");
            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
                divAlerta.Visible = true;
            }
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            try
            {
                LinkButton btn = (LinkButton)sender;
                GridViewRow row = (GridViewRow)btn.NamingContainer;
                
                Label _lblIdTipificacion = (Label)grvMantenciones.Rows[row.RowIndex].FindControl("lblIdTipificacion");
                Label _lblNivel1 = (Label)grvMantenciones.Rows[row.RowIndex].FindControl("lblNivel1");
                Label _lblNivel2 = (Label)grvMantenciones.Rows[row.RowIndex].FindControl("lblNivel2");
                Label _lblNivel3 = (Label)grvMantenciones.Rows[row.RowIndex].FindControl("lblNivel3");
                Label _lblNivel4 = (Label)grvMantenciones.Rows[row.RowIndex].FindControl("lblNivel4");
                Label _lblClase = (Label)grvMantenciones.Rows[row.RowIndex].FindControl("lblClase");
                Label _lblIdArea = (Label)grvMantenciones.Rows[row.RowIndex].FindControl("lblIdArea");

                Limpiar();
                hfIdMantencion.Value = _lblIdTipificacion.Text;

                ddlTipo.SelectedValue = _lblClase.Text;
                ddlArea.SelectedValue = _lblIdArea.Text;
                
                Nivel1();

                ddlNivel1.SelectedValue = _lblNivel1.Text;
                TxtNivel1.Text = _lblNivel1.Text;
                Nivel2();
                
                ddlNivel2.SelectedValue = _lblNivel2.Text;
                TxtNivel2.Text = _lblNivel2.Text;
                Nivel3();

                ddlNivel3.SelectedValue = _lblNivel3.Text;
                TxtNivel3.Text = _lblNivel3.Text;
                Nivel4();

                ddlNivel4.SelectedValue = _lblNivel4.Text;
                TxtNivel4.Text = _lblNivel4.Text;
                
                MostrarFormulario();

            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
                divAlerta.Visible = true;
            }
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                LinkButton btn = (LinkButton)sender;
                GridViewRow row = (GridViewRow)btn.NamingContainer;

                Label _lblIdTipificacion = (Label)grvMantenciones.Rows[row.RowIndex].FindControl("lblIdTipificacion");
                dal.setEliminarTipificacion(_lblIdTipificacion.Text);
                Buscar();

                lblInfo.Text = "Mantencion eliminada correctamente";
                divAlerta.Attributes["class"] = "alert alert-success";
                divAlerta.Visible = true;
            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
                divAlerta.Visible = true;
            }
        }
        
        protected void BtnGuardar_Click(object sender, EventArgs e)
        {
            
            try
            {
                if (ddlTipo.SelectedValue=="0")
                {
                    lblInfo.Text = "El Tipo es obligatorio, favor de seleccionar";
                    divAlerta.Attributes["class"] = "alert alert-danger";
                    divAlerta.Visible = true; return;
                }
                
                if (TxtNivel1.Text.Trim()==string.Empty)
                {
                    lblInfo.Text = "El nivel 1 es obligatorio";
                    divAlerta.Attributes["class"] = "alert alert-danger";
                    divAlerta.Visible = true; return;
                }
                if (TxtNivel2.Text.Trim() == string.Empty)
                {
                    lblInfo.Text = "El nivel 2 es obligatorio";
                    divAlerta.Attributes["class"] = "alert alert-danger";
                    divAlerta.Visible = true; return;
                }
                if (TxtNivel3.Text.Trim() == string.Empty)
                {
                    lblInfo.Text = "El nivel 3 es obligatorio";
                    divAlerta.Attributes["class"] = "alert alert-danger";
                    divAlerta.Visible = true; return;
                }
                if (TxtNivel4.Text.Trim() == string.Empty)
                {
                    lblInfo.Text = "El nivel 4 es obligatorio";
                    divAlerta.Attributes["class"] = "alert alert-danger";
                    divAlerta.Visible = true; return;
                }

                if (hfIdMantencion.Value != string.Empty)
                {
                    dal.setEditarConfiguracion(hfIdMantencion.Value, ddlTipo.SelectedValue, ddlArea.SelectedValue, TxtNivel1.Text.Trim(), 
                        TxtNivel2.Text.Trim(), TxtNivel3.Text.Trim(), TxtNivel4.Text.Trim());
                }
                else
                {
                    dal.setIngresarMantencion("1", TxtNivel1.Text.Trim(), TxtNivel2.Text.Trim(), TxtNivel3.Text.Trim(), TxtNivel4.Text.Trim(), ddlTipo.SelectedValue, ddlArea.SelectedValue);
                }
                
                lblInfo.Text = "Mantencion guardada correctamente";
                divAlerta.Attributes["class"] = "alert alert-success";
                divAlerta.Visible = true;

            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
                divAlerta.Visible = true;
            }
        }

        protected void BtnCancelar_Click(object sender, EventArgs e)
        {
            try
            {
                Buscar();
                Limpiar();
                divMantenciones.Visible = true;
                divAddEditMantencion.Visible = false;
            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
                divAlerta.Visible = true;
            }
        }

        protected void ddlNivel1_DataBound(object sender, EventArgs e)
        {
            try
            {
                ddlNivel1.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Seleccione", "0"));
            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
                divAlerta.Visible = true;
            }
        }

        protected void ddlNivel1_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                Nivel2();
                Nivel3();
                Nivel4();
                TxtNivel1.Text = ddlNivel1.SelectedValue;
            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
                divAlerta.Visible = true;
            }
        }

        protected void ddlNivel2_DataBound(object sender, EventArgs e)
        {
            try
            {
                ddlNivel2.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Seleccione", "0"));
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
                Nivel3();
                Nivel4();
                TxtNivel2.Text = ddlNivel2.SelectedValue;
            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
                divAlerta.Visible = true;
            }
        }

        protected void ddlNivel3_DataBound(object sender, EventArgs e)
        {
            try
            {
                ddlNivel3.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Seleccione", "0"));
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
                Nivel4();
                TxtNivel3.Text = ddlNivel3.SelectedValue;
            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
                divAlerta.Visible = true;
            }
        }

        protected void ddlNivel4_DataBound(object sender, EventArgs e)
        {
            try
            {
                ddlNivel4.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Seleccione", "0"));
            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
                divAlerta.Visible = true;
            }
        }

        protected void ddlNivel4_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                TxtNivel4.Text = ddlNivel4.SelectedValue;
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
                Nivel1();
                Nivel2();
                Nivel3();
                Nivel4();
            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
                divAlerta.Visible = true;
            }
        }

        void area()
        {
            ddlArea.DataSource = dal.getBuscarArea();
            ddlArea.DataValueField = "ID_AREA";
            ddlArea.DataTextField = "AREA";
            ddlArea.DataBind();
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
                divAlerta.Visible = true;
            }
        }

        protected void ddlArea_DataBound(object sender, EventArgs e)
        {
            ddlArea.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Seleccione", "0"));
        }
    }
}