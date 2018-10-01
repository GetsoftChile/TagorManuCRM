<%@ Page Title="" Language="C#" MasterPageFile="~/Sitio.Master" AutoEventWireup="true" CodeBehind="IngresoSC.aspx.cs" Inherits="ModCompras.IngresoSC" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
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
                    <i class="fa fa-pencil"></i>SOLCOMP Nº
                   
                    <asp:Label ID="lblNumeroSolicitud" runat="server" Font-Bold="true"></asp:Label>
                    <small class="pull-right">Fecha:
                        <asp:Label ID="lblFechaHoy" runat="server" Font-Bold="true"></asp:Label></small>
                </h2>
            </div>
            <!-- /.col -->
        </div>

        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>

                <div class="box box-danger">
                    <div class="box-header">
                        <h3 class="box-title">Ingreso de Solicitud de Compra </h3>
                        <h3 class="box-title pull-right">Estado:
                    <asp:Label ID="lblEstado" runat="server" Font-Bold="true" Text="" CssClass=" label label-danger"></asp:Label>
                            <asp:Label ID="lblIdEstado" runat="server" Visible="false"></asp:Label>
                        </h3>
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
                                    <asp:DropDownList ID="ddlSucursal" runat="server" CssClass="form-control input-sm" ClientIDMode="Static" OnDataBound="ddlSucursal_DataBound">
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label for="lblNombreUsuario">Nombre Solicitante:</label><br />
                                    <asp:Label ID="lblNombreUsuario" runat="server" CssClass="label label-primary"></asp:Label>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label for="lblEmailUsuario">Email Solicitante:</label>
                                    <asp:Label ID="lblEmailUsuario" runat="server" CssClass="label label-success"></asp:Label>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label for="lblFechaSolicitud">Fecha Solicitud:</label>
                                    <asp:Label ID="lblFechaSolicitud" runat="server" CssClass="label label-warning"></asp:Label>
                                </div>
                            </div>


                        </div>
                    </div>
                </div>

                <div class="box box-danger">
                    <div class="box-header">
                        <h3 class="box-title">Ingreso de Material</h3>
                    </div>
                    <div class="box-body">
                        <div class="row">
                            <div class="col-lg-3">
                                <label for="ddlTipo">Tipo:</label>
                                <asp:DropDownList ID="ddlTipo" runat="server" CssClass="form-control input-sm" AutoPostBack="true" OnSelectedIndexChanged="ddlTipo_SelectedIndexChanged" OnDataBound="ddlTipo_DataBound">
                                </asp:DropDownList>
                            </div>
                            <div class="col-lg-5">
                                <label for="ddlSucursal">Material:</label>
                                <asp:DropDownList ID="ddlMaterial" runat="server" CssClass="form-control input-sm" ClientIDMode="Static" OnDataBound="ddlMaterial_DataBound">
                                </asp:DropDownList>
                            </div>
                            <div class="col-lg-2">
                                <label for="txtCantidad">Cantidad:</label>
                                <asp:TextBox ID="txtCantidad" runat="server" CssClass="form-control input-sm" Text="0" MaxLength="5" ClientIDMode="Static"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="ftbe" runat="server"
                                    TargetControlID="txtCantidad"
                                    FilterType="Numbers" />
                            </div>
                            <div class="col-lg-2">
                                <br />
                                <asp:LinkButton ID="lbtnAgregar" OnClick="lbtnAgregar_Click" CssClass="btn btn-success btn-sm" runat="server"><i aria-hidden="true" class="glyphicon glyphicon-plus glyphicon-arrow-down"></i></asp:LinkButton>
                                <asp:LinkButton ID="lbtnNuevoMaterial" OnClick="lbtnNuevoMaterial_Click" CssClass="btn btn-primary btn-sm" runat="server"><i aria-hidden="true" class="glyphicon glyphicon-plus"></i></asp:LinkButton>
                            </div>
                        </div>

                        <div class="row" id="DivAgregarMaterial" runat="server" visible="false">

                            <div class="col-lg-3">
                                <asp:HiddenField ID="HiddenField1" runat="server" />
                                <label for="txtMaterial">Nombre Material:</label>
                                <asp:TextBox ID="txtMaterial" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                            </div>
                            <div class="col-lg-5">
                                <label for="ddlTipo">Tipo:</label>
                                <asp:DropDownList ID="ddlTipoAgregar" runat="server" CssClass="form-control input-sm" OnDataBound="ddlTipoAgregar_DataBound">
                                </asp:DropDownList>
                            </div>
                            <div class="col-lg-2">
                                <label for="txtClave">Unidad:</label>
                                <asp:TextBox ID="txtUnidad" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                            </div>
                            <div class="col-lg-2">
                                <br />
                                <asp:LinkButton ID="lbtnGrabarMaterial" OnClick="lbtnGrabarMaterial_Click" CssClass="btn btn-danger btn-sm" runat="server"><i aria-hidden="true" class="glyphicon  glyphicon-floppy-disk"></i> Grabar Material</asp:LinkButton>
                            </div>


                        </div>

                    </div>




                </div>

                <div class="box box-danger">
                    <div class="box-header">
                        <h3 class="box-title">Materiales</h3>
                    </div>
                    <div class="box-body">

                        <div style="width: 100%; overflow-y: scroll;">

                            <asp:GridView ID="grvMateriales" runat="server" ClientIDMode="Static" CssClass="table table-hover table-responsive table-condensed"
                                HeaderStyle-CssClass="active" OnRowDataBound="grvMateriales_RowDataBound" BorderColor="Transparent" PagerStyle-CssClass="active" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true">
                                <Columns>
                                    <asp:TemplateField HeaderText="Correlativo">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCorrelativo" runat="server" Text='<%# Bind("Correlativo") %>' Visible="true"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Id">
                                        <ItemTemplate>
                                            <asp:Label ID="lblIdMaterial" runat="server" Text='<%# Bind("IdMaterial") %>' Visible="true"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Material">
                                        <ItemTemplate>
                                            <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("Nombre") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Tipo">
                                        <ItemTemplate>
                                            <asp:Label ID="lblIdTipo" runat="server" Visible="false" Text='<%# Bind("IdTipo") %>'></asp:Label>
                                            <asp:Label ID="lblTipo" runat="server" Text='<%# Bind("NombreTipo") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="U.Medida">
                                        <ItemTemplate>
                                            <asp:Label ID="lblUnidadMedida" runat="server" Text='<%# Bind("UnidadMedida") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Cantidad">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCantidad" runat="server" Text='<%# Bind("Cantidad") %>' Font-Size="Smaller" CssClass="label label-warning"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Right" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-Width="5%" HeaderText="Acción">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="btnEliminarMaterial" OnClick="btnEliminarMaterial_Click" OnClientClick="return confirm('¿Desea eliminar el registro?');" ToolTip="Eliminar Registro" runat="server" CssClass="btn btn-xs btn-danger"><span class="glyphicon glyphicon-trash"></span></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>

                    <div class="box-footer">
                        <asp:Button ID="btnGuardar" Text="Guardar" CssClass="btn btn-success" OnClick="btnGuardar_Click" runat="server" />
                    </div>
                </div>



                <div class="box box-warning" runat="server" id="divPanelHistoricoCaso" visible="false">
                    <div class="box-header">
                        <h3 class="box-title">Histórico del SOLPED</h3>
                    </div>
                    <div class="box-body">
                        <div style="width: 100%; overflow-y: scroll;">
                            <asp:GridView ID="grvGestiones" runat="server" CssClass="table table-responsive table-bordered table-hover table-condensed small" HeaderStyle-CssClass="active" AutoGenerateColumns="false" OnRowDataBound="paginacion_RowDataBound">
                                <Columns>
                                    <asp:TemplateField HeaderText="Id">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCorrelativo" runat="server" Text='<%# Bind("CORRELATIVO") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="F.Creación">
                                        <ItemTemplate>
                                            <asp:Label ID="lblFecha" runat="server" Visible="true" Text='<%# Bind("FECHA","{0:dd/MM/yyyy HH:mm}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="U.Creación">
                                        <ItemTemplate>
                                            <asp:Label ID="lblUsuarioCreacion" runat="server" Text='<%# Bind("USUARIO") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="U.Asignado">
                                        <ItemTemplate>
                                            <asp:Label ID="lblUsuarioAsignado" runat="server" Text='<%# Bind("USUARIO_ASIG") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Estado">
                                        <ItemTemplate>
                                            <asp:Label ID="lblEstado" runat="server" Text='<%# Bind("ESTADO_ATENCION") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="F.Agend">
                                        <ItemTemplate>
                                            <asp:Label ID="lblFechaAgendamiento" runat="server" Visible="true" Text='<%# Bind("FECHA_AGEND","{0:dd/MM/yyyy HH:mm}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Motivo Cierre" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblNombreMotivoCierre" runat="server" Text='<%# Bind("NOM_MOTIVO_CIERRE") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Archivo1">
                                        <ItemTemplate>
                                            <asp:Label ID="lblArchivo1" runat="server" Visible="false" Text='<%# Bind("RUTA_ARCHIVO_1") %>'></asp:Label>
                                            <asp:ImageButton ID="ibtnArchivo1" runat="server" ImageUrl="~/assets/img/box.png" Visible="false" OnClick="ibtnArchivo1_Click" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Archivo2">
                                        <ItemTemplate>
                                            <asp:Label ID="lblArchivo2" runat="server" Visible="false" Text='<%# Bind("RUTA_ARCHIVO_2") %>'></asp:Label>
                                            <asp:ImageButton ID="ibtnArchivo2" runat="server" ImageUrl="~/assets/img/box.png" Visible="false" OnClick="ibtnArchivo2_Click" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="OT">
                                        <ItemTemplate>
                                            <asp:Label ID="lblArchivoOT" runat="server" Visible="false" Text='<%# Bind("RUTA_ARCHIVO_OT") %>'></asp:Label>
                                            <asp:ImageButton ID="ibtnArchivoOT" runat="server" ImageUrl="~/assets/img/box.png" Visible="false" OnClick="ibtnArchivoOT_Click" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Obs">
                                        <ItemTemplate>
                                            <asp:Label ID="lblObservacion" runat="server" Text='<%# Bind("OBSERVACION") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Obs Cli" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblObservacionCli" runat="server" Text='<%# Bind("OBSERVACION_CLIENTE") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>



            </ContentTemplate>
        </asp:UpdatePanel>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
