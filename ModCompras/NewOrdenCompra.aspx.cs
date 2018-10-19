using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using System.IO;
using System.Collections;


namespace ModCompras
{
    public partial class NewOrdenCompra : System.Web.UI.Page
    {
        DatosModCom dalCom = new DatosModCom();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!this.Page.IsPostBack)
                {
                    string _IdSolCom = Convert.ToString(Request.QueryString["solcom"]);
                    string _Id = Convert.ToString(Request.QueryString["id"]);
                    lblNumeroOrdenCompra.Text = _Id;
                    lblIdSolcom.Text = _IdSolCom;


                    BuscarMateriales();

                    DateTime Hoy = DateTime.Today;
                    string fecha_actual = Hoy.ToLongDateString();
                    lblFechaHoy.Text = fecha_actual;
                }
            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
                divAlerta.Visible = true;
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                string idUsuario = Session["variableIdUsuario"].ToString();

                //dalCom.SetInSolicitudCompra("1", ddlProyecto.SelectedValue, null, "1", idUsuario, idUsuario, ddlSucursal.SelectedValue);
                string idOc = dalCom.SetInOC("1", hfIdProveedor.Value, idUsuario, "1", txtObservaciones.Text.Trim(), lblIdSolcom.Text, null);
                foreach (GridViewRow item in grvMateriales.Rows)
                {
                    CheckBox _chkSeleccionar = (CheckBox)item.FindControl("chkSeleccionar");

                    if (_chkSeleccionar.Checked==true)
                    {
                        Label _lblIdMaterial = (Label)item.FindControl("lblIdMaterial");
                        Label _lblCantidad = (Label)item.FindControl("lblCantidad");
                        Label _lblPrecioTotal = (Label)item.FindControl("lblPrecioTotal");
                        TextBox _txtValorProducto = (TextBox)item.FindControl("txtValorProducto");

                        decimal precioNeto = Convert.ToDecimal(_lblPrecioTotal.Text);
                        decimal precioUnitario  = Convert.ToDecimal(_txtValorProducto.Text);
                        
                        dalCom.SetInProductoOC(idOc, _lblIdMaterial.Text, _lblCantidad.Text, precioNeto, precioUnitario);
                    }
                }

