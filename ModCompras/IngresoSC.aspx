<%@ Page Title="" Language="C#" MasterPageFile="~/Sitio.Master" AutoEventWireup="true" CodeBehind="IngresoSC.aspx.cs" Inherits="ModCompras.IngresoSC" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">

     <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>Ingreso SOLCOMP
        </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
            <li><a href="#">SOLCOM (Solicitud de Compra)</a></li>
            <li class="active">Ingreso SOLCOMP</li>
        </ol>
    </section>
    <section class="content">
            <!-- Alertas -->
        <div id="divAlerta" runat="server" visible="false" class="alert alert-danger">
            <strong>Atención!: </strong>
            <asp:Label Text="" ID="lblInfo" runat="server" />
        </div> 
        
        <div class="box box-danger" >
            <div class="box-header">

                <h3 class="box-title">Ingreso de Solicitud de Compra </h3>
                
            </div>
            <div class="box-body">
                <div class="row">
                    <div class="col-md-3">
                        <div class="form-group">
                            <asp:HiddenField ID="hfId" runat="server" />
                            <label for="ddlProyecto">Proyecto:</label>
                            <asp:DropDownList ID="ddlProyecto" runat="server" CssClass="form-control input-sm" ClientIDMode="Static" OnDataBound="ddlProyecto_DataBound">
                            </asp:DropDownList>
                        </div>
                        
                        
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <label for="ddlSucursal">Sucursal:</label>
                            <asp:DropDownList ID="ddlSucursal" runat="server" CssClass="form-control input-sm" ClientIDMode="Static"  OnDataBound="ddlSucursal_DataBound">
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
            </div>
            <div class="box-footer">
                <asp:Button ID="btnGuardar" Text="Guardar" CssClass="btn btn-success" OnClick="btnGuardar_Click" runat="server" />
            </div>
        </div>


        </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
