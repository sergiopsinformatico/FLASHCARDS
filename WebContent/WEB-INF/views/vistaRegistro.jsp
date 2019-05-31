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
    <link rel="stylesheet" type="text/css" href="resources/css/registro.css"/>

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
		        <a class="navbar-brand js-scroll-trigger" href="inicio.html">FLASHCARDS</a>
		        <button class="navbar-toggler navbar-toggler-right text-uppercase bg-primary text-white rounded" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
		          Menu
		          <i class="fas fa-bars"></i>
		        </button>
		        <div class="collapse navbar-collapse" id="navbarResponsive">
		          <ul class="navbar-nav ml-auto">
		            <li class="nav-item mx-0 mx-lg-1">
		              <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="inicioRecSesion.html">Iniciar Sesión</a>
		            </li>
		          </ul>
		        </div>
		      </div>
		    </nav>
		</header>
			<section class="background">
				<br><br><br><br>
				<div class="row" ng-app="AppRegistro" ng-controller="RegistroCtrl">
					<div class="col-md-1"></div>
					<div class="col-md-5 middle">
						<div class="containerImg">
							<img src="resources/img/logoFlashcards.JPG" alt=""/>
						</div>
					</div>
					<div class="col-md-5 fondoRegistro">
						<h3 align="center">Regístrate</h3>
						<br>
	                    <form ng-submit="envioDatos()" id="Registro" name="Registro">
		                    <div class="row">
		                        <div class="col-md-12">
		                            <div class="form-group">
		                                <input type="text" class="form-control" id="inputUsername" ng-model="username" ng-change="validateUsername($event, username)" name="inputUsername" placeholder="Username" required />
		                            </div>
		                            <div class="form-group">
		                                <small id="msgUsername">{{messageUsername}}</small>
		                            </div>
		                            <div class="form-group">
		                                <input type="text" class="form-control" id="inputEmail" ng-model="email" ng-change="validateEmail($event, email)" name="inputEmail" placeholder="Email" required />
		                            </div>
		                            <div class="form-group">
		                                <small id="msgEmail">{{messageEmail}}</small>
		                            </div>
		                            <div class="form-group">
		                                <input type="password" class="form-control" id="inputClave" ng-model="clave" ng-change="validateClave($event, clave, repClave)" name="inputClave" placeholder="Clave" required />
		                            </div>
		                            <div class="form-group">
		                                <small id="msgClave">{{messageClave}}</small>
		                            </div>
		                            <div class="form-group">
		                                <input type="password" class="form-control"  id="inputRepiteClave" ng-model="repClave" ng-change="validateRepClave($event, clave, repClave)" name="inputRepiteClave" placeholder="Repetir Clave" required />
		                            </div>
		                            <div class="form-group">
		                                <small id="msgRepClave">{{messageRepClave}}</small>
		                            </div>
		                            <br>
		                            <div class="form-group">
		                                <small id="msgError">{{messageError}}</small>
		                            </div>
		                            <br>
		                            <div class="form-group">
		                            	<input type="submit" class="btnRegister"  value="Registrar" id="button1" name="button1" disabled/>
		                            </div>
		                        </div>
		                    </div>
		            	</form>
					</div>
					<div class="col-md-1"></div>
				</div>
			<script>
				'use strict'
			    var app = angular.module('AppRegistro', []);
		        app.controller('RegistroCtrl', function($scope, $http) {
		        	
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
	        	        url: '/getUsernames.do',
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
	        	        url: '/getEmails.do',
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
		        				document.getElementById("button1").disabled = true;
		        				document.getElementById("msgError").style.color="#E33A3A"
		        				$scope.messageError="Existen campos vacíos o erróneos. Por favor, revísalos para continuar con el registro.";
		        			}else{
		        				$scope.messageError="";
		        				document.getElementById("button1").disabled = false;
		        			}
		        		}else{
		        			document.getElementById("button1").disabled = true;
		        			document.getElementById("msgError").style.color="#E33A3A"
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
		        				document.getElementById("msgUsername").style.color="#E33A3A"
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
			        					document.getElementById("msgUsername").style.color="#E33A3A"
			        					$scope.messageUsername = "El username no puede contener espacios.";
			        					break;
			        				}else if((!(username.charAt(indice)>='a' && username.charAt(indice)<='z')) &&
			        				   (!(username.charAt(indice)>='A' && username.charAt(indice)<='Z')) &&
			        				   (!(username.charAt(indice)>='0' && username.charAt(indice)<='9'))){
			        					checkCaracterUsername=false;
			        					document.getElementById("msgUsername").style.color="#E33A3A"
			        					$scope.messageUsername = "El caracter "+ username.charAt(indice) +" no se permite para este campo.";
			        					break;
			        				}
			        			}
			        			
			        			if(checkCaracterUsername==true){
			        				document.getElementById("msgUsername").style.color="#5CC300"
			        				$scope.messageUsername = "El username "+username+" es válido.";
			        			}
			        			
			        		}else{
			        			document.getElementById("msgUsername").style.color="#E33A3A"
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
		        				document.getElementById("msgEmail").style.color="#E33A3A"
		        				$scope.messageEmail = "El email "+ email +" existe.";
		        				break;
		        			}
		        		}
		        		
		        		if(existEmail==false){
			        		for(indice=0; indice<email.length; indice++){
			        			if(email.charAt(indice)==' '){
			        				checkCaracterEmail = false;
			        				document.getElementById("msgEmail").style.color="#E33A3A"
			        				$scope.messageEmail = "La direccion de email no puede contener espacios.";
			        				break;
			        			}
			        		}
		        		}
		        		
		        		if(existEmail==false && checkCaracterEmail==true){
		        			document.getElementById("msgEmail").style.color="#5CC300"
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
		        					document.getElementById("msgClave").style.color="#E33A3A"
			    		        	$scope.messageClave = "Error. La clave no puede contener espacios.";
		        					break;
		        				}else if((!(clave.charAt(indice)>='a' && clave.charAt(indice)<='z')) &&
		        				   (!(clave.charAt(indice)>='A' && clave.charAt(indice)<='Z')) &&
		        				   (!(clave.charAt(indice)>='0' && clave.charAt(indice)<='9'))){
		        					checkCaracterClave=false;
		        					document.getElementById("msgClave").style.color="#E33A3A"
		    		        		$scope.messageClave = "Error. El caracter "+clave.charAt(indice)+" no es valido.";
		        					break;
		        				}
		        			}
		        		}else{
		        			document.getElementById("msgClave").style.color="#E33A3A"
		        			$scope.messageClave = "Error. La longitud de la clave debe de ser entre 5 y 20 caracteres.";
		        		}
		        		
		        		if(checkLongClave==true && checkCaracterClave==true){
		        			document.getElementById("msgClave").style.color="#5CC300"
			        		$scope.messageClave = "La clave es válida.";
		        			checkClave = true;
		        		}
		        		
		        		$scope.validateRepClave(event, clave, repClave);
		        	}
		        	
		        	$scope.validateRepClave = function(event, clave, repClave){
		        		checkRepClave = false;
		        		if(clave==repClave){
		        			checkRepClave = true;
		        			document.getElementById("msgRepClave").style.color="#5CC300"
				        	$scope.messageRepClave = "Los campos Clave y Repite Clave coinciden.";
		        		}else{
		        			document.getElementById("msgRepClave").style.color="#E33A3A"
			        		$scope.messageRepClave = "Error. No coinciden los campos Clave y Repite Clave.";
		        		}
		        		enableBtnRegistro();
		        	}
		        	
		        	$scope.envioDatos = function(){
		        		
		        		var emailN = $scope.email;
		        		
		        		var dataObj = {
	        				"username" : $scope.username,
	        				"clave" : $scope.clave,
	        				"email" : emailN.toLowerCase()
		        		};
		        		
		        		$http({
		        	        method: 'POST',
		        	        url: '/guardarUsuario.do',
		        	        data: dataObj,
		        	        headers : {
		        	        	'Content-type': 'application/json',
		                    	'Accept': 'application/json'
		                    }
		        	    }).then(
			        		function (response) {
				        		if (response.data){
				        			bootbox.alert('Cuenta creada. Para activarla, siga las instrucciones que se han enviado a su email: '+dataObj.email, function(){
				        			    window.open('/', '_self');
				        			});
				        		}else{
				        			bootbox.alert('Fallo en el registro. Por favor, intentelo más tarde.');
				        		}
			        		},
			        		function (response) {
				        		$scope.msgAlert = response.data;
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
	    
	    <!-- Alert de Bootbox -->
	    <script src="resources/js/bootbox.min.js"></script>
		
		<script>
			if("${mensaje}" != ""){
				bootbox.alert("${mensaje}");
			}
		</script>
	
  </body>
</html>