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
    
    <style>
	    .btn-login {
		  background-color: #FFD333;
		  border: none;
		  color: white;
		  padding: 15px 32px;
		  text-align: center;
		  text-decoration: none;
		  display: inline-block;
		  font-size: 16px;
		}
    </style>
    
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
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item mx-0 mx-lg-1">
              <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#contact">Registrarse</a>
            </li>
          </ul>
        </div>
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
			            <input type="text" class="form-control" id="inputUsernameEmail" name="inputUsernameEmail" placeholder="Username o Email" required>
			        </div>
			        <div class="form-group">
			            <input type="password" class="form-control" id="inputClave" name="inputClave" placeholder="Clave" required>
			        </div>
			        <div class="row">
			        	<div class="col-md-3"></div>
			        	<div class="col-md-6">
			        		<button type="submit" class="btn-login">Iniciar Sesion</button>
			        	</div>
			        	<div class="col-md-3"></div>
			        </div>
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