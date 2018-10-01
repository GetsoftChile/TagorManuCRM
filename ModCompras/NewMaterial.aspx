<%@ Page Title="" Language="C#" MasterPageFile="~/Sitio.Master" AutoEventWireup="true" CodeBehind="NewMaterial.aspx.cs" Inherits="ModCompras.NewMaterial" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">

    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>Materiales
        </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
            <li><a href="#">Administración</a></li>
            <li class="active">Materiales</li>
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
            </div>
            <div class="box-body">
                <div class="row">
                    <div class="col-md-5">
                        <div class="form-group">
                            <asp:HiddenField ID="hfId" runat="server" />
                            <label for="txtMaterial">Nombre Material:</label>
                            <asp:TextBox ID="txtMaterial" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="ddlTipo">Tipo:</label>
                            <asp:DropDownList ID="ddlTipo" runat="server" CssClass="form-control input-sm">
                            </asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <label for="txtClave">Unidad:</label>
                            <asp:TextBox ID="txtUnidad" runat="server"  CssClass="form-control input-sm"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
            <div class="box-footer">
                <asp:Button ID="btnGuardar" Text="Guardar" CssClass="btn btn-success" OnClick="btnGuardar_Click" runat="server" />
                <asp:Button ID="btnCancelar" Text="Cancelar" CssClass="btn btn-default" OnClick="btnCancelar_Click" runat="server" />
            </div>
        </div>


    </section>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
