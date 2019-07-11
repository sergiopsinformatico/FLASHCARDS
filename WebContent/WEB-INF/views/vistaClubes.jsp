<!DOCTYPE html>
<html lang="es">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Flashcards - Clubes</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
  <link href="resources/css/comunes.css" rel="stylesheet">
  <link href="resources/css/cardFlip.css" rel="stylesheet">
  
  <!-- Bootstrap core CSS -->
  <link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  
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

        <!-- Begin Page Content -->
        
        <script>        	
	        var app = angular.module('AppClubes', []);
	        app.controller('ClubesCtrl', function($scope, $http) {
	        	$scope.listaClubesActual = [];
	        	
	        	$scope.listaTodosClubes = [];
	        	$scope.listaClubesCreados = [];
	        	$scope.listaClubesPertenezco = [];
	        	
	        	$scope.checkGet = false;
	        	var indice = 0;
	        	var user;
	        	var posicionTarjeta = 0;
	        	
	        	$scope.value = 'all';
	        	
	        	$scope.enableFormClub = function(){
	        		document.getElementById('divAddClub').style.display='block';
	        	}
	        	
	        	$scope.getTodosClubes = function (){
	        		$http.get("getTodosClubes.do")
		       			.then(function(response) {
		       				$scope.listaTodosClubes = response.data;
		       				$scope.getClubesCreados();
		       		  	}, function myError(response) {
			       		  	$scope.listaTodosClubes = [];
			       		 	$scope.getClubesCreados();
			       	    }
		       		);
	        	}
	        	
	        	$scope.getClubesCreados = function (){
	        		$http.get("getClubesCreados.do")
		       			.then(function(response) {
		       				$scope.listaClubesCreados = response.data;
		       				$scope.getClubesPertenezco();
		       		  	}, function myError(response) {
			       		  	$scope.listaClubesCreados = [];
			       		 	$scope.getClubesPertenezco();
			       	    }
		       		);
	        	}
	        	
	        	$scope.getClubesPertenezco = function (){
	        		$http.get("getClubesPertenezco.do")
		       			.then(function(response) {
		       				$scope.listaClubesPertenezco = response.data;
		       				$scope.listaClubesActual = $scope.listaTodosClubes;
		       				$scope.refreshCarrousel();
		       				$scope.checkGet = true;
		       			}, function myError(response) {
			       		  	$scope.listaClubesPertenezco = [];
			       		 	$scope.listaClubesActual = $scope.listaTodosClubes;
			       		 	$scope.refreshCarrousel();
			       		 	$scope.checkGet = true;
			       	    }
		       		);
	        	}
	        	
	        	$scope.refreshCarrousel = function(){
					$('#carouselClubes').carousel({});
					$(document).ready(function(){
						  $('.carousel').each(function(){
						    $(this).find('.carousel-item').eq(0).addClass('active');
						  });
						});
				};
				
				$scope.cambioButton = function(value){
					if(value == "all"){
						$scope.listaClubesActual = $scope.listaTodosClubes;
						$scope.refreshCarrousel();
					}else if(value == "creadas"){
						$scope.listaClubesActual = $scope.listaClubesCreados;
						$scope.refreshCarrousel();
					}else if(value == "estoy"){
						$scope.listaClubesActual = $scope.listaClubesPertenezco;
						$scope.refreshCarrousel();
					}
				}
	        	
	        	$scope.getTodosClubes();
	        	
	        	$scope.unirmeClub = function(idClub, nameClub){
	        		
	        		bootbox.confirm({ 
	  	    		  size: "small",
	  	    		  message: "¿Quiere unirse al club "+nameClub+"?", 
	  	    		  callback: function(result){ 
	  	    			if(result){
	  	    				window.location.href = "unirmeClub.html?idClub="+idClub+"&username=${usuario.getUsername()}";
	  	    			}  
	  	    		  }
	  	    		})
	        	}
	        	
	        	$scope.dejarClub = function(idClub, nameClub){
	        		
	        		bootbox.confirm({ 
	  	    		  size: "small",
	  	    		  message: "¿Quiere dejar el club "+nameClub+"?", 
	  	    		  callback: function(result){ 
	  	    			if(result){
	  	    				window.location.href = "dejarClub.html?idClub="+idClub+"&username=${usuario.getUsername()}";
	  	    			}  
	  	    		  }
	  	    		})
	        	
	        	}
	        	
	        	$scope.borrarClub = function(idClub, nameClub){
	        		
	        		bootbox.confirm({ 
	  	    		  size: "small",
	  	    		  message: "¿Quiere eliminar el club "+nameClub+"?", 
	  	    		  callback: function(result){ 
	  	    			if(result){
	  	    				window.location.href = "borrarClub.html?idClub="+idClub;
	  	    			}  
	  	    		  }
	  	    		})
	        	}
	        });
        </script>
        
        <div class="container-fluid" ng-app="AppClubes" ng-controller="ClubesCtrl">
        	<div class="row">
        		<div class="col-md-1" style="width:100%"></div>
        		<div class="col-md-7" style="width:100%">
		        	<div class="row" style="width:100%">
			            <div ng-if="!checkGet" style="width:100%">
			            	<h6 align="center">Cargando clubes...</h6>
			            </div>
			            
			            <div ng-if="checkGet" style="width:100%">
			            
			            	<div class="row">
			            	
			            		<div class="col-md-5" align="left">
				            		<input type="radio" id="allRadio" name="selectClubes" ng-model="value" ng-change="cambioButton(value)" value="all">
				            		<label for="allRadio">Todos los Clubes</label>
				            		<br>
				            		<input type="radio" id="creadasRadio" name="selectClubes" ng-model="value" ng-change="cambioButton(value)" value="creadas">
				            		<label for="creadasRadio">Clubes que he creado</label>
				            		<br>
				            		<input type="radio" id="estoyRadio" name="selectClubes" ng-model="value" ng-change="cambioButton(value)" value="estoy">
				            		<label for="estoyRadio">Clubes a los que pertenezco</label>
				            		<br>
				            	</div>
				            	
				            	<div class="col-md-7">
				            		<div ng-if="listaClubesActual.length == 0" style="width:100%" align="center">
						            	<h6 ng-if="value == 'all'" align="center">No existen clubs. ¡Anímate y se el primero!</h6>
						            	<h6 ng-if="value == 'creadas'" align="center">Aun no has creado clubes. ¡Crea uno ahora!</h6>
						            	<h6 ng-if="value == 'estoy'" align="center">Aun no perteneces a un club. ¡Unete a alguno!</h6>
						            </div>
						            <div ng-if="listaClubesActual.length > 0" style="width:100%" align="center">
						            	<div class="input-group">
							            	<input type="text" ng-model="filterClubes" ng-change="refreshCarrousel()" class="form-control" placeholder="Filtrar por nombre del club" />
							            </div>
							            <br>
					            		<div id="carouselClubes" class="carousel slide" style="width:400px;height:500px;">
									        <div class="container" style="width:400px;height:500px;">
									            <div class="carousel-inner row w-100 mx-auto" style="width:400px;height:500px;">
													<div class="carousel-item" ng-repeat="eClub in listaClubesActual | filter:filterClubes">
											            <div class="flip-card-container" style="width:400px;height:500px;text-align:center;">
															<div class="flip-card">
														    	<div class="flip-card-front" style="background:#C5BC00;">
														        	<br><br><br><br>
											                    	<i class="fa fa-star fa-5x" aria-hidden="true"></i>
											                    	<br><br>
											                        <p><strong>{{eClub.nombreClub}}</strong></p>
											                        <p><strong>Tema:</strong> {{eClub.temaClub}}</p>
											                        <br><br><br>
											                        <p ng-if="eClub.pertenezcoClub == false">
											                        	No perteneces a este club
											                        </p>
											                        <p ng-if="eClub.pertenezcoClub == true">
											                        	Perteneces a este club
											                        </p>
											                        <p ng-if="eClub.soyAdministradorClub == true">
											                        	Creaste este club
											                        </p>
																</div>
														 		<div class="flip-card-back" style="background:#FF8439;">
														 			<br><br><br><br><br><br>
														 			<a ng-href="verClub.html?idClub={{eClub.idClub}}" style="color:yellow;">
														 				Entrar
														 			</a>
														 			<br><br>
													        		<button class="btn btn-success" ng-click="unirmeClub(eClub.idClub, eClub.nombreClub)" ng-if="eClub.pertenezcoClub == false">
														        		<i class="fa fa-sign-in" aria-hidden="true"></i>
											                        	Unirte al Club
											                        </button>
													        		<button class="btn btn-danger" ng-click="dejarClub(eClub.idClub, eClub.nombreClub)" ng-if="eClub.pertenezcoClub == true && eClub.soyAdministradorClub == false">
														        		<i class="fa fa-sign-out" aria-hidden="true"></i>
											                        	Dejar Club
											                        </button>
													        		<button class="btn btn-danger" ng-click="borrarClub(eClub.idClub, eClub.nombreClub)" ng-if="eClub.soyAdministradorClub == true">
											                        	<i class="fa fa-times" aria-hidden="true"></i>
											                        	Eliminar Club
											                        </button>
															    </div>
														    </div>
														</div>					
									                </div>
									            </div>
										        <a class="carousel-control-prev" href="#carouselClubes" role="button" data-slide="prev">
											      <i class="fa fa-arrow-circle-left" aria-hidden="true"></i>
											      <span class="sr-only">Anterior</span>
											    </a>
											    <a class="carousel-control-next" href="#carouselClubes" role="button" data-slide="next">
											      <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>
											      <span class="sr-only">Siguiente</span>
											    </a>
										    </div>
										</div>
									</div>
				            	</div>
			            	
			            	</div>
			            
			            </div>
			        </div>
		        </div>
		        <div class="col-md-3" style="width:100%">
		        	<div class="row" style="width:100%">
        				<form ng-submit="enableFormClub()" style="width:100%;height:50px;">
        					<button type="submit" class="btn btn-info" style="width:100%;height:50px;">
        						<i class="fa fa-plus" aria-hidden="true"></i>
        						Nuevo Club
        					</button>
        				</form>
        			</div>
        			<div class="row">
        				<br><br><br>
        			</div>
        			<div class="row" id="divAddClub" style="display:none; background-color: #9ED5B0;">
        				<div class="col-md-12" align="center">
        					<form action="crearClub.html" method="post" align="center">
        						<br>
	        					<input type="text" style="width:100%;" id="nombre" name="nombre" placeholder="Nombre del Club"/>
	        					<br><br>
	        					<input type="text" style="width:100%;" id="tema" name="tema" placeholder="Tema del Club"/>
	        					<br><br><br>
	        					<button type="submit" class="btn btn-success middle">
	        						Crear Club
	        					</button>
	        					<br><br>
	        				</form>
        				</div>
        			</div>
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