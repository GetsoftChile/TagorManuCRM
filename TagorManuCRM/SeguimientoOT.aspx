<%@ Page Title="" Language="C#" MasterPageFile="~/Sitio.Master" AutoEventWireup="true" CodeBehind="SeguimientoOT.aspx.cs" Inherits="TagorManuCRM.SeguimientoOT" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">


      <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>Seguimiento de 
            <asp:Label ID="lblIdTicket" runat="server" Text=""></asp:Label>
            <asp:LinkButton ID="lbtnGenerarPdf" CssClass="btn btn-danger btn-xs" runat="server"
            OnClick="lbtnGenerarPdf_Click"><i aria-hidden="true" class=" fa fa-file-pdf-o"></i> </asp:LinkButton>
            
        </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
            <li><a href="#">SOLPED</a></li>
            <li><a href="#">Buscar SOLPED</a></li>
            <li class="active"><i class="fa fa-circle-o"></i>Detalle SOLPED</li>
        </ol>
    </section>


    <section class="content">

        <!-- Alertas -->
        <div id="divAlerta" runat="server" visible="false" class="alert alert-danger">
            <strong>Atención!: </strong>
            <asp:Label Text="" ID="lblInfo" runat="server" />
        </div>

        <asp:HiddenField ID="hfNumeroTicket" runat="server" />
        <asp:HiddenField ID="hfIdUsuarioCreacion" runat="server" />

        <div class="row">

            <div class="col-lg-6">
                <div class="box box-success">
                    <div class="box-header">
                        <h3 class="box-title">
                            Datos SOLPED
                        </h3>
                    </div>
                    <div class="box-body">
                        <div class="row">
                            <div id="divCliente" class="col-lg-12">
                                <asp:Label ID="lblCelularCliente" runat="server" Visible="false"></asp:Label>
                          
                                <table class="table table-responsive table-condensed small">
                                    <tr class="active">
                                        <td>
                                            <strong>Usuario Asig:</strong><br />
                                            <asp:Label ID="lblUsuarioAsig" runat="server"></asp:Label>
                                        </td>
                                        <td>
                                            <strong>Usuario creación:</strong><br />
                                            <asp:Label ID="lblUsuarioCreacion" runat="server"></asp:Label>
