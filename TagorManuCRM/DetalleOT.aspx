<%@ Page Title="" Language="C#" MasterPageFile="~/Sitio.Master" AutoEventWireup="true" CodeBehind="DetalleOT.aspx.cs" Inherits="TagorManuCRM.DetalleOT" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">

    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>Detalle
        </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
            <li><a href="#">Administración</a></li>
            <li class="active">Detalle</li>
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
                <div runat="server" id="divOt" class="box box-default">
                    <div class="box-header with-border">
                        <h3 class="box-title">OT's</h3>
                         <asp:LinkButton ID="lbtnExportar" runat="server" OnClick="lbtnExportar_Click"  CssClass="btn btn-success"><i aria-hidden="true" class="fa fa-lg fa-file-excel-o"></i></asp:LinkButton>
                    </div>
                    <div style="width: 100%; height: 100%; overflow-y: scroll;">
                        <div class="box-body">
                            <asp:GridView ID="grvTickets" runat="server" CssClass="table table-bordered table-hover table-condensed small" HeaderStyle-CssClass="active" AutoGenerateColumns="false" OnRowDataBound="paginacion_RowDataBound" EmptyDataText="Solped no encontrado" EmptyDataRowStyle-CssClass="active h4" PageSize="50" AllowPaging="true">
                                <Columns>
                                    <asp:TemplateField HeaderText="OT">
                                        <ItemTemplate>
                                            <asp:Label ID="lblIdTicket" runat="server" Visible="false" Text='<%# Bind("ID_ATENCION") %>'></asp:Label>
                                            <asp:LinkButton ID="lbtnIdTicket" runat="server" Text='<%# Bind("ID_ATENCION") %>' OnClick="lbtnIdTicket_Click" Font-Bold="true" Font-Size="Large"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Sucursal" Visible="true">
                                        <ItemTemplate>
                                            <asp:Label ID="lblSucursal" runat="server" Visible="true" Text='<%# Bind("NOMBRE_SUCURSAL") %>'></asp:Label>
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
                </div>

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
</asp:Content>
