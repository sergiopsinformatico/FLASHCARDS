<!DOCTYPE html>
<html lang="en">
  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Flashcards - Registro</title>

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
    	.btn-registro[disabled] {
    		background-color: #ECECEC;
    		border: none;
		  	color: white;
		  	width: 100%;
		  	height: 50px;
		  	text-align: center;
		  	text-decoration: none;
		  	display: inline-block;
		  	font-size: 16px;
		}
    
	    .btn-registro {
		  	background-color: #00ff00;
		  	border: none;
		  	color: white;
		  	width: 100%;
		  	height: 50px;
		  	text-align: center;
		  	text-decoration: none;
		  	display: inline-block;
		  	font-size: 16px;
		}
		
		.positionReCaptcha{
			margin-left: auto;
			margin-right: auto;
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
	    
	    <!-- Angular JS -->
	    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
	
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
	              <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="https://sistemaflashcards.herokuapp.com/iniciarSesion.html">Iniciar Sesi�n</a>
	            </li>
	          </ul>
	        </div>
	      </div>
	    </nav>
	    <section>
	    	<div class="row">
	    		<br><br>
	    	</div>
	    	<div class="row" ng-app="AppRegistro" ng-controller="RegistroCtrl">
	    		<div class="col-md-4"></div>
	    		<div class="col-md-4">
	    			
	    			<form ng-submit="envioDatos()" id="Registro" name="Registro">
				        <small>{{msg}}</small>
				        <div class="form-group">
				            <input type="text" class="form-control" id="inputUsername" ng-model="usernameUser" name="inputUsername" placeholder="Username" required>
				        </div>
				        <h6 style="font-size:10px; color:#808080">El campo Username solo puede contener n�meros y letras, y tiene que tener una longitud de entre 5 y 15 caracteres</h6>
				        
				        <div class="form-group">
				            <input type="email" class="form-control" id="inputEmail" ng-model="emailUser" name="inputEmail" placeholder="Email" required>
				        </div>
				        <div class="form-group">
				            <input type="password" class="form-control" id="inputClave" ng-model="claveUser" name="inputClave" placeholder="Clave" required>
				        </div>
				        <div class="form-group">
				            <input type="password" class="form-control" id="inputRepiteClave" name="inputRepiteClave" placeholder="Repetir Clave" required>
				        </div>
				        <h6 style="font-size:10px; color:#808080">Deben coincidir los campos Clave y Repetir Clave. Solo puede contener n�meros y letras, y tiene que tener una longitud de entre 5 y 20 caracteres</h6>
				        <div class="row">
				        	<br>
				        	<div class="g-recaptcha positionReCaptcha" data-sitekey="6LfaZ4EUAAAAAFcqOxY0fsiDeh17WHqRhLdEQPZw" data-callback="enableBtn"></div>
				        </div>
				        
				        <div class="row">
				        	<div class="col-md-3"></div>
				        	<div class="col-md-6">
				        		<br>
				        		<button type="submit" class="btn-registro" id="button1" disabled>Registrar</button>
				        		<br>
				        	</div>
				        	<div class="col-md-3"></div>
				        </div>
				        <script>
				        	function enableBtn(){
				        		document.getElementById("button1").disabled = false;
				        	}
				        </script>
				    </form>
				    <br>
	    		</div>
	    		<div class="col-md-4"></div>
			</div>
			<script>
				'use strict'
			    var app = angular.module('AppRegistro', []);
		        app.controller('RegistroCtrl', function($scope, $http) {
		        	
		        	$scope.msg = " ";
		        	
		        	$http({
	        	        method: 'GET',
	        	        url: '/ejemploGET.do',
	                    headers : {
	                    	'Content-Type': 'text/plain',
	                    	'Accept': 'text/plain'
	                    }
	        	    }).then(function mySuccess(response) {
	        	    	$scope.msg = "Llega correctamente - " + response.data;
		        	    }, function myError(response) {
		        	    	$scope.msg = "Error del GET - Status Code= " + response.status + ", Status Text= " + response.statusText + ", Data= " + response.data;
		        	    });
		        	
		        	$scope.envioDatos = function(){
		        	    
		        	    /*$scope.newUser.nombreApellidos = '';
			        	$scope.newUser.ciudad = '';
			        	$scope.newUser.pais = '';
			        	$scope.newUser.photo = '';
			        	$scope.newUser.hasRolUsuario = true;
			        	$scope.newUser.hasRolModerador = false;
			        	$scope.newUser.hasRolAdministrador = false;*/
		        	    
			        	/*
			        	{
		                    headers : {
		                    	'Content-Type': 'application/json;charset=UTF-8',
		                    	'Accept': 'text/plain'
		                    }
			            }
			        	*/		        	    
		        		/*$http.post('/guardarUsuario.do', $scope.newUser, {'Content-Type': 'application/json'}).then(
			        		function (response) {
				        		$scope.msg = $scope.msg + " - enviado correctamente";
			        		},
			        		function (response) {
				        		$scope.msg = $scope.msg + " - Status Code= " + response.status + ", Status Text= " + response.statusText;
			        		}
		        		);*/
		        		
		        		//var datoEnvia = '{' + '"username":"' + $scope.usernameUser + '","clave":"'+$scope.claveUser+'","email":"'+$scope.emailUser+'"}';
		        		
		        		/*
		        		
		        		*/
		        		
		        		var dataObj = {
	        				username : $scope.usernameUser,
	        				clave : $scope.claveUser,
	        				email : $scope.emailUser,
	        				nombre : $scope.emailUser,
	        				ciudad : $scope.emailUser,
	        				pais : $scope.emailUser,
	        				photo : $scope.emailUser
		        		};
		        		
		        		$http({
		        	        method: 'POST',
		        	        url: '/guardarUsuario.do',
		        	        data: dataObj
		        	    }).then(
			        		function (response) {
				        		$scope.msg = dataObj.username+" - enviado correctamente. Response: "+response.data;
			        		},
			        		function (response) {
				        		$scope.msg = dataObj.username+" - Status Code= " + response.status + ", Status Text= " + response.statusText + ", Data= " + response.data;
			        		}
		        		);

					}
		        });
		    </script>
	    </section>
	    
	    <!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
	    <div class="scroll-to-top d-lg-none position-fixed ">
	      <a class="js-scroll-trigger d-block text-center text-white rounded" href="#page-top">
	        <i class="fa fa-chevron-up"></i>
	      </a>
	    </div>
	
  </body>
</html>