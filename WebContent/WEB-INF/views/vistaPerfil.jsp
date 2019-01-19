
<!DOCTYPE html>
<html lang="en">
  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Flashcards - Perfil de ${perfil.getUsername()}</title>

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
    
    <link href="resources/vendor/bootstrap/css/glyphicon.css" rel="stylesheet" type="text/css">
    
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
		  height: 100%;
		  min-height: 100%;
		  
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
			width: 80%;
			text-align:center;
			margin:auto;
			display: flex; 
			justify-content: center;
		}
		
		.container-Paneles {
		  position: relative;
		  width: 50%;
		}
		
		.image {
		  opacity: 1;
		  display: block;
		  width: 40%;
		  height: auto;
		  transition: .5s ease;
		  backface-visibility: hidden;
		}
		
		.middle {
		  transition: .5s ease;
		  opacity: 0;
		  position: absolute;
		  top: 50%;
		  left: 50%;
		  transform: translate(-50%, -50%);
		  -ms-transform: translate(-50%, -50%);
		  text-align: center;
		}
		
		.container-Paneles:hover .image {
		  opacity: 0.3;
		}
		
		.container-Paneles:hover .middle {
		  opacity: 1;
		}
		
		.text {
		  background-color: #97BBFF;
		  color: white;
		  font-size: 16px;
		  padding: 16px 32px;
		}
		
		#panelUsuarioGente, #panelUsuarioClubes{
			display:inline,
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
            <li class="nav-item mx-0 mx-lg-1" id="adminOption">
              <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="/administrador.html">Opciones de Administrador</a>
            </li>
          </ul>
        </div>-->
      </div>
    </nav>
    
    <section>
	    <div class="container">
		    <div class="row profile">
				<div class="col-md-3">
					<div class="profile-sidebar">
						<div class="profile-userpic">
							<img src="${perfil.getFoto()}" class="img-responsive" alt="">
						</div>
						<br>
						<div class="form-group">
				            <p><b>Username:</b> ${perfil.getUsername()}</p>
				        </div>
				        <div class="form-group">
				            <p id="textNyA" style="visibility:hidden;"><b>Nombre y Apellidos:</b>${perfil.getNombreApellidos()}</p>
				        </div>
				        <div class="form-group">
				            <p id="textCiudad" style="visibility:hidden;"><b>Ciudad:</b>${perfil.getCiudad()}</p>
				        </div>
				        <div class="form-group">
				            <p id="textPais" style="visibility:hidden;"><b>País:</b>${perfil.getPais()}</p>
				        </div>
					</div>
				</div>
				<div class="col-md-9"></div>
			</div>
		</div>
	</section>
	
	<script>
		if("${perfil.getNombreApellidos()}"!=null && "${perfil.getNombreApellidos()}"!=""){
			document.getElementById("textNyA").style.visibility="visible";
		}
		if("${perfil.getCiudad()}"!=null && "${perfil.getCiudad()}"!=""){
			document.getElementById("textCiudad").style.visibility="visible";
		}
		if("${perfil.getPais()}"!=null && "${perfil.getPais()}"!=""){
			document.getElementById("textPais").style.visibility="visible";
		}
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
						<!-- 
		            	<div class="col-md-9">
		            		<br>
		            		<div class="form-group">
					            <p><b>Username:</b> ${perfil.getUsername()}</p>
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
		            	 -->

	
	
	
	<!-- <script>
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
	</script>-->