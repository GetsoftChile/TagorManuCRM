using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;

namespace ModCompras
{
    public partial class Sitio : System.Web.UI.MasterPage
    {
        Datos dal = new Datos();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Page.IsPostBack)
                {
                    if (Session["variableIdUsuario"] == null)
                    {
                        Response.Redirect("Login.aspx");
                    }
                    else
                    {
                        visible();
                        perfiles();
                    }
                }
            }
            catch (Exception ex)
            {
                string ss = ex.Message;
            }
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            try
            {
                Session["variableUsuario"] = null;
                Session.Clear();
                Session.Abandon();

                Response.Redirect("Login.aspx");
            }
            catch (Exception ex)
            {
                string ss = ex.Message;
            }
        }

        void perfiles()
        {
            string idPerfil = Session["variableIdPerfil"].ToString();
            if (idPerfil == "1")
            {
                lblEmpresa.Text = "Tagor";
                
            }

            if (idPerfil == "2")
            {
                
                
                lblEmpresa.Text = Session["variableEmpresa"].ToString();
            }

            if (idPerfil == "3")
            {
               
                lblEmpresa.Text = Session["variableEmpresa"].ToString();
            }

            if (idPerfil == "4")
            {
                

                lblEmpresa.Text = Session["variableEmpresa"].ToString();
            }

            if (idPerfil == "5")
            {
               
                lblEmpresa.Text = Session["variableEmpresa"].ToString();
            }

            if (idPerfil == "6")
            {
               
                lblEmpresa.Text = Session["variableEmpresa"].ToString();
            }

        }

        void visible()
        {
            //DataTable dt = new DataTable();
            //dt = dal.getBuscarParametro("1").Tables[0];

            //foreach (DataRow item in dt.Rows)
            //{
            //    string campo1 = item["NOMBRE_CAMPO1"].ToString();
            //    string campo2 = item["NOMBRE_CAMPO2"].ToString();
            //    string campo3 = item["NOMBRE_CAMPO3"].ToString();
            //    string campo4 = item["NOMBRE_CAMPO4"].ToString();
            //    string campo5 = item["NOMBRE_CAMPO5"].ToString();
            //    string gestion = item["GESTION_ADJUNTO"].ToString();


            //}

        }
    }
}