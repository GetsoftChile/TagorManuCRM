<%@ Page Title="" Language="C#" MasterPageFile="~/Sitio.Master" AutoEventWireup="true" CodeBehind="GeneraFactura.aspx.cs" Inherits="TagorManuCRM.GeneraFactura" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">

    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h5></h5>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i>SOLPED</a></li>
            <li class="active">Ingreso SOLPED</li>
        </ol>
    </section>
    <!--  -->

    <section class="content">

        <!-- Alertas -->
        <div id="divAlerta" runat="server" visible="false" class="alert alert-danger">
            <strong>Atención!: </strong>
            <asp:Label Text="" ID="lblInfo" runat="server" />
        </div>

        <div id="divMostrar" runat="server" visible="true">

            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">Buscar Solped Cerradas</h3>
                    <br />
                    <br />
                    <div class="row">
                        <div class="col-lg-3 col-xs-12">
                            <strong>Categoría Servicio</strong>
                            <asp:DropDownList ID="ddlCategoriaServicio" runat="server" CssClass="form-control input-sm" OnDataBound="ddlCategoriaServicio_DataBound">
                            </asp:DropDownList>
                        </div>
                        <div class="col-lg-3 col-xs-12">
                            <strong>Local</strong>
                            <asp:DropDownList ID="ddlLocal" runat="server" CssClass="form-control input-sm" OnDataBound="ddlLocal_DataBound">
                            </asp:DropDownList>
                        </div>
                        <div class="col-lg-3 col-xs-12">
                            <strong>Mes</strong>
                            <asp:DropDownList ID="ddlMes" runat="server" CssClass="form-control input-sm">
                                <asp:ListItem Text="Seleccione" Value="0"></asp:ListItem>
                                <asp:ListItem Text="Enero" Value="1"></asp:ListItem>
                                <asp:ListItem Text="Febrero" Value="2"></asp:ListItem>
                                <asp:ListItem Text="Marzo" Value="3"></asp:ListItem>
                                <asp:ListItem Text="Abril" Value="4"></asp:ListItem>
                                <asp:ListItem Text="Mayo" Value="5"></asp:ListItem>
                                <asp:ListItem Text="Junio" Value="6"></asp:ListItem>
                                <asp:ListItem Text="Julio" Value="7"></asp:ListItem>
                                <asp:ListItem Text="Agosto" Value="8"></asp:ListItem>
                                <asp:ListItem Text="Septiembre" Value="9"></asp:ListItem>
                                <asp:ListItem Text="Octubre" Value="10"></asp:ListItem>
                                <asp:ListItem Text="Noviembre" Value="11"></asp:ListItem>
                                <asp:ListItem Text="Diciembre" Value="12"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-lg-1 col-xs-12">
                            <strong>Ano</strong>
                            <asp:DropDownList ID="ddlAno" runat="server" CssClass="form-control input-sm">
                                <asp:ListItem Text="Seleccione" Value="0"></asp:ListItem>
                                <asp:ListItem Text="2018" Value="2018"></asp:ListItem>
                                <asp:ListItem Text="2019" Value="2019"></asp:ListItem>
                                <asp:ListItem Text="2020" Value="2020"></asp:ListItem>
                                <asp:ListItem Text="2021" Value="2021"></asp:ListItem>
                                <asp:ListItem Text="2022" Value="2022"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-lg-2 col-xs-12">
                            <br />
                            <asp:LinkButton ID="lbtnBuscar" CssClass="btn btn-primary btn-sm btn-block" runat="server"
                                OnClick="lbtnBuscar_Click"><i aria-hidden="true" class="glyphicon glyphicon-search"></i></asp:LinkButton>
                        </div>
                    </div>
                </div>
                <div class=" box-body">
                    <div class="col-lg-12">
                        <asp:GridView ID="grvTickets" runat="server" ClientIDMode="Static" CssClass="table table-bordered table-hover table-condensed small" HeaderStyle-CssClass="active"
                            AutoGenerateColumns="false" EmptyDataText="Solped no encontrado"
                            EmptyDataRowStyle-CssClass="active h4">
                            <Columns>
                                <asp:TemplateField HeaderText="SOLPED">
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
                                        <asp:Label ID="lblFechaCreacion" runat="server" Text='<%# Bind("FECHA","{0:dd/MM/yyyy HH:mm}") %>'></asp:Label>
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
                                        <asp:Label ID="lblFechaAgendamiento" runat="server" Text='<%# Bind("FECHA_AGENDAMIENTO","{0:dd/MM/yyyy HH:mm}") %>'></asp:Label>
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

                                <asp:TemplateField HeaderText="OT">
                                    <ItemTemplate>
                                        <asp:Label ID="lblArchivo" runat="server" Visible="false" Text='<%# Bind("ARCHIVO_OT") %>'></asp:Label>
                                        <asp:LinkButton ID="btnArchivo" runat="server" Text="text" OnClick="btnArchivo_Click"><i class="fa fa-files-o"></i></asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>

                            </Columns>

                        </asp:GridView>
                    </div>
                </div>
                <div id="divFacturacion" runat="server" visible="false">
                    <div class="box-header with-border">
                        <h3 class="box-title">Ingreso Facturación</h3>
                    </div>

                    <div class="row">

                        <div class="col-lg-4">
                            <div class="box box-danger">
                                <div class="box-header with-border">
                                    <h3 class="box-title">O.C.</h3>
                                    <div class="box-tools pull-right">
                                        <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                        <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                                    </div>
                                </div>
                                <div class="box-body">
                                    <asp:FileUpload ID="fuOC" runat="server" accept="image/*" />
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="box box-danger">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Factura</h3>
                                    <div class="box-tools pull-right">
                                        <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                        <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                                    </div>
                                </div>
                                <div class="box-body">
                                    <asp:FileUpload ID="fuFacturas" runat="server" />
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="box box-danger">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Informe</h3>
                                    <div class="box-tools pull-right">
                                        <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                        <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                                    </div>
                                </div>
                                <div class="box-body">
                                    <asp:FileUpload ID="fuInforme" runat="server" />
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class=" box-footer">
                        <asp:LinkButton ID="lbtnGeneraFacturacion" OnClick="lbtnGeneraFacturacion_Click" runat="server" CssClass="btn btn-lg btn-danger" OnClientClick="fileCheck(this);"><span class="glyphicon glyphicon-cloud-upload"></span>Generar Facturación</asp:LinkButton>
                    </div>
                </div>



            </div>
        </div>


    </section>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
