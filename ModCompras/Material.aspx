<%@ Page Title="" Language="C#" MasterPageFile="~/Sitio.Master" AutoEventWireup="true" CodeBehind="Material.aspx.cs" Inherits="ModCompras.Material" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <link rel="stylesheet" href="AdminLTE-2.3.0/plugins/datatables/dataTables.bootstrap.css">
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

        <div runat="server" id="divUsuarios" class="box box-danger">
            <div class="box-header">
                <asp:LinkButton ID="bntNuevo" OnClick="bntNuevo_Click" runat="server" CssClass="btn btn-xs btn-success"><span class="glyphicon glyphicon-plus"></span></asp:LinkButton>
                <asp:LinkButton ID="btnExportar" OnClick="btnExportar_Click" runat="server" CssClass="btn btn-xs btn-primary"><span class="glyphicon glyphicon-file"></span></asp:LinkButton>

            </div>
            <div class="box-body">
                <asp:GridView ID="grvMateriales" runat="server" ClientIDMode="Static" CssClass="table table-hover table-responsive table-condensed"
                    HeaderStyle-CssClass="active" OnRowDataBound="grvMateriales_RowDataBound" BorderColor="Transparent" PagerStyle-CssClass="active" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true">
                    <Columns>
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
                                <asp:Label ID="lblTipo" runat="server" Text='<%# Bind("NombreTipo") %>'></asp:Label>
                                <asp:Label ID="lblIdTipo" Visible="false" runat="server" Text='<%# Bind("IdTipo") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="U.Medida">
                            <ItemTemplate>
                                <asp:Label ID="lblUnidad" runat="server" Text='<%# Bind("Unidad") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="U.Creación">
                            <ItemTemplate>
                                <asp:Label ID="lblUsuarioCreacion" runat="server" Text='<%# Bind("UsuarioCreacion") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="F.Creación">
                            <ItemTemplate>
                                <asp:Label ID="lblFechaCreacion" runat="server" Text='<%# Bind("FechaCreacion") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="U.Modificación">
                            <ItemTemplate>
                                <asp:Label ID="lblUsuarioModificacion" runat="server" Text='<%# Bind("UsuarioModificacion") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="F.Modificación">
                            <ItemTemplate>
                                <asp:Label ID="lblFechaModificacion" runat="server" Text='<%# Bind("FechaModificacion") %>'></asp:Label>
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
    </section>



</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
     <!-- DataTables -->
    <script src="AdminLTE-2.3.0/plugins/datatables/jquery.dataTables.min.js"></script>
    <script src="AdminLTE-2.3.0/plugins/datatables/dataTables.bootstrap.min.js"></script>

    <script>
        $(document).ready(function () {
            jQuery('#grvMateriales').DataTable({

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
                "iDisplayLength": 25
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
