<%@ Page Title="" Language="C#" MasterPageFile="~/Sitio.Master" AutoEventWireup="true" CodeBehind="ReporteSolped.aspx.cs" Inherits="TagorManuCRM.ReporteSolped" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <link href="AdminLTE-2.3.0/plugins/datepicker/datepicker3.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <script src="AdminLTE-2.3.0/plugins/canvasjs.min.js"></script>
    <%--    <script src="AdminLTE-2.3.0/plugins/canvasjs-2.2/canvasjs.min.js"></script>--%>
    <script type="text/javascript">
        function ejemplo() {
            var chart = new CanvasJS.Chart("chartContainer",
                {
                    animationEnabled: true,
                    title: {
                        text: " "
                    },
                    data: [
                        {
                            type: "column", //change type to bar, line, area, pie, etc
                            dataPoints: <%=consultaStr %> 
                }
                    ]
                });

            chart.render();

        }
    </script>

    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>Reporte de OT's
          </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
            <li><a href="#">Reportes</a></li>
            <li class="active">Reporte de OT's</li>
        </ol>
    </section>


    <section class="content">
        <!-- Alertas -->
        <div id="divAlerta" runat="server" visible="false" class="alert alert-danger">
            <strong>Atención!: </strong>
            <asp:Label Text="" ID="lblInfo" runat="server" />
        </div>

        <div class="box box-success">
            <%--<div class="box-header with-border">
                    <h3 class="box-title">Buscar</h3>
                </div>--%>
            <div class="box-body">
                <div class="row">
                    <div class="col-lg-2 col-xs-12">
                        <label for="">Fecha Desde:</label>
                        <asp:TextBox ID="txtFechaDesde" ClientIDMode="Static" runat="server" CssClass="form-control input-sm class-date"></asp:TextBox>
                    </div>
                    <div class="col-lg-2 col-xs-12">
                        <label for="">Fecha Hasta:</label>
                        <asp:TextBox ID="txtFechaHasta" ClientIDMode="Static" runat="server" CssClass="form-control input-sm class-date"></asp:TextBox>
                    </div>
                    <div class="col-lg-2 col-xs-12">
                        <label for="ddlUsuario">Sucursal</label>
                        <asp:DropDownList ID="ddlSucursal" runat="server" OnDataBound="ddlSucursal_DataBound" CssClass="form-control input-sm">
                        </asp:DropDownList>
                    </div>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <div class="col-lg-2 col-xs-12">
                                <label for="ddlZonas">Zonas</label>
                                <asp:DropDownList ID="ddlZonas" runat="server" OnDataBound="ddlZonas_DataBound" CssClass="form-control input-sm" AutoPostBack="true" OnSelectedIndexChanged="ddlZona_SelectedIndexChanged">
                                </asp:DropDownList>
                            </div>
                            <div class="col-lg-2 col-xs-12">
                                <label for="ddlUsuario">Local</label>
                                <asp:DropDownList ID="ddlLocal" runat="server" OnDataBound="ddlLocal_DataBound" CssClass="form-control input-sm">
                                </asp:DropDownList>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <div class="col-lg-2 col-xs-12">
                        <label for="ddlUsuario">Usuario Asignado</label>
                        <asp:DropDownList ID="ddlUsuario" runat="server" OnDataBound="ddlUsuario_DataBound" CssClass="form-control input-sm">
                        </asp:DropDownList>
                    </div>
                    <div class="col-lg-2 col-xs-12">
                        <label for="ddlArea">Area</label>
                        <asp:DropDownList ID="ddlArea" runat="server" OnDataBound="ddlArea_DataBound" CssClass="form-control input-sm">
                        </asp:DropDownList>
                    </div>
                    <div class="col-lg-2 col-xs-12">
                        <label for="">Estado</label>
                        <asp:DropDownList ID="ddlEstado" runat="server" CssClass="form-control input-sm" OnDataBound="ddlEstado_DataBound">
                        </asp:DropDownList>
                    </div>
                    <div class="col-lg-1 col-xs-12">
                        <label></label>
                        <asp:LinkButton ID="lbtnBuscar" CssClass="btn btn-primary btn-sm btn-block" runat="server"
                            OnClick="lbtnBuscar_Click"><i aria-hidden="true" class="glyphicon glyphicon-search"></i>Buscar</asp:LinkButton>
                    </div>
                    <div class="col-lg-1 col-xs-12">
                        <label></label>
                        <asp:LinkButton ID="btnExcel" Text="text" OnClick="btnExcel_Click" CssClass="btn btn-success btn-sm btn-block" runat="server"><i class="fa fa-lg fa-file-excel-o"></i></asp:LinkButton>
                    </div>
                    <%--<div class="col-xs-2">
                        <label for="">Zonas</label>
                        <asp:CheckBoxList ID="chkZonas" runat="server" RepeatDirection="Horizontal" CssClass="table table-condensed small"></asp:CheckBoxList>
                    </div>--%>
                </div>
                <div class="row">
                </div>
            </div>
        </div>

        
        <div class="row">
            <div class="col-lg-4 col-xs-12">
                <div class="info-box">
                    <span class="info-box-icon bg-red-active"><i class="ion ion-android-alarm-clock"></i></span>
                    <div class="info-box-content">
                        <span class="info-box-text">AVG Tiempo Resolución (DD:HH:MM:SS)</span>
                        <span class="info-box-text">CORRECTIVA</span>
                        <span class="info-box-number">
                            <asp:Label ID="lblAvgTiempoResolucionCorrectiva" runat="server"  CssClass="text-bold text-black" Font-Size="XX-Large"  Text="90"></asp:Label>
                            <%--<asp:GridView ID="grvCorrectiva" EmptyDataText="Selección realizada no obtuvo registros" runat="server"
                              AutoGenerateColumns="false" CssClass="table table-condensed table-responsive" BorderColor="Transparent">
                            <Columns>
                                <asp:TemplateField HeaderText="DD">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDias" runat="server" Text='<%# Bind("DIAS") %>'></asp:Label>
                                    </ItemTemplate>
                                 
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="HH">
                                    <ItemTemplate>
                                        <asp:Label ID="lblHoras" runat="server" Text='<%# Bind("HORAS") %>'></asp:Label>
                                    </ItemTemplate>
                                    
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="MM">
                                    <ItemTemplate>
                                        <asp:Label ID="lblMinutos" runat="server" Text='<%# Bind("MINUTOS") %>'></asp:Label>
                                    </ItemTemplate>
                                
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="SS">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSegundos" runat="server" Text='<%# Bind("SEGUNDOS") %>'></asp:Label>
                                    </ItemTemplate>
                                 
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>--%>
                        </span>
                    </div>
                    <!-- /.info-box-content -->
                </div>
            </div>
            <div class="col-lg-4 col-xs-12">
                <div class="info-box">
                    <span class="info-box-icon bg-yellow"><i class="ion ion-android-alarm-clock"></i></span>
                    <div class="info-box-content">
                        <span class="info-box-text">AVG Tiempo Resolución (DD:HH:MM:SS)</span>
                        <span class="info-box-text">CORRECTIVA PLANIFICADA</span>
                        <span class="info-box-number">
                            <asp:Label ID="lblAvgTiempoResolucionCorrectivaPlanificada" runat="server"  CssClass="text-bold text-black" Font-Size="XX-Large"  Text="90"></asp:Label>
                        </span>
                    </div>
                    <!-- /.info-box-content -->
                </div>
            </div>
            <div class="col-lg-4 col-xs-12">
                <div class="info-box">
                    <span class="info-box-icon  bg-black-gradient"><i class="ion ion-android-alarm-clock"></i></span>
                    <div class="info-box-content">
                        <span class="info-box-text">AVG Tiempo Resolución (DD:HH:MM:SS)</span>
                        <span class="info-box-text">PREVENTIVA</span>
                        <span class="info-box-number">
                            <asp:Label ID="lblAvgTiempoResolucionPreventiva" runat="server"  CssClass="text-bold text-black" Font-Size="XX-Large"  Text="90"></asp:Label>
                        </span>
                    </div>
                    <!-- /.info-box-content -->
                </div>
            </div>
        </div>

        <div class="box box-danger">
            <div class="box-header with-border">
                <h3 class="box-title">Gráfico Mantenciones</h3>
                <div class="box-tools pull-right">
                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                    <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
                </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body " style="width: 100%;  overflow-y: scroll;">
                <div id="chartContainer" style="height: 300px; width: 100%;"></div>
            </div>
            <!-- /.box-body -->
            <div class="box-footer">
            </div>
        </div>

        <!-- /.box -->

        <div class="row">
            <div class="col-md-6">
                <div class="box box-info">
                    <div class="box-header with-border">
                        <h3 class="box-title">Detalle por Mantención</h3>
                        <div class="box-tools pull-right">
                            <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                            <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
                        </div>
                    </div>
                    <!-- /.box-header -->

                    <div class="box-body">
                        <asp:GridView ID="grvAtencionCliente" EmptyDataText="Selección realizada no obtuvo registros" runat="server" HeaderStyle-CssClass="info"
                            PagerStyle-CssClass="info" CssClass="table table-responsive table-hover" AutoGenerateColumns="false" OnRowDataBound="grvAtencionCliente_RowDataBound" BorderColor="Transparent">
                            <Columns>
                                <asp:TemplateField HeaderText="Mantención" ItemStyle-CssClass="info">
                                    <ItemTemplate>
                                        <asp:Label ID="lblNIvel1" runat="server" Text='<%# Bind("NIVEL_1") %>'></asp:Label>
                                        <asp:Label ID="lblIdNivel1" runat="server" Visible="false" Text='<%# Bind("NIVEL_1") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Pendiente" ItemStyle-CssClass="danger">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbtnPendiente" Text='<%# Bind("PENDIENTE") %>' OnClick="lbtnPendiente_Click" Visible="true" runat="server"></asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Right" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Cerrado" ItemStyle-CssClass="success">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbtnCerrado" Text='<%# Bind("CERRADO") %>' OnClick="lbtnCerrado_Click" Visible="true" runat="server"></asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Right" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total" ItemStyle-CssClass="warning">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbtnTotal" Text='<%# Bind("TOTAL") %>' OnClick="lbtnTotal_Click" Visible="true" runat="server"></asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Right" />
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <!-- /.box-body -->
                    <%-- <div class="box-footer">
                    </div>--%>
                </div>
                <!-- /.box -->
            </div>



            <div class="col-md-6">
                <div class="box box-info">
                    <div class="box-header with-border">
                        <h3 class="box-title">Detalle por Usuarios</h3>
                        <div class="box-tools pull-right">
                            <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                            <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
                        </div>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <asp:GridView ID="grvDetallePorUsuario" EmptyDataText="Busqueda realizada no obtuvo registros" runat="server" BorderColor="Transparent"
                            HeaderStyle-CssClass="info" PagerStyle-CssClass="info" CssClass="table table-responsive table-hover" AutoGenerateColumns="false" OnRowDataBound="grvDetallePorUsuario_RowDataBound">
                            <Columns>
                                <asp:TemplateField HeaderText="Usuario" ItemStyle-CssClass="info">
                                    <ItemTemplate>
                                        <asp:Label ID="lblUsuario" runat="server" Text='<%# Bind("USUARIO") %>'></asp:Label>
                                        <asp:Label ID="lblIdUsuario" runat="server" Visible="false" Text='<%# Bind("ID_USUARIO") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Pendiente" ItemStyle-CssClass="danger">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbtnPendientePorUsuario" Text='<%# Bind("PENDIENTE") %>' OnClick="lbtnPendientePorUsuario_Click" Visible="true" runat="server"></asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Right" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Cerrado" ItemStyle-CssClass="success">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbtnCerradoPorUsuario" Text='<%# Bind("CERRADO") %>' OnClick="lbtnCerradoPorUsuario_Click" Visible="true" runat="server"></asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Right" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total" ItemStyle-CssClass="warning">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbtnTotalPorUsuario" Text='<%# Bind("TOTAL") %>' OnClick="lbtnTotalPorUsuario_Click" Visible="true" runat="server"></asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Right" />
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <!-- /.box-body -->
                    <%--<div class="box-footer">
                    </div>--%>
                </div>
                <!-- /.box -->
            </div>
        </div>



    </section>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
    <script src="AdminLTE-2.3.0/plugins/datepicker/bootstrap-datepicker.js"></script>
    <script src="AdminLTE-2.3.0/plugins/datepicker/locales/bootstrap-datepicker.es.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.2/moment.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {

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
        });
    </script>
</asp:Content>
