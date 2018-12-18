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
	    	<div class="row">
	    		<div class="col-md-4"></div>
	    		<div class="col-md-4">
	    			<script>
				        var app = angular.module('myApp', []);
				        app.controller('RegistroCtrl', function($scope, $http) {
				        	//Variables
				        	var listaUsuarios = "${listUsername}";
				        	var listaEmail = "${listEmail}";
				        	$scope.arrayUsuarios = [];
				        	$scope.arrayEmail = [];
				        	var objUsuarios = null;
				        	var objEmail = null;
				        	var longitud = 0;
				        	var flagErrorUsername = 0;
				        	var indiceUser = 0;
				        	
			        		objUsuarios = JSON.parse(listaUsuarios);
			        		longitud = Object.keys(objUsuarios.listUsername).length;
			        		for(indiceUser=0; indiceUser<longitud; indiceUser++) {
			        			$scope.arrayUsuarios.push(objUsuarios.listUsername[indiceUser]);
		        			}
			        	
			        		objEmail = JSON.parse(listaEmail);
			        		longitud = Object.keys(objEmail.listEmail).length;
			        		for(indiceUser=0; indiceUser<longitud; indiceUser++) {
			        			$scope.arrayEmail.push(objEmail.listEmail[indiceUser]);
		        			}
				        	
				        	$scope.funcUsername = function(username){
				        		flagErrorUsername = 0;
				        		$scope.longitudUsername = '';
				        		$scope.caracterUsername = '';
				        		
				        		if(username.length<5 || username.length>15){
				        			flagErrorUsername = 1;
				        			$scope.longitudUsername = 'La longitud del campo username es erronea. Debe tener entre 5 y 15 caracteres.';
				        		}
				        		
				        		for(indiceUser = 0; indiceUser<username.length; indiceUser++){
				        			if(username.charAt(indiceUser)==' '){
				        				$scope.caracterUsername = 'El campo username no puede contener espacios';
				        				flagErrorUsername = 1;
				        				indiceUser = username.length;
				        			}else if(!((username.charAt(indiceUser)>='0' && username.charAt(indiceUser)<='9')||
					        			 (username.charAt(indiceUser)>='a' && username.charAt(indiceUser)<='z')||
					        			 (username.charAt(indiceUser)>='A' && username.charAt(indiceUser)<='Z'))){
			        					flagErrorUsername = 1;
			        					$scope.caracterUsername = 'El campo username no puede contener el caracter '+username.charAt(indiceUser)+'.';
			        					indiceUser = username.length;
			        				}
			        			}
					        	if(arrayUsuarios.length > 0){
					        		for(indiceUser = 0; indiceUser<arrayUsuarios.length; indiceUser++){
					        			if(arrayUsuarios[indiceUser] == username){
					        				$scope.infoUsername = $scope.infoUsername + '\nEl username ya existe.';
					        				indiceUser = arrayUsuarios.length;
					        				flagErrorUsername = 1;
					        			}
					        		}
					        	}
					        	if(flagErrorUsername == 0){
					        		$scope.infoUsername = 'El nombre de usuario '+username+' es valido.';
					        		document.getElementById("showUsername").style.color = "#CDE436"
					        	}else{
					        		document.getElementById("showUsername").style.color = "red";
					        	}
				        	}
				        	
				        	
				        	
				        	
				        	
				        	
				        	
				        	$scope.envioDatos = function(user,em,pass){
				        		
				        		var data = {

				        				username: user,

				        				email: em,

				        				clave: pass

				        				};

				        				//Call the services

				        				$http.post('/registrarUsuario.html', JSON.stringify(data)).then(function (response) {

				        				if (response.data)

				        				$scope.msg = "Post Data Submitted Successfully!";

				        				}, function (response) {

				        				$scope.msg = "Service not Exists";

				        				$scope.statusval = response.status;

				        				$scope.statustext = response.statusText;

				        				$scope.headers = response.headers();

				        				});
				        		
				        	}
				        	
				        	
				        	
					        $scope.enviar = function(){
					        	$scope.errorUsername = '';
					        	$scope.errorEmail = '';
					        	$scope.errorClave = '';
					        	var flagError = 0;
	
								//check email existe
					        	
				        		if(arrayEmail.length > 0){
					        		for(var indiceEmail = 0; indiceEmail<arrayEmail.length; indiceEmail++){
					        			if(arrayEmail[indiceEmail] == $scope.campEmail){
					        				flagError = 1;
					        				$scope.errorEmail = 'Error. Email ya existe.';
					        				indiceEmail = arrayEmail.length;
					        			}
					        		}
					        	}
					        	
					        	//check clave adecuada
				        		var lengthClave = $scope.campClave.length;
				        		if(lengthClave<5 || lengthClave>20){
				        			flagError = 1;
			        				$scope.errorClave = 'Error. La longitud del campo clave es erronea.';
				        		}
				        		if(flagError == 0){
				        			for(var indiceClave = 0; indiceClave<lengthClave; indiceClave++){
				        				if(!(($scope.campClave.charAt(indiceClave)>='0' && $scope.campClave.charAt(indiceClave)<='9')||
							        	     ($scope.campClave.charAt(indiceClave)>='a' && $scope.campClave.charAt(indiceClave)<='z')||
							        		 ($scope.campClave.charAt(indiceClave)>='A' && $scope.campClave.charAt(indiceClave)<='Z'))){
				        					flagError = 1;
				        					$scope.errorClave = 'Error. No esta permitido el caracter '+$scope.campClave.charAt(indiceClave)+' en el campo clave.';
				        					indiceClave = lengthClave;
				        				}
				        			}
				        		}
					        	
					        	//check clave y rep clave coinciden
					        		
				        		if($scope.campClave != $scope.campRepClave){
				        			flagError = 1;
				        			$scope.errorClave = 'Error. Las claves no coinciden';
					        	}
					        		
					        	//registro correcto	
					        	
					        	/*if(flagError == 0){
					        	    $http.post('https://sistemaflashcards.herokuapp.com/registrarUsuario.html', {
			        	    			username: $scope.campUsername,
			        	    			email: $scope.campEmail,
			        	    			clave: $scope.campClave
			        	    		});
					        	}*/
					        	
					        	/*var nuevoUser = '{ "user" : [' +
					        	'{ "username":"'+$scope.campUsername+'" , "email":"'+$scope.campEmail+'", "clave":"'+ $scope.campClave +'"}]}';
					        	
					        	this.http.post('/registrarUsuario.html', {
				        	      title: 'registro',
				        	      body: nuevoUser,
				        	      userId: 1
				        	    }).subscribe(
				        	        res => {
				        	          console.log(res);
				        	        },
				        	        err => {
				        	          console.log("Error occured");
				        	        }
				        	      );*/
				        	      
				        		
					        }
				        });
			        </script>
	    			<form ng-submit="envioDatos(campUsername,campEmail,campClave)" ng-controller="RegistroCtrl" id="Registro" name="Registro">
				        <div class="form-group">
				            <input type="text" class="form-control" id="inputUsername" ng-model="campUsername" ng-change="funcUsername(campUsername)" name="inputUsername" placeholder="Username" required>
				        </div>
				        <h6 style="font-size:10px; color:#808080">El campo Username solo puede contener n�meros y letras, y tiene que tener una longitud de entre 5 y 15 caracteres</h6>
				        <small id="showUsername" name="showUsername">{{infoUsername}}</small>
				        <div class="form-group">
				            <input type="email" class="form-control" id="inputEmail" ng-model="campEmail" ng-change="funcEmail(campEmail)" name="inputEmail" placeholder="Email" required>
				        </div>
				        <h6 style="font-size:10px; color:red">{{errorEmail}}</h6>
				        <div class="form-group">
				            <input type="password" class="form-control" id="inputClave" ng-model="campClave" name="inputClave" placeholder="Clave" required>
				        </div>
				        <div class="form-group">
				            <input type="password" class="form-control" id="inputRepiteClave" ng-model="campRepClave" name="inputRepiteClave" placeholder="Repetir Clave" required>
				        </div>
				        <h6 style="font-size:10px; color:#808080">Deben coincidir los campos Clave y Repetir Clave. Solo puede contener n�meros y letras, y tiene que tener una longitud de entre 5 y 20 caracteres</h6>
				        <h6 style="font-size:10px; color:red">{{errorClave}}</h6>
				        <div class="row">
				        	<br>
				        	<div class="g-recaptcha positionReCaptcha" data-sitekey="6LfaZ4EUAAAAAFcqOxY0fsiDeh17WHqRhLdEQPZw" data-callback="enableBtn"></div>
				        </div>
				        <h6>{{arrayUsuarios}}</h6>
				        <h6>{{arrayEmail}}</h6>
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
	    </section>
	
	
	    <!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
	    <div class="scroll-to-top d-lg-none position-fixed ">
	      <a class="js-scroll-trigger d-block text-center text-white rounded" href="#page-top">
	        <i class="fa fa-chevron-up"></i>
	      </a>
	    </div>
	
  </body>

</html>