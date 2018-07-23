<%@ Page Title="" Language="C#" MasterPageFile="~/Sitio.Master" AutoEventWireup="true" CodeBehind="ReporteSolped.aspx.cs" Inherits="TagorManuCRM.ReporteSolped" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <script src="AdminLTE-2.3.0/plugins/canvasjs.min.js"></script>
<%--    <script src="AdminLTE-2.3.0/plugins/canvasjs-2.2/canvasjs.min.js"></script>--%>
     <script type="text/javascript">
        function ejemplo()
        {
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
          <h1>
            Reporte de Tickets
          </h1>
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
            <li><a href="#">Reportes</a></li>
            <li class="active">Reporte de Tickets</li>
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

                          <div class="col-xs-2">
                            <label for="ddlArea">Area</label>
                            <asp:DropDownList ID="ddlArea" runat="server" OnDataBound="ddlArea_DataBound" CssClass="form-control input-sm" 
                               >
                            </asp:DropDownList>
                        </div>

                        <div class="col-xs-2">
                            <label for="">Estado</label>
                            <asp:DropDownList ID="ddlEstado" runat="server" CssClass="form-control input-sm" OnDataBound="ddlEstado_DataBound">
                            </asp:DropDownList>
                        </div>

                        <div class="col-xs-2">
                            <label for="">Zonas</label>
                            <asp:CheckBoxList ID="chkZonas" runat="server" RepeatDirection="Horizontal"></asp:CheckBoxList>
                        </div>
                        
                        <div class="col-xs-2">
                            <label for="">Fecha Desde:</label>
                            <asp:TextBox ID="txtFechaDesde" ClientIDMode="Static" runat="server" CssClass="form-control input-sm class-date"></asp:TextBox>
                        </div>
                        <div class="col-xs-2">
                            <label for="">Fecha Hasta:</label>
                            <asp:TextBox ID="txtFechaHasta" ClientIDMode="Static" runat="server" CssClass="form-control input-sm class-date"></asp:TextBox>
                        </div>

                        <div class="col-xs-1">
                            <label></label>
                            <asp:LinkButton ID="lbtnBuscar" CssClass="btn btn-primary btn-sm btn-block" runat="server"
                                OnClick="lbtnBuscar_Click"><i aria-hidden="true" class="glyphicon glyphicon-search"></i>Buscar</asp:LinkButton>
                        </div>
                        
                        <div class="col-xs-1">
                            <label></label>
                             <asp:LinkButton ID="btnExcel" Text="text" OnClick="btnExcel_Click" CssClass="btn btn-success btn-sm btn-block" runat="server"><i class="fa fa-lg fa-file-excel-o"></i></asp:LinkButton>
                        </div>
                    </div>
                </div>
            </div>

            
            <div class="box box-danger">
            <div class="box-header with-border">
              <h3 class="box-title">Gráfico</h3>
              <div class="box-tools pull-right">
                <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
              </div>
            </div><!-- /.box-header -->
            <div class="box-body">
                   <div id="chartContainer" style="height: 300px; width: 100%;"></div>
            </div><!-- /.box-body -->
            <div class="box-footer">
              
            </div>
          </div><!-- /.box -->

            <div class="row">
                <div class="col-md-6">
                    <div class="box box-info">
                        <div class="box-header with-border">
                            <h3 class="box-title">Detalle</h3>
                            <div class="box-tools pull-right">
                                <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
                            </div>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <asp:GridView ID="grvAtencionCliente" EmptyDataText="Selección realizada no obtuvo registros" runat="server" HeaderStyle-CssClass="active" PagerStyle-CssClass="active" CssClass="table table-bordered table-hover table-condensed table small panel table-responsive" AutoGenerateColumns="false" OnRowDataBound="grvAtencionCliente_RowDataBound" ShowFooter="True">
                                <Columns>
                                    <asp:TemplateField HeaderText="Canal">
                                        <ItemTemplate>
                                            <asp:Label ID="lblNIvel1" runat="server" Text='<%# Bind("NIVEL_1") %>'></asp:Label>
                                            <asp:Label ID="lblIdNivel1" runat="server" Visible="false" Text='<%# Bind("NIVEL_1") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Pendiente">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lbtnPendiente" Text='<%# Bind("PENDIENTE") %>' OnClick="lbtnPendiente_Click" Visible="true" runat="server"></asp:LinkButton>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Right" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Cerrado">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lbtnCerrado" Text='<%# Bind("CERRADO") %>' OnClick="lbtnCerrado_Click" Visible="true" runat="server"></asp:LinkButton>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Right" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Total">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lbtnTotal" Text='<%# Bind("TOTAL") %>' OnClick="lbtnTotal_Click" Visible="true" runat="server"></asp:LinkButton>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Right" />
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                        <!-- /.box-body -->
                        <div class="box-footer">
                        </div>
                    </div>
                    <!-- /.box -->
                </div>
            </div>
            
       

            </section>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
          <script src="AdminLTE-2.3.0/plugins/datepicker/bootstrap-datepicker.js"></script>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.2/moment.min.js"></script>
        <script type="text/javascript">
        $(document).ready(function () {
            var dp = $(".class-date");
                dp.datepicker({
                changeMonth: true,
                changeYear: true,
                format: "dd-mm-yyyy",
                language: "es"
            });
        });
        </script>
</asp:Content>
