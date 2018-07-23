<%@ Page Title="" Language="C#" MasterPageFile="~/Sitio.Master" AutoEventWireup="true" CodeBehind="Mantenciones.aspx.cs" Inherits="TagorManuCRM.Mantenciones" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <!-- DataTables -->
    <link rel="stylesheet" href="AdminLTE-2.3.0/plugins/datatables/dataTables.bootstrap.css">
    <link href="AdminLTE-2.3.0/plugins/datatables/jquery.dataTables.min.css" rel="stylesheet" />
    <link href="AdminLTE-2.3.0/plugins/datatables/jquery.dataTables_themeroller.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">



    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>Mantenciones
        </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
            <li><a href="#">Administración</a></li>
            <li class="active">Mantenciones</li>
        </ol>
    </section>

    <section class="content">
        <!-- Alertas -->
        <div id="divAlerta" runat="server" visible="false" class="alert alert-danger">
            <strong>Atención!: </strong>
            <asp:Label Text="" ID="lblInfo" runat="server" />
        </div>
        <div runat="server" id="divMantenciones" class="box box-default">
            <div class="box-header with-border">
                <h3 class="box-title">Mantenciones </h3>
                <asp:LinkButton ID="bntNuevo" OnClick="bntNuevo_Click" runat="server" CssClass="btn btn-xs btn-success"><span class="glyphicon glyphicon-plus"></span></asp:LinkButton>
                <asp:ImageButton ID="ibtnExportarExcel" ImageUrl="assets/img/file_extension_xls.png" runat="server" OnClick="ibtnExportarExcel_Click" />
            </div>
            <div style="width: 100%; height: 100%; overflow-y: scroll;">
                <div class="box-body">
                    <asp:GridView ID="grvMantenciones" runat="server" ClientIDMode="Static" CssClass="table table-hover table-responsive table-bordered table-condensed" BorderColor="Transparent"
                      AutoGenerateColumns="false" ShowHeaderWhenEmpty="true">
                        <Columns>
                            <asp:TemplateField HeaderText="ID">
                                <ItemTemplate>
                                    <asp:Label ID="lblIdTipificacion" runat="server" Text='<%# Bind("ID_TIPIFICACION") %>' Visible="true"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Tipo">
                                <ItemTemplate>
                                    <asp:Label ID="lblTipoOT" runat="server" Text='<%# Bind("TIPOOT") %>'></asp:Label>
                                    <asp:Label ID="lblClase" runat="server" Text='<%# Bind("CLASE") %>' Visible="false"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Area">
                                <ItemTemplate>
                                    <asp:Label ID="lblArea" runat="server" Text='<%# Bind("AREA") %>'></asp:Label>
                                    <asp:Label ID="lblIdArea" runat="server" Text='<%# Bind("ID_AREA") %>' Visible="false"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Nivel 1">
                                <ItemTemplate>
                                    <asp:Label ID="lblNivel1" runat="server" Text='<%# Bind("NIVEL_1") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Nivel 2">
                                <ItemTemplate>
                                    <asp:Label ID="lblNivel2" runat="server" Text='<%# Bind("NIVEL_2") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Nivel 3">
                                <ItemTemplate>
                                    <asp:Label ID="lblNivel3" runat="server" Text='<%# Bind("NIVEL_3") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Nivel 4">
                                <ItemTemplate>
                                    <asp:Label ID="lblNivel4" runat="server" Text='<%# Bind("NIVEL_4") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderStyle-Width="7%" HeaderText="Acción">
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnEditar" OnClick="btnEditar_Click" runat="server" CssClass="btn btn-xs btn-warning" ToolTip="Editar Registro"><span class="glyphicon glyphicon-edit"></span></asp:LinkButton>
                                    <asp:LinkButton ID="btnEliminar" OnClick="btnEliminar_Click" OnClientClick="return confirm('¿Desea eliminar el registro?');" ToolTip="Eliminar Registro" runat="server" CssClass="btn btn-xs btn-danger"><span class="glyphicon glyphicon-trash"></span></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>

                    </asp:GridView>
                </div>
            </div>
        </div>
        <div runat="server" id="divAddEditMantencion" class="box box-danger" visible="false">
            <div class="box-header">
            </div>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class="box-body">
                        <div class="row">
                            <div class="col-md-3 col-xs-12">
                                <div class="form-group">
                                    <label for="txtLogin">Tipo:</label>
                                    <asp:DropDownList ID="ddlTipo" runat="server" CssClass="form-control input-sm" AutoPostBack="true" OnSelectedIndexChanged="ddlTipo_SelectedIndexChanged">
                                        <asp:ListItem Value="0" Text="Seleccionar"></asp:ListItem>
                                        <asp:ListItem Value="C" Text="Correctiva (Emergencia)"></asp:ListItem>
                                        <asp:ListItem Value="CP" Text="Correctiva (Planificado)"></asp:ListItem>
                                        <asp:ListItem Value="P" Text="Preventiva"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-3 col-xs-12">
                                <div class="form-group">
                                    <label for="txtLogin">Area:</label>
                                    <asp:DropDownList ID="ddlArea" runat="server" CssClass="form-control input-sm" AutoPostBack="true" OnSelectedIndexChanged="ddlArea_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3 col-xs-12">
                                <div class="form-group">
                                    <asp:HiddenField ID="hfIdMantencion" runat="server" />
                                    <label for="txtNombres">Nivel 1:</label>
                                    <asp:DropDownList ID="ddlNivel1" runat="server" CssClass="form-control input-sm" OnDataBound="ddlNivel1_DataBound" AutoPostBack="true" OnSelectedIndexChanged="ddlNivel1_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    <asp:TextBox ID="TxtNivel1" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-3 col-xs-12">
                                <div class="form-group">
                                    <label for="txtLogin">Nivel 2:</label>
                                    <asp:DropDownList ID="ddlNivel2" runat="server" CssClass="form-control input-sm" OnDataBound="ddlNivel2_DataBound" AutoPostBack="true" OnSelectedIndexChanged="ddlNivel2_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    <asp:TextBox ID="TxtNivel2" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-3 col-xs-12">
                                <div class="form-group">
                                    <label for="txtClave">Nivel 3:</label>
                                    <asp:DropDownList ID="ddlNivel3" runat="server" CssClass="form-control input-sm" OnDataBound="ddlNivel3_DataBound" AutoPostBack="true" OnSelectedIndexChanged="ddlNivel3_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    <asp:TextBox ID="TxtNivel3" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-3 col-xs-12">
                                <div class="form-group">
                                    <label for="ddlLocal">Nivel 4:</label>
                                    <asp:DropDownList ID="ddlNivel4" runat="server" CssClass="form-control input-sm" OnDataBound="ddlNivel4_DataBound" AutoPostBack="true" OnSelectedIndexChanged="ddlNivel4_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    <asp:TextBox ID="TxtNivel4" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            <div class="box-footer">
                <asp:Button ID="BtnGuardar" Text="Guardar" CssClass="btn btn-success" OnClick="BtnGuardar_Click" runat="server" />
                <asp:Button ID="BtnCancelar" Text="Cancelar" CssClass="btn btn-default" OnClick="BtnCancelar_Click" runat="server" />
            </div>
        </div>


    </section>