<%--<div class="direct-chat-text"></div>--%>    
                                        </td>
                                        <td>
                                            <strong>Estado:</strong><br />
                                            <asp:Label ID="lblEstadoTicket" runat="server"></asp:Label>
                                            <asp:Label id="lblIdEstadoTicket" runat="server" Visible="false"/>
                                        </td>
                                    </tr>
                                    <tr class="active">
                                        <td>
                                            <strong>Nombre Solicitante:</strong><br />
                                            <asp:Label ID="lblNombreCliente" runat="server"></asp:Label>
                                        </td>
                                        <td>
                                            <strong>Telefono Solicitante:</strong><br />
                                            <asp:Label ID="lblTelefonoCliente" runat="server"></asp:Label>
                                        </td>
                    
                                        <td>
                                            <strong>Email Solicitante:</strong><br />
                                            <asp:Label ID="lblEmailCliente" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                   
                            </div>
                            
                        </div>

                        
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="box box-success">
                    <div class="box-header">
                        <h3 class="box-title">Datos Local
                        </h3>
                    </div>
                    <div class="box-body">
                        <div class="row">
                            <div id="divLocal" class="col-lg-12">
                                <table class="table table-responsive table-condensed small" style="width: 100%">
                                    <tr class="active">
                                        <td>
                                            <strong>Cod Local:</strong><br />
                                            <asp:Label ID="lblCodLocal" runat="server"></asp:Label>
                                        </td>
                                        <td>
                                            <strong>Nombre Local:</strong><br />
                                            <asp:Label ID="lblNombreLocal" runat="server"></asp:Label>
                                        </td>
                                        <td>
                                            <strong>Comuna Local:</strong><br />
                                            <asp:Label ID="lblComunaLocal" runat="server"></asp:Label>
                                        </td>
                                       
                                    </tr>
                                    <tr class="active">
                                         <td>
                                            <strong>Región Local:</strong><br />
                                            <asp:Label ID="lblRegionLocal" runat="server"></asp:Label>
                                        </td>
                                        <td>
                                            <strong>Dirección Local:</strong><br />
                                            <asp:Label ID="lblDireccionLocal" runat="server"></asp:Label>
                                        </td>
                                        <td>
                                            <strong>Teléfono Local:</strong><br />
                                            <asp:Label ID="lblTelefonoLocal" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
            

        </div>


        <div class="row">
            <div class="col-lg-6 col-xs-12">
                <div class="box box-info">
                    <div class="box-header">
                        <h4 class="box-title">Mantención</h4>
                       
                    </div>
                    <div class="box-body">
                        <div class="row">
                            <div class="col-md-3">
                                <strong>Tipo</strong>
                                <br />
                                <asp:Label ID="lblTipo" runat="server" CssClass="label label-primary" ></asp:Label>
                            </div>
                            <div class="col-md-3">
                                <strong>Especialidad</strong>
                                <br />
                                <asp:Label ID="lblArea" runat="server" CssClass="label label-primary"></asp:Label>
                            </div>
                            <div class="col-md-3">
                                <strong>Archivo 1:</strong><br />
                                <asp:Label ID="lblRutaArchivo" runat="server" Text="" Visible="false"></asp:Label>
                                <asp:ImageButton ID="ibtnArchivo" runat="server" ImageUrl="~/assets/img/box.png" Visible="false" OnClick="ibtnArchivo_Click" />
                            </div>
                            <div class="col-md-3">
                                <strong>Archivo 2:</strong><br />
                                <asp:Label ID="lblRutaArchivo2" runat="server" Text="" Visible="false"></asp:Label>
                                <asp:ImageButton ID="ibtnArchivo2" runat="server" ImageUrl="~/assets/img/box.png" Visible="false" OnClick="ibtnArchivo_Click" />
                            </div>
                        </div>
                        <div class="row">
                            <div>
                                <div class="col-md-3">
                                    <strong>
                                        <asp:Label ID="lblNombreNivel1" runat="server" Text="Nivel1"></asp:Label></strong>
                                    <br />
                                    <asp:Label ID="lblNivel1" runat="server"></asp:Label>
                                    <asp:HiddenField ID="hfIdTipificacion" runat="server" />
                                </div>
                                <div class="col-md-5">
                                    <strong>
                                        <asp:Label ID="lblNombreNivel2" runat="server" Text="Nivel2"></asp:Label></strong><br />
                                    <asp:Label ID="lblNivel2" runat="server"></asp:Label>
                                </div>
                                <div class="col-md-2">
                                    <strong>
                                        <asp:Label ID="lblNombreNivel3" runat="server" Text="Nivel3"></asp:Label></strong><br />
                                    <asp:Label ID="lblNivel3" runat="server"></asp:Label>
                                </div>
                                <div class="col-md-2">
                                    <strong>
                                        <asp:Label ID="lblNombreNivel4" runat="server" Text="Nivel4"></asp:Label></strong><br />
                                    <asp:Label ID="lblNivel4" runat="server"></asp:Label>
                                </div>
                            </div>

                        </div>
            
                    </div>
                </div>
            </div>

            <div class="col-lg-6 col-xs-12">
                <div class="box box-warning">
                    <div class="box-header">
                        <h3 class="box-title">Descripción general de la SOLPED</h3>
                    </div>
                    <div class="box-body">                          
                        <asp:textbox id="txtObservacion" runat="server" textmode="MultiLine" cssclass="form-control input-sm" ReadOnly="true" Height="100px"></asp:textbox>
                    </div>
                </div>
            </div>
        </div>


        <div class="row" runat="server" id="divOtrosDatos" visible="false">
            <div class="col-md-12">
                <div class="box box-success">
                    <div class="box-header">
                        <h3 class="box-title">Otros Datos</h3>
                    </div>
                    <div class="box-body">
                        <div class="row">
                            <div id="divCampo1" runat="server" class="col-md-2" visible="false">
                                <strong>
                                    <asp:Label ID="lblCampo1" runat="server" Text=""></asp:Label></strong>
                            </div>
                            <div id="divCampo2" runat="server" class="col-md-2" visible="false">
                                <strong>
                                    <asp:Label ID="lblCampo2" runat="server" Text=""></asp:Label></strong>
                            </div>
                            <div id="divCampo3" runat="server" class="col-md-2" visible="false">
                                <strong>
                                    <asp:Label ID="lblCampo3" runat="server" Text=""></asp:Label></strong>
                            </div>
                            <div id="divCampo4" runat="server" class="col-md-2" visible="false">
                                <strong>
                                    <asp:Label ID="lblCampo4" runat="server" Text=""></asp:Label></strong>
                            </div>
                            <div id="divCampo5" runat="server" class="col-md-2" visible="false">
                                <strong>
                                    <asp:Label ID="lblCampo5" runat="server" Text=""></asp:Label></strong>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    
        <div class="box box-warning" runat="server" id="divPanelHistoricoCaso" visible="false">
            <div class="box-header">
                <h3 class="box-title">Histórico del SOLPED</h3>
            </div>
            <div class="box-body">

                <div style="width: 100%;  overflow-y: scroll;">
                    
                <asp:GridView ID="grvGestiones" runat="server" CssClass="table table-responsive table-bordered table-hover table-condensed small" HeaderStyle-CssClass="active" AutoGenerateColumns="false" OnRowDataBound="paginacion_RowDataBound">
                    <Columns>
                        <asp:TemplateField HeaderText="Correlativo">
                            <ItemTemplate>
                                <asp:Label ID="lblCorrelativo" runat="server" Text='<%# Bind("CORRELATIVO") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Fecha Creación SOLPED">
                            <ItemTemplate>
                                <asp:Label ID="lblFecha" runat="server" Visible="true" Text='<%# Bind("FECHA") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Usuario Creación">
                            <ItemTemplate>
                                <asp:Label ID="lblUsuarioCreacion" runat="server" Text='<%# Bind("USUARIO") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Usuario Asignado">
                            <ItemTemplate>
                                <asp:Label ID="lblUsuarioAsignado" runat="server" Text='<%# Bind("USUARIO_ASIG") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Estado">
                            <ItemTemplate>
                                <asp:Label ID="lblEstado" runat="server" Text='<%# Bind("ESTADO_ATENCION") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Motivo Cierre" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="lblNombreMotivoCierre" runat="server" Text='<%# Bind("NOM_MOTIVO_CIERRE") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Archivo 1">
                            <ItemTemplate>
                                <asp:Label ID="lblArchivo1" runat="server" Visible="false" Text='<%# Bind("RUTA_ARCHIVO_1") %>'></asp:Label>
                                <asp:ImageButton ID="ibtnArchivo1" runat="server" ImageUrl="~/assets/img/box.png" Visible="false" OnClick="ibtnArchivo1_Click" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Archivo 2">
                            <ItemTemplate>
                                <asp:Label ID="lblArchivo2" runat="server" Visible="false" Text='<%# Bind("RUTA_ARCHIVO_2") %>'></asp:Label>
                                <asp:ImageButton ID="ibtnArchivo2" runat="server" ImageUrl="~/assets/img/box.png" Visible="false" OnClick="ibtnArchivo2_Click" />
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
         
        
            

        <div class="box box-success" id="divIngresoGestion" runat="server" visible="false">
            <div class="box-header">
                <h3 class="box-title">
                    Ingreso Gestión
                </h3>
            </div>
            <div class="box-body">
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <label for="">Estado</label>
                                    <asp:DropDownList ID="ddlEstado" runat="server" OnDataBound="ddlEstado_DataBound" CssClass="form-control input-sm" OnSelectedIndexChanged="ddlEstado_SelectedIndexChanged" AutoPostBack="true">
                                    </asp:DropDownList>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                        <div class="form-group">
                            <label for="">Resolutor asignado o Derivado a</label>
                            <asp:DropDownList ID="ddlDerivar" OnDataBound="ddlDerivar_DataBound" runat="server" CssClass="form-control input-sm">
                            </asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <label for="">Adjunto 1</label>
                            <asp:FileUpload ID="fuArchivo1" runat="server" CssClass="form-control input-sm"></asp:FileUpload>
                        </div>
                        <div class="form-group">
                            <label for="">Adjunto 2</label>
                            <asp:FileUpload ID="fuArchivo2" runat="server" Width="100%" CssClass="form-control input-sm"></asp:FileUpload>
                            <div class="alert-info alert-dismissible" role="alert">
                                <strong>Archivos permitidos!</strong> PDF, DOC, DOCX, XLSX, XLS, TXT, JPG, GIF, PNG, ZIP y RAR
                            </div>

                            <asp:Label ID="lblRutaFuArchivo1" runat="server" Visible="false"></asp:Label>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="form-group">
                            <label for="">Observación</label>
                            <asp:TextBox ID="txtObservacionGestion" runat="server" TextMode="MultiLine" Height="100px" CssClass="form-control input-sm" Rows="20"></asp:TextBox>
                        </div>
                    </div>
                </div>

            </div>
            <div class="box-footer">
                <div class="form-group">
                    <asp:Button ID="btnGrabarGestion" runat="server" Text="Grabar Gestión" CssClass="btn btn-sm btn-danger"
                        OnClick="btnGrabarGestion_Click" />
                </div>
            </div>
        </div>

            
    </section>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
