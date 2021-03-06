﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TagorManuCRM.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <meta charset="utf-8"/>
      <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
      <title>CRM Tagor | Login</title>
      <!-- Tell the browser to be responsive to screen width -->
      <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport"/>
      <!-- Bootstrap 3.3.7 -->
      <link rel="stylesheet" href="assets/bower_components/bootstrap/dist/css/bootstrap.min.css"/>
      <!-- Font Awesome -->
      <link rel="stylesheet" href="assets/bower_components/font-awesome/css/font-awesome.min.css"/>

      <!-- Ionicons -->
      <link rel="stylesheet" href="assets/bower_components/Ionicons/css/ionicons.min.css"/>
      <!-- Theme style -->
      <link rel="stylesheet" href="assets/dist/css/AdminLTE.min.css"/>
      <!-- iCheck -->
      <link rel="stylesheet" href="assets/plugins/iCheck/square/blue.css"/>

      <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
      <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
      <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
      <![endif]-->

      <!-- Google Font -->
      <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic"/>

</head>

<body class="hold-transition login-page">
<div class="login-box">
  <div class="login-logo">
    <a><b>Tagor</b>CRM</a>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
    <%--<p class="login-box-msg">Sign in to start your session</p>--%>
    <%--<img src="assets/img/logo-Cencosud.png" />
    <img src="assets/img/logo-tagor.png" />--%>
    <p class="login-logo"><img src="assets/img/logo-Cencosud.png" class="img-rounded" style="width: 70%;max-height: 70%" /></p>
    <p class="login-logo"><img src="assets/img/logo-tagor.png" class="img-rounded" style="width: 70%;max-height: 70%" /></p>
    <form id="form1" runat="server">
        <div class="form-group has-feedback">
            <input id="TxtUsuario" runat="server" class="form-control" placeholder="Usuario"/>
            <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
        </div>
        <div class="form-group has-feedback">
            <input id="TxtPassword" runat="server" type="password" class="form-control" placeholder="Password"/>
            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
        </div>
        <div class="row">
            <div class="col-xs-8">
                <div class="checkbox icheck">
                    <label>
                        <%--<input type="checkbox">
                        Remember Me--%>
           
                    </label>
                </div>
            </div>
            <!-- /.col -->
            <div class="col-xs-4">
                <asp:Button ID="BtnIngresar" CssClass="btn btn-primary btn-block btn-flat" runat="server" Text="Ingresar" OnClick="BtnIngresar_Click" />
            </div>
            <!-- /.col -->

            
        </div>
        <!-- Alertas -->
             <div id="divAlerta" runat="server" visible="false" class="alert alert-danger">
                 <strong>Error!</strong> <asp:Label Text="" ID="lblError" runat="server" />
             </div>
    </form>


<%--    <div class="social-auth-links text-center">
      <p>- OR -</p>
      <a href="#" class="btn btn-block btn-social btn-facebook btn-flat"><i class="fa fa-facebook"></i> Sign in using
        Facebook</a>
      <a href="#" class="btn btn-block btn-social btn-google btn-flat"><i class="fa fa-google-plus"></i> Sign in using
        Google+</a>
    </div>--%>
    <!-- /.social-auth-links -->

<%--    <a href="#">I forgot my password</a><br>
    <a href="register.html" class="text-center">Register a new membership</a>--%>

  </div>
  <!-- /.login-box-body -->
</div>
<!-- /.login-box -->

<!-- jQuery 3 -->
<script src="assets/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="assets/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="assets/plugins/iCheck/icheck.min.js"></script>
<script>

    <!--

$(document).ready(function () {

window.setTimeout(function() {
    $(".alert").fadeTo(1500, 0).slideUp(100, function(){
        $(this).remove(); 
    });
}, 5000);

});
//-->

  $(function () {
    $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%' // optional
    });
  });

</script>



</body>
</html>
