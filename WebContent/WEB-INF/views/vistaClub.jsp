<!DOCTYPE html>
<html lang="es">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Flashcards - Club ${club.getNombreClub()}</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
  <link href="resources/css/comunes.css" rel="stylesheet">
  <link href="resources/css/vistaClub.css" rel="stylesheet">
  <link href="resources/css/cardFlip.css" rel="stylesheet">
  
  <!-- Bootstrap core CSS -->
  <link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  
  <!-- Font-Awesome -->
  <link rel="stylesheet" href="resources/font-awesome/css/font-awesome.min.css">
  
  <!-- Angular JS -->
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>

</head>

<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
    	
	   	<div class="row">
	   		<br><br>
	   	</div>
      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="inicio.html">
      	<div class="sidebar-brand-icon middle">
        	<img class="logoFlashcards" src="resources/img/logoFlashcards.JPG" alt=""/>
        </div>
      </a>
      
      <div class="row">
	  	<br><br>
	  </div>

      <!-- Divider-->
      <hr class="sidebar-divider my-0">

      <li class="nav-item">
        <a class="nav-link" href="inicio.html">
          <i class="fa fa-home" aria-hidden="true"></i>
          <span>Pagina Principal</span></a>
      </li>      
      
      <hr class="sidebar-divider" id="adminSidebarDivider" style="display: none;">
      <div class="sidebar-heading" id="adminSidebarTitle" style="display: none;">
        Administrador
      </div>
      <li class="nav-item" id="adminSidebar" style="display: none;">
        <a class="nav-link" href="panelAdministrador.html">
          <i class="fa fa-universal-access" aria-hidden="true"></i>
          <span>Panel Administrador</span></a>
      </li>
      
      <hr class="sidebar-divider">
      
      <!-- Heading -->
      <div class="sidebar-heading">
        Usuarios
      </div>
      <li class="nav-item">
        <a class="nav-link" href="verGente.html">
          <i class="fa fa-user-circle-o" aria-hidden="true"></i>
          <span>Gente</span>
        </a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="verClubes.html">
          <i class="fa fa-users" aria-hidden="true"></i>
          <span>Clubes</span>
        </a>
      </li>

    </ul>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

          <!-- Sidebar Toggle (Topbar) -->
          <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
            <i class="fa fa-bars"></i>
          </button>

          <!-- Topbar Navbar -->
          <ul class="navbar-nav ml-auto">

            <div class="topbar-divider d-none d-sm-block"></div>

            <!-- Nav Item - User Information -->
            <li class="nav-item dropdown no-arrow">
              <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small">¡Bienvenido ${usuario.getUsername()}!</span>
                <img class="img-profile rounded-circle" src="${usuario.getFoto()}">
              </a>
              <!-- Dropdown - User Information -->
              <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                <a class="dropdown-item" href="verPerfil.html?usuarioPerfil=${usuario.getUsername()}">
                  <!-- <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>-->
                  <i class="fa fa-id-card" aria-hidden="true"></i>
                  Ver Mi Perfil
                </a>
                <a class="dropdown-item" href="configuracion.html">
                  <!-- <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>-->
                  <i class="fa fa-cog" aria-hidden="true"></i>
                  Configuración
                </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" data-toggle="modal" onclick="dialogCS()">
                  <i class="fa fa-power-off" aria-hidden="true"></i>
                  <!-- <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>-->
                  Cerrar Sesión
                </a>
              </div>
            </li>

          </ul>

        </nav>
        
        <script>
	        function dialogCS(){
		    	bootbox.confirm({ 
	    		  size: "small",
	    		  message: "¿Desea salir del sistema?", 
	    		  callback: function(result){ 
	    			if(result){
	    				window.location.href = "cerrarSesion.do";
	    			}  
	    		  }
	    		})
		    }
        </script>
        <!-- End of Topbar -->
        
        <script>        	
	        var app = angular.module('AppClub', []);
	        app.controller('ClubCtrl', function($scope, $http) {
	        	
	        	$scope.listaMiembros = [];
	        	$scope.checkGet = false;
	        	
	        	$scope.getClubesPertenezco = function (){
	        		$http.get("getUsuariosClub.do?idClub=${club.getIdClub()}")
		       			.then(function(response) {
		       				$scope.listaMiembros = response.data;
		       				$scope.refreshCarrousel();
		       				$scope.checkGet = true;
		       			}, function myError(response) {
		       				$scope.listaMiembros = [];
			       		 	$scope.refreshCarrousel();
			       		 	$scope.checkGet = true;
			       	    }
		       		);
	        	}
	        	
	        	$scope.refreshCarrousel = function(){
					$('#carouselMiembrosClub').carousel({});
					$(document).ready(function(){
						  $('.carousel').each(function(){
						    $(this).find('.carousel-item').eq(0).addClass('active');
						  });
						});
				};
				
				$scope.getClubesPertenezco();
				
				$scope.unirmeClub = function(){
	        		
	        		bootbox.confirm({ 
	  	    		  size: "small",
	  	    		  message: "¿Quiere unirse al club ${club.getNombreClub()}?", 
	  	    		  callback: function(result){ 
	  	    			if(result){
	  	    				window.location.href = "unirmeClub.html?idClub=${club.getIdClub()}&username=${usuario.getUsername()}";
	  	    			}  
	  	    		  }
	  	    		})
	        	}
	        	
	        	$scope.dejarClub = function(){
	        		
	        		bootbox.confirm({ 
	  	    		  size: "small",
	  	    		  message: "¿Quiere dejar el club ${club.getNombreClub()}?", 
	  	    		  callback: function(result){ 
	  	    			if(result){
	  	    				window.location.href = "dejarClub.html?idClub=${club.getIdClub()}&username=${usuario.getUsername()}";
	  	    			}  
	  	    		  }
	  	    		})
	        	
	        	}
	        	
	        	$scope.borrarClub = function(){
	        		
	        		bootbox.confirm({ 
	  	    		  size: "small",
	  	    		  message: "¿Quiere eliminar el club ${club.getNombreClub()}?", 
	  	    		  callback: function(result){ 
	  	    			if(result){
	  	    				window.location.href = "borrarClub.html?idClub=${club.getIdClub()}";
	  	    			}  
	  	    		  }
	  	    		})
	        	}
	        	
	        	$scope.eliminarUsuario = function(usuario){
	        		
	        		bootbox.confirm({ 
	  	    		  size: "small",
	  	    		  message: "¿Esta seguro de eliminar a "+usuario+"?", 
	  	    		  callback: function(result){ 
	  	    			if(result){
	  	    				window.location.href = "eliminarUsuarioClub.html?idClub=${club.getIdClub()}&username="+usuario;
	  	    			}  
	  	    		  }
	  	    		})
	        		
	        		
	        	}
	        	
	        });
        </script>

        <!-- Begin Page Content -->
        <div class="container-fluid" ng-app="AppClub" ng-controller="ClubCtrl">
        	
        	<div class="row">
        		<div class="col-md-1"></div>
        		<div class="col-md-5">
        			<div class="cuadroInfo" align="center" style="width:100%">
        				<br>
        				<i class="fa fa-star fa-5x" aria-hidden="true"></i>
        				<br><br><strong>Nombre del Club:</strong> ${club.getNombreClub()}
	        			<br><strong>Tema del Club:</strong> ${club.getTemaClub()}
	        			<br><strong>Fecha de Creacion:</strong> ${club.getFechaCreacion()}
	        			<br><strong>Creador:</strong> ${club.getAdministrador()} 
	        			<br><br>
        			</div>      			
        		</div>
        		<div class="col-md-5">
        			<div class="cuadroInfo" align="center" style="width:100%">
        				<br><br><br>
        				<p ng-if="${club.isPertenezcoClub()} == false">
        					No pertenece a este Club
        					<br><br>
        					<button class="btn btn-success" ng-click="unirmeClub()" ng-if="${club.isPertenezcoClub()} == false">
				        		<i class="fa fa-sign-in" aria-hidden="true"></i>
	                        	Unirte al Club
	                        </button>
        				</p>
        				<p ng-if="(${club.isPertenezcoClub()} == true) && (${club.isSoyAdministradorClub()} == false)">
        					Pertenece a este club
        					<br><br>
        					<button class="btn btn-danger" ng-click="dejarClub()" ng-if="(${club.isPertenezcoClub()} == true) && (${club.isSoyAdministradorClub()} == false)">
				        		<i class="fa fa-sign-out" aria-hidden="true"></i>
	                        	Dejar Club
	                        </button>
        				</p>
        				<p ng-if="${club.isSoyAdministradorClub()} == true">
        					Pertenece y es creador de este club
        					<br><br>
        					<button class="btn btn-danger" ng-click="borrarClub()" ng-if="${club.isSoyAdministradorClub()} == true">
	                        	<i class="fa fa-times" aria-hidden="true"></i>
	                        	Eliminar Club
	                        </button>
        				</p>
	        			<br><br><br>
	        		</div> 
        		</div>
        		<div class="col-md-1"></div>
        	</div>
        	
        	<div class="row">
        		<div class="col-md-1"></div>
        		<div class="col-md-5" align="center">
        			<br>
        			<h6>Miembros del Club</h6>
        			<br>
        			<div ng-if="${club.isPertenezcoClub()} == true" id="carouselMiembrosClub" class="carousel slide" style="width:300px;height:350px;">
				        <div class="container" style="width:300px;height:350px;">
				            <div class="carousel-inner row w-100 mx-auto" style="width:300px;height:350px;">
								<div class="carousel-item" ng-repeat="eMiembro in listaMiembros">
									<div align="center" style="background:#8EC868;">
							      		<br><br>
							      		<img src="{{eMiembro.foto}}" style="width:100px;height:auto;">
							      		<br>
							      		<br>
							      		<p><strong><a ng-href="verPerfil.html?usuarioPerfil={{eMiembro.username}}" style="color:#244B36;">{{eMiembro.username}}</a></strong></p>
							      		<br>
							      		<br>
							      		<br>
							      		<br>
							      	</div>
					      		</div>
					      	</div>
			            </div>
				        <a class="carousel-control-prev" href="#carouselMiembrosClub" role="button" data-slide="prev">
					      <i class="fa fa-arrow-circle-left" aria-hidden="true"></i>
					      <span class="sr-only">Anterior</span>
					    </a>
					    <a class="carousel-control-next" href="#carouselMiembrosClub" role="button" data-slide="next">
					      <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>
					      <span class="sr-only">Siguiente</span>
					    </a>
				    </div>
				    <div ng-if="${club.isPertenezcoClub()} == false">
				        <p>
				        	No puede ver los miembros del club, ya que no forma parte del mismo
				        </p>
				    </div>
				</div>
       		</div>
        		<div class="col-md-5">
        			
        		</div>
        		<div class="col-md-1"></div>
        	</div>
        	        	
        	<script>
		   		if("${usuario.getRol()}" === 'Administrador'){
		   			document.getElementById("adminSidebarDivider").style.display="block";
		   			document.getElementById("adminSidebarTitle").style.display="block";
		   			document.getElementById("adminSidebar").style.display="block";
		   		}
		   	</script>
        	
        </div>
        <!-- /.container-fluid -->
        
           

      </div>
      <!-- End of Main Content -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fa fa-angle-up"></i>
  </a>

  <!-- Custom scripts for all pages-->
  <script src="resources/js/sb/sb-admin-2.min.js"></script>

  <!-- Page level plugins -->
  <script src="vendor/chart.js/Chart.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="resources/js/sb/chart-area-demo.js"></script>
  <script src="resources/js/sb/chart-pie-demo.js"></script>
  
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