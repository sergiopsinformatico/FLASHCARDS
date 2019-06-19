<!DOCTYPE html>
<html lang="en">
  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Flashcards - Registro de Usuarios</title>

    <!-- Bootstrap core CSS -->
    <link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">

    <!-- Plugin CSS -->
    <link href="resources/vendor/magnific-popup/magnific-popup.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="resources/css/accesoFlashcards.css"/>

    <!-- Custom styles for this template -->
    <link href="resources/css/freelancer.min.css" rel="stylesheet">
    
    <!-- Angular JS -->
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
    
  </head>

  <body id="page-top">		
		
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
	    
	    <!-- Angular JS -->
	    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
	
	    <!-- Navigation -->
	    <header class="header">
		    <nav class="navbar navbar-expand-lg bg-secondary fixed-top text-uppercase" id="mainNav">
		      <div class="container">
		        <a class="navbar-brand js-scroll-trigger" href="inicio.html">
		        	<img class="logoFlashcards" src="resources/img/logoFlashcards.JPG" alt=""/>
		        </a>
		        <button class="navbar-toggler navbar-toggler-right text-uppercase bg-primary text-white rounded" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
		          Menu
		          <i class="fas fa-bars"></i>
		        </button>
		        <div class="collapse navbar-collapse" id="navbarResponsive">
		          <ul class="navbar-nav ml-auto">
		          	<li class="nav-item mx-0 mx-lg-1">
		              <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="iniciarSesion.html">Iniciar Sesión</a>
		            </li>
		            <li class="nav-item mx-0 mx-lg-1">
		              <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="registro.html">¡Regístrate!</a>
		            </li>
		          </ul>
		        </div>
		      </div>
		    </nav>
		</header>
		<section ng-app="AppRegistro" ng-controller="RegistroCtrl">
			<br><br><br><br>
			<div class="col-md-4"></div>
			<div class="col-md-4 formAccess textCenter container">
				<br>
				<h4 class="title">Crear una Cuenta Nueva</h4>
				<br>
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<form action="crearCuenta.do" method="post" id="Registro" name="Registro">
			                <div class="row">
			                    <div class="col-md-12">
			                        <div class="form-group">
			                            <input type="text" class="form-control" id="inputUsername" ng-model="username" ng-change="validateUsername($event, username)" name="inputUsername" placeholder="Username" required />
			                        </div>
			                        <div class="form-group">
			                            <small id="msgUsername" class="mensajesReg">{{messageUsername}}</small>
			                        </div>
			                        <div class="form-group">
			                            <input type="email" class="form-control" id="inputEmail" ng-model="email" ng-change="validateEmail($event, email)" name="inputEmail" placeholder="Email" required />
			                        </div>
			                        <div class="form-group">
			                            <small id="msgEmail" class="mensajesReg">{{messageEmail}}</small>
			                        </div>
			                        <div class="form-group">
			                            <input type="password" class="form-control" id="inputClave" ng-model="clave" ng-change="validateClave($event, clave, repClave)" name="inputClave" placeholder="Clave" required />
			                        </div>
			                        <div class="form-group">
			                            <small id="msgClave" class="mensajesReg">{{messageClave}}</small>
			                        </div>
			                        <div class="form-group">
			                            <input type="password" class="form-control"  id="inputRepiteClave" ng-model="repClave" ng-change="validateRepClave($event, clave, repClave)" name="inputRepiteClave" placeholder="Repetir Clave" required />
			                        </div>
			                        <div class="form-group">
			                            <small id="msgRepClave" class="mensajesReg">{{messageRepClave}}</small>
			                        </div>
			                        <div class="form-group">
			                            <small id="msgError" class="mensajesReg">{{messageError}}</small>
			                        </div>
			                        <div class="form-group">
			                        	<input type="submit" class="btn btn-lg btn-block btn-signin btnBlock" ng-disabled="btnDisabled" value="Registrar" id="buttonRegistro" name="buttonRegistro"/>
			                        </div>
			                        <br>
			                        <p><a class="btnRecupera" href="recuperaCuenta.html">Ups.... ¿Olvidasta tu clave?</a></p>
			                    </div>
			                </div>
			        	</form>
					</div>
					<div class="col-md-2"></div>
				</div>
			</div>
			<div class="col-md-4"></div>
		</section>
		
		<script>
		    var app = angular.module('AppRegistro', []);
	        app.controller('RegistroCtrl', function($scope, $http) {
	        	
	        	$scope.btnDisabled = true;
	        	/*document.getElementById("buttonRegistro").style.background="#457D8E";
	        	document.getElementById("buttonRegistro").style.color="#DDDDDC";*/
	        	
	        	$scope.messageUsername = "";
	        	$scope.messageEmail = "";
	        	$scope.messageClave = "";
	        	$scope.messageRepClave = "";
	        	$scope.messageError = "";
	        	
	        	var listaUsernames = [];
	        	var listaEmails = [];
	        	var indice = 0;
	        	
	        	var checkUsername = false;
	        	var checkExistUsername = false;
	        	var checkLongUsername = false;
	       		var checkCaracterUsername = true;
	        	
	        	var checkEmail = false;
	        	var existEmail = false;
	        	var checkCaracterEmail = false;
	        	
	        	var checkClave = false;
	        	var checkLongClave = false;
	        	var checkCaracterClave = false;
	        	
	        	var checkRepClave = false;
	        	
	        	$http({
	       	        method: 'GET',
	       	        url: 'getUsernames.do',
	                   headers : {
	                   	'Accept': 'application/json'
	                   }
	       	    }).then(function mySuccess(response) {
	       	    	for(indice=0; indice<response.data.length; indice++){
	       	    		listaUsernames.push(response.data[indice]);
	       	    	}
	       	    }, function myError(response) {
	       	    	listaUsernames = [];
	       	    });
	        	
						        	
	        	$http({
	       	        method: 'GET',
	       	        url: 'getEmails.do',
	                   headers : {
	                   	'Accept': 'application/json'
	                   }
	       	    }).then(function mySuccess(response) {
	       	    	for(indice=0; indice<response.data.length; indice++){
	       	    		listaEmails.push(response.data[indice]);
	       	    	}
	       	    }, function myError(response) {
	       	    	listaEmails = [];
	       	    });
	        	
	        	
	        	function enableBtnRegistro(){
	        		if(checkUsername==true && checkEmail==true && checkClave==true && checkRepClave==true){
	        			if($scope.username=="" || $scope.clave=="" || $scope.repClave=="" || $scope.email==""){
	        				$scope.btnDisabled = true;
	        				document.getElementById("msgError").style.color="#FFA720";
	        				document.getElementById("buttonRegistro").style.background="##457D8E";
	        				/*document.getElementById("buttonRegistro").style.color="#DDDDDC";*/
	        				$scope.messageError="Existen campos vacíos o erróneos. Por favor, revísalos para continuar con el registro.";
	        			}else{
	        				$scope.messageError="";
	        				$scope.btnDisabled = false;
	        				document.getElementById("buttonRegistro").style.background="#A3AD1A";
	        				document.getElementById("buttonRegistro").style.color="black";
	        			}
	        		}else{
	        			$scope.btnDisabled = true;
	        			document.getElementById("msgError").style.color="#FFA720"
	        			document.getElementById("buttonRegistro").style.background="#457D8E";
	        			/*document.getElementById("buttonRegistro").style.color="#DDDDDC";*/
	        			$scope.messageError="Existen campos vacíos o erróneos. Por favor, revísalos para continuar con el registro.";
	        		}
	        	}
	        	
	        	$scope.validateUsername = function(event, username){
	        		checkUsername = false;
	        		checkExistUsername = false;
	        		checkLongUsername = false;
	        		checkCaracterUsername = true;
	        		
	        		for(indice=0; indice<listaUsernames.length; indice++){
	        			if(username == listaUsernames[indice]){
	        				checkExistUsername = true;
	        				document.getElementById("msgUsername").style.color="#FFA720"
	        				$scope.messageUsername = "Error. El username "+username+" existe.";
	        				break;
	        			}
	        		}
	        		
	        		if(checkExistUsername==false){		        			
	        			if(username.length>=5 && username.length<=15){
		        			checkLongUsername = true;
		        			for(indice=0; indice<username.length; indice++){
		        				if(username.charAt(indice)==' '){
		        					checkCaracterUsername=false;
		        					document.getElementById("msgUsername").style.color="#FFA720"
		        					$scope.messageUsername = "El username no puede contener espacios.";
		        					break;
		        				}else if((!(username.charAt(indice)>='a' && username.charAt(indice)<='z')) &&
		        				   (!(username.charAt(indice)>='A' && username.charAt(indice)<='Z')) &&
		        				   (!(username.charAt(indice)>='0' && username.charAt(indice)<='9'))){
		        					checkCaracterUsername=false;
		        					document.getElementById("msgUsername").style.color="#FFA720"
		        					$scope.messageUsername = "El caracter "+ username.charAt(indice) +" no se permite para este campo.";
		        					break;
		        				}
		        			}
		        			
		        			if(checkCaracterUsername==true){
		        				document.getElementById("msgUsername").style.color="#1E00A0"
		        				$scope.messageUsername = "El username "+username+" está disponible.";
		        			}
		        			
		        		}else{
		        			document.getElementById("msgUsername").style.color="#FFA720"
		        			$scope.messageUsername = "Error. La longitud del username debe de ser entre 5 y 15 caracteres.";
		        		}
	        			
	        			
	        		}
	        		
	        		if(checkExistUsername==false && checkLongUsername==true && checkCaracterUsername==true){
	        			checkUsername = true;
	        		}
	        		
	        		enableBtnRegistro();
	        	}
	        	
	        	$scope.validateEmail = function(event, email){
	        		checkEmail = false;
	        		existEmail = false;
		        	checkCaracterEmail = true;
		        	email = email.toLowerCase();
	        		
	        		for(indice=0; indice<listaEmails.length; indice++){
	        			if(email == listaEmails[indice]){
	        				existEmail = true;
	        				document.getElementById("msgEmail").style.color="#FFA720"
	        				$scope.messageEmail = "El email "+ email +" existe.";
	        				break;
	        			}
	        		}
	        		
	        		if(existEmail==false){
		        		for(indice=0; indice<email.length; indice++){
		        			if(email.charAt(indice)==' '){
		        				checkCaracterEmail = false;
		        				document.getElementById("msgEmail").style.color="#FFA720"
		        				$scope.messageEmail = "La direccion de email no puede contener espacios.";
		        				break;
		        			}
		        		}
	        		}
	        		
	        		if(existEmail==false && checkCaracterEmail==true){
	        			document.getElementById("msgEmail").style.color="#1E00A0"
	        			$scope.messageEmail = "El email "+ email + " está disponible.";
	        			checkEmail = true;
	        		}
	        		
	        		enableBtnRegistro();
		        }
	        	
	        	$scope.validateClave = function(event, clave, repClave){
	        		
	        		checkClave = false;
	        		checkLongClave = false;
	        		checkCaracterClave = true;
	        		
	        		if(clave.length>=5 && clave.length<=20){
	        			checkLongClave = true;
	        			for(indice=0; indice<clave.length; indice++){
	        				if(clave.charAt(indice)==' '){
	        					checkCaracterClave=false;
	        					document.getElementById("msgClave").style.color="#FFA720"
		    		        	$scope.messageClave = "Error. La clave no puede contener espacios.";
	        					break;
	        				}else if((!(clave.charAt(indice)>='a' && clave.charAt(indice)<='z')) &&
	        				   (!(clave.charAt(indice)>='A' && clave.charAt(indice)<='Z')) &&
	        				   (!(clave.charAt(indice)>='0' && clave.charAt(indice)<='9'))){
	        					checkCaracterClave=false;
	        					document.getElementById("msgClave").style.color="#FFA720"
	    		        		$scope.messageClave = "Error. El caracter "+clave.charAt(indice)+" no es valido.";
	        					break;
	        				}
	        			}
	        		}else{
	        			document.getElementById("msgClave").style.color="#FFA720"
	        			$scope.messageClave = "Error. La longitud de la clave debe de ser entre 5 y 20 caracteres.";
	        		}
	        		
	        		if(checkLongClave==true && checkCaracterClave==true){
	        			document.getElementById("msgClave").style.color="#1E00A0"
		        		$scope.messageClave = "La clave es válida.";
	        			checkClave = true;
	        		}
	        		
	        		$scope.validateRepClave(event, clave, repClave);
	        	}
	        	
	        	$scope.validateRepClave = function(event, clave, repClave){
	        		checkRepClave = false;
	        		if(clave==repClave){
	        			checkRepClave = true;
	        			document.getElementById("msgRepClave").style.color="#1E00A0"
			        	$scope.messageRepClave = "Los campos Clave y Repite Clave coinciden.";
	        		}else{
	        			document.getElementById("msgRepClave").style.color="#FFA720"
		        		$scope.messageRepClave = "Error. No coinciden los campos Clave y Repite Clave.";
	        		}
	        		enableBtnRegistro();
	        	}
	        	
	        });
	    </script>
	    
	    <!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
	    <div class="scroll-to-top d-lg-none position-fixed ">
	      <a class="js-scroll-trigger d-block text-center text-white rounded" href="#page-top">
	        <i class="fa fa-chevron-up"></i>
	      </a>
	    </div>
	    
	    <!-- Alert de Bootbox -->
	    <script src="resources/js/bootbox.min.js"></script>
		
		<script>
			if("${mensaje}" != ""){
				bootbox.alert("${mensaje}");
			}
		</script>
	
  </body>
</html>