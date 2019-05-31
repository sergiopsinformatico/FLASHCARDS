<!DOCTYPE html>
<html lang="en">
  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Restablecer Clave - Flashcards</title>

    <!-- Bootstrap core CSS -->
    <link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">

    <!-- Plugin CSS -->
    <link href="resources/vendor/magnific-popup/magnific-popup.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="resources/css/recoveryKey.css"/>

    <!-- Custom styles for this template -->
    <link href="resources/css/freelancer.min.css" rel="stylesheet">
    
    <!-- Angular JS -->
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
    
  </head>

  <body id="page-top">		
  
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
	          <ul class="navbar-nav ml-auto"></ul>
	        </div>
	      </div>
	    </nav>
	</header>
	
	<section class="background" ng-app="AppRestablece" ng-controller="RestableceCtrl">
		<br><br>
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<div class="row">
		   			<div class="col-md-6 middle">
						<div class="containerImg">
							<img src="resources/img/logoFlashcards.JPG" alt=""/>
						</div>
					</div>
		   			<div class="col-md-6 fondoForm container">
		   				<br>
		   				<h6 align="center" class="negrita cursiva">Restablecimiento de la Clave</h6>
		   				<br>
		   				<small class="negrita">¡Hola ${username}!</small>
		   				<br>
		   				<small>Por favor, introduce tu nueva clave</small>
		   				<br><br>
		   				<form action="cambioClave.html" method="post" id="NuevaClave" name="NuevaClave">
		   					<span id="reauth-email" class="reauth-email"></span>
		   					<input type="hidden" id="username" name="username" value="${username}">
			                <input type="text" class="form-control" id="inputNuevaClave" name="inputNuevaClave" ng-change="enableBtnClaves(clave, rClave)" ng-model="clave" placeholder="Nueva Clave" required autofocus>
			                <br>
			                <input type="text" class="form-control" id="inputRepiteNuevaClave" name="inputRepiteNuevaClave" ng-change="enableBtnClaves(clave, rClave)" ng-model="rClave" placeholder="Repite la Nueva Clave" required autofocus>
			                <br><small class="negrita" id="showMsgClave">{{msgClave}}</small>
			                <br><small class="negrita" id="showMsgRepClave">{{msgRepClave}}</small>
			                <br><br>
					        <button class="btn btn-lg btn-block btn-signin color-block" ng-disabled="buttonDisabled" id="buttonRec" name="buttonRec" type="submit">Recuperar Clave</button>
					        <br><br>
					    </form>
		   			</div>
				</div>
			</div>
			<div class="col-md-1"></div>
		</div>
	</section>
	
	<script>
		'use strict'
	    var app = angular.module('AppRestablece', []);
	    app.controller('RestableceCtrl', function($scope, $http) {
	    	
	    	$scope.msgClave = "";
	    	$scope.msgRepClave = "";
	    	$scope.buttonDisabled = true;
	    		    	
	    	var checkClave = false;
	    	var checkLongClave = false;
	    	var checkCaracterClave = false;
	    	var checkRepClave = false;	    	
	    	var indice = 0;
        	
        	$scope.enableBtnClaves = function(clave, rClave){
	    		checkClave = false;
	    		checkLongClave = false;
	    		checkCaracterClave = true;
	    		checkRepClave = false;
	    		
	    		if(clave.length>=5 && clave.length<=20){
	    			checkLongClave = true;
	    			for(indice=0; indice<clave.length; indice++){
	    				if(clave.charAt(indice)==' '){
	    					checkCaracterClave=false;
	    		        	$scope.msgClave = "Error. La clave no puede contener espacios.";
	    		        	document.getElementById("showMsgClave").style.color = "red";
	    					break;
	    				}else if((!(clave.charAt(indice)>='a' && clave.charAt(indice)<='z')) &&
	    				   (!(clave.charAt(indice)>='A' && clave.charAt(indice)<='Z')) &&
	    				   (!(clave.charAt(indice)>='0' && clave.charAt(indice)<='9'))){
	    					checkCaracterClave=false;
			        		$scope.msgClave = "Error. El caracter "+clave.charAt(indice)+" no es valido.";
			        		document.getElementById("showMsgClave").style.color = "red";
	    					break;
	    				}
	    			}
	    			
	    		}else{
	    			$scope.msgClave = "Error. La longitud de la clave debe de ser entre 5 y 20 caracteres.";
	    			document.getElementById("showMsgClave").style.color = "red";
	    		}
	    		
	    		if(checkLongClave==true && checkCaracterClave==true){
	        		$scope.msgClave = "La clave es válida.";
	        		document.getElementById("showMsgClave").style.color = "green";
	    			checkClave = true;
	    		}
	    		
	    		if(clave.localeCompare(rClave) == 0){
	    			checkRepClave = true;
		        	$scope.msgRepClave = "Los campos Clave y Repite Clave coinciden.";
		        	document.getElementById("showMsgRepClave").style.color = "green";
	    		}else{
	        		$scope.msgRepClave = "Error. No coinciden los campos Clave y Repite Clave.";
	        		document.getElementById("showMsgRepClave").style.color = "red";
	    		}
	    		
	    		if(checkClave == true && checkRepClave == true){
	    			$scope.buttonDisabled = false;
	    		}else{
	    			$scope.buttonDisabled = true;
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
    
    <!-- Alert de Bootbox -->
    <script src="resources/js/bootbox.min.js"></script>
	
	<script>
		if("${mensaje}" != ""){
			bootbox.alert("${mensaje}");
		}
	</script>

  </body>

</html>