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

  <body ng-app="myApp" id="page-top">
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
	              <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="https://sistemaflashcards.herokuapp.com/iniciarSesion.html">Iniciar Sesión</a>
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
	    			<form ng-submit="enviar()" ng-controller="RegistroCtrl" id="Registro" name="Registro">
				        <div class="form-group">
				            <input type="text" class="form-control" id="inputUsername" ng-model="campUsername" name="inputUsername" placeholder="Username" required>
				        </div>
				        <h6 style="font-size:10px; color:#808080">El campo Username solo puede contener números y letras, y tiene que tener una longitud de entre 5 y 15 caracteres</h6>
				        <h6 style="font-size:10px; color:red">{{errorUsername}}</h6>
				        <div class="form-group">
				            <input type="email" class="form-control" id="inputEmail" ng-model="campEmail" name="inputEmail" placeholder="Email" required>
				        </div>
				        <h6 style="font-size:10px; color:red">{{errorEmail}}</h6>
				        <div class="form-group">
				            <input type="password" class="form-control" id="inputClave" ng-model="campClave" name="inputClave" placeholder="Clave" required>
				        </div>
				        <div class="form-group">
				            <input type="password" class="form-control" id="inputRepiteClave" ng-model="campRepClave" name="inputRepiteClave" placeholder="Repetir Clave" required>
				        </div>
				        <h6 style="font-size:10px; color:#808080">Deben coincidir los campos Clave y Repetir Clave. Solo puede contener números y letras, y tiene que tener una longitud de entre 5 y 20 caracteres</h6>
				        <h6 style="font-size:10px; color:red">{{errorClave}}</h6>
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
	    		<script>
			        var app = angular.module('myApp', []);
			        app.controller('RegistroCtrl', function($scope, $http) {
			        	$scope.errorUsername = '';
			        	$scope.errorEmail = '';
			        	$scope.errorClave = '';
			        	var listaUsuarios = "${listUsername}";
			        	var listaEmail = "${listEmail}";
			        	var objUsuarios = null;
			        	var objEmail = null;
			        	var longitud = 0;
			        	var arrayUsuarios = [];
			        	var arrayEmail = [];
			        	
			        	if(listaUsuarios != "empty"){
			        		objUsuarios = JSON.parse(listaUsuarios);
			        		longitud = Object.keys(objUsuarios.listUsername).length;
			        		for(var i=0; i<longitud; i++) {
		        			   arrayUsuarios.push(objUsuarios.listUsername[i]);
		        			}
						}
			        	
			        	if(listaEmail != "empty"){
			        		objEmail = JSON.parse(listaEmail);
			        		longitud = Object.keys(objEmail.listEmail).length;
			        		for(var i=0; i<longitud; i++) {
		        			   arrayEmail.push(objEmail.listEmail[i]);
		        			}
						}
			        	
				        $scope.enviar = function(){
				        	$scope.errorUsername = '';
				        	$scope.errorEmail = '';
				        	$scope.errorClave = '';
				        	var flagError = 0;
				        	
				        	
				        	//check existe nombre de usuario
				        	
				        	if(arrayUsuarios.length > 0){
				        		for(var indiceUsuarios = 0; indiceUsuarios<arrayUsuarios.length; indiceUsuarios++){
				        			if(arrayUsuarios[indiceUsuarios] == $scope.campUsername){
				        				flagError = 1;
				        				$scope.errorUsername = 'Error. Username ya existe.';
				        				indiceUsuarios = arrayUsuarios.length;
				        			}
				        		}
				        	}
				        	
				        	//check nombre usuario adecuado
				        	
				        	if(flagError == 0){
				        		var lengthUsername = $scope.campUsername.length;
				        		if(lengthUsername<5 || lengthUsername>15){
				        			flagError = 1;
				        			$scope.errorUsername = 'Error. La longitud del campo username es erronea.';
				        		}
				        		if(flagError == 0){
				        			for(var indiceUser = 0; indiceUser<lengthUsername; indiceUser++){
				        				if(!(($scope.campUsername.charAt(indiceUser)>='0' && $scope.campUsername.charAt(indiceUser)<='9')||
						        			 ($scope.campUsername.charAt(indiceUser)>='a' && $scope.campUsername.charAt(indiceUser)<='z')||
						        			 ($scope.campUsername.charAt(indiceUser)>='A' && $scope.campUsername.charAt(indiceUser)<='Z'))){
				        					flagError = 1;
				        					$scope.errorUsername = 'Error. No esta permitido el caracter '+$scope.campUsername.charAt(indiceUser)+' en el campo username.';
				        				}
				        			}
				        		}
				        	}
				        	
				        	//check email existe
				        	
				        	if(flagError == 0){
				        		if(arrayEmail.length > 0){
					        		for(var indiceEmail = 0; indiceEmail<arrayEmail.length; indiceEmail++){
					        			if(arrayEmail[indiceEmail] == $scope.campEmail){
					        				flagError = 1;
					        				$scope.errorEmail = 'Error. Email ya existe.';
					        			}
					        		}
					        	}
				        	}
				        	
				        	//check clave adecuada
				        	if(flagError == 0){
				        		var lengthClave = $scope.campClave.length;
				        		if(lengthClave<5 || lengthClave>20){
				        			flagError = 1;
			        				$scope.error = 'Error. La longitud del campo clave es erronea.';
				        		}
				        		if(flagError == 0){
				        			for(var indiceClave = 0; indiceClave<lengthClave; indiceClave++){
				        				if(!(($scope.campClave.charAt(indiceClave)>='0' && $scope.campClave.charAt(indiceClave)<='9')||
							        	     ($scope.campClave.charAt(indiceClave)>='a' && $scope.campClave.charAt(indiceClave)<='z')||
							        		 ($scope.campClave.charAt(indiceClave)>='A' && $scope.campClave.charAt(indiceClave)<='Z'))){
				        					flagError = 1;
				        					$scope.errorClave = 'Error. No esta permitido el caracter '+$scope.campClave.charAt(indiceClave)+' en el campo clave.';
				        				}
				        			}
				        		}
				        	}
				        	
				        	//check clave y rep clave coinciden
				        		
				        	if(flagError == 0){
				        		if($scope.campClave != $scope.campRepClave){
				        			flagError = 1;
				        			$scope.errorClave = 'Error. Las claves no coinciden';
					        	}
				        	}
				        		
				        	//registro correcto	
				        	
				        	if(flagError == 0){
				        	    $http.post('https://sistemaflashcards.herokuapp.com/registrarUsuario.html',
		        	    		{
		        	    			username: $scope.campUsername,
		        	    			email: $scope.campEmail,
		        	    			clave: $scope.campClave
		        	    		});
				        	}
				        }
			        });
		        </script>
			</div>
	    </section>
	
	
	    <!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
	    <div class="scroll-to-top d-lg-none position-fixed ">
	      <a class="js-scroll-trigger d-block text-center text-white rounded" href="#page-top">
	        <i class="fa fa-chevron-up"></i>
	      </a>
	    </div>
	
  </body>

</html>