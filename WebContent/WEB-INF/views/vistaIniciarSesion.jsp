<!DOCTYPE html>
<html lang="en">
  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Flashcards - Iniciar Sesión</title>

    <!-- Bootstrap core CSS -->
    <link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">

    <!-- Plugin CSS -->
    <link href="resources/vendor/magnific-popup/magnific-popup.css" rel="stylesheet" type="text/css">

    <!-- Custom styles for this template -->
    <link href="resources/css/freelancer.min.css" rel="stylesheet">
    
    <!-- <style>
	    body#LoginForm{ background-image:url("https://hdwallsource.com/img/2014/9/blur-26347-27038-hd-wallpapers.jpg"); background-repeat:no-repeat; background-position:center; background-size:cover; padding:10px;}
	
	    .form-heading { color:#fff; font-size:23px;}
	    .panel h2{ color:#444444; font-size:18px; margin:0 0 8px 0;}
	    .panel p { color:#777777; font-size:14px; margin-bottom:30px; line-height:24px;}
	    .login-form .form-control {
	      background: #f7f7f7 none repeat scroll 0 0;
	      border: 1px solid #d4d4d4;
	      border-radius: 4px;
	      font-size: 14px;
	      height: 50px;
	      line-height: 50px;
	    }
	    .main-div {
	      background: #ffffff none repeat scroll 0 0;
	      border-radius: 2px;
	      margin: 10px auto 30px;
	      max-width: 38%;
	      padding: 50px 70px 70px 71px;
	    }
	
	    .login-form .form-group {
	      margin-bottom:10px;
	    }
	    .login-form{ text-align:center;}
	    .forgot a {
	      color: #777777;
	      font-size: 14px;
	      text-decoration: underline;
	    }
	    .login-form  .btn.btn-primary {
	      background: #f0ad4e none repeat scroll 0 0;
	      border-color: #f0ad4e;
	      color: #ffffff;
	      font-size: 14px;
	      width: 100%;
	      height: 50px;
	      line-height: 50px;
	      padding: 0;
	    }
	    .forgot {
	      text-align: left; margin-bottom:30px;
	    }
	    .botto-text {
	      color: #ffffff;
	      font-size: 14px;
	      margin: auto;
	    }
	    .login-form .btn.btn-primary.reset {
	      background: #ff9900 none repeat scroll 0 0;
	    }
	    .back { text-align: left; margin-top:10px;}
	    .back a {color: #444444; font-size: 13px;text-decoration: none;}
    </style>-->
    
  </head>

  <body id="page-top">
  		<%@ page import="main.java.flashcards.dto.UsuarioDTO"%> 
		
		<% 
			UsuarioDTO user = ((UsuarioDTO)(session.getAttribute("usuario")));
			if(user!=null && (!user.getUsername().equals(""))){
				response.sendRedirect("https://sistemaflashcards.herokuapp.com/inicio.html?usuario="+((UsuarioDTO)(session.getAttribute("usuario"))).getUsername());
			}
		%>
		
		<script language="JavaScript" type="text/javascript">
			if("${mensaje}" != ""){
				alert("${mensaje}");
			}
		</script>

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg bg-secondary fixed-top text-uppercase" id="mainNav">
      <div class="container">
        <a class="navbar-brand js-scroll-trigger" href="https://sistemaflashcards.herokuapp.com">FLASHCARDS</a>
        <button class="navbar-toggler navbar-toggler-right text-uppercase bg-primary text-white rounded" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          Menu
          <i class="fas fa-bars"></i>
        </button>
      </div>
    </nav>
    <section>
    	<div class="row">
    		<br><br>
    	</div>
    	<div class="row">
    		<div class="col-md-4"></div>
    		<div class="col-md-4">
    			<form action="loguear.html" method="post" id="Login" name="Login">
			        <div class="form-group">
			            <input type="text" class="form-control" id="inputUsernameEmail" placeholder="Username o Email">
			        </div>
			        <div class="form-group">
			            <input type="password" class="form-control" id="inputClave" placeholder="Clave">
			        </div>
			        <button type="submit" class="btn btn-primary">Login</button>
			    </form>
    		</div>
    		<div class="col-md-4"></div>
		</div>
    </section>
    
	<!--  <div class="row">
			<br><br>
		</div>
		<div class="row">
		    <div class="col-md-12">
		      <h2 align="center" style="color:blue;">
			  </h2>
			  <br><br>
		    </div>
		</div>
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-6">
				<img src="/resources/img/flashcards.jpg" style="max-width: 100%; max-height: 100%;">
			</div>
			<div class="col-md-1"></div>
			<div class="col-md-3">
				<br><br><br>
			    <form action="iniciarSesion.html" method="post" class="form-signin">
			      <h1 class="h3 mb-3 font-weight-normal">Sign In</h1>
			      <label for="inputUsuario" class="sr-only">Usuario o Email</label>
			      <input type="text" id="inputUsuario" name="inputUsuario" class="form-control" placeholder="Usuario o Email" required>
			      <label for="inputClave" class="sr-only">Clave</label>
			      <input type="password" id="inputClave" name="inputClave" class="form-control" placeholder="Clave" required>
			      <button class="btn btn-primary" type="submit">Iniciar Sesión</button>
			    </form>
			    <a href="registro.html" class="register">
	                Si aún no tienes cuenta, pulsa sobre este enlace para registrarte.
	            </a>
	            <br>
	            <a href="recovery.html" class="forgot-password">
	                ¿Olvidaste la Clave?
	            </a>
	            <br><br><br><br><br><br>
				<h6 align="center" style="color:green;">Aplicación Desarrollada por Sergio Pérez Sánchez.</h6>
			</div>
			<div class="col-md-1"></div>
		</div>-->

    <!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
    <div class="scroll-to-top d-lg-none position-fixed ">
      <a class="js-scroll-trigger d-block text-center text-white rounded" href="#page-top">
        <i class="fa fa-chevron-up"></i>
      </a>
    </div>
    
    <!-- Bootstrap core JavaScript -->
    <script src="resources/vendor/jquery/jquery.min.js"></script>
    <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="resources/vendor/magnific-popup/jquery.magnific-popup.min.js"></script>

    <!-- Contact Form JavaScript -->
    <script src="resources/js/jqBootstrapValidation.js"></script>
    <script src="resources/js/contact_me.js"></script>

    <!-- Custom scripts for this template -->
    <script src="resources/js/freelancer.min.js"></script>

  </body>

</html>





























































































































<!-- <html>
	<head>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	    <title>Login - Flashcards</title>
		<meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	    <meta http-equiv="x-ua-compatible" content="ie=edge">
	    <link rel="stylesheet" href="https://unpkg.com/bootstrap-material-design@4.1.1/dist/css/bootstrap-material-design.min.css" integrity="sha384-wXznGJNEXNG1NFsbm0ugrLFMQPWswR3lds2VeinahP8N0zJw9VWSopbjv2x7WCvX" crossorigin="anonymous">
	    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
		<script src="https://unpkg.com/popper.js@1.12.6/dist/umd/popper.js" integrity="sha384-fA23ZRQ3G/J53mElWqVJEGJzU0sTs+SvzG8fXVWP+kJQ1lwFAOkcUOysnlKJC33U" crossorigin="anonymous"></script>
		<script src="https://unpkg.com/bootstrap-material-design@4.1.1/dist/js/bootstrap-material-design.js" integrity="sha384-CauSuKpEqAFajSpkdjv3z9t8E7RlpJ1UP0lKM/+NdtSarroVKu069AlsRPKkFBz9" crossorigin="anonymous"></script>
		<script>$(document).ready(function() { $('body').bootstrapMaterialDesign(); });</script>
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
		
		<style>
			body, html {
			    height: 100%;
			    background-repeat: no-repeat;
			    /*background-image: linear-gradient(rgb(104, 145, 162), rgb(12, 97, 33));*/
			}
			
			.card-container.card {
			    max-width: 350px;
			    padding: 40px 40px;
			}
			
			.btn {
			    font-weight: 700;
			    height: 36px;
			    -moz-user-select: none;
			    -webkit-user-select: none;
			    user-select: none;
			    cursor: default;
			}
			
			/*
			 * Card component
			 */
			.card {
			    background-color: #F7F7F7;
			    /* just in case there no content*/
			    padding: 20px 25px 30px;
			    margin: 0 auto 25px;
			    margin-top: 50px;
			    /* shadows and rounded borders */
			    -moz-border-radius: 2px;
			    -webkit-border-radius: 2px;
			    border-radius: 2px;
			    -moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
			    -webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
			    box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
			}
			
			.profile-img-card {
			    width: 96px;
			    height: 96px;
			    margin: 0 auto 10px;
			    display: block;
			    -moz-border-radius: 50%;
			    -webkit-border-radius: 50%;
			    border-radius: 50%;
			}
			
			/*
			 * Form styles
			 */
			.profile-name-card {
			    font-size: 16px;
			    font-weight: bold;
			    text-align: center;
			    margin: 10px 0 0;
			    min-height: 1em;
			}
			
			.reauth-email {
			    display: block;
			    color: #404040;
			    line-height: 2;
			    margin-bottom: 10px;
			    font-size: 14px;
			    text-align: center;
			    overflow: hidden;
			    text-overflow: ellipsis;
			    white-space: nowrap;
			    -moz-box-sizing: border-box;
			    -webkit-box-sizing: border-box;
			    box-sizing: border-box;
			}
			
			.form-signin #inputEmail,
			.form-signin #inputPassword {
			    direction: ltr;
			    height: 44px;
			    font-size: 16px;
			}
			
			.form-signin input[type=email],
			.form-signin input[type=password],
			.form-signin input[type=text],
			.form-signin button {
			    width: 100%;
			    display: block;
			    margin-bottom: 10px;
			    z-index: 1;
			    position: relative;
			    -moz-box-sizing: border-box;
			    -webkit-box-sizing: border-box;
			    box-sizing: border-box;
			}
			
			.form-signin .form-control:focus {
			    border-color: rgb(104, 145, 162);
			    outline: 0;
			    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgb(104, 145, 162);
			    box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgb(104, 145, 162);
			}
			
			.btn.btn-signin {
			    /*background-color: #4d90fe; */
			    background-color: rgb(104, 145, 162);
			    /* background-color: linear-gradient(rgb(104, 145, 162), rgb(12, 97, 33));*/
			    padding: 0px;
			    font-weight: 700;
			    font-size: 14px;
			    height: 36px;
			    -moz-border-radius: 3px;
			    -webkit-border-radius: 3px;
			    border-radius: 3px;
			    border: none;
			    -o-transition: all 0.218s;
			    -moz-transition: all 0.218s;
			    -webkit-transition: all 0.218s;
			    transition: all 0.218s;
			}
			
			.btn.btn-signin:hover,
			.btn.btn-signin:active,
			.btn.btn-signin:focus {
			    background-color: rgb(12, 97, 33);
			}
			
			.forgot-password,
			.register {
			    color: rgb(104, 145, 162);
			}
			
			.forgot-password:hover,
			.forgot-password:active,
			.forgot-password:focus,
			.register:hover,
			.register:active,
			.register:focus{
			    color: rgb(12, 97, 33);
			}
		</style>
	</head>
	<!--  <body background="resources/img/background.jpg" style="background-size: 100%;"> background-position: center;-->
	<!-- <body>
		@ page import="com.flashcards.modelo.UsuarioDTO" 
		
		UsuarioDTO user = ((UsuarioDTO)(session.getAttribute("usuario")));
			if(user!=null && (!user.getNombreUsuario().equals(""))){
				response.sendRedirect("https://sistemaflashcards.herokuapp.com/inicio.html?usuario="+((UsuarioDTO)(session.getAttribute("usuario"))).getNombreUsuario());
			}
		
		<script language="JavaScript" type="text/javascript">
			if("${mensaje}" != ""){
				alert("${mensaje}");
			}
		</script>
		
		
	</body>
</html>-->