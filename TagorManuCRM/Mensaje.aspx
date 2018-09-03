<%@ Page Title="" Language="C#" MasterPageFile="~/Sitio.Master" AutoEventWireup="true" CodeBehind="Mensaje.aspx.cs" Inherits="TagorManuCRM.Mensaje" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">

    <section class="content-header">
        <h1>Mantenciones
        </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
            <li><a href="#">Administración</a></li>
            <li class="active"></li>
        </ol>
    </section>

    <section class="content">
        <div id="divAlerta" runat="server" visible="false" class="alert alert-danger">
            <strong>Atención!: </strong>
            <asp:Label Text="" ID="lblInfo" runat="server" />
        </div>


        <div class="box box-danger">
            <div class="box-header">
                <h3 class="box-title">Buscar</h3>
            </div>
            <div class="box-body">
                <div class="row">
                    <div class="col-md-10 col-xs-12">
                        <div class="form-group">
                            <label for="txtMensaje">Mensaje:</label>
                            <asp:TextBox ID="txtMensaje" runat="server" TextMode="MultiLine" Height="100px" CssClass="form-control input-sm" Rows="20"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-2 col-xs-12">
                        <div class="form-group">
                            <label for="ddlActivo">Activo:</label>
                            <asp:DropDownList ID="ddlActivo" runat="server" CssClass="form-control input-sm">
                                <asp:ListItem Value="1" Text="SI"></asp:ListItem>
                                <asp:ListItem Value="0" Text="NO"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
                <div>
                    
                </div>
            </div>
            <div class="box-footer">
                <asp:Button ID="btnGrabarMensaje" runat="server" CssClass="btn btn-sm btn-primary" Text="Guardar" OnClick="btnGrabarMensaje_Click" />
            </div>
        </div>

    </section>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
