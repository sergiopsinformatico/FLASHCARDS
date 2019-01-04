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
    
    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
    
    <!-- Angular JS -->
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
    
    <style>
    	body {
		  background: #F1F3FA;
		}
		
		/* Profile container */
		.profile {
		  margin: 20px 0;
		  min-width: 100%;
		  min-height: 100%;
		}
		
		/* Profile sidebar */
		.profile-sidebar {
		  padding: 20px 0 10px 0;
		  background: #fff;
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
		
		.profile-usertitle {
		  text-align: center;
		  margin-top: 20px;
		}
		
		.profile-usertitle-username {
		  color: #5a7391;
		  font-size: 14px;
		  font-weight: 600;
		  margin-bottom: 7px;
		}
		
		.btn-principal{
			width: 70%;
			text-align:center;
			margin:auto;
			display: flex; 
			justify-content: center;
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
        <!-- <button class="navbar-toggler navbar-toggler-right text-uppercase bg-primary text-white rounded" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          Menu
          <i class="fas fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item mx-0 mx-lg-1">
              <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="https://sistemaflashcards.herokuapp.com/iniciarSesion.html">Iniciar Sesión</a>
            </li>
            <li class="nav-item mx-0 mx-lg-1">
              <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="https://sistemaflashcards.herokuapp.com/registro.html">Registrarse</a>
            </li>
          </ul>
        </div>-->
      </div>
    </nav>
    
    <section ng-app="AppPrincipal" ng-controller="PrincipalCtrl">
	    <div class="container">
		    <div class="row profile">
				<div class="col-md-12">		            
		            <div class="row">
		            	Informacion Personal
		            </div>
				</div>
			</div>
		</div>
	</section>
	
	<script>
		'use strict'
	    var app = angular.module('AppPrincipal', []);
	    app.controller('PrincipalCtrl', function($scope, $http) {
	    	$scope.nombreApellidos="";
	    	$scope.ciudad="";
	    	$scope.pais="";
	    	if("${usuario.getNombreApellidos()}"!=null && "${usuario.getNombreApellidos()}"!=""){
	    		$scope.nombreApellidos="Nombre y Apellidos: "+"${usuario.getNombreApellidos()}";
	    	}
	    	if("${usuario.getCiudad()}"!=null && "${usuario.getCiudad()}"!=""){
	    		$scope.ciudad="Ciudad: "+"${usuario.getCiudad()}";
	    	}
	    	if("${usuario.getPais()}"!=null && "${usuario.getPais()}"!=""){
	    		$scope.pais="Pais: "+"${usuario.getPais()}";
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