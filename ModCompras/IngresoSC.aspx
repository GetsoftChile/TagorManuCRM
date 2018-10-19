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
                            <i class="fa fa-pencil"></i>SOLCOMP Nº
                   
                    <asp:Label ID="lblNumeroSolicitud" runat="server" Font-Bold="true"></asp:Label>
                            <small class="pull-right">Fecha:
                        <asp:Label ID="lblFechaHoy" runat="server" Font-Bold="true"></asp:Label></small>
                        </h2>
                    </div>
                    <!-- /.col -->
                </div>



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


                </div>

                <div class="box box-warning" runat="server" id="divPanelHistoricoCaso" visible="true">
                    <div class="box-header">
                        <h3 class="box-title">Gestiones SolCom</h3>
                        <h3 class="box-title pull-right">
                            <asp:LinkButton ID="lbtnNuevaGestion" OnClick="lbtnNuevaGestion_Click" CssClass="btn btn-success btn-sm" runat="server"><i aria-hidden="true" class="glyphicon glyphicon-plus"></i> Nueva Gestión</asp:LinkButton>
                        </h3>
                    </div>
                    <div class="box-body">
                        <div style="width: 100%; overflow-y: scroll;">
                            <asp:GridView ID="grvGestiones" runat="server" CssClass="table table-responsive table-bordered table-hover table-condensed small" HeaderStyle-CssClass="active" AutoGenerateColumns="false">
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


                                    <asp:TemplateField HeaderText="Obs">
                                        <ItemTemplate>
                                            <asp:Label ID="lblObservacion" runat="server" Text='<%# Bind("OBSERVACION") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>

                </div>

                <div class="box box-warning" runat="server" id="divOC" visible="true">
                    <div class="box-header">
                        <h3 class="box-title">Ordenes de Compra</h3>
                        <h3 class="box-title pull-right">
                            <asp:LinkButton ID="lbtnNuevaOrdenCompra" OnClick="lbtnNuevaOrdenCompra_Click" CssClass="btn btn-success btn-sm" runat="server"><i aria-hidden="true" class="glyphicon glyphicon-plus"></i> Crear Orden de Compra</asp:LinkButton>
                        </h3>
                    </div>
                    <div class="box-body">
                        <div style="width: 100%; overflow-y: scroll;">
                            <asp:GridView ID="GridView1" runat="server" CssClass="table table-responsive table-bordered table-hover table-condensed small" HeaderStyle-CssClass="active" AutoGenerateColumns="false">
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
                                    <asp:TemplateField HeaderText="Obs">
                                        <ItemTemplate>
                                            <asp:Label ID="lblObservacion" runat="server" Text='<%# Bind("OBSERVACION") %>'></asp:Label>
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

                <%--NUEVA GESTION--%>
                <%--MODALPOPUP CON BOOTSTRAP--%>
                <asp:Button ID="btnMDLNuevaGestion" runat="server" Style="display: none" />
                <ajaxToolkit:ModalPopupExtender ID="mdlNuevaGestion" BackgroundCssClass="modalBackground" runat="server" PopupControlID="pnlNuevaGestion" TargetControlID="btnMDLNuevaGestion">
                </ajaxToolkit:ModalPopupExtender>
                <asp:Panel ID="pnlNuevaGestion" runat="server" CssClass="panel" Style="display: none; background: white; width: 65%; height: auto; overflow: auto">
                    <%--MODALPOPUP CON BOOTSTRAP--%>
                    <div class="panel panel-success">
                        <div class="panel-heading">
                            <button class="close" data-dismiss="modal">
                                ×
                            </button>
                            <strong>Modulo Gestión - Ingreso de Gestión SOLCOM</strong>
                        </div>
                        <div class="panel-body">
                            <table class="table small">
                                <tr>
                                    <td class="active">
                                        <strong>Nº</strong>
                                        <asp:Label ID="lblNumeroSolCom" runat="server"></asp:Label>
                                    </td>
                                </tr>
                            </table>

                            <h4>Nueva Gestión</h4>



                            <table class="table small">
                                <tr class="active">
                                    <td>
                                        <label for="ddlNivel1">Categoria:</label>
                                        <asp:DropDownList ID="ddlNivel1" runat="server" CssClass="form-control input-sm" ClientIDMode="Static" OnDataBound="ddlNivel1_DataBound" AutoPostBack="true" OnSelectedIndexChanged="ddlNivel1_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <label for="ddlNivel2">Sub Categoria:</label>
                                        <asp:DropDownList ID="ddlNivel2" runat="server" CssClass="form-control input-sm" ClientIDMode="Static" OnDataBound="ddlNivel2_DataBound" AutoPostBack="true" OnSelectedIndexChanged="ddlNivel2_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr class="active">
                                    <td>
                                        <label for="fuCotizacion">Cotización:</label>
                                        <asp:FileUpload ID="fuCotizacion" runat="server" />
                                    </td>
                                    <td>
                                        <label for="fuCotizacion">Valor total cotización:</label>
                                        <asp:TextBox ID="txtValorTotalCotizacion" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr class="active">
                                    <td>
                                        <label for="fuCuadroComparativo">Cuadro Comparativo:</label>
                                        <asp:FileUpload ID="fuCuadroComparativo" runat="server" />
                                    </td>
                                    <td></td>
                                </tr>
                                <tr class="active">
                                    <td>
                                        <strong>Observaciones</strong>
                                        <asp:TextBox ID="txtObservaciones" TextMode="MultiLine" runat="server" CssClass="form-control input-sm" Height="100px"></asp:TextBox>
                                    </td>
                                </tr>

                            </table>

                        </div>
                        <div class="panel-footer">
                            <asp:Button ID="btnGrabarGestion" runat="server" Text="Ingresar" CssClass="btn btn-sm btn-danger" OnClick="btnGrabarGestion_Click" />
                        </div>
                        <%--MODALPOPUP CON BOOTSTRAP--%>
                    </div>
                </asp:Panel>


            </section>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
