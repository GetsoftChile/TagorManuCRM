<%@ Page Title="" Language="C#" MasterPageFile="~/Sitio.Master" AutoEventWireup="true" CodeBehind="NewOrdenCompra.aspx.cs" Inherits="ModCompras.NewOrdenCompra" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">

    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>Ingreso de Orden de Compra
        </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
            <li><a href="#">Ordenes de Compra</a></li>
            <li class="active">Ingreso de Ordenes de Compra</li>
        </ol>
    </section>

    
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
    <section class="invoice">
        <!-- Alertas -->
        <div id="divAlerta" runat="server" visible="false" class="alert alert-danger">
            <strong>Atención!: </strong>
            <asp:Label Text="" ID="lblInfo" runat="server" />
        </div>

                <!-- title row -->
                <div class="row">
                    <div class="col-xs-12">
                        <h2 class="page-header">
                            <i class="fa fa-pencil"></i>Orden de Compra Nº
                            <asp:Label ID="lblNumeroOrdenCompra" runat="server" Font-Bold="true"></asp:Label>
                            <asp:Label ID="lblIdSolcom" runat="server" Font-Bold="true" Visible="false"></asp:Label>
                            <small class="pull-right">Fecha:
                        <asp:Label ID="lblFechaHoy" runat="server" Font-Bold="true"></asp:Label>
                            </small>
                        </h2>
                    </div>
                    <!-- /.col -->
                </div>

                <div class="box box-danger">
                    <div class="box-header">
                        <h3 class="box-title">DATOS RECEPTOR</h3>
                    </div>
                    <div class="box-body">
                        <div class="row">
                            <div class="col-lg-3">
                                <div class="input-group">
                                    <span class="input-group-addon" id="basic-addon2">R.U.T.</span>
                                    <asp:TextBox ID="txtRutProveedor" runat="server" CssClass="form-control input-sm" MaxLength="10"></asp:TextBox>
                                    <asp:HiddenField ID="hfIdProveedor" runat="server" />
                                    <asp:FilteredTextBoxExtender ID="ftbeDescuento1" runat="server"
                                        TargetControlID="txtRutProveedor" ValidChars="1234567890-" />
                                    <span class="input-group-btn">
                                        <asp:LinkButton ID="lbtnBuscarProveedor" OnClick="lbtnBuscarProveedor_Click" ToolTip="Buscar Proveedor" CssClass="btn btn-primary btn-sm" runat="server"><i aria-hidden="true" class="glyphicon glyphicon-search"></i></asp:LinkButton>
                                    </span>
                                </div>
                            </div>
                            <div class="col-lg-9">
                                <div class="input-group">
                                    <span class="input-group-addon" id="basic-addon3">Razon Social</span>
                                    <asp:TextBox ID="txtRazonSocial" Enabled="false" runat="server" CssClass="form-control input-sm" ClientIDMode="Static"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="input-group">
                                    <span class="input-group-addon" id="basic-addon4">Dirección</span>
                                    <asp:TextBox ID="txtDireccion" Enabled="false" runat="server" CssClass="form-control input-sm" ClientIDMode="Static"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="input-group">
                                    <span class="input-group-addon" id="basic-addon5">Teléfono</span>
                                    <asp:TextBox ID="txtTelefono" Enabled="false" runat="server" CssClass="form-control input-sm" ClientIDMode="Static"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="input-group">
                                    <span class="input-group-addon" id="basic-addon6">Email</span>
                                    <asp:TextBox ID="txtEmail" Enabled="false" runat="server" CssClass="form-control input-sm" ClientIDMode="Static"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="input-group">
                                    <span class="input-group-addon" id="basic-addon7">Giro</span>
                                    <asp:TextBox ID="txtGiro" Enabled="false" runat="server" CssClass="form-control input-sm" ClientIDMode="Static"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="input-group">
                                    <span class="input-group-addon" id="basic-addon8">Actividad Comercial</span>
                                    <asp:TextBox ID="txtActividadComercial" Enabled="false" runat="server" CssClass="form-control input-sm" ClientIDMode="Static"></asp:TextBox>
                                </div>
                            </div>
                        </div>


                    </div>
                </div>

                <div class="box box-danger">
                    <div class="box-header">
                        <h3 class="box-title">MATERIALES</h3>
                    </div>
                    <div class="box-body">
                        <div style="width: 100%; overflow-y: scroll;">
                            <asp:GridView ID="grvMateriales" runat="server" ClientIDMode="Static" CssClass="table table-hover table-responsive table-condensed"
                                HeaderStyle-CssClass="active" OnRowDataBound="grvMateriales_RowDataBound" BorderColor="Transparent" PagerStyle-CssClass="active" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true">
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkSeleccionar" runat="server" AutoPostBack="true" OnCheckedChanged="chkSeleccionar_CheckedChanged" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Item">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCorrelativo" runat="server" Text='<%# Bind("Correlativo") %>' Visible="true"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Id">
                                        <ItemTemplate>
                                            <asp:Label ID="lblIdMaterial" runat="server" Text='<%# Bind("IdMaterial") %>' Visible="true"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Producto">
                                        <ItemTemplate>
                                            <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("Nombre") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Cantidad">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCantidad" runat="server" Text='<%# Bind("Cantidad") %>' Font-Size="Smaller" CssClass="label label-warning"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Right" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Precio Unitario" HeaderStyle-Width="15%">
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtValorProducto" Enabled="false" runat="server" Text="0"
                                                CssClass="form-control input-sm text-right" OnTextChanged="txtValorProducto_TextChanged" MaxLength="15"
                                                AutoPostBack="true"></asp:TextBox>

                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Right" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Precio Total">
                                        <ItemTemplate>
                                            <asp:Label ID="lblPrecioTotal" runat="server" Font-Size="Large" CssClass="label label-default" Text="0"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Right" />
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>

                        <br />
                        <div class="row">
                            <div class="col-lg-8">
                            </div>
                            <div class="col-lg-4">
                                <div class="input-group">
                                    <span class="input-group-addon" id="basic-addon9">Total Neto</span>
                                    <asp:TextBox ID="txtTotalNeto" Enabled="false" Font-Size="Large" Font-Bold="true" runat="server" CssClass="form-control input-sm text-right" ClientIDMode="Static"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-8">
                            </div>
                            <div class="col-lg-4">
                                <div class="input-group">
                                    <span class="input-group-addon" id="basic-addon10">IVA 19%</span>
                                    <asp:TextBox ID="txtIva" Enabled="false" Font-Size="Large" Font-Bold="true" runat="server" CssClass="form-control input-sm text-right" ClientIDMode="Static"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-8">
                            </div>
                            <div class="col-lg-4">
                                <div class="input-group">
                                    <span class="input-group-addon" id="basic-addon11">Total</span>
                                    <asp:TextBox ID="txtTotalConIva" Font-Size="Large" Font-Bold="true" Enabled="false" runat="server" CssClass="form-control input-sm text-right" ClientIDMode="Static"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                </div>


                <div class="box box-danger">
                    <div class="box-header">
                        <h3 class="box-title">Observación</h3>
                    </div>
                    <div class="box-body">
                        <asp:TextBox ID="txtObservaciones" TextMode="MultiLine" runat="server" CssClass="form-control input-sm" Height="100px"></asp:TextBox>
                    </div>
                    <div class="box-footer">
                        <asp:Button ID="btnGuardar" Text="Generar" CssClass="btn btn-success" OnClick="btnGuardar_Click" runat="server" />
                    </div>
                </div>

       

    </section>
         </ContentTemplate>
        </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
