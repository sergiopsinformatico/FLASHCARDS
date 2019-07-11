<!DOCTYPE html>
<html lang="es">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Flashcards - Gente</title>

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
      <li class="nav-item active">
        <a class="nav-link" href="verGente.html">
          <i class="fa fa-user-circle-o" aria-hidden="true"></i>
          <span>Gente</span>
        </a>
      </li>
      <li class="nav-item">
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
	        var app = angular.module('AppGente', []);
	        app.controller('GenteCtrl', function($scope, $http) {
	        	$scope.listaUsuariosActual = [];
	        	
	        	$scope.listaTodosUsuarios = [];
	        	$scope.listaAmigos = [];
	        	$scope.listaPdaEnv = [];
	        	$scope.listaPdaRec = [];
	        	$scope.listaBloq = [];
	        	
	        	$scope.checkGet = false;
	        	var indice = 0;
	        	var user;
	        	
	        	$scope.value = 'all';
	        	
	        	$scope.getTodosUsuarios = function (){
	        		$http.get("getTodosUsuarios.do")
		       			.then(function(response) {
		       				$scope.listaTodosUsuarios = response.data;
		       				$scope.getAmigos();
		       		  	}, function myError(response) {
		       		  		$scope.listaTodosUsuarios = [];
			       		 	$scope.getAmigos();
			       	    }
		       		);
	        	}
	        	
	        	$scope.getAmigos = function (){
	        		$http.get("getAmigos.do")
		       			.then(function(response) {
		       				$scope.listaAmigos = response.data;
		       				$scope.getPdARec();
		       		  	}, function myError(response) {
		       		  		$scope.listaAmigos = [];
		       		  		$scope.getPdARec();
			       	    }
		       		);
	        	}
	        	
	        	$scope.getPdARec = function (){
	        		$http.get("getPdaRec.do")
		       			.then(function(response) {
		       				$scope.listaPdaRec = response.data;
		       				$scope.getPdAEnv();
		       		  	}, function myError(response) {
		       		  		$scope.listaPdaRec = [];
		       		  		$scope.getPdAEnv();
			       	    }
		       		);
	        	}
	        	
	        	$scope.getPdAEnv = function (){
	        		$http.get("getPdaEnv.do")
		       			.then(function(response) {
		       				$scope.listaPdaEnv = response.data;
		       				$scope.getBloqueados();
		       		  	}, function myError(response) {
		       		  		$scope.listaPdaEnv = [];
		       		  		$scope.getBloqueados();
			       	    }
		       		);
	        	}
	        	
	        	$scope.getBloqueados = function (){
	        		$http.get("getBloqueados.do")
		       			.then(function(response) {
		       				$scope.listaBloq = response.data;
		       				$scope.listaUsuariosActual = $scope.listaTodosUsuarios;
		       				$scope.value = 'all';
		       				$scope.refreshCarrousel();
		       				$scope.checkGet = true;
		       			}, function myError(response) {
		       				$scope.listaBloq = [];
		       				$scope.listaUsuariosActual = $scope.listaTodosUsuarios;
		       				$scope.value = 'all';
			       		 	$scope.refreshCarrousel();
			       		 	$scope.checkGet = true;
			       	    }
		       		);
	        	}
	        	
	        	$scope.refreshCarrousel = function(){
					$('#carouselUsuarios').carousel({});
					$(document).ready(function(){
						  $('.carousel').each(function(){
						    $(this).find('.carousel-item').eq(0).addClass('active');
						  });
						});
				};
				
				$scope.cambioButton = function(value){
					if(value == "all"){
						$scope.listaUsuariosActual = $scope.listaTodosUsuarios;
						$scope.refreshCarrousel();
					}else if(value == "amigos"){
						$scope.listaUsuariosActual = $scope.listaAmigos;
						$scope.refreshCarrousel();
					}else if(value == "pdaEnv"){
						$scope.listaUsuariosActual = $scope.listaPdaEnv;
						$scope.refreshCarrousel();
					}else if(value == "pdaRec"){
						$scope.listaUsuariosActual = $scope.listaPdaRec;
						$scope.refreshCarrousel();
					}else if(value == "bloq"){
						$scope.listaUsuariosActual = $scope.listaBloq;
						$scope.refreshCarrousel();
					}
				}
				
				$scope.eliminarAmigo = function(amigo){
	        		
	        		bootbox.confirm({ 
	  	    		  size: "small",
	  	    		  message: "¿Quiere eliminar a tu amigo "+amigo+"?", 
	  	    		  callback: function(result){ 
	  	    			if(result){
	  	    				window.location.href = "eliminarAmigo.html?username="+amigo;
	  	    			}  
	  	    		  }
	  	    		})
	        	}
	        	
	        	
	        	$scope.aceptarAmistad = function(pdA){
	        		
	        		bootbox.confirm({ 
	  	    		  size: "small",
	  	    		  message: "¿Aceptas la petición de amistad de "+pdA+"?", 
	  	    		  callback: function(result){ 
	  	    			if(result){
	  	    				window.location.href = "aceptarAmistad.html?username="+pdA;
	  	    			}  
	  	    		  }
	  	    		})
	        	}
	        	
				$scope.rechazarAmistad = function(pdA){
	        		
	        		bootbox.confirm({ 
	  	    		  size: "small",
	  	    		  message: "¿Rechazas la peticion de "+pdA+"?", 
	  	    		  callback: function(result){ 
	  	    			if(result){
	  	    				window.location.href = "rechazarAmistad.html?username="+pdA;
	  	    			}  
	  	    		  }
	  	    		})
	        	}
				
				$scope.enviarPeticion = function(usuario){
	        		
	        		bootbox.confirm({ 
	  	    		  size: "small",
	  	    		  message: "¿Quiere enviar una petición de amistad a "+usuario+"?", 
	  	    		  callback: function(result){ 
	  	    			if(result){
	  	    				window.location.href = "enviarPeticion.html?username="+usuario;
	  	    			}  
	  	    		  }
	  	    		})
	        	}
				
				$scope.bloquearUsuario = function(usuario){
	        		
	        		bootbox.confirm({ 
	  	    		  size: "small",
	  	    		  message: "¿Quiere bloquear a "+usuario+"?", 
	  	    		  callback: function(result){ 
	  	    			if(result){
	  	    				window.location.href = "bloquearUsuario.html?username="+usuario;
	  	    			}  
	  	    		  }
	  	    		})
	        	}
				
				$scope.desbloquearUsuario = function(usuario){
	        		
	        		bootbox.confirm({ 
	  	    		  size: "small",
	  	    		  message: "¿Quiere desbloquear a "+usuario+"?", 
	  	    		  callback: function(result){ 
	  	    			if(result){
	  	    				window.location.href = "desbloquearUsuario.html?username="+usuario;
	  	    			}  
	  	    		  }
	  	    		})
	        	}
				
				$scope.getTodosUsuarios();
	        	
	        });
        </script>
        
        <div class="container-fluid" ng-app="AppGente" ng-controller="GenteCtrl">
        	<div class="row">
        		<div class="col-md-1" style="width:100%"></div>
        		<div class="col-md-10" style="width:100%">
		        	<div class="row" style="width:100%">
			            <div ng-if="!checkGet" style="width:100%">
			            	<h6 align="center">Cargando usuarios...</h6>
			            </div>
			            
			            <div ng-if="checkGet" style="width:100%">
			            
			            	<div class="row">
			            	
			            		<div class="col-md-5" align="left">
				            		<input type="radio" id="allRadio" name="selectClubes" ng-model="value" ng-change="cambioButton(value)" value="all">
				            		<label for="allRadio">Todos los Usuarios</label>
				            		<br>
				            		<input type="radio" id="amigosRadio" name="selectClubes" ng-model="value" ng-change="cambioButton(value)" value="amigos">
				            		<label for="amigosRadio">Amigos</label>
				            		<br>
				            		<input type="radio" id="pdaEnvRadio" name="selectClubes" ng-model="value" ng-change="cambioButton(value)" value="pdaEnv">
				            		<label for="pdaEnvRadio">Peticiones de Amistad Enviadas</label>
				            		<br>
				            		<input type="radio" id="pdaRecRadio" name="selectClubes" ng-model="value" ng-change="cambioButton(value)" value="pdaRec">
				            		<label for="pdaRecRadio">Peticiones de Amistad Recibidas</label>
				            		<br>
				            		<input type="radio" id="bloqRadio" name="selectClubes" ng-model="value" ng-change="cambioButton(value)" value="bloq">
				            		<label for="bloqRadio">Usuarios Bloqueados</label>
				            		<br>
				            	</div>
				            	
				            	<div class="col-md-7">
				            		<div ng-if="listaUsuariosActual.length == 0" style="width:100%" align="center">
						            	<h6 ng-if="value == 'all'" align="center">Tu eres el unico usuario del sistema</h6>
						            	<h6 ng-if="value == 'amigos'" align="center">Aun no tienes amigos. ¡Conoce a nuevas personas!</h6>
						            	<h6 ng-if="value == 'pdaEnv'" align="center">Las peticiones de amistad enviadas fueron respondidas</h6>
						            	<h6 ng-if="value == 'pdaRec'" align="center">No tienes pendientes peticiones de amistad por responder</h6>
						            	<h6 ng-if="value == 'bloq'" align="center">No tienes a ningún usuario bloqueado</h6>
						            </div>
						            <div ng-if="listaUsuariosActual.length > 0" style="width:100%" align="center">
						            	<div class="input-group">
							            	<input type="text" ng-model="filterUsuarios" ng-change="refreshCarrousel()" class="form-control" placeholder="Filtrar por nombre de usuario" />
							            </div>
							            <br>
					            		<div id="carouselUsuarios" class="carousel slide" style="width:400px;height:500px;">
									        <div class="container" style="width:400px;height:500px;">
									            <div class="carousel-inner row w-100 mx-auto" style="width:400px;height:500px;">
													<div class="carousel-item" ng-repeat="eUsuario in listaUsuariosActual | filter:filterUsuarios">
											            <div class="flip-card-container" style="width:400px;height:500px;text-align:center;">
															<div class="flip-card">
														    	<div class="flip-card-front" style="background:#64FFAC;">
														        	<br><br><br><br>
											                    	<img src="{{eUsuario.foto}}" style="width:100px;height:auto;">
														      		<br>
														      		<br>
														      		<p style="color:black;"><strong>{{eUsuario.username}}</strong></p>
											                    	<br><br>
											                        <br><br><br>
											                        <p ng-if="eUsuario.tipoRelacion == 'amigo'" style="color:black;">
											                        	Sois amigos
											                        </p>
											                        <p ng-if="eUsuario.tipoRelacion == 'solEnviada'" style="color:black;">
											                        	Solicitud de amistad enviada
											                        </p>
											                        <p ng-if="eUsuario.tipoRelacion == 'solRecibida'" style="color:black;">
											                        	Pendiente de contestar la solicitud
											                        </p>
											                        <p ng-if="eUsuario.tipoRelacion == 'bloqueado'" style="color:black;">
											                        	Usuario Bloqueado
											                        </p>
																</div>
														 		<div class="flip-card-back" style="background:#B1FFE8s;">
														 			<br><br><br>
														 			<p><strong><a ng-href="verPerfil.html?usuarioPerfil={{eUsuario.username}}" style="color:#244B36;">Ver Perfil</a></strong></p>
											                    	<br><br>
														 			<div ng-if="eUsuario.tipoRelacion == 'ninguna'">
											                        	<button class="btn btn-info" ng-click="enviarPeticion(eUsuario.username)">
											                        		<i class="fa fa-user-o" aria-hidden="true"></i>
											                        		Enviar Solicitud de Amistad
											                        	</button>
											                        	<br><br><br><br>
											                        	<button class="btn btn-secondary" ng-click="bloquearUsuario(eUsuario.username)">
											                        		<i class="fa fa-user-o" aria-hidden="true"></i>
											                        		Bloquear Usuario
											                        	</button>
											                        </div>
											                        <div ng-if="eUsuario.tipoRelacion == 'amigo'">
											                        	<button class="btn btn-danger" ng-click="eliminar(eUsuario.username)">
											                        		<i class="fa fa-user-o" aria-hidden="true"></i>
											                        		Eliminar Amistad
											                        	</button>
											                        	<br><br><br><br>
											                        	<button class="btn btn-secondary" ng-click="bloquearUsuario(eUsuario.username)">
											                        		<i class="fa fa-user-o" aria-hidden="true"></i>
											                        		Bloquear Usuario
											                        	</button>
											                        </div>
											                        <div ng-if="eUsuario.tipoRelacion == 'solEnviada'">
											                        	<button class="btn btn-secondary" ng-click="bloquearUsuario(eUsuario.username)">
											                        		<i class="fa fa-user-o" aria-hidden="true"></i>
											                        		Bloquear Usuario
											                        	</button>
											                        </div>
											                        <div ng-if="eUsuario.tipoRelacion == 'solRecibida'">
											                        	<button class="btn btn-success" ng-click="aceptarAmistad(eUsuario.username)">
											                        		<i class="fa fa-user-o" aria-hidden="true"></i>
											                        		Aceptar Peticion de Amistad
											                        	</button>
											                        	<br><br><br><br>
											                        	<button class="btn btn-danger" ng-click="rechazarAmistad(eUsuario.username)">
											                        		<i class="fa fa-user-o" aria-hidden="true"></i>
											                        		Rechazar Peticion de Amistad
											                        	</button>
											                        	<br><br><br><br>
											                        	<button class="btn btn-secondary" ng-click="bloquearUsuario(eUsuario.username)">
											                        		<i class="fa fa-user-o" aria-hidden="true"></i>
											                        		Bloquear Usuario
											                        	</button>
											                        </div>
											                        <div ng-if="eUsuario.tipoRelacion == 'bloqueado'">
											                        	<button class="btn btn-warning" ng-click="desbloquearUsuario(eUsuario.username)">
											                        		<i class="fa fa-user-o" aria-hidden="true"></i>
											                        		Desloquear Usuario
											                        	</button>
											                        </div>
															    </div>
														    </div>
														</div>					
									                </div>
									            </div>
										        <a class="carousel-control-prev" href="#carouselUsuarios" role="button" data-slide="prev">
											      <i class="fa fa-arrow-circle-left" aria-hidden="true"></i>
											      <span class="sr-only">Anterior</span>
											    </a>
											    <a class="carousel-control-next" href="#carouselUsuarios" role="button" data-slide="next">
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