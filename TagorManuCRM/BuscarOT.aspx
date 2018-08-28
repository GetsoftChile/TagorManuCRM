<%@ Page Title="" Language="C#" MasterPageFile="~/Sitio.Master" AutoEventWireup="true" CodeBehind="BuscarOT.aspx.cs" Inherits="TagorManuCRM.BuscarOT" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <link href="AdminLTE-2.3.0/plugins/datepicker/datepicker3.css" rel="stylesheet" />
    <style>
        .example-modal .modal {
            position: relative;
            top: auto;
            bottom: auto;
            right: auto;
            left: auto;
            display: block;
            z-index: 1;
        }

        .example-modal .modal {
            background: transparent !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <!-- Content Header (Page header) -->

    <section class="content-header">
        <h1>
            <asp:Label ID="lblTituloBuscadorTicket" runat="server"></asp:Label>
        </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
            <li><a href="#">OT</a></li>
            <li class="active"><a href="BuscarOT.aspx"><i class="fa fa-circle-o"></i>Buscardor de SOLPED</a></li>
        </ol>
    </section>
    <section class="content">

        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <!-- Alertas -->
                <div id="divAlerta" runat="server" visible="false" class="alert alert-danger">
                    <strong>Atención!: </strong>
                    <asp:Label Text="" ID="lblInfo" runat="server" />
                </div>

                <div class="row" runat="server" visible="true" id="divBuscador">
                    <div class="col-md-12">
                        <div class="box box-success">
                            <div class="box-header">
                                <h3 class="box-title">Buscar</h3>
                            </div>
                            <div class="box-body">
                                <div class="row">
                                    <div class="col-xs-4">
                                        <div class="input-group input-group-sm">
                                            <asp:TextBox ID="txtBuscar" runat="server" CssClass="form-control input-sm" placeholder="Buscar por Nº SOLPED"></asp:TextBox>
                                            <span class="input-group-btn">
                                                <asp:Button ID="btnBuscar" runat="server" CssClass="btn btn-sm btn-primary"
                                                    Text="Buscar" OnClick="btnBuscar_Click" />
                                            </span>
                                        </div>

                                    </div>

                                    <div class="col-xs-3" runat="server" visible="false">
                                        <asp:TextBox ID="txtBuscarPorRut" runat="server" CssClass="form-control input-sm" placeholder="Buscar por Rut"></asp:TextBox>
                                    </div>
                                    <div class="col-xs-1" runat="server" visible="false">
                                        <asp:Button ID="btnBuscarPorRut" runat="server" CssClass="btn btn-sm btn-primary"
                                            Text="Buscar" OnClick="btnBuscarPorRut_Click" />
                                    </div>
                                    <div class="col-xs-3" runat="server" visible="false">
                                        <asp:TextBox ID="txtBuscarPorNombreCliente" runat="server" CssClass="form-control input-sm" placeholder="Buscar por Cliente"></asp:TextBox>
                                    </div>
                                    <div class="col-xs-1" runat="server" visible="false">
                                        <asp:Button ID="btnBuscarPorCliente" runat="server" CssClass="btn btn-sm btn-primary"
                                            Text="Buscar" OnClick="btnBuscarPorCliente_Click" />
                                    </div>

                                    <div class="col-xs-3" runat="server" visible="false">
                                        <asp:TextBox ID="txtBuscarPorRutCi" runat="server" CssClass="form-control input-sm" placeholder="Buscar por Rut CI"></asp:TextBox>
                                    </div>
                                    <div class="col-xs-1" runat="server" visible="false">
                                        <asp:Button ID="btnBuscarPorRutCi" runat="server" CssClass="btn btn-sm btn-primary"
                                            Text="Buscar" OnClick="btnBuscarPorRutCi_Click" />
                                    </div>

                                    <div class="col-xs-3" runat="server" visible="false">
                                        <asp:TextBox ID="txtBuscarEmailCi" runat="server" CssClass="form-control input-sm" placeholder="Buscar por Email CI"></asp:TextBox>
                                    </div>
                                    <div class="col-xs-1" runat="server" visible="false">
                                        <asp:Button ID="btnBuscarEmailCi" runat="server" CssClass="btn btn-sm btn-primary"
                                            Text="Buscar" OnClick="btnBuscarEmailCi_Click" />
                                    </div>

                                    <div class="col-xs-4" runat="server" visible="true">
                                        <div class="input-group input-group-sm">
                                            <asp:TextBox ID="txtBuscarPorLocal" runat="server" CssClass="form-control input-sm" placeholder="Buscar por Local"></asp:TextBox>
                                            <span class="input-group-btn">
                                                <asp:Button ID="btnBuscarPorLocal" runat="server" CssClass="btn btn-sm btn-primary"
                                                    Text="Buscar" OnClick="btnBuscarPorLocal_Click" />
                                            </span>
                                        </div>

                                    </div>

                                </div>
                            </div>
                            <!-- /.box-body -->
                        </div>
                    </div>
                    <!-- /.col -->
                </div>

                <div class="row">
                    <div class="col-lg-12">
                        <div class="box box-info">
                            <div class="box-header">
                                <h3 class="box-title">Buscador Avanzado</h3>
                            </div>
                            <div class="box-body">
                                <div class="row">
                                    <div class="col-xs-12 col-lg-2">
                                        <label for="ddlEstado">Fecha Inicio</label>
                                        <div class="input-group">
                                            <asp:TextBox ID="txtFechaDesde" runat="server" ClientIDMode="Static" CssClass="form-control input-sm class-date"></asp:TextBox>
                                            <%--<span class="input-group-btn">
                                            <button class="btn btn-secondary btn-sm" type="button"><span class="glyphicon glyphicon-calendar"></span></button>
                                        </span>--%>
                                            <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-lg-2">
                                        <label for="ddlEstado">Fecha Hasta</label>
                                        <div class="input-group">
                                            <asp:TextBox ID="txtFechaHasta" ClientIDMode="Static" runat="server" CssClass="form-control input-sm class-date"></asp:TextBox>
                                            <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                            <%--<span class="input-group-btn">
                                            <button class="btn btn-secondary btn-sm" type="button"><span class="glyphicon glyphicon-calendar"></span></button>
                                        </span>--%>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-lg-2">
                                        <label for="ddlUsuarioAsig">Usuario Creación</label>
                                        <asp:DropDownList ID="ddlUsuarioCreacion" runat="server" OnDataBound="ddlUsuarioCreacion_DataBound" CssClass="form-control input-sm">
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-xs-12 col-lg-2">
                                        <label for="ddlUsuarioAsig">Usuario Asignado</label>
                                        <asp:DropDownList ID="ddlUsuarioAsig" runat="server" OnDataBound="ddlUsuarioAsig_DataBound" CssClass="form-control input-sm">
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-xs-12 col-lg-2">
                                        <label for="ddlEstado">Estado</label>
                                        <asp:DropDownList ID="ddlEstado" runat="server" OnDataBound="ddlEstado_DataBound" CssClass="form-control input-sm">
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-xs-12 col-lg-2">
                                        <label for="ddlEstado">Tipo</label>
                                        <asp:DropDownList ID="ddlTipo" runat="server" CssClass="form-control input-sm">
                                            <asp:ListItem Text="Todos" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="Correctiva" Value="C"></asp:ListItem>
                                            <asp:ListItem Text="Correctiva Planificada" Value="CP"></asp:ListItem>
                                            <asp:ListItem Text="Preventiva" Value="P"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-xs-12 col-lg-2">
                                        <label for="ddlEstado">Area</label>
                                        <asp:DropDownList ID="ddlArea" runat="server" OnDataBound="ddlArea_DataBound1" CssClass="form-control input-sm">
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-xs-12 col-lg-2">
                                        <label for="ddlEstado">Sucursal</label>
                                        <asp:DropDownList ID="ddlSucursal" runat="server" OnDataBound="ddlSucursal_DataBound" CssClass="form-control input-sm">
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-xs-12 col-lg-1">
                                        <label for="btnBuscarTicket"></label>
                                        <asp:Button ID="btnBuscarTicket" runat="server" CssClass="btn btn-sm btn-block btn-primary"
                                            Text="Buscar" OnClick="btnBuscarTicket_Click" />

                                    </div>
                                    <div class="col-xs-12 col-lg-1">
                                        <label for="lbtnExportar"></label>
                                        <asp:LinkButton ID="lbtnExportar" runat="server" OnClick="lbtnExportar_Click" CssClass="btn btn-success btn-sm btn-block">
                                                <i aria-hidden="true" class="fa fa-lg fa-file-excel-o"></i></asp:LinkButton>
                                    </div>
                                    <div class="col-xs-2 col-lg-2" runat="server" visible="false">
                                        <label for=""></label>
                                        <br />
                                        <asp:CheckBox ID="chkResumen" runat="server" Text="&nbsp;&nbsp;Cuadro Resumen"></asp:CheckBox>
                                    </div>
                                </div>

                            </div>
                            <!-- /.box-body -->
                        </div>
                    </div>

                    <!-- /.col -->
                </div>
                <!-- /.row PageSize="50" AllowPaging="true" -->

                <div class="row">
                    <div class="col-md-12" style="width: 100%; overflow-y: scroll;">
                        <div runat="server" id="divGrilla" class="box box-danger" visible="true">

                            <asp:GridView ID="grvTickets" runat="server" ClientIDMode="Static" CssClass="table table-bordered table-hover table-condensed small" HeaderStyle-CssClass="active"
                                AutoGenerateColumns="false" OnRowDataBound="paginacion_RowDataBound" EmptyDataText="Solped no encontrado"
                                EmptyDataRowStyle-CssClass="active h4" PageSize="50" AllowPaging="true">
                                <Columns>
                                    <asp:TemplateField HeaderText="OT">
                                        <ItemTemplate>
                                            <asp:Label ID="lblIdTicket" runat="server" Visible="false" Text='<%# Bind("ID_ATENCION") %>'></asp:Label>
                                            <%--<a  id="aIdTicket" href='<%# "SeguimientoOT.aspx?t="+Eval("ID_ATENCION") %>'><%#Eval("ID_ATENCION")%></a>--%>
                                            <asp:HyperLink ID="hlIdTicket" runat="server" NavigateUrl='<%# "SeguimientoOT.aspx?t="+Eval("ID_ATENCION") %>' Text='<%# Eval("ID_ATENCION") %>' Font-Bold="true" Font-Size="Large"></asp:HyperLink>
                                            <%--<asp:LinkButton ID="lbtnIdTicket" runat="server" Visible="false" Text='<%# Bind("ID_ATENCION") %>' OnClick="lbtnIdTicket_Click" Font-Bold="true" Font-Size="Large"></asp:LinkButton>--%>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Sucursal" Visible="true">
                                        <ItemTemplate>
                                            <asp:Label ID="lblSucursal" runat="server" Visible="true" Text='<%# Bind("NOMBRE_SUCURSAL") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Area" Visible="true">
                                        <ItemTemplate>
                                            <asp:Label ID="lblArea" runat="server" Visible="true" Text='<%# Bind("AREA") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="U.Creación">
                                        <ItemTemplate>
                                            <asp:Label ID="lblUsuarioCreacion" runat="server" Text='<%# Bind("USUARIO") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="F.Creación">
                                        <ItemTemplate>
                                            <asp:Label ID="lblFechaCreacion" runat="server" Text='<%# Bind("FECHA") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="U.Asignado">
                                        <ItemTemplate>
                                            <asp:Label ID="lblUsuarioAsignado" runat="server" Text='<%# Bind("USUARIO_ASIG") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Local">
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("COD_LOCAL") %>'></asp:Label>
                                            <asp:Label ID="lblLocal" runat="server" Text='<%# Bind("NOMBRE_LOCAL") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Tipo">
                                        <ItemTemplate>
                                            <asp:Label ID="lblTipo" runat="server" Text='<%# Bind("CLASE2") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="F.Agendamiento">
                                        <ItemTemplate>
                                            <asp:Label ID="lblFechaAgendamiento" runat="server" Text='<%# Bind("FECHA_AGENDAMIENTO") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Estado">
                                        <ItemTemplate>
                                            <asp:Label ID="lblEstado" runat="server" Text='<%# Bind("ESTADO_ATENCION") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="T.Res." Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblTiempoResolucion" runat="server" Text='<%# Bind("TIEMPO_RESOLUCION") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Nivel 1">
                                        <ItemTemplate>
                                            <asp:Label ID="lblNivel1" runat="server" Text='<%# Bind("NIVEL_1") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Ins." Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblInsistencias" runat="server" Text='<%# Bind("INSISTENCIAS") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Obs">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ibtnObservacion" runat="server" OnClick="ibtnObservacion_Click" ImageUrl="~/assets/img/page.png" ToolTip='<%# Bind("OBSERVACION") %>' />
                                            <asp:Label ID="lblObservacion" runat="server" Visible="false" Text='<%# Bind("OBSERVACION") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Obs Cli" Visible="false">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ibtnObservacionCli" runat="server" OnClick="ibtnObservacionCli_Click" ImageUrl="~/assets/img/page.png" ToolTip='<%# Bind("OBSERVACION_CLIENTE") %>' />
                                            <asp:Label ID="lblObservacionCli" runat="server" Visible="false" Text='<%# Bind("OBSERVACION_CLIENTE") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Adjunto">
                                        <ItemTemplate>
                                            <asp:Label ID="lblArchivo" runat="server" Visible="false" Text='<%# Bind("RUTA_ARCHIVO") %>'></asp:Label>
                                            <asp:LinkButton ID="btnArchivo" runat="server" OnClick="btnArchivo_Click" Text="text"><i class="fa fa-files-o"></i></asp:LinkButton>

                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Adjunto 2">
                                        <ItemTemplate>
                                            <asp:Label ID="lblArchivo2" runat="server" Visible="false" Text='<%# Bind("RUTA_ARCHIVO2") %>'></asp:Label>
                                            <asp:LinkButton ID="btnArchivo2" runat="server" OnClick="btnArchivo2_Click" Text="text"><i class="fa fa-files-o"></i></asp:LinkButton>

                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Pdf">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lbtnGenerarPdf" CssClass="btn btn-danger btn-xs" runat="server"
                                                OnClick="lbtnGenerarPdf_Click"><i aria-hidden="true" class="fa fa-file-pdf-o"></i> </asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lbtnEliminarOT" CssClass="btn btn-danger btn-xs" runat="server"
                                                OnClick="lbtnEliminarOT_Click" OnClientClick="return confirm('¿Esta seguro que desea eliminar la OT?');"><i aria-hidden="true" class="fa fa-close" ></i> </asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>

                                <PagerTemplate>
                                    <div>
                                        <div style="float: left">
                                            <asp:ImageButton ID="imgFirst" runat="server"
                                                ImageUrl="~/assets/img/grid/first.gif" OnClick="imgFirst_Click"
                                                Style="height: 15px" title="Navegación: Ir a la Primera Pagina" Width="26px" />
                                            <asp:ImageButton ID="imgPrev" runat="server"
                                                ImageUrl="~/assets/img/grid/prev.gif" OnClick="imgPrev_Click"
                                                title="Navegación: Ir a la Pagina Anterior" Width="26px" />
                                            <asp:ImageButton ID="imgNext" runat="server"
                                                ImageUrl="~/assets/img/grid/next.gif" OnClick="imgNext_Click"
                                                title="Navegación: Ir a la Siguiente Pagina" Width="26px" />
                                            <asp:ImageButton ID="imgLast" runat="server"
                                                ImageUrl="~/assets/img/grid/last.gif" OnClick="imgLast_Click"
                                                title="Navegación: Ir a la Ultima Pagina" Width="26px" />
                                        </div>

                                        <div style="float: left">
                                            Registros por página: 50
                                        </div>

                                        <div style="float: right">
                                            Total Registros: 
                                                <asp:Label ID="lblTotalRegistros" runat="server"></asp:Label>
                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                                Página
                                                <asp:Label ID="lblPagina" runat="server"></asp:Label>
                                            de
                                                <asp:Label ID="lblTotal" runat="server"></asp:Label>
                                        </div>
                                    </div>
                                </PagerTemplate>


                            </asp:GridView>
                        </div>
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->

                <div class="row">
                    <div class="col-md-12">
                        <div runat="server" class="box box-danger" id="divResumen" visible="false">
                            <asp:GridView ID="grvResumen" runat="server" Width="50%" CssClass="table table-bordered table-hover table-condensed small" HeaderStyle-CssClass="active" AutoGenerateColumns="false">
                                <Columns>
                                    <asp:TemplateField HeaderText="Estado">
                                        <ItemTemplate>
                                            <asp:Label ID="lblEstado" runat="server" Visible="true" Text='<%# Bind("ESTADO_ATENCION") %>'></asp:Label>
                                            <asp:Label ID="lblIdEstado" runat="server" Visible="false" Text='<%# Bind("ID_ESTADO_ATENCION") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Cantidad" ItemStyle-HorizontalAlign="Right">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lbtnCantidad" runat="server" Text='<%# Bind("CANTIDAD") %>' OnClick="lbtnCantidad_Click"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Exportar" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="btnExportar" Text="text" OnClick="btnExportar_Click" CssClass="btn btn-success btn-xs" runat="server"><i class="fa fa-lg fa-file-excel-o"></i></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->

                <asp:Panel ID="Panel1" runat="server" CssClass="example-modal modal" TabIndex="-1" role="dialog" aria-labelledby="myLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <div class="modal-header">
                                        <h4 class="modal-title" id="myLabel">Observación de la SOLPED</h4>
                                    </div>
                                    <div class="modal-body">
                                        <p>
                                            <asp:Label ID="lblObservacionTicket" runat="server" CssClass="text"></asp:Label>
                                        </p>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </div>
                </asp:Panel>

            </ContentTemplate>
        </asp:UpdatePanel>

    </section>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">

    <script src="AdminLTE-2.3.0/plugins/datepicker/bootstrap-datepicker.js"></script>
    <script src="AdminLTE-2.3.0/plugins/datepicker/locales/bootstrap-datepicker.es.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.2/moment.min.js"></script>

    <script src="AdminLTE-2.3.0/plugins/select2/select2.full.min.js"></script>

    <script type="text/javascript">

        $(document).ready(function () {
            cargar();
        });

        var prm = Sys.WebForms.PageRequestManager.getInstance();

        prm.add_endRequest(function () {
            cargar();
        });

        function cargar() {
            //agregar jquery de las funciones...

            var dp = $(".class-date");
            dp.datepicker({
                changeMonth: true,
                changeYear: true,
                weekStart: 1,
                format: "dd-mm-yyyy",
                language: "es",
                todayHighlight: true,
                autoclose: true
            });
        }
    </script>

</asp:Content>
