using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using iTextSharp.text.pdf;
using iTextSharp.text;
using System.IO;
using System.Data;
using System.Drawing;

namespace TagorManuCRM
{
    public partial class GeneraFactura : System.Web.UI.Page
    {
        Comun com = new Comun();
        Datos dal = new Datos();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                lblInfo.Text = "";
                divAlerta.Visible = false;

                if (!Page.IsPostBack)
                {

                    DateTime Hoy = DateTime.Today;
                    int ano = Hoy.Year;
                    int mes = Hoy.Month;

                    ddlAno.SelectedValue = ano.ToString();
                    ddlMes.SelectedValue = mes.ToString();
                    com.FillCategoriaServicio(ddlCategoriaServicio);
                    com.FillArea(ddlArea);
                    Local();
                }
            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
                divAlerta.Visible = true;

            }
        }

        void Local()
        {
            ddlLocal.DataSource = dal.getBuscarLocalPorZona(null, null);
            ddlLocal.DataTextField = "COD_LOCAL";
            ddlLocal.DataValueField = "COD_LOCAL";
            ddlLocal.DataBind();
        }

        protected void lbtnGeneraFacturacion_Click(object sender, EventArgs e)
        {
            try
            {
                string idFacturacion = "1";

                if (!fuOC.HasFile)
                {
                    lblInfo.Text = "Favor ingresar un archivo PDF de Orden de Compra!";
                    divAlerta.Attributes["class"] = "alert alert-danger";
                    divAlerta.Visible = true;
                    return;
                }
                if (!fuFacturas.HasFile)
                {
                    lblInfo.Text = "Favor ingresar un archivo PDF de factura!";
                    divAlerta.Attributes["class"] = "alert alert-danger";
                    divAlerta.Visible = true;
                    return;
                }
                //if (!fuInforme.HasFile)
                //{
                //    lblInfo.Text = "Favor ingresar un archivo PDF de informe!";
                //    divAlerta.Attributes["class"] = "alert alert-danger";
                //    divAlerta.Visible = true;
                //    return;
                //}

                if (fuOC.HasFile)
                {
                    string extension = System.IO.Path.GetExtension(fuOC.FileName);
                    if (extension == ".pdf")
                    {
                        fuOC.SaveAs(Server.MapPath("Facturacion/temp/" + idFacturacion +"_OC_"+ fuOC.FileName));
                    }
                    else
                    {
                        lblInfo.Text = "Favor ingresar solo archivos de tipo pdf!";
                        divAlerta.Attributes["class"] = "alert alert-danger";
                        divAlerta.Visible = true;
                        return;
                    }
                }
                if (fuFacturas.HasFile)
                {
                    string extension = System.IO.Path.GetExtension(fuFacturas.FileName);
                    if (extension == ".pdf")
                    {
                        fuFacturas.SaveAs(Server.MapPath("Facturacion/temp/" + idFacturacion + "_FAC_" + fuFacturas.FileName));
                    }
                    else
                    {
                        lblInfo.Text = "Favor ingresar solo archivos de tipo pdf!";
                        divAlerta.Attributes["class"] = "alert alert-danger";
                        divAlerta.Visible = true;
                        return;
                    }
                }
                if (fuInforme.HasFile)
                {
                    string extension = System.IO.Path.GetExtension(fuInforme.FileName);
                    if (extension == ".pdf")
                    {
                        fuInforme.SaveAs(Server.MapPath("Facturacion/temp/" + idFacturacion + "_INF_" + fuInforme.FileName));
                    }
                    else
                    {
                        lblInfo.Text = "Favor ingresar solo archivos de tipo pdf!";
                        divAlerta.Attributes["class"] = "alert alert-danger";
                        divAlerta.Visible = true;
                        return;
                    }
                }
                
                string ruta = generaPdf(idFacturacion);

                string nombreArchivo = "Fac_"+ddlMes.SelectedValue+"_"+ddlAno.SelectedValue+"_"+ddlLocal.SelectedValue+".pdf";

                MergePDFs(Server.MapPath("Facturacion/"+ nombreArchivo), 
                    Server.MapPath("Facturacion/temp/" + idFacturacion + "_FAC_" + fuFacturas.FileName), 
                    Server.MapPath("Facturacion/temp/" + idFacturacion + "_OC_" + fuOC.FileName),
                    Server.MapPath(ruta)/*,
                    Server.MapPath("Facturacion/temp/" + idFacturacion + "_INF_" + fuInforme.FileName)*/
                    );

                FileInfo fi = new FileInfo(Server.MapPath("Facturacion/" + nombreArchivo));
                string extensiones = fi.Extension.ToString().ToLower();
                Response.ContentType = extensiones;
                Response.AppendHeader("Content-Disposition", "attachment; filename=" + fi.Name);
                Response.TransmitFile(fi.FullName);
                Response.End();

                //MergePDFs(Server.MapPath("Facturacion/output.pdf"), ots);

            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
                divAlerta.Visible = true;

            }
        }


        protected void ddlArea_DataBound1(object sender, EventArgs e)
        {
            ddlArea.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Todos", "0"));
        }

        private static void InsertImageToPdf(string sourceFileName, string imageFileName, string newFileName)
        {
            using (Stream pdfStream = new FileStream(sourceFileName, FileMode.Open))
            using (Stream imageStream = new FileStream(imageFileName, FileMode.Open))
            using (Stream newpdfStream = new FileStream(newFileName, FileMode.Create, FileAccess.ReadWrite))
            {
                PdfReader pdfReader = new PdfReader(pdfStream);
                PdfStamper pdfStamper = new PdfStamper(pdfReader, newpdfStream);
                PdfContentByte pdfContentByte = pdfStamper.GetOverContent(1);
                iTextSharp.text.Image image = iTextSharp.text.Image.GetInstance(imageStream);
                image.SetAbsolutePosition(300, 600);
                pdfContentByte.AddImage(image);
                pdfStamper.Close();
            }
        }

        public string generaPdf(string idFacturacion)
        {
            string nombreArchivoPdf = "OTS_" + idFacturacion + ".pdf";
            Document doc = new Document(PageSize.A4, 25, 25, 30, 30);
            PdfWriter writePdf = PdfWriter.GetInstance(doc, new FileStream(Server.MapPath("Facturacion/temp/" + nombreArchivoPdf), FileMode.Create));
            writePdf.CompressionLevel = PdfStream.BEST_COMPRESSION;
            doc.Open();
        
            foreach (GridViewRow row in grvTickets.Rows)
            {
                //var cb_sty = (HtmlInputCheckBox)row.FindControl("CHK_STY");
                //DropDownList ddl_distro = (DropDownList)row.FindControl("ddlDistros");
                Label _lblArchivo = (Label)row.FindControl("lblArchivo");
                string extension = System.IO.Path.GetExtension(_lblArchivo.Text.ToLower());

                


                if (extension==".pdf")
                {
                    PdfReader pdfReader = new PdfReader(_lblArchivo.Text);
                    PdfImportedPage page = writePdf.GetImportedPage(pdfReader,1);
                    doc.Add(iTextSharp.text.Image.GetInstance(page));
                    pdfReader.Close();
                }
                else
                {
                    //Stream imageStream = new FileStream(Server.MapPath(_lblArchivo.Text), FileMode.Open);
                    //System.Drawing.Image image = System.Drawing.Image.FromFile(Server.MapPath(_lblArchivo.Text));
                    //iTextSharp.text.Image jpg = iTextSharp.text.Image.GetInstance(image,BaseColor.WHITE);

                    iTextSharp.text.Image jpg = iTextSharp.text.Image.GetInstance(Server.MapPath(_lblArchivo.Text));
                    //jpg.Rotation = 90;
                    //jpg.ScaleToFit(80, 80);
                    //jpg.ScalePercent(70f);
                    //jpg.Rotation = (float)Math.PI / 2;


                    if (jpg.Width > jpg.Height)
                    {
                        jpg.RotationDegrees = 270f;
                    }
                   
                    jpg.Alignment = iTextSharp.text.Image.ALIGN_CENTER;

                    //jpg.ScaleToFit(250f,250f);
                    jpg.ScaleToFit(doc.PageSize.Width -50, doc.PageSize.Height);
                    //jpg.CompressionLevel = PdfStream.BEST_COMPRESSION;
                    //jpg.ScaleAbsolute(doc.PageSize.Width - 50, doc.PageSize.Height);
                    //jpg.SetAbsolutePosition(doc.PageSize.Width - 36f - 72f,
                    //doc.PageSize.Height - 36f - 216.6f);
                    
                    doc.Add(jpg);
                }
            }
            
            doc.Close();

            string ruta = "Facturacion/temp/" + nombreArchivoPdf; ;
            return ruta;
        }


        protected void ddlCategoriaServicio_DataBound(object sender, EventArgs e)
        {

            ddlCategoriaServicio.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Seleccione", "0"));
        }

        protected void ddlLocal_DataBound(object sender, EventArgs e)
        {
            ddlLocal.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Seleccione", "0"));
        }

        protected void lbtnSubirFacturas_Click(object sender, EventArgs e)
        {
            try
            {

            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
                divAlerta.Visible = true;

            }
        }

        protected void lbtnBuscar_Click(object sender, EventArgs e)
        {
            try
            {
                int mes = Convert.ToInt32(ddlMes.SelectedValue);
                int ano = Convert.ToInt32(ddlAno.SelectedValue);
                string local = ddlLocal.SelectedValue;
                string idCategoriaServicio = ddlCategoriaServicio.SelectedValue;
                string idArea = ddlArea.SelectedValue;
                
                DateTime fecha1;
                DateTime fecha2;
                
                fecha1 = new DateTime(ano, mes, 1);
                fecha2 = new DateTime(ano, mes + 1, 1).AddDays(-1);

                string fechaDesde = fecha1.ToShortDateString().Replace("/", "-");
                string fechaHasta = fecha2.ToShortDateString().Replace("/", "-");
                
                BuscarTicket(fechaDesde, fechaHasta, local, idCategoriaServicio, idArea);
            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
                divAlerta.Visible = true;
            }
        }


        void BuscarTicket(string fechaDesde, string fechaHasta, string codLocal, string idCategoriaServicio, string idArea)
        {
            DataTable dt = new DataTable();
            dt = dal.getBuscarTicketBuscadorParametros(null, null, fechaDesde, fechaHasta, "3", "P",idArea, null, null, codLocal, idCategoriaServicio).Tables[0];
        
            grvTickets.DataSource = dt;
            grvTickets.DataBind();

            if (dt.Rows.Count >0)
            {
                divFacturacion.Visible = true;
            }
            else
            {
                divFacturacion.Visible = false;
            }
        }

        protected void btnArchivo_Click(object sender, EventArgs e)
        {
            try
            {
                LinkButton btn = (LinkButton)sender;
                GridViewRow row = (GridViewRow)btn.NamingContainer;
                Label _lblArchivo = (Label)grvTickets.Rows[row.RowIndex].FindControl("lblArchivo");
                ScriptManager.RegisterStartupScript(this, this.GetType(), UniqueID, "window.open('" + _lblArchivo.Text + "','_blank');", true);
            }
            catch (Exception ex)
            {
                lblInfo.Text = ex.Message;
                divAlerta.Attributes["class"] = "alert alert-danger";
                divAlerta.Visible = true;
            }
        }


        static void CreateMergedPDF(string targetPDF, string sourceDir)
        {
            using (FileStream stream = new FileStream(targetPDF, FileMode.Create))
            {
                Document pdfDoc = new Document(PageSize.A4);
                PdfCopy pdf = new PdfCopy(pdfDoc, stream);
                pdfDoc.Open();
                var files = Directory.GetFiles(sourceDir);
                Console.WriteLine("Merging files count: " + files.Length);
                int i = 1;
                foreach (string file in files)
                {
                    Console.WriteLine(i + ". Adding: " + file);
                    pdf.AddDocument(new PdfReader(file));
                    i++;
                }

                if (pdfDoc != null)
                    pdfDoc.Close();

                Console.WriteLine("SpeedPASS PDF merge complete.");
            }
        }

        private void MergePDFs(string outPutFilePath, params string[] filesPath)
        {
            List<PdfReader> readerList = new List<PdfReader>();
            
            foreach (string filePath in filesPath)
            {
                //using (PdfReader pdfReader = new PdfReader(filePath))
                //{
                //    readerList.Add(pdfReader);
                //}

                PdfReader pdfReader = new PdfReader(filePath);
                readerList.Add(pdfReader);
                //try
                //{
                //    readerList.Add(pdfReader);
                //}
                //finally
                //{
                //    pdfReader.Dispose();
                //}
            }

            //Define a new output document and its size, type
            Document document = new Document(PageSize.A4, 0, 0, 0, 0);
            //Create blank output pdf file and get the stream to write on it.
            PdfWriter writer = PdfWriter.GetInstance(document, new FileStream(outPutFilePath, FileMode.Create));
            document.Open();

            //PdfReader reader = new PdfReader(readerList);

            foreach (PdfReader reader in readerList)
            {
                    for (int i = 1; i <= reader.NumberOfPages; i++)
                    {
                        PdfImportedPage page = writer.GetImportedPage(reader, i);
                        document.Add(iTextSharp.text.Image.GetInstance(page));
                    }
                //reader.Close();
            }
            

            writer.CompressionLevel = PdfStream.BEST_COMPRESSION;
            
            document.Close();

            foreach (PdfReader reader in readerList)
            {
                reader.Close();
            }
        }

    }
}