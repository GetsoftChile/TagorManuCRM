<%@ Page Title="" Language="C#" MasterPageFile="~/Sitio.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="TagorManuCRM.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">


    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>Dashboard Panel de Control
          </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
            <li class="active">Dashboard</li>
        </ol>
    </section>
    <!--  -->

    <section class="content">

        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>


                <!-- Alertas -->
                <div id="divAlerta" runat="server" visible="false" class="alert alert-danger">
                    <strong>¡Atención!: </strong>
                    <asp:Label Text="" ID="lblInfo" runat="server" />
                </div>

                <asp:Panel ID="pnlPrincipal" runat="server">

                    <div class="row">
                        <div class="col-lg-4 col-xs-12">
                            <!-- small box -->
                            <div class="small-box bg-red">
                                <div class="inner">
                                    <h2>
                                        <%--   <asp:Label ID="lblTotalCasosAbiertos" runat="server" Text="EMERGENCIAS" />--%>
                                        <asp:LinkButton ID="lbtnEmergencias" runat="server" CssClass="label" OnClick="lbtnEmergencias_Click">EMERGENCIAS</asp:LinkButton>
                                    </h2>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-alert-circled"></i>
                                </div>
                                <asp:LinkButton ID="lbtnVerNumeros" runat="server" CssClass="small-box-footer" OnClick="lbtnVerNumeros_Click"><i class="fa fa-arrow-circle-right"></i> Mas Info</asp:LinkButton>
                                <%--<a href="#" class="small-box-footer">Más info <i class="fa fa-arrow-circle-right"></i>
                         </a>--%>
                            </div>
                        </div>
                        <div class="col-lg-4 col-xs-12" runat="server" id="divSolicitudOT">
                            <!-- small box -->
                            <div class="small-box bg-blue">
                                <div class="inner">
                                    <h2>
                                        <%--   <asp:Label ID="lblTotalCasosAbiertos" runat="server" Text="EMERGENCIAS" />--%>
                                        <asp:LinkButton ID="lbtnSolicitudOrdenTrabajo" runat="server" CssClass="label control-label" OnClick="lbtnSolicitudOrdenTrabajo_Click">GENERAR SOLPED</asp:LinkButton>
                                    </h2>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-edit"></i>
                                </div>
                                <asp:LinkButton ID="lbtnSolicitudOT" runat="server" CssClass="small-box-footer" OnClick="lbtnSolicitudOT_Click"><i class="fa fa-arrow-circle-right"></i> </asp:LinkButton>
                                <%--<a href="#" class="small-box-footer">Más info <i class="fa fa-arrow-circle-right"></i>
                         </a>--%>
                            </div>
                        </div>
                        <div class="col-lg-4 col-xs-12">
                            <!-- small box -->
                            <div class="small-box bg-green">
                                <div class="inner">
                                    <h2>
                                        <%--   <asp:Label ID="lblTotalCasosAbiertos" runat="server" Text="EMERGENCIAS" />--%>
                                        <asp:LinkButton ID="lbtnBuscarOT" runat="server" CssClass="label control-label" OnClick="lbtnBuscarOT_Click">BUSCAR SOLPED</asp:LinkButton>
                                    </h2>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-search"></i>
                                </div>
                                <asp:LinkButton ID="lbtnBuscarOT2" runat="server" CssClass="small-box-footer" OnClick="lbtnBuscarOT2_Click"><i class="fa fa-arrow-circle-right"></i> </asp:LinkButton>
                                <%--<a href="#" class="small-box-footer">Más info <i class="fa fa-arrow-circle-right"></i>
                         </a>--%>
                            </div>
                        </div>
                    </div>

                    <div class="row" runat="server" id="divContador">
                        <div class="col-lg-12">
                            <div class="box box-primary">
                                <div class="box-header with-border box-solid">
                                    <h3 class="box-title">AREA</h3>
                                    <asp:DropDownList ID="ddlArea" runat="server" CssClass="form-control" Width="33%" AutoPostBack="true" OnSelectedIndexChanged="ddlArea_SelectedIndexChanged" OnDataBound="ddlArea_DataBound"></asp:DropDownList>
                                    <h3 class="box-title">SUCURSAL</h3>
                                    <asp:DropDownList ID="ddlSucursal" runat="server" CssClass="form-control" Width="33%" AutoPostBack="true" OnSelectedIndexChanged="ddlSucursal_SelectedIndexChanged" OnDataBound="ddlSucursal_DataBound"></asp:DropDownList>
                                    <div class="box-tools pull-right">
                                        <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                        <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                                    </div>
                                </div>
                                <div class="box-body">
                                    <!-- /.CORRECTIVOS -->
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="box box-danger">
                                                <div class="box-header with-border">
                                                    <h3 class="box-title">Correctivos</h3>
                                                    <div class="box-tools pull-right">
                                                        <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                                        <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                                                    </div>
                                                </div>
                                                <!-- /.box-header -->
                                                <div class="box-body">
                                                    <div class="row">
                                                        <div class="col-lg-12 col-xs-12">

                                                            <div class="info-box">
                                                                <span class="info-box-icon bg-maroon"><i class="ion ion-android-alarm-clock"></i></span>
                                                                <div class="info-box-content">
                                                                    <span class="info-box-text">SOLPED PENDIENTES</span>
                                                                    <span class="info-box-number">
                                                                        <asp:LinkButton ID="lbtnOTCorrectivasPendientes" runat="server" CssClass="text-bold text-black" Font-Size="XX-Large" OnClick="lbtnOTCorrectivasPendientes_Click" Text="90"></asp:LinkButton>
                                                                    </span>
                                                                </div>
                                                                <!-- /.info-box-content -->
                                                            </div>
                                                            <!-- /.info-box -->

                                                        </div>
                                                        <div class="col-lg-12 col-xs-12">
                                                            <div class="info-box">
                                                                <span class="info-box-icon bg-aqua"><i class="ion ion-checkmark-circled"></i></span>
                                                                <div class="info-box-content">
                                                                    <span class="info-box-text">SOLPED CERRADAS</span>
                                                                    <span class="info-box-number">
                                                                        <asp:LinkButton ID="lbtnOTCorrectivasCerradas" runat="server" CssClass="text-bold text-black" Font-Size="XX-Large" OnClick="lbtnOTCorrectivasCerradas_Click" Text="90"></asp:LinkButton>
                                                                    </span>
                                                                </div>
                                                                <!-- /.info-box-content -->
                                                            </div>
                                                            <!-- /.info-box -->
                                                        </div>
                                                    </div>
                                                    <!-- /.row -->
                                                </div>
                                                <!-- ./box-body -->
                                                <div class="box-footer">
                                                </div>
                                                <!-- /.box-footer -->
                                            </div>
                                            <!-- /.box -->
                                        </div>
                                        <!-- /.col -->

                                        <div class="col-md-4">
                                            <div class="box box-warning">
                                                <div class="box-header with-border">
                                                    <h3 class="box-title">Correctivos Planificados</h3>
                                                    <div class="box-tools pull-right">
                                                        <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                                        <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                                                    </div>
                                                </div>
                                                <!-- /.box-header -->
                                                <div class="box-body">
                                                    <div class="row">
                                                        <div class="col-lg-12 col-xs-12">


                                                            <div class="info-box">
                                                                <span class="info-box-icon bg-maroon"><i class="ion ion-android-alarm-clock"></i></span>
                                                                <div class="info-box-content">
                                                                    <span class="info-box-text">SOLPED PENDIENTES</span>
                                                                    <span class="info-box-number">
                                                                        <asp:LinkButton ID="lbtnOTCorrectivoPlanificadoPendiente" runat="server" CssClass="text-bold text-black" Font-Size="XX-Large" OnClick="lbtnOTCorrectivoPlanificadoPendiente_Click" Text="90"></asp:LinkButton>
                                                                    </span>
                                                                </div>
                                                                <!-- /.info-box-content -->
                                                            </div>
                                                            <!-- /.info-box -->
                                                        </div>
                                                        <div class="col-lg-12 col-xs-12">
                                                            <!-- small box -->

                                                            <div class="info-box">
                                                                <span class="info-box-icon bg-aqua"><i class="ion ion-checkmark-circled"></i></span>
                                                                <div class="info-box-content">
                                                                    <span class="info-box-text">SOLPED CERRADAS</span>
                                                                    <span class="info-box-number">
                                                                        <asp:LinkButton ID="lbtnOTCorrectivoPlanificadoCerrado" runat="server" CssClass="text-bold text-black" Font-Size="XX-Large" OnClick="lbtnOTCorrectivoPlanificadoCerrado_Click" Text="90"></asp:LinkButton>
                                                                    </span>
                                                                </div>
                                                                <!-- /.info-box-content -->
                                                            </div>
                                                            <!-- /.info-box -->
                                                        </div>
                                                    </div>
                                                    <!-- /.row -->
                                                </div>
                                                <!-- ./box-body -->
                                                <div class="box-footer">
                                                </div>
                                                <!-- /.box-footer -->
                                            </div>
                                            <!-- /.box -->
                                        </div>
                                        <!-- /.col -->
                                        <div class="col-md-4">
                                            <div class="box box-success">
                                                <div class="box-header with-border">
                                                    <h3 class="box-title">Preventivo</h3>
                                                    <div class="box-tools pull-right">
                                                        <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                                        <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                                                    </div>
                                                </div>
                                                <!-- /.box-header -->
                                                <div class="box-body">
                                                    <div class="row">
                                                        <div class="col-lg-12 col-xs-12">
                                                            <!-- small box -->
                                                            <div class="info-box">
                                                                <span class="info-box-icon bg-maroon"><i class="ion ion-android-alarm-clock"></i></span>
                                                                <div class="info-box-content">
                                                                    <span class="info-box-text">SOLPED PENDIENTES</span>
                                                                    <span class="info-box-number">
                                                                        <asp:LinkButton ID="lbtnOTPreventivoPendiente" runat="server" CssClass="text-bold text-black" Font-Size="XX-Large" OnClick="lbtnOTPreventivoPendiente_Click" Text="90"></asp:LinkButton>
                                                                    </span>
                                                                </div>
                                                                <!-- /.info-box-content -->
                                                            </div>
                                                            <!-- /.info-box -->
                                                        </div>
                                                        <div class="col-lg-12 col-xs-12">
                                                            <!-- small box -->

                                                            <div class="info-box">
                                                                <span class="info-box-icon bg-aqua"><i class="ion ion-checkmark-circled"></i></span>
                                                                <div class="info-box-content">
                                                                    <span class="info-box-text">SOLPED CERRADAS</span>
                                                                    <span class="info-box-number">
                                                                        <asp:LinkButton ID="lbtnOTPreventivoCerrado" runat="server" CssClass="text-bold text-black" Font-Size="XX-Large" OnClick="lbtnOTPreventivoCerrado_Click" Text="90"></asp:LinkButton>
                                                                    </span>
                                                                </div>
                                                                <!-- /.info-box-content -->
                                                            </div>
                                                            <!-- /.info-box -->
                                                        </div>
                                                    </div>
                                                    <!-- /.row -->
                                                </div>
                                                <!-- ./box-body -->
                                                <div class="box-footer">
                                                </div>
                                                <!-- /.box-footer -->
                                            </div>
                                            <!-- /.box -->
                                        </div>


                                    </div>
                                    <!-- /.row -->
                                </div>
                            </div>
                        </div>

                    </div>





                </asp:Panel>



                <asp:Panel ID="Panel1" runat="server" CssClass="modal fade bs-example-modal-lg" TabIndex="-1" role="dialog" aria-labelledby="myLabel">
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <div>
                                        <div class=" alert-danger alert-dismissable">
                                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>

                                            <h4><i class="icon fa fa-ban"></i>Emergencia!</h4>
                                            <asp:Label ID="lblInfomacionEmergencia" Text="" runat="server"></asp:Label>
                                            Informe la emergencia al siguiente teléfono
                                            <br />
                                            <br />
                                            <b>2 2423 5676</b>
                                            <br />
                                            <br />
                                            ADVERTENCIA
                                            <br />
                                            Las emergencia ingresadas que no sean tales, serán recobradas
                              
                                        </div>
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
</asp:Content>
