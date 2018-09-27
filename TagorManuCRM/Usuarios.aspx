<%@ Page Title="" Language="C#" MasterPageFile="~/Sitio.Master" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="TagorManuCRM.Usuarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <!-- DataTables -->
    <link rel="stylesheet" href="AdminLTE-2.3.0/plugins/datatables/dataTables.bootstrap.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">

    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>Usuarios
        </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
            <li><a href="#">Administración</a></li>
            <li class="active">Usuario</li>
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
                <asp:LinkButton ID="bntNuevo" OnClick="btnNuevo_Click" runat="server" CssClass="btn btn-xs btn-success"><span class="glyphicon glyphicon-plus"></span></asp:LinkButton>
                <asp:ImageButton ID="ibtnExportarExcel" ImageUrl="assets/img/file_extension_xls.png" runat="server" OnClick="ibtnExportarExcel_Click" />
            </div>
            <div class="box-body">
                <asp:GridView ID="grvUsuarios" runat="server" ClientIDMode="Static" CssClass="table table-hover table-responsive table-condensed"
                    HeaderStyle-CssClass="active" OnRowDataBound="grvUsuarios_RowDataBound" BorderColor="Transparent" PagerStyle-CssClass="active" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true">
                    <Columns>
                        <asp:TemplateField HeaderText="ID">
                            <ItemTemplate>
                                <asp:Label ID="lblIdUsuario" runat="server" Text='<%# Bind("ID_USUARIO") %>' Visible="true"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Login">
                            <ItemTemplate>
                                <asp:Label ID="lblRutaFoto" runat="server" Text='<%# Bind("RUTA_FOTO") %>' Visible="false"></asp:Label>
                                <asp:Label ID="lblUsuario" runat="server" Text='<%# Bind("USUARIO") %>'></asp:Label>
                                <asp:Label ID="lblClave" runat="server" Text='<%# Bind("CONTRASENA") %>' Visible="false"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Nombre">
                            <ItemTemplate>
                                <asp:Label ID="lblNombres" runat="server" Text='<%# Bind("NOMBRE") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Email">
                            <ItemTemplate>
                                <asp:Label ID="lblEmail" runat="server" Text='<%# Bind("EMAIL") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Perfil">
                            <ItemTemplate>
                                <asp:Label ID="lblPerfil" runat="server" Text='<%# Bind("NOM_PERFIL") %>'></asp:Label>
                                <asp:Label ID="lblIdPerfil" Visible="false" runat="server" Text='<%# Bind("ID_PERFIL") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Area">
                            <ItemTemplate>
                                <asp:Label ID="lblIdArea" runat="server" Visible="false" Text='<%# Bind("ID_AREA") %>'></asp:Label>
                                <asp:Label ID="lblArea" runat="server" Visible="true" Text='<%# Bind("AREA") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Sucursal">
                            <ItemTemplate>
                                <asp:Label ID="lblIdSucursal" runat="server" Visible="false" Text='<%# Bind("ID_SUCURSAL") %>'></asp:Label>
                                <asp:Label ID="lblNombreSucursal" runat="server" Visible="true" Text='<%# Bind("NOMBRE_SUCURSAL") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Zonas">
                            <ItemTemplate>
                                <asp:Label ID="lblZonas" runat="server" Visible="true"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Empresa" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="lblEmpresa" runat="server" Text='<%# Bind("EMPRESA") %>'></asp:Label>
                                <asp:Label ID="lblIdEmpresa" runat="server" Visible="false" Text='<%# Bind("ID_EMPRESA") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Activo">
                            <ItemTemplate>
                                <asp:Label ID="lblActivo" runat="server" Visible="false" Text='<%# Bind("ACTIVO") %>'></asp:Label>
                                <asp:Label ID="lblActivo2" runat="server" Text='<%# Bind("ACTIVO2") %>'></asp:Label>
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
        <div runat="server" id="divAddEditUsuario" class="box box-danger" visible="false">
            <div class="box-header">
            </div>
            <div class="box-body">
                <div class="row">
                    <div class="col-md-5">
                        <div class="form-group">
                            <asp:HiddenField ID="hfIdUsuario" runat="server" />
                            <label for="txtNombres">Nombres:</label>
                            <asp:TextBox ID="txtNombres" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="txtLogin">Login:</label>
                            <asp:TextBox ID="txtLogin" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="txtClave">Clave:</label>
                            <asp:TextBox ID="txtClave" runat="server" TextMode="Password" CssClass="form-control input-sm"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="ddlSucursal">Sucursal:</label>
                            <asp:DropDownList ID="ddlSucursal" runat="server" CssClass="form-control input-sm" OnDataBound="ddlSucursal_DataBound">
                            </asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <label for="chkZona">Zonas:</label>
                            <asp:CheckBoxList ID="chkZona" runat="server" CssClass="table table-condensed small table-responsive"></asp:CheckBoxList>
                        </div>
                    </div>
                    <div class="col-md-5">
                        <div class="form-group">
                            <label for="txtEmail">Email:</label>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <label for="ddlPerfil">Perfil:</label>
                            <asp:DropDownList ID="ddlPerfil" runat="server" CssClass="form-control input-sm" AutoPostBack="true" OnSelectedIndexChanged="ddlPerfil_SelectedIndexChanged">
                            </asp:DropDownList>
                        </div>
                        <div class="form-group" runat="server" visible="false" id="divArea">
                            <label for="ddlPerfil">Area:</label>
                            <asp:DropDownList ID="ddlArea" runat="server" CssClass="form-control input-sm" OnDataBound="ddlArea_DataBound">
                            </asp:DropDownList>
                        </div>
                        <div class="form-group" runat="server" visible="false" id="divEmpresa">
                            <label for="ddlEmpresa">Empresa:</label>
                            <asp:DropDownList ID="ddlEmpresa" runat="server" OnDataBound="ddlEmpresa_DataBound" CssClass="form-control input-sm">
                            </asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <label for="ddlActivo">Activo:</label>
                            <asp:DropDownList ID="ddlActivo" runat="server" Width="150px" CssClass="form-control input-sm">
                                <asp:ListItem Text="Si" Value="1"></asp:ListItem>
                                <asp:ListItem Text="No" Value="0"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>

                    <div class="col-md-2" id="divImagenUsuario" runat="server" visible="false">
                        <div class="form-group">
                            <label style="text-align: center">Fotografia Perfil:</label>
                            <img runat="server" id="imgUsuario" src="/" class="img-circle img-responsive" style="height: 160px; width: 160px" alt="" />
                        </div>
                        <div class="form-group">
                            <label></label>
                            <asp:FileUpload runat="server" CssClass="form-control" ID="fluFotoUsuario" />
                        </div>
                        <div class="form-group">
                            <label></label>
                            <asp:Button ID="btnSubirImagen" OnClick="btnSubirImagen_Click" CssClass="btn btn-info btn-sm" Text="Subir Imagen" runat="server" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="box-footer">
                <asp:Button Text="Guardar" CssClass="btn btn-success" OnClick="Guardar_Click" runat="server" />
                <asp:Button Text="Cancelar" CssClass="btn btn-default" OnClick="Cancelar_Click" runat="server" />
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
            jQuery('#grvUsuarios').DataTable({

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
