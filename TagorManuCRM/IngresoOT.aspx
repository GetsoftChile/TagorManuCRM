<%@ Page Title="" Language="C#" MasterPageFile="~/Sitio.Master" AutoEventWireup="true" CodeBehind="IngresoOT.aspx.cs" Inherits="TagorManuCRM.IngresoOT" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <link href="AdminLTE-2.3.0/plugins/datepicker/datepicker3.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <!-- Content Header (Page header) -->
        <section class="content-header">
          <h5>
            
          </h5>
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> SOLPED</a></li>
            <li class="active">Ingreso SOLPED</li>
          </ol>
        </section>
        <!--  -->
    <section class="content">

        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <!-- Alertas -->
        <div id="divAlerta" runat="server" visible="false" class="alert alert-danger">
            <strong>Atención!: </strong>
            <asp:Label Text="" ID="lblInfo" runat="server" />
        </div>

            <div class="panel panel-primary" id="divSearch" runat="server">
                <div class="panel-heading">
                    <strong>Ingreso de SOLPED</strong>
                </div>
                <div class="panel-body">

                    <div class="row">
                        <div class="col-xs-12 col-lg-2">
                            <strong>Usuario Solicitante:</strong><br />
                            <asp:Label ID="lblUsuario" runat="server"></asp:Label>
                        </div>
                        <div class="col-xs-12 col-lg-2">
                            <strong>Nombre Solicitante:</strong><br />
                            <asp:Label ID="lblNombreUsuario" runat="server"></asp:Label>
                        </div>
                    </div>
            </div>
                
                
                <div class="panel-heading ">
                    <strong>Ultimas SOLPED</strong>
                </div>

                <div style="width: 100%; height: 100%; overflow-y: scroll;">

                    <asp:GridView ID="grvTickets" runat="server" CssClass="table table-bordered table-hover table-condensed small" HeaderStyle-CssClass="active" AutoGenerateColumns="false" OnRowDataBound="paginacion_RowDataBound" EmptyDataText="No hay SOLPED creadas" EmptyDataRowStyle-CssClass="active h4" PageSize="10" AllowPaging="true" >
                            <Columns>
                                <asp:TemplateField HeaderText="Solped">
                                    <ItemTemplate>
                                        <asp:Label ID="lblIdTicket" runat="server" Visible="false" Text='<%# Bind("ID_ATENCION") %>'></asp:Label>
                                        <asp:LinkButton ID="lbtnIdTicket" runat="server" Text='<%# Bind("ID_ATENCION") %>' OnClick="lbtnIdTicket_Click"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Rut" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lblRutCliente" runat="server" Visible="true" Text='<%# Bind("RUT_CLIENTE") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Nombre" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lblNombreCliente" runat="server" Visible="true" Text='<%# Bind("NOMBRE_CLIENTE") %>'></asp:Label>
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
                                <asp:TemplateField HeaderText="Zona">
                                    <ItemTemplate>
                                        <asp:Label ID="lblIdZona" runat="server" Text='<%# Bind("ID_ZONA") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Local">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("COD_LOCAL") %>'></asp:Label>
                                        <asp:Label ID="lblLocal" runat="server" Text='<%# Bind("NOMBRE_LOCAL") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Area">
                                    <ItemTemplate>
                                        <asp:Label ID="lblArea" runat="server" Text='<%# Bind("AREA") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Tipo">
                                    <ItemTemplate>
                                        <asp:Label ID="lblTipo" runat="server" Text='<%# Bind("CLASE2") %>'></asp:Label>
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
                                        <asp:ImageButton ID="ibtnObservacion" runat="server" OnClick="ibtnObservacion_Click" ImageUrl="~/assets/img/page.png" ToolTip='<%# Bind("OBSERVACION") %>'/>
                                        <asp:Label ID="lblObservacion" runat="server" Visible="false" Text='<%# Bind("OBSERVACION") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%--<asp:TemplateField HeaderText="Obs Cli" Visible="false">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="ibtnObservacionCli" runat="server" OnClick="ibtnObservacionCli_Click" ImageUrl="~/assets/img/page.png" ToolTip='<%# Bind("OBSERVACION_CLIENTE") %>'/>
                                        <asp:Label ID="lblObservacionCli" runat="server" Visible="false" Text='<%# Bind("OBSERVACION_CLIENTE") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>--%>
                                <asp:TemplateField HeaderText="Adjunto">
                                    <ItemTemplate>
                                        <asp:Label ID="lblArchivo" runat="server" Visible="false" Text='<%# Bind("RUTA_ARCHIVO") %>'></asp:Label>
                                        <asp:LinkButton ID="btnArchivo" runat="server" OnClick="btnArchivo_Click" Text="text" ><i class="fa fa-files-o"></i></asp:LinkButton>
                                        
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Adjunto 2">
                                    <ItemTemplate>
                                        <asp:Label ID="lblArchivo2" runat="server" Visible="false" Text='<%# Bind("RUTA_ARCHIVO2") %>'></asp:Label>
                                        <asp:LinkButton ID="btnArchivo2" runat="server" OnClick="btnArchivo2_Click" Text="text" ><i class="fa fa-files-o"></i></asp:LinkButton>
                                        
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Pdf">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbtnGenerarPdf" CssClass="btn btn-danger btn-xs" runat="server"
                                        OnClick="lbtnGenerarPdf_Click"><i aria-hidden="true" class=" fa fa-file-pdf-o"></i> </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>


                            
                    <PagerTemplate>
                        <div>
                            <div style="float:left">
                                <asp:ImageButton ID="imgFirst" runat="server"  
                                    ImageUrl="~/assets/img/grid/first.gif" onclick="imgFirst_Click" 
                                    style="height: 15px" title="Navegación: Ir a la Primera Pagina" Width="26px" />
                                <asp:ImageButton ID="imgPrev" runat="server" 
                                    ImageUrl="~/assets/img/grid/prev.gif" onclick="imgPrev_Click" 
                                    title="Navegación: Ir a la Pagina Anterior" Width="26px" />
                                <asp:ImageButton ID="imgNext" runat="server"
                                    ImageUrl="~/assets/img/grid/next.gif" onclick="imgNext_Click" 
                                    title="Navegación: Ir a la Siguiente Pagina" Width="26px" />
                                <asp:ImageButton ID="imgLast" runat="server" 
                                    ImageUrl="~/assets/img/grid/last.gif" onclick="imgLast_Click" 
                                    title="Navegación: Ir a la Ultima Pagina" Width="26px" />
                            </div>

                            <div style="float:left">
                            Registros por página: 10
                            </div>

                            <div style="float:right">
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

                <div class=" panel-heading">
                    <strong>Ingreso</strong>
                </div>
               <div class="panel-body">
                   <div class="row">
                       <div class="col-lg-2 col-xs-12">
                           <strong>Zona</strong>
                           <asp:DropDownList ID="ddlZona" Width="100%" runat="server" CssClass="form-control input-sm" AutoPostBack="true" OnSelectedIndexChanged="ddlZona_SelectedIndexChanged">
                           </asp:DropDownList>
                       </div>
                       <div class="col-lg-3 col-xs-12">
                           <strong>Local</strong>
                           <asp:DropDownList ID="ddlLocal" Width="100%" runat="server" CssClass="form-control input-sm" AutoPostBack="false" OnSelectedIndexChanged="ddlLocal_SelectedIndexChanged">
                           </asp:DropDownList>
                       </div>
                       <div class="col-lg-3 col-xs-12">
                           <strong>Tipo SOLPED</strong>
                           <asp:DropDownList ID="ddlTipoOT" Width="100%" runat="server" CssClass="form-control input-sm" OnSelectedIndexChanged="ddlTipoOT_SelectedIndexChanged" AutoPostBack="true">
                               <asp:ListItem Text="Seleccionar" Value="0"></asp:ListItem>
                               <asp:ListItem Text="Correctiva (Emergencia)" Value="C"></asp:ListItem>
                               <asp:ListItem Text="Correctiva (Planificado)" Value="CP"></asp:ListItem>
                               <asp:ListItem Text="Preventiva" Value="P"></asp:ListItem>
                           </asp:DropDownList>
                       </div>
                       <div class="col-lg-2 col-xs-12" runat="server" visible="false" id="divFechaAgendamiento">
                           <strong>Fecha Agendamiento</strong>
                           <asp:TextBox ID="txtFechaAgendamiento" runat="server" ClientIDMode="Static" CssClass="form-control input-sm class-date"></asp:TextBox>
                       </div>
                       <div class="col-lg-2 col-xs-12">
                           <strong>Especialidad</strong>
                           <asp:DropDownList ID="ddlArea" Width="100%" runat="server" CssClass="form-control input-sm" AutoPostBack="true" OnSelectedIndexChanged="ddlArea_SelectedIndexChanged" OnDataBound="ddlArea_DataBound">
                           </asp:DropDownList>
                       </div>
                   </div>

                   <div class="row" runat="server" visible="false" id="divLocal">
                       <div class="col-xs-12 col-lg-3">
                            <strong>Cod Local:</strong><br />
                            <asp:Label ID="lblCodLocal" runat="server" ></asp:Label>
                        </div>
                        <div class="col-xs-12 col-lg-3">
                            <strong>Local:</strong><br />
                            <asp:Label ID="lblLocal" runat="server"></asp:Label>
                        </div>
                        <div class="col-xs-12 col-lg-3">
                            <strong>Direccion Local:</strong><br />
                            <asp:Label ID="lblDireccionLocal" runat="server"></asp:Label>
                        </div>
                        <div class="col-xs-12 col-lg-3">
                            <strong>Telefono Local:</strong><br />
                            <asp:Label ID="lblTelefonoLocal" runat="server"></asp:Label>
                        </div>
                   </div>

                    <div class="row" runat="server" id="divTipificacion" visible="false">
                        <div class="col-md-2">
                            <div class="form-group">
                                <strong><asp:Label ID="lblNivel1" runat="server" Text="Nivel 1"></asp:Label></strong>
                                <asp:DropDownList ID="ddlNivel1" Width="100%" runat="server" CssClass="form-control input-sm" OnSelectedIndexChanged="ddlNivel1_SelectedIndexChanged" OnDataBound="ddlNivel1_DataBound" AutoPostBack="true">
                                </asp:DropDownList>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <!-- /.form-group -->
                            <div class="form-group">
                                <strong><asp:Label ID="lblNivel2" runat="server" Text="Nivel 2"></asp:Label></strong>
                                <asp:DropDownList ID="ddlNivel2" Width="100%" runat="server" CssClass="form-control input-sm" OnSelectedIndexChanged="ddlNivel2_SelectedIndexChanged" OnDataBound="ddlNivel2_DataBound" AutoPostBack="true">
                                </asp:DropDownList>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <!-- /.form-group -->
                            <div class="form-group">
                                <strong><asp:Label ID="lblNivel3" runat="server" Text="Nivel 3"></asp:Label></strong>
                                <asp:DropDownList ID="ddlNivel3" Width="100%" runat="server" CssClass="form-control input-sm" OnSelectedIndexChanged="ddlNivel3_SelectedIndexChanged" OnDataBound="ddlNivel3_DataBound" AutoPostBack="true">
                                </asp:DropDownList>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <!-- /.form-group -->
                            <div class="form-group">
                                <strong><asp:Label ID="lblNivel4" runat="server" Text="Nivel 4"></asp:Label></strong>
                                <asp:DropDownList ID="ddlNivel4" Width="100%" runat="server" CssClass="form-control input-sm" OnSelectedIndexChanged="ddlNivel4_SelectedIndexChanged" OnDataBound="ddlNivel4_DataBound" AutoPostBack="true">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <!-- /.form-group -->
                    </div>

                   <div class="row">
                       <div class="col-lg-3 col-xs-12">
                           <strong>Solicitado por</strong>
                           <asp:TextBox ID="txtSolicitadoPor" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                       </div>
                       <div class="col-lg-3 col-xs-12">
                           <strong>Telefono</strong>
                           <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                       </div>
                   </div>

                   <div class="row">
                       <div class="col-lg-6 col-xs-12">
                           <strong>Observación</strong>
                           <asp:TextBox ID="txtComentario" TextMode="MultiLine" CssClass="form-control input-sm" ClientIDMode="Static" runat="server" Width="100%" Height="180px" />
                       </div>
                       <div class="col-lg-6 col-xs-12">
                           <strong>Archivo Adjunto 1</strong>
                           <asp:FileUpload ID="fuArchivo" CssClass="form-control input-sm" runat="server" Width="100%" />
                           <strong>Archivo Adjunto 2</strong>
                           <asp:FileUpload ID="fuArchivo2" CssClass="form-control input-sm" runat="server" Width="100%" />
                       </div>
                   </div>

                </div>
                  


                

                <div class="panel-footer">
                    <div class="row">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <div class="pull-right">
                                <br />
                                <asp:Button Text="Enviar" Width="100px" OnClick="btnGrabar_Click" CssClass="btn btn-success btn-lg" runat="server" ID="btnGrabar" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>



            
            <asp:Panel ID="Panel1" runat="server" CssClass="modal fade bs-example-modal-lg" TabIndex="-1" role="dialog" aria-labelledby="myLabel">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <div class="modal-header">
                                    <h4 class="modal-title" id=" myLabel ">Observación del SOLPED</h4>
                                </div>
                                <div class="modal-body">
                                    <asp:Label ID="lblObservacionTicket" runat="server" CssClass="form-control input-sm"></asp:Label>
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
            $('nh').select2();

           var date = new Date();
           date.setDate(date.getDate());
           var dp = $(".class-date");
            dp.datepicker({
                changeMonth: true,
                changeYear: true,
                weekStart: 1,
                format: "dd-mm-yyyy",
                language: "es",
                todayHighlight: true,
                autoclose: true,
                startDate: date
            });

//            var dates = $(".class-date").datepicker({
//    defaultDate: "+1w",
//    changeMonth: true,
//    numberOfMonths: 3,
//    minDate: dateToday,
//    onSelect: function(selectedDate) {
//        var option = this.id == "from" ? "minDate" : "maxDate",
//            instance = $(this).data("datepicker"),
//            date = $.datepicker.parseDate(instance.settings.dateFormat || $.datepicker._defaults.dateFormat, selectedDate, instance.settings);
//        dates.not(this).datepicker("option", option, date);
//    }
//});
        }
    </script>
</asp:Content>