                lblInfo.Text = "Orden de compra generada correctamente con el número " + idOc.ToString();
                divAlerta.Attributes["class"] = "alert alert-success";
                divAlerta.Visible = true;
            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
                divAlerta.Visible = true;
            }

        }
        

        protected void lbtnBuscarProveedor_Click(object sender, EventArgs e)
        {
            try
            {
                BuscarProveedor(txtRutProveedor.Text.Trim());
            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
                divAlerta.Visible = true;
            }
        }

        void BuscarProveedor(string rut)
        {
            DataTable dt = new DataTable();
            dt = dalCom.GetBuscarProveedorPorRut(rut).Tables[0];
            foreach (DataRow item in dt.Rows)
            {
                hfIdProveedor.Value= item["IdProveedor"].ToString();
                txtGiro.Text = item["GIRO"].ToString();
                txtRazonSocial.Text = item["NOMBRE"].ToString();
                txtDireccion.Text = item["DIRECCION"].ToString();
                txtTelefono.Text = item["TELEFONO"].ToString();
                txtEmail.Text = item["EMAIL"].ToString();
                txtActividadComercial.Text = item["NOM_ACTIVIDAD_COMERCIAL"].ToString();
            }
        }

        void BuscarMateriales()
        {
            grvMateriales.DataSource = dalCom.GetBuscarMaterialPorSolicitud(Convert.ToInt32(lblIdSolcom.Text));
            grvMateriales.DataBind();
        }

        protected void grvMateriales_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void txtValorProducto_TextChanged(object sender, EventArgs e)
        {
            try
            {
                TextBox img = (TextBox)sender;
                GridViewRow row = (GridViewRow)img.NamingContainer;

                Label _lblCantidad = (Label)grvMateriales.Rows[row.RowIndex].FindControl("lblCantidad");
                Label _lblPrecioTotal = (Label)grvMateriales.Rows[row.RowIndex].FindControl("lblPrecioTotal");
                TextBox _txtValorProducto = (TextBox)grvMateriales.Rows[row.RowIndex].FindControl("txtValorProducto");

                int totalValor = Convert.ToInt32(_txtValorProducto.Text) * Convert.ToInt32(_lblCantidad.Text);
                _lblPrecioTotal.Text = totalValor.ToString();

                int totalNeto = 0;

                foreach (GridViewRow item in grvMateriales.Rows)
                {
                    Label _lblPrecioTotalGrv = (Label)item.FindControl("lblPrecioTotal");
                    totalNeto += Convert.ToInt32(_lblPrecioTotalGrv.Text);
                }
                
                txtTotalNeto.Text = totalNeto.ToString("n0");
                double valorConIva = CalcularIva(Convert.ToDouble(totalNeto));
                txtIva.Text = Convert.ToInt32(valorConIva).ToString("n0");
                txtTotalConIva.Text = (Convert.ToInt32(valorConIva) + totalNeto).ToString("n0");

            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
                divAlerta.Visible = true;
            }
        }


        public double CalcularIva(double monto)
        {
            double montoTotal = 0;
            double porcentaje = 19;

            montoTotal = ((porcentaje / 100) * monto);

            return montoTotal;
        }

        protected void chkSeleccionar_CheckedChanged(object sender, EventArgs e)
        {
            try
            {
                CheckBox img = (CheckBox)sender;
                GridViewRow row = (GridViewRow)img.NamingContainer;

                CheckBox _chkSeleccionar = (CheckBox)grvMateriales.Rows[row.RowIndex].FindControl("chkSeleccionar");
                TextBox _txtValorProducto = (TextBox)grvMateriales.Rows[row.RowIndex].FindControl("txtValorProducto");

                if (_chkSeleccionar.Checked==true)
                {
                    _txtValorProducto.Enabled = true;
                    
                }
                else
                {
                    _txtValorProducto.Enabled = false;
                }
                
            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
                divAlerta.Visible = true;
            }
        }


        //private string generaPdf2(string cotizacion, string ejecutivo, string rut, string idEmpresa)
        //{
        //    string str1 = DateTime.Today.ToString("dd-MM-yyyy");
        //    string str2 = "Cotizacion_" + cotizacion + ".pdf";
        //    BaseFont font1 = BaseFont.CreateFont("Helvetica", "Cp1252", false);
        //    iTextSharp.text.Font font2 = new iTextSharp.text.Font(font1, 7f, 0);
        //    iTextSharp.text.Font font3 = new iTextSharp.text.Font(font1, 7f, 1);
        //    iTextSharp.text.Font font4 = new iTextSharp.text.Font(font1, 8f, 0);
        //    iTextSharp.text.Font font5 = new iTextSharp.text.Font(font1, 9f, 1, BaseColor.RED);
        //    iTextSharp.text.Font font6 = new iTextSharp.text.Font(font1, 9f, 1);
        //    iTextSharp.text.Font font7 = new iTextSharp.text.Font(font1, 8f, 1);
        //    iTextSharp.text.Font font8 = new iTextSharp.text.Font(font1, 8f, 1);
        //    iTextSharp.text.Font font9 = new iTextSharp.text.Font(font1, 10f, 1);
        //    iTextSharp.text.Font font10 = new iTextSharp.text.Font(font1, 12f, 1);
        //    Document document = new Document(PageSize.A4, 25f, 25f, 30f, 30f);
        //    PdfWriter.GetInstance(document, (Stream)new FileStream(this.Server.MapPath("cotizaciones/" + str2), FileMode.Create));
        //    document.Open();
        //    string path1 = "";
        //    string empty1 = string.Empty;
        //    string empty2 = string.Empty;
        //    foreach (DataRow row in (InternalDataCollectionBase)this.dal.getBuscarEmpresa((string)null, idEmpresa).Tables[0].Rows)
        //    {
        //        path1 = row["IMAGEN"].ToString();
        //        empty1 = row["EMAIL"].ToString();
        //        empty2 = row["TELEFONO"].ToString();
        //    }
        //    if (path1 == string.Empty)
        //        path1 = "assets/img/imagenesEmpresa/1_1_logo fadonel con call center y productos.png";
        //    iTextSharp.text.Image instance1 = iTextSharp.text.Image.GetInstance(this.Server.MapPath(path1));
        //    instance1.ScaleToFit(150f, 150f);
        //    instance1.Alignment = 0;
        //    document.Add((IElement)instance1);
        //    string empty3 = string.Empty;
        //    string empty4 = string.Empty;
        //    string empty5 = string.Empty;
        //    string empty6 = string.Empty;
        //    string empty7 = string.Empty;
        //    foreach (DataRow row in (InternalDataCollectionBase)this.dal.getBuscarRazonSocial(new int?(Convert.ToInt32(this.ddlRazonSocial.SelectedValue))).Tables[0].Rows)
        //    {
        //        empty3 = row["RUT"].ToString();
        //        empty4 = row["DIRECCION"].ToString();
        //        row["EMAIL"].ToString();
        //        empty6 = row["BANCO"].ToString();
        //        empty7 = row["CUENTA_CTE"].ToString();
        //    }
        //    PdfPTable pdfPtable1 = new PdfPTable(2);
        //    PdfPCell cell1 = new PdfPCell((Phrase)new Paragraph("\nCOTIZACIÓN \nNº " + cotizacion, font10));
        //    cell1.HorizontalAlignment = 1;
        //    cell1.VerticalAlignment = 4;
        //    new PdfPCell((Phrase)new Paragraph(this.ddlRazonSocial.SelectedItem.ToString(), font9)).VerticalAlignment = 6;
        //    PdfPCell cell2 = new PdfPCell((Phrase)new Paragraph("Importación, Publicidad, Impresión de Telas, Comercializacion de Toldos Araña, Banderas, Carpas Araña, Pendones Roller, Cortinas con Diseño, Manteles, Paneles Araña Textil, Lienzos, Pasacalle, Minipendones, Banderas Velas, Banderas Gotas, Banderas Corporativas, Impresión y Aplicación de Logos.", font4));
        //    cell2.Border = 0;
        //    pdfPtable1.AddCell(cell2);
        //    pdfPtable1.AddCell(cell1);
        //    pdfPtable1.DefaultCell.Border = 0;
        //    pdfPtable1.HorizontalAlignment = 2;
        //    pdfPtable1.WidthPercentage = 100f;
        //    foreach (Rectangle cell3 in pdfPtable1.Rows[0].GetCells())
        //        cell3.Border = 0;
        //    document.Add((IElement)pdfPtable1);
        //    document.Add((IElement)new Paragraph(empty4, font8));
        //    document.Add((IElement)new Paragraph("FONO: " + empty2, font8));
        //    document.Add((IElement)new Paragraph(empty1, font8));
        //    string content = string.Empty;
        //    string empty8 = string.Empty;
        //    string id = this.Session["IdCliente"].ToString();
        //    DataTable dataTable1 = new DataTable();
        //    foreach (DataRow row in (InternalDataCollectionBase)this.dal.getBuscarClientePorId(id).Tables[0].Rows)
        //        content = !(row["RUT_PADRE"].ToString() != string.Empty) ? "Datos Cliente" : "Datos Cliente Asociado";
        //    document.Add((IElement)new Paragraph(" ", font2));
        //    Chunk chunk1 = new Chunk(content, FontFactory.GetFont("ARIAL", 9f, 1));
        //    chunk1.SetUnderline(0.1f, -2f);
        //    document.Add((IElement)chunk1);
        //    PdfPTable pdfPtable2 = new PdfPTable(4);
        //    DataTable dataTable2 = new DataTable();
        //    DataTable table1 = this.dal.getBuscarClientePorId(id).Tables[0];
        //    string str3 = "";
        //    string idCondicionVenta = "";
        //    string empty9 = string.Empty;
        //    string empty10 = string.Empty;
        //    string empty11 = string.Empty;
        //    foreach (DataRow row in (InternalDataCollectionBase)table1.Rows)
        //    {
        //        str3 = row["GIRO"].ToString();
        //        idCondicionVenta = row["CONDICION_DE_VENTA"].ToString();
        //        empty9 = row["RAZON_SOCIAL"].ToString();
        //        empty10 = row["DIRECCION"].ToString();
        //        empty11 = row["TELEFONO"].ToString();
        //    }
        //    string empty12 = string.Empty;
        //    DataTable dataTable3 = new DataTable();
        //    DataTable table2 = this.dal.getBuscarCotizacionPorId(cotizacion).Tables[0];
        //    string empty13 = string.Empty;
        //    foreach (DataRow row in (InternalDataCollectionBase)table2.Rows)
        //    {
        //        empty12 = row["ID_CONTACTO"].ToString();
        //        empty13 = row["MONTO_DESCUENTO"].ToString();
        //    }
        //    DataTable dataTable4 = new DataTable();
        //    DataTable table3 = this.dal.getBuscarContactoPorId(empty12).Tables[0];
        //    string empty14 = string.Empty;
        //    string empty15 = string.Empty;
        //    string empty16 = string.Empty;
        //    string empty17 = string.Empty;
        //    foreach (DataRow row in (InternalDataCollectionBase)table3.Rows)
        //    {
        //        empty14 = row["NOM_CONTACTO"].ToString();
        //        row["TELEFONO1"].ToString();
        //        row["CELULAR"].ToString();
        //        row["EMAIL_1"].ToString();
        //    }
        //    float[] relativeWidths1 = new float[4]
        //    {
        //        35f,
        //        95f,
        //        35f,
        //        55f
        //    };
        //    pdfPtable2.SetWidths(relativeWidths1);
        //    pdfPtable2.AddCell((Phrase)new Paragraph("Rut :", font7));
        //    pdfPtable2.AddCell((Phrase)new Paragraph(rut, font2));
        //    pdfPtable2.AddCell((Phrase)new Paragraph("Nombre :", font7));
        //    pdfPtable2.AddCell((Phrase)new Paragraph(empty9, font2));
        //    pdfPtable2.AddCell((Phrase)new Paragraph("Dirección :", font7));
        //    pdfPtable2.AddCell((Phrase)new Paragraph(empty10, font2));
        //    pdfPtable2.AddCell((Phrase)new Paragraph("Teléfono:", font7));
        //    pdfPtable2.AddCell((Phrase)new Paragraph(empty11, font2));
        //    pdfPtable2.AddCell((Phrase)new Paragraph("Giro :", font7));
        //    pdfPtable2.AddCell((Phrase)new Paragraph(str3, font2));
        //    pdfPtable2.AddCell((Phrase)new Paragraph("Fecha :", font7));
        //    pdfPtable2.AddCell((Phrase)new Paragraph(str1, font2));
        //    pdfPtable2.AddCell((Phrase)new Paragraph("Nombre Contacto :", font7));
        //    pdfPtable2.AddCell((Phrase)new Paragraph(empty14, font2));
        //    pdfPtable2.AddCell((Phrase)new Paragraph(" ", font7));
        //    pdfPtable2.AddCell((Phrase)new Paragraph(" ", font2));
        //    pdfPtable2.HorizontalAlignment = 0;
        //    pdfPtable2.WidthPercentage = 100f;
        //    document.Add((IElement)pdfPtable2);
        //    document.Add((IElement)new Paragraph(" ", font2));
        //    DataTable dataTable5 = new DataTable();
        //    DataTable table4 = this.dal.getBuscarClientePorId(id).Tables[0];
        //    PdfPTable pdfPtable3 = new PdfPTable(4);
        //    foreach (DataRow row in (InternalDataCollectionBase)table4.Rows)
        //    {
        //        string str4 = row["RUT_PADRE"].ToString();
        //        if (str4.Trim() != string.Empty)
        //        {
        //            string str5 = row["RAZON_PADRE"].ToString();
        //            row["DIRECCION_PADRE"].ToString();
        //            string str6 = row["TELEFONO_PADRE"].ToString();
        //            string str7 = row["GIRO_PADRE"].ToString();
        //            document.Add((IElement)new Paragraph(" ", font2));
        //            Chunk chunk2 = new Chunk("Datos Cliente Principal", FontFactory.GetFont("ARIAL", 9f, 1));
        //            chunk2.SetUnderline(0.1f, -2f);
        //            document.Add((IElement)chunk2);
        //            float[] relativeWidths2 = new float[4]
        //            {
        //                35f,
        //                95f,
        //                35f,
        //                55f
        //            };
        //            pdfPtable3.SetWidths(relativeWidths2);
        //            pdfPtable3.AddCell((Phrase)new Paragraph("Rut :", font7));
        //            pdfPtable3.AddCell((Phrase)new Paragraph(str4, font2));
        //            pdfPtable3.AddCell((Phrase)new Paragraph("Nombre :", font7));
        //            pdfPtable3.AddCell((Phrase)new Paragraph(str5, font2));
        //            pdfPtable3.AddCell((Phrase)new Paragraph("Dirección :", font7));
        //            pdfPtable3.AddCell((Phrase)new Paragraph(str5, font2));
        //            pdfPtable3.AddCell((Phrase)new Paragraph("Teléfono:", font7));
        //            pdfPtable3.AddCell((Phrase)new Paragraph(str6, font2));
        //            pdfPtable3.AddCell((Phrase)new Paragraph("Giro :", font7));
        //            pdfPtable3.AddCell((Phrase)new Paragraph(str7, font2));
        //            pdfPtable3.AddCell((Phrase)new Paragraph(" ", font7));
        //            pdfPtable3.AddCell((Phrase)new Paragraph(" ", font2));
        //            pdfPtable3.HorizontalAlignment = 0;
        //            pdfPtable3.WidthPercentage = 100f;
        //        }
        //    }
        //    document.Add((IElement)pdfPtable3);
        //    document.Add((IElement)new Paragraph(" ", font2));
        //    Chunk chunk3 = new Chunk("Detalle Cotización", FontFactory.GetFont("ARIAL", 9f, 1));
        //    chunk3.SetUnderline(0.1f, -2f);
        //    document.Add((IElement)chunk3);
        //    document.Add((IElement)new Paragraph(" ", font2));
        //    PdfPTable pdfPtable4 = new PdfPTable(5);
        //    pdfPtable4.AddCell((Phrase)new Paragraph("Código", font7));
        //    pdfPtable4.AddCell((Phrase)new Paragraph("Producto", font7));
        //    pdfPtable4.AddCell((Phrase)new Paragraph("Cantidad", font7));
        //    pdfPtable4.AddCell((Phrase)new Paragraph("Monto Uni", font7));
        //    pdfPtable4.AddCell((Phrase)new Paragraph("Valor Final", font7));
        //    float[] relativeWidths3 = new float[5]
        //    {
        //        35f,
        //        105f,
        //        25f,
        //        35f,
        //        25f
        //    };
        //    pdfPtable4.SetWidths(relativeWidths3);
        //    DataTable dataTable6 = new DataTable();
        //    DataTable table5 = this.dal.getBuscarCotizacionDetalle(cotizacion).Tables[0];
        //    string empty18 = string.Empty;
        //    string empty19 = string.Empty;
        //    string empty20 = string.Empty;
        //    string empty21 = string.Empty;
        //    string empty22 = string.Empty;
        //    string empty23 = string.Empty;
        //    string empty24 = string.Empty;
        //    int num1 = 0;
        //    foreach (DataRow row in (InternalDataCollectionBase)table5.Rows)
        //    {
        //        string str4 = row["CODIGO"].ToString();
        //        string str5 = row["NOM_PRODUCTO"].ToString();
        //        string str6 = row["CANTIDAD"].ToString();
        //        string str7 = row["DESCUENTO"].ToString();
        //        string str8 = row["PORC_DESCUENTO"].ToString();
        //        double num2 = Convert.ToDouble(row["MONTO_NETO"].ToString()) / Convert.ToDouble(str6);
        //        string str9 = num2.ToString("n0");
        //        num2 = Convert.ToDouble(str9) * Convert.ToDouble(str6);
        //        string str10 = num2.ToString("n0");
        //        if (str8 == string.Empty)
        //            str8 = "0";
        //        int num3 = Convert.ToDecimal(str8) <= Decimal.Zero ? 1 : 0;
        //        if (str7 == string.Empty)
        //            str7 = "0";
        //        if (str7 != string.Empty)
        //            empty23 = Convert.ToInt32(Convert.ToDouble(str7)).ToString("n0");
        //        PdfPCell cell3 = new PdfPCell((Phrase)new Paragraph(str4, font2));
        //        cell3.BorderColorBottom = BaseColor.WHITE;
        //        cell3.Border = 0;
        //        cell3.Border = 8;
        //        cell3.Border = 4;
        //        pdfPtable4.AddCell(cell3);
        //        PdfPCell cell4 = new PdfPCell((Phrase)new Paragraph(str5, font2));
        //        cell4.BorderColorBottom = BaseColor.WHITE;
        //        cell4.Border = 0;
        //        cell4.Border = 8;
        //        cell4.Border = 4;
        //        pdfPtable4.AddCell(cell4);
        //        PdfPCell cell5 = new PdfPCell((Phrase)new Paragraph(str6, font2));
        //        cell5.HorizontalAlignment = 2;
        //        cell5.BorderColorBottom = BaseColor.WHITE;
        //        cell5.Border = 0;
        //        cell5.Border = 8;
        //        cell5.Border = 4;
        //        pdfPtable4.AddCell(cell5);
        //        PdfPCell cell6 = new PdfPCell((Phrase)new Paragraph(str9, font2));
        //        cell6.HorizontalAlignment = 2;
        //        cell6.BorderColorBottom = BaseColor.WHITE;
        //        cell6.Border = 0;
        //        cell6.Border = 8;
        //        cell6.Border = 4;
        //        pdfPtable4.AddCell(cell6);
        //        PdfPCell cell7 = new PdfPCell((Phrase)new Paragraph(str10, font2));
        //        cell7.HorizontalAlignment = 2;
        //        cell7.Border = 0;
        //        cell7.Border = 8;
        //        cell7.Border = 4;
        //        pdfPtable4.AddCell(cell7);
        //        ++num1;
        //    }
        //    PdfPCell cell8 = new PdfPCell((Phrase)new Paragraph(" ", font2));
        //    cell8.HorizontalAlignment = 2;
        //    cell8.BorderColorBottom = BaseColor.WHITE;
        //    cell8.Border = 0;
        //    cell8.Border = 1;
        //    PdfPCell cell9 = new PdfPCell((Phrase)new Paragraph(" ", font2));
        //    cell9.BorderColorBottom = BaseColor.WHITE;
        //    cell9.Border = 0;
        //    PdfPCell cell10 = new PdfPCell((Phrase)new Paragraph(" ", font2));
        //    cell10.HorizontalAlignment = 2;
        //    cell10.BorderColorBottom = BaseColor.WHITE;
        //    cell10.Border = 0;
        //    cell10.Border = 8;
        //    cell10.Border = 4;
        //    PdfPCell cell11 = new PdfPCell((Phrase)new Paragraph(" ", font2));
        //    cell11.HorizontalAlignment = 2;
        //    cell11.BorderColorBottom = BaseColor.WHITE;
        //    cell11.Border = 0;
        //    cell11.Border = 8;
        //    cell11.Border = 4;
        //    PdfPCell cell12 = new PdfPCell((Phrase)new Paragraph(" ", font2));
        //    cell12.HorizontalAlignment = 2;
        //    cell12.BorderColorBottom = BaseColor.WHITE;
        //    cell12.Border = 0;
        //    cell12.Border = 8;
        //    cell12.Border = 4;
        //    PdfPCell cell13 = new PdfPCell((Phrase)new Paragraph(" ", font2));
        //    cell13.HorizontalAlignment = 2;
        //    cell13.BorderColorBottom = BaseColor.WHITE;
        //    cell13.Border = 0;
        //    cell13.Border = 8;
        //    cell13.Border = 4;
        //    PdfPCell cell14 = new PdfPCell((Phrase)new Paragraph(" ", font2));
        //    cell14.HorizontalAlignment = 2;
        //    cell14.BorderColorBottom = BaseColor.WHITE;
        //    cell14.Border = 0;
        //    cell14.Border = 8;
        //    cell14.Border = 4;
        //    pdfPtable4.AddCell(cell10);
        //    pdfPtable4.AddCell(cell11);
        //    pdfPtable4.AddCell(cell12);
        //    pdfPtable4.AddCell(cell13);
        //    pdfPtable4.AddCell(cell14);
        //    string empty25 = string.Empty;
        //    string empty26 = string.Empty;
        //    string empty27 = string.Empty;
        //    DataTable dataTable7 = new DataTable();
        //    DataTable table6 = this.dal.getBuscarCotizacionPorId(cotizacion).Tables[0];
        //    string empty28 = string.Empty;
        //    pdfPtable4.HorizontalAlignment = 0;
        //    pdfPtable4.WidthPercentage = 100f;
        //    foreach (PdfPCell cell3 in pdfPtable4.Rows[0].GetCells())
        //    {
        //        cell3.BackgroundColor = BaseColor.LIGHT_GRAY;
        //        cell3.HorizontalAlignment = 1;
        //        cell3.Padding = 2f;
        //    }
        //    int count1 = pdfPtable4.Rows.Count;
        //    for (int index = 1; index < count1; ++index)
        //    {
        //        foreach (PdfPCell cell3 in pdfPtable4.Rows[index].GetCells())
        //        {
        //            int count2 = pdfPtable4.Rows.Count;
        //            cell3.Border = 15;
        //            cell3.DisableBorderSide(1);
        //            cell3.DisableBorderSide(2);
        //        }
        //    }
        //    foreach (DataRow row in (InternalDataCollectionBase)table6.Rows)
        //    {
        //        row["MONTO_NETO"].ToString();
        //        row["MONTO_IVA"].ToString();
        //        row["MONTO_TOTAL"].ToString();
        //        pdfPtable4.AddCell(cell8);
        //        pdfPtable4.AddCell(cell8);
        //        pdfPtable4.AddCell(cell8);
        //        pdfPtable4.AddCell((Phrase)new Paragraph(" Neto", font2));
        //        pdfPtable4.AddCell(new PdfPCell((Phrase)new Paragraph("$" + Convert.ToInt32(row["MONTO_NETO"]).ToString("n0"), font2))
        //        {
        //            HorizontalAlignment = 2
        //        });
        //        if (Convert.ToDouble(empty13) > 0.0)
        //        {
        //            pdfPtable4.AddCell(cell9);
        //            pdfPtable4.AddCell(cell9);
        //            pdfPtable4.AddCell(cell9);
        //            pdfPtable4.AddCell((Phrase)new Paragraph(" Descuento Pago Contado", font2));
        //            pdfPtable4.AddCell((Phrase)new Paragraph("$" + empty13, font2));
        //        }
        //        pdfPtable4.AddCell(cell9);
        //        pdfPtable4.AddCell(cell9);
        //        pdfPtable4.AddCell(cell9);
        //        pdfPtable4.AddCell((Phrase)new Paragraph(" 19% I.V.A.", font2));
        //        pdfPtable4.AddCell(new PdfPCell((Phrase)new Paragraph("$" + Convert.ToInt32(row["MONTO_IVA"]).ToString("n0"), font2))
        //        {
        //            HorizontalAlignment = 2
        //        });
        //        cell9.DisableBorderSide(2);
        //        pdfPtable4.AddCell(cell9);
        //        pdfPtable4.AddCell(cell9);
        //        pdfPtable4.AddCell(cell9);
        //        pdfPtable4.AddCell((Phrase)new Paragraph(" Total", font2));
        //        pdfPtable4.AddCell(new PdfPCell((Phrase)new Paragraph("$" + Convert.ToInt32(row["MONTO_TOTAL"]).ToString("n0"), font2))
        //        {
        //            HorizontalAlignment = 2
        //        });
        //        empty28 = row["OBSERVACION"].ToString();
        //    }
        //    document.Add((IElement)pdfPtable4);
        //    document.Add((IElement)new Paragraph(" ", font2));
        //    PdfPTable pdfPtable5 = new PdfPTable(1);
        //    pdfPtable5.AddCell((Phrase)new Paragraph("Observación", font7));
        //    pdfPtable5.WidthPercentage = 100f;
        //    foreach (PdfPCell cell3 in pdfPtable5.Rows[0].GetCells())
        //    {
        //        cell3.BackgroundColor = BaseColor.LIGHT_GRAY;
        //        cell3.HorizontalAlignment = 1;
        //        cell3.Padding = 2f;
        //    }
        //    pdfPtable5.AddCell((Phrase)new Paragraph(empty28, font2));
        //    document.Add((IElement)pdfPtable5);
        //    string str11 = "";
        //    foreach (DataRow row in (InternalDataCollectionBase)this.dal.getBuscarParametros(idEmpresa).Tables[0].Rows)
        //        str11 = row["VIGENCIA_COTIZACION_DIAS"].ToString();
        //    document.Add((IElement)new Paragraph(" Le envia esta cotización " + this.Session["variableNombreEjecutivo"].ToString(), font3));
        //    document.Add((IElement)new Paragraph(" FECHA DE ENTREGA: A CONVENIR.", font2));
        //    document.Add((IElement)new Paragraph(" VALIDEZ DE LA OFERTA: " + str11 + " DIAS CORRIDOS O HASTA TERMINAR STOCK.", font3));
        //    document.Add((IElement)new Paragraph(" ", font2));
        //    PdfPTable pdfPtable6 = new PdfPTable(1);
        //    pdfPtable6.AddCell((Phrase)new Paragraph("Condición Venta", font7));
        //    pdfPtable6.WidthPercentage = 100f;
        //    float[] relativeWidths4 = new float[1] { 35f };
        //    pdfPtable6.SetWidths(relativeWidths4);
        //    foreach (PdfPCell cell3 in pdfPtable6.Rows[0].GetCells())
        //    {
        //        cell3.BackgroundColor = BaseColor.LIGHT_GRAY;
        //        cell3.HorizontalAlignment = 1;
        //        cell3.Padding = 2f;
        //    }
        //    DataTable dataTable8 = new DataTable();
        //    foreach (DataRow row in (InternalDataCollectionBase)this.dal.getBuscarCondicionVenta(idCondicionVenta).Tables[0].Rows)
        //        pdfPtable6.AddCell((Phrase)new Paragraph(row["GLOSA"].ToString(), font2));
        //    document.Add((IElement)pdfPtable6);
        //    document.Add((IElement)new Paragraph(" ", font2));
        //    document.Add((IElement)new Paragraph(" DATOS TRANSFERENCIA: ", font3));
        //    document.Add((IElement)new Paragraph(" RAZON SOCIAL: " + this.ddlRazonSocial.SelectedItem.ToString(), font2));
        //    document.Add((IElement)new Paragraph(" BANCO: " + empty6, font2));
        //    document.Add((IElement)new Paragraph(" RUT: " + empty3, font2));
        //    document.Add((IElement)new Paragraph(" CUENTA CTE: " + empty7, font2));
        //    document.Add((IElement)new Paragraph(" CORREO CONFIRMACION: " + empty1, font2));
        //    document.Add((IElement)new Paragraph(" NOTA: EN ASUNTO DE LA TRANSFERENCIA DEBE INCLUIR EL NUMERO DE LA COTIZACION.", font3));
        //    document.NewPage();
        //    Chunk chunk4 = new Chunk("Productos", FontFactory.GetFont("ARIAL", 11f, 1));
        //    chunk4.SetUnderline(0.1f, -2f);
        //    document.Add((IElement)new Paragraph(chunk4)
        //    {
        //        Alignment = 1
        //    });
        //    document.Add((IElement)new Paragraph(" ", font2));
        //    PdfPTable pdfPtable7 = new PdfPTable(4);
        //    pdfPtable7.AddCell((Phrase)new Paragraph("Código", font7));
        //    pdfPtable7.AddCell((Phrase)new Paragraph("Producto", font7));
        //    pdfPtable7.AddCell((Phrase)new Paragraph("Observación", font7));
        //    pdfPtable7.AddCell((Phrase)new Paragraph("Imagen", font7));
        //    float[] relativeWidths5 = new float[4]
        //    {
        //35f,
        //35f,
        //105f,
        //35f
        //    };
        //    pdfPtable7.SetWidths(relativeWidths5);
        //    DataTable dataTable9 = new DataTable();
        //    DataTable table7 = this.dal.getBuscarImagenesProductoPorCotizacion(cotizacion).Tables[0];
        //    foreach (DataRow row in (InternalDataCollectionBase)table7.Rows)
        //    {
        //        pdfPtable7.AddCell((Phrase)new Paragraph(row["CODIGO"].ToString(), font2));
        //        pdfPtable7.AddCell((Phrase)new Paragraph(row["NOM_PRODUCTO"].ToString(), font2));
        //        pdfPtable7.AddCell((Phrase)new Paragraph(row["OBSERVACION_PROD"].ToString(), font2));
        //        string path2 = row["IMAGEN"].ToString();
        //        if (path2 == string.Empty)
        //        {
        //            pdfPtable7.AddCell((Phrase)new Paragraph("Sin Imagen", font2));
        //        }
        //        else
        //        {
        //            iTextSharp.text.Image instance2 = iTextSharp.text.Image.GetInstance(this.Server.MapPath(path2));
        //            instance2.ScaleToFit(120f, 120f);
        //            instance2.Alignment = 0;
        //            pdfPtable7.AddCell(instance2);
        //        }
        //    }
        //    document.Add((IElement)pdfPtable7);
        //    foreach (DataRow row in (InternalDataCollectionBase)table7.Rows)
        //    {
        //        int num2 = row["FICHA_TECNICA_PDF"].ToString() == string.Empty ? 1 : 0;
        //    }
        //    document.Close();
        //    string str12 = "cotizaciones/" + str2;
        //    this.hfrutaArchivoPdf.Value = str12;
        //    return str12;
        //}

    }
}