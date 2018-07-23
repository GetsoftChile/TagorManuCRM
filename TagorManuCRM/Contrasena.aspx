<%@ Page Title="" Language="C#" MasterPageFile="~/Sitio.Master" AutoEventWireup="true" CodeBehind="Contrasena.aspx.cs" Inherits="TagorManuCRM.Contrasena" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">


    
     <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
            <asp:Label ID="lblTituloBuscadorTicket" runat="server"></asp:Label>
          </h1>
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
            <li><a href="#">OT</a></li>
            <li class="active"><a href="BuscarOT.aspx"><i class="fa fa-circle-o"></i>Buscardor de SOLPED</a></li>
          </ol>
        </section>
        <section class="content">
                <!-- Alertas -->
                <div id="divAlerta" runat="server" visible="false" class="alert alert-danger">
                    <strong>Atención!: </strong>
                    <asp:Label Text="" ID="lblInfo" runat="server" />
                </div>

            
        <asp:HiddenField ID="hfIdUsuario" runat="server" />
            <div class="box box-success">
                <div class="box-header">
                    <h3 class="box-title">Cambiar Contraseña</h3>
                </div>
                <div class="box-body">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Nombre</label>
                            <div class="col-sm-10">
                                <asp:Label ID="lblNombre" runat="server" Text="Label" CssClass="btn btn-link btn-sm"></asp:Label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Usuario</label>
                            <div class="col-sm-10">
                                <asp:Label ID="lblUsuario" runat="server" Text="Label" CssClass="btn btn-link btn-sm"></asp:Label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="txtContrasena" class="col-sm-2 control-label">Contraseña</label>
                            <div class="col-sm-10">
                                <asp:TextBox ID="txtContrasena" ToolTip="Recuerde que la Contraseña debe tener al menos 5 caracteres" Width="20%" runat="server" CssClass="form-control input-sm" TextMode="Password"></asp:TextBox>
                            </div>
                        </div>
                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                            ControlToValidate="txtContrasena"
                            Display="Dynamic"
                            ErrorMessage="Debe ingresar 5 caracteres como minimo para su contraseña"
                            ForeColor="Red">
                        </asp:RequiredFieldValidator>--%>
                    </div>
                </div>
                <div class="box box-footer">
                    <asp:LinkButton ID="lbtnGrabar" CssClass="btn btn-danger" runat="server"
                    OnClick="lbtnGrabar_Click"><i aria-hidden="true" class="glyphicon glyphicon-floppy-disk"></i> Grabar</asp:LinkButton>
                </div>
                
            </div>
        </section>



</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
