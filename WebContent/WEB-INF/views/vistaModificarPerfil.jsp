<!DOCTYPE html>
<html lang="en">
  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Flashcards - Modificar Mi Perfil</title>

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
    	body {
		  background: #F1F3FA;
		}
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
		  width: 35%;
		  height: 35%;
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
    </style>
    
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
    <nav class="navbar navbar-expand-lg bg-secondary fixed-top text-uppercase" id="mainNav">
      <div class="container">
        <a class="navbar-brand js-scroll-trigger" href="https://sistemaflashcards.herokuapp.com">FLASHCARDS</a>
      </div>
    </nav>
    <br>
    <section ng-app="AppModPerfil" ng-controller="ModPerfilCtrl">
    	<div class="container">
		    <div class="row">
				<div class="col-md-12">
					<form ng-submit="envioDatos()" id="Registro" name="Registro">            
		           		<br>
		           		<div class="form-group">
				            <input type="text" class="form-control" id="inputUsername" ng-model="username" ng-change="validateUsername($event, username)" name="inputUsername" placeholder="Username" value="${usuario.getUsername()}" required>
				        </div>
				        <small id="msgUsername">{{messageUsername}}</small>	
				        <h6 style="font-size:10px; color:#808080">El campo Username solo puede contener números y letras, y tiene que tener una longitud de entre 5 y 15 caracteres.</h6>			        
				        <br>
				        <div class="form-group">
				            <input type="email" class="form-control" id="inputEmail" ng-model="email" ng-change="validateEmail($event, email)" name="inputEmail" placeholder="Email" value="${usuario.getEmail()}" required>
				        </div>
				        <small id="msgEmail">{{messageEmail}}</small>
				        <h6 style="font-size:10px; color:#808080">Dirección de email peteneciente al usuario.</h6>			        
				        <br>
				        <div class="form-group">
				            <input type="password" class="form-control" id="inputClave" ng-model="clave" ng-change="validateClave($event, clave, repClave)" name="inputClave" placeholder="Clave" value="${usuario.getClave()}" required>
				        </div>
				        <small id="msgClave">{{messageClave}}</small>
				        <h6 style="font-size:10px; color:#808080">Solo puede contener números y letras, y tiene que tener una longitud de entre 5 y 20 caracteres.</h6>
				        <br>
				        <div class="form-group">
				            <input type="password" class="form-control" id="inputRepiteClave" ng-model="repClave" ng-change="validateRepClave($event, clave, repClave)" name="inputRepiteClave" placeholder="Repetir Clave" value="${usuario.getClave()}" required>
				        </div>
				        <small id="msgRepClave">{{messageRepClave}}</small>
				        <h6 style="font-size:10px; color:#808080">Deben coincidir los campos Clave y Repetir Clave.</h6>
				        <br>
				        <div class="form-group">
				            <input type="text" class="form-control" id="inputNyA" name="inputNyA" ng-model="nombreApellidos" placeholder="Nombre y Apellidos" value="${usuario.getNombreApellidos()}">
				        </div>
				        <div class="form-group">
				            <input type="text" class="form-control" id="inputCiudad" name="inputCiudad" ng-model="ciudad" placeholder="Ciudad" value="${usuario.getCiudad()}">
				        </div>
				        <div class="form-group">
				            <input type="text" class="form-control" id="inputPais" name="inputPais" ng-model="pais" placeholder="Pais" value="${usuario.getPais()}">
				        </div>
				        <div class="form-group">
				        	<p class="infoFinRegistro">Elija una de las siguientes opciones:</p>
				        	<table class="center">
							  <tr>
							    <th>
							    	<input type="radio" value="/resources/img/avatarNone.png" name="foto">Sin foto
							    	<br>
							    	<div class="profile-userpic-forbidden">
				            			<img src="/resources/img/forbidden.png" class="img-responsive" alt="">
									</div>
							    </th>
							    <th>
							    	<input type="radio" value="/resources/img/avatarGeneral.png" name="foto">Avatar
							    	<br>
							    	<div class="profile-userpic-avatar">
				            			<img src="/resources/img/avatarGeneral.png" class="img-responsive" alt="">
									</div>
							    </th>
							  </tr>
				        	</table>
						</div>
				        <small id="msgError">{{messageError}}</small>
				        <br>
				        <div class="row">
				        	<div class="col-md-3"></div>
				        	<div class="col-md-6">
				        		<br>
				        		<button type="submit" class="btn-registro" id="btnGuardaCambios" name="btnGuardaCambios" disabled>Guardar Cambios</button>
				        		<br>
				        	</div>
				        	<div class="col-md-3"></div>
				        </div>	
					</form>	            		
				</div>
			</div>
		</div>
	</section>
	
	<script>
		'use strict'
	    var app = angular.module('AppModPerfil', []);
	    app.controller('ModPerfilCtrl', function($scope, $http) {
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
        	
        	
        	/*if("${usuario.getFoto()}"=="/resources/img/avatarNone.png"){
        		document.getElementById("foto")[0].checked=true;
        	}else{
        		document.getElementById("foto")[1].checked=true;
        	}*/
        	
        	
        	function enableBtnModificar(){
        		if(checkUsername==true && checkEmail==true && checkClave==true && checkRepClave==true){
        			if($scope.username=="" || $scope.clave=="" || $scope.repClave=="" || $scope.email==""){
        				document.getElementById("btnGuardaCambios").disabled = true;
        				document.getElementById("msgError").style.color="#E33A3A"
        				$scope.messageError="Existen campos vacíos o erróneos. Por favor, revísalos para continuar con el registro.";
        			}else{
        				$scope.messageError="";
        				document.getElementById("btnGuardaCambios").disabled = false;
        			}
        		}else{
        			document.getElementById("btnGuardaCambios").disabled = true;
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
        			if((listaUsernames[indice] != "${usuario.getUsername()}") && (username == listaUsernames[indice])){
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
        		
        		enableBtnModificar();
        	}
        	
        	$scope.validateEmail = function(event, email){
        		checkEmail = false;
        		existEmail = false;
	        	checkCaracterEmail = true;
	        	email = email.toLowerCase();
        		
        		for(indice=0; indice<listaEmails.length; indice++){
        			if((listaEmails[indice]!="${usuario.getEmail()}") && (email == listaEmails[indice])){
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
        		
        		enableBtnModificar();
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
        		enableBtnModificar();
        	}
        	
        	$scope.envioDatos = function(){
        		
        		var emailN = $scope.email;
        		
        		var dataObj = {
    				"username" : $scope.username,
    				"clave" : $scope.clave,
    				"email" : emailN.toLowerCase(),
    				"nombreApellidos" : $scope.nombreApellidos,
    				"ciudad" : $scope.ciudad,
    				"pais" : $scope.pais,
    				"foto" : document.getElementById("foto").value
        		};
        		
        		$http({
        	        method: 'POST',
        	        url: '/modificaUsuario.do',
        	        data: dataObj,
        	        headers : {
        	        	'Content-type': 'application/json',
                    	'Accept': 'application/json'
                    }
        	    }).then(
	        		function (response) {
		        		if (response.data){
		        			bootbox.alert('Cuenta creada. Para activarla, siga las instrucciones que se han enviado a su email: '+dataObj.email, function(){
		        			    window.open('https://sistemaflashcards.herokuapp.com', '_self');
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
        	
        	
        	enableBtnModificar();
        	
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
    
    <!-- Alert de Bootbox -->
    <script src="resources/js/bootbox.min.js"></script>
	
	<script>
		if("${mensaje}" != ""){
			bootbox.alert("${mensaje}");
		}
	</script>

  </body>

</html>