</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
    <!-- DataTables -->
    <script src="AdminLTE-2.3.0/plugins/datatables/jquery.dataTables.min.js"></script>
    <script src="AdminLTE-2.3.0/plugins/datatables/dataTables.bootstrap.min.js"></script>

    <script>
        $(document).ready(function () {
            jQuery('#grvMantenciones').DataTable({

                "language": {
                    "sProcessing": "Procesando...",
                    "sLengthMenu": "Mostrar _MENU_ registros",
                    "sZeroRecords": "No se encontraron resultados",
                    "sEmptyTable": "Ningún dato disponible en esta tabla",
                    "sInfo": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
                    "sInfoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
                    "sInfoFiltered": "(filtrado de un total de _MAX_ registros)",
                    "sInfoPostFix": "",
                    "sSearch": "Buscar:",
                    "sUrl": "",
                    "sInfoThousands": ",",
                    "sLoadingRecords": "Cargando...",
                    "oPaginate": {
                        "sFirst": "Primero",
                        "sLast": "Último",
                        "sNext": "Siguiente",
                        "sPrevious": "Anterior"
                    }
                },
                "iDisplayLength": 100
                /**,
                dom: 'Bfrtip',
                buttons: [
                    'copyHtml5',
                    'csvHtml5',
                    'pdfHtml5'
                ] **/

            });
        });

    </script>
</asp:Content>
