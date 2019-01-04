<!DOCTYPE html>
<html lang="en">
  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Flashcards - Pagina Principal</title>

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
		
		div.infoPersonal{
			width: 100%;
			height: 150px;
		}
		
		.profile-userpic img {
		  float: none;
		  display: block; 
		  margin: 0 auto;
		  width: 50%;
		  height: 50%;
		  margin-left: auto;
  		  margin-right: auto;
		  -webkit-border-radius: 50% !important;
		  -moz-border-radius: 50% !important;
		  border-radius: 50% !important;
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
    <section ng-app="AppPerfil" ng-controller="PerfilCtrl">
    	<div class="container">
		    <div class="row">
				<div class="col-md-12">		            
		            <div class="row rounded border border-warning infoPersonal">
		            	<div class="col-md-3">
		            		<div class="profile-userpic">
								<img src="${perfil.getFoto()}" class="img-responsive" alt="">
							</div>
		            	</div>
		            	<div class="col-md-9">
		            		<br><br>
		            		<div class="form-group">
					            <p>Username: {{perfil.getUsername()}}</p>
					        </div>
					        <div class="form-group">
					            <p>{{nombreApellidos}}</p>
					        </div>
					        <div class="form-group">
					            <p>{{ciudad}}</p>
					        </div>
					        <div class="form-group">
					            <p>{{pais}}</p>
					        </div>		            		
		            	</div>
		            </div>
				</div>
			</div>
		</div>
	</section>
	
	<script>
		'use strict'
	    var app = angular.module('AppPerfil', []);
	    app.controller('PerfilCtrl', function($scope, $http) {
	    	$scope.nombreApellidos="";
	    	$scope.ciudad="";
	    	$scope.pais="";
	    	if("${perfil.getNombreApellidos()}"!=null && "${perfil.getNombreApellidos()}"!=""){
	    		$scope.nombreApellidos="Nombre y Apellidos: "+"${perfil.getNombreApellidos()}";
	    	}
	    	if("${perfil.getCiudad()}"!=null && "${perfil.getCiudad()}"!=""){
	    		$scope.ciudad="Ciudad: "+"${perfil.getCiudad()}";
	    	}
	    	if("${perfil.getPais()}"!=null && "${perfil.getPais()}"!=""){
	    		$scope.pais="Pais: "+"${perfil.getPais()}";
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