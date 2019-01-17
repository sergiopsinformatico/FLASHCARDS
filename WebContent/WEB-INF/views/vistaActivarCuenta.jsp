<!DOCTYPE html>
<html lang="en">
  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Flashcards - Activación Cuenta ${activa.getUsername()}</title>

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
    
    <!-- Angular JS -->
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
    
    <style>
	    .profile-userpic-avatar img {
		  float: none;
		  margin: 0 auto;
		  width: 50%;
		  height: 50%;
		  -webkit-border-radius: 50% !important;
		  -moz-border-radius: 50% !important;
		  border-radius: 50% !important;
		  border-style: solid;
  		  border-width: 1px;
		}
		.profile-userpic-forbidden img {
		  float: none;
		  margin: 0 auto;
		  width: 20%;
		  height: 20%;
		  -webkit-border-radius: 50% !important;
		  -moz-border-radius: 50% !important;
		  border-radius: 50% !important;
		  border-style: solid;
  		  border-width: 1px;
		}
		.recuadroActivaCuenta {
		     border: ridge #108CA6 1px;
		     font-size: 20px;
		     background-color: #16E40D;
		     color : #0B6507;
		}
		.infoFinRegistro {
		     font-size: 15px;
		     color : #1962EE;
		}
		table.center {
	      margin-left:auto; 
	      margin-right:auto;
	      text-align:center;
	    }
	    body {
		  background: #F1F3FA;
		}
    </style>
    
  </head>

  <body id="page-top">		

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg bg-secondary fixed-top text-uppercase" id="mainNav">
      <div class="container">
        <a class="navbar-brand js-scroll-trigger" href="https://sistemaflashcards.herokuapp.com">FLASHCARDS</a>
      </div>
    </nav>
    <section>
    	<div class="row" ng-App="AppActivaCuenta" ng-controller="ActivarCuentaCtrl">
    		<div class="col-md-4"></div>
    		<div class="col-md-4">
    			<br>
    			<h1 align="center">Activar Cuenta: ${activa.getUsername()}</h1>
    			<br> 
    			<div class="row" style="text-align: center;">
    				<p class="recuadroActivaCuenta">¡Enhorabuena ${activa.getUsername()}! Su cuenta ha sido activada correctamente.</p>
    			</div>
    			<div class="row">
    				<form action="activar.html" method="post" id="ActivaCuenta" name="ActivaCuenta">
    					<p class="infoFinRegistro">De manera opcional, puede rellenar los siguientes campos. Cuando finalice pulse en siguiente:</p>
				        <div class="form-group">
				            <input type="text" class="form-control" id="inputNyA" name="inputNyA" placeholder="Nombre y Apellidos">
				        </div>
				        <div class="form-group">
				            <input type="text" class="form-control" id="inputCiudad" name="inputCiudad" placeholder="Ciudad">
				        </div>
				        <div class="form-group">
				            <input type="text" class="form-control" id="inputPais" name="inputPais" placeholder="Pais">
				        </div>
				        <div class="form-group">
				        	<p class="infoFinRegistro">Elija una de las siguientes opciones:</p>
				        	<table>
							  <tr>
							    <th>
							    	<input type="radio" value="no_foto" name="foto" id="sf" ng-model="value" ng-change="optionFoto(value)" checked="checked">
							    	<label for="sf">Sin foto de perfil</label>
							    </th>
							  </tr>
							  <tr>
							    <th>
							    	<input type="radio" value="gravatar" name="foto" id="cf" ng-model="value" ng-change="optionFoto(value)">
							    	<label for="cf">Elige tu avatar con GRAVATAR</label>
							    	<div id="eligeGravatar" style="display: none;">
							    		<br>
							    		<label style="text-align:justify;">GRAVATAR es un servicio que ofrece un avatar único globalmente a través de tu email. Introduce a continuación tu email. Si no estás registrado, accede <a href="https://es.gravatar.com/" target="_blank">aquí</a> para registrarte.</label>
							    		<br>
							    		<input type="text" class="form-control" id="inputAvatar" name="inputAvatar" placeholder="">
							    	</div>
							    </th>
							  </tr>
				        	</table>
						</div>
						<input type="hidden" id="username" name="username" value="${activa.getUsername()}">
				        <br>
				        <div class="row">
				        	<div class="col-md-3"></div>
				        	<div class="col-md-6">
				        		<button type="submit" class="btn btn-success">Siguiente</button>
				        	</div>
				        	<div class="col-md-3"></div>
				        </div>
				    </form>
    			</div>
			</div>
    		<div class="col-md-4"></div>
		</div>
    </section>
    
    <script>
    	'use strict'
    	
	    var app = angular.module('AppActivaCuenta',[]);
	
	    app.controller('ActivarCuentaCtrl', function($scope, $http) {
	    	
	    	$scope.optionFoto = function(value){
	    		var divGravatar = document.getElementById("eligeGravatar");
				if(value=="gravatar"){
	    			divGravatar.style.display = "block";
	    		}else{
	    			divGravatar.style.display = "none";
	    		}
	    	}
	    
	    });
    </script>

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
    
    <!--Re captcha google-->
    <script src='https://www.google.com/recaptcha/api.js'></script>
	
	<!-- Alert de Bootbox -->
    <script src="resources/js/bootbox.min.js"></script>
	
	<script>
		if("${mensaje}" != ""){
			bootbox.alert("${mensaje}");
		}
	</script>

  </body>

</html>