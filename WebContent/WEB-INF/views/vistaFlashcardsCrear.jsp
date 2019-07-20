<!DOCTYPE html>
<html lang="es">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Flashcards - Flashcards</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
  <link href="resources/css/comunes.css" rel="stylesheet">
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
      <div class="sidebar-heading">
        Flashcards
      </div>
      <li class="nav-item active">
        <a class="nav-link" href="flashcards.html">
          <i class="fa fa-id-card-o" aria-hidden="true"></i>
          <span>Panel Flashcards</span></a>
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
        <div class="container-fluid" ng-app="AppCreaFlashcards" ng-controller="CreaFlashcardsCtrl">
        	<div class="row">
        		<div class="col-md-1"></div>
        		<div class="col-md-10">
        			<div class="row">
        				<div class="col-md-6">
        					<div class="row">
        						<div class="col-md-6">
        							<h6 align="left" style="color:black;font-weight: bold;">Crea una tarjeta</h6>
        							<br><br>
        							<input type="text" style="width:100%" ng-model="anverso" id="anversoInput" name="anversoInput" placeholder="Anverso de la Tarjeta"/>
        							<br>
        							<br>
        							<input type="text" style="width:100%" ng-model="reverso" id="reversoInput" name="reversoInput" placeholder="Reverso de la Tarjeta"/>
        							<br>
        							<br>
        							<br>
        							<br>
        							<button class="btn" style="color:black;background:#81FF88;" ng-click="insertarTarjeta()">
        								<i class="fa fa-plus-circle" aria-hidden="true"></i> Insertar Tarjeta
        							</button>
        						</div>
        						<div class="col-md-1"></div>
        						<div class="col-md-5">
        							<div class="flip-card-container" style="width:200px;height:300px;text-align:center;">
										<div class="flip-card">
									    	<div class="flip-card-front" style="color:black;background:#FFFFAE;">
									        	<br><br><br>{{anverso}}
											</div>
									 		<div class="flip-card-back" style="color:black;background:#D3D3D3;">
									 			<br><br><br>{{reverso}}
										    </div>
									    </div>
									</div>
        						</div>
	        				</div>
        				</div>
        				<div class="col-md-6" align="center">
        					<h6 align="center" style="color:black;font-weight: bold;">Colección de Tarjetas</h6>
        					<br><br>
        					<div ng-if="listaFlashcards.length == 0">
        						Todavía no se han insertado ninguna tarjeta a la colección
        					</div>
        					<div ng-if="listaFlashcards.length > 0">
        						<div id="carouselCrearFlashcards" class="carousel slide" style="width:300px;height:375px;">
							        <div class="container" style="width:300px;height:375px;">
							            <div class="carousel-inner row w-100 mx-auto" style="width:300px;height:375px;">
											<div class="carousel-item" ng-repeat="eTarjeta in listaFlashcards">
									            <div class="flip-card-container" style="width:300px;height:375px;text-align:center;">
													<div class="flip-card">
												    	<div class="flip-card-front" style="background:#BCCAFF;">
												        	<br><br><br>
												        	{{eTarjeta.anverso}}
														</div>
												 		<div class="flip-card-back" style="background:#FF3939;">
												 			<br><br><br>
												 			{{eTarjeta.reverso}}
												 			<br><br>
											        		<button class="btn" ng-click="eliminarTarjeta(eTarjeta, $index)" style="background:#D8D8D8;">
									                        	<i class="fa fa-times" aria-hidden="true"></i>
									                        	Eliminar Tarjeta
									                        </button>
													    </div>
												    </div>
												</div>					
							                </div>
							            </div>
								        <a class="carousel-control-prev" href="#carouselCrearFlashcards" role="button" data-slide="prev">
									      <i class="fa fa-arrow-circle-left" aria-hidden="true"></i>
									      <span class="sr-only">Anterior</span>
									    </a>
									    <a class="carousel-control-next" href="#carouselCrearFlashcards" role="button" data-slide="next">
									      <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>
									      <span class="sr-only">Siguiente</span>
									    </a>
								    </div>
								</div>
        					</div>
        				</div>
        			</div>
        		</div>
        		<div class="col-md-1"></div>
        	</div>
        	<div class="row">
        		<br><br>
        	</div>
	        <form action="guardarColeccionFlashcards.html" method="post">
	        	<div class="row">
	        		<div class="col-md-1"></div>
	        		<div class="col-md-11">
	        			<h6 align="left" style="color:black;font-weight: bold;">Datos de la Colección</h6>
	        			<br>
	        		</div>
	        	</div>
	        	<div class="row">
	        		<div class="col-md-1"></div>
	        		<div class="col-md-10">
	        			<div class="row">
	        				<div class="col-md-6" style="width:100%">
	        					<input type="text" style="width:100%" id="nombreColeccion" name="nombreColeccion" placeholder="Nombre de la Coleccion de Flashcards" style="width:100%" required />
	        					<br>
	        					<br>
	        					<input type="text" style="width:100%" id="temaColeccion" name="temaColeccion" placeholder="Tema de la Coleccion" style="width:100%" required />
	        				</div>
	        				<div class="col-md-6" align="right" style="width:75%">
	        					<p ng-if="(cargadosClubes == false) || (cargadosAmigos == false)">
	        						Cargando...
	        					</p>
	        					
	        					
	        					<div ng-if="(cargadosClubes == true) && (cargadosAmigos == true)">
		        					<label for="tipoCompartir" align="right" style="color:black;font-weight: bold;">Modo de Compartir la Coleccion</label>
		        					<br>
		        					<select id="tipoCompartir" name="tipoCompartir" ng-model="valueCompartir" 
		        									ng-change="changeSelect(valueCompartir)" align="right" style="width:50%">
									  <option value="publico">Publico</option>
									  <option value="privado">Privado</option>
									  <option value="club">Club</option>
									  <option value="usuario">Usuario</option>
									</select>
									<br>
									<br>
									<div id="showTableClubes" style="display: none;">
										<br>
							            <table width="75%" height="2px" border="1">  
										   <tr>  
										      <th align="center" style="text-align:center;">Clubes</th>    
										   </tr>
										   <tr ng-repeat = "eClub in listaActual">  
										      <td>
										      	<input type="radio" id="compartirCon" name="compartirCon" ng-model="valueCompartirCon" ng-change="changeSelectCC(valueCompartirCon)"
										      	value="{{eClub.idClub}}">{{eClub.nombreClub}}
										      </td>    
										   </tr>
										</table>
									</div>
									
									<p id="notClubes" style="display: none;">
		        						Ups! Aún no pertenece a ningún club
		        					</p>
									
									<div id="showTableAmigos" style="display: none;">
										<br>
							            <table width="75%" height="2px" border="1">  
										   <tr>  
										      <th align="center" style="text-align:center;">Amigos</th>    
										   </tr>
										   <tr ng-repeat = "eUsuario in listaActual">  
										      <td>
										      	<input type="radio" id="compartirCon" name="compartirCon" ng-model="valueCompartirCon" ng-change="changeSelectCC(valueCompartirCon)"
										      	value="{{eUsuario}}">{{eUsuario}}
										      </td>    
										   </tr>
										</table>
									</div>
									
									<p id="notAmigos" style="display: none;">
		        						Ups! No tiene amigos con quien compartir una colección
		        					</p>
		        					
								</div>
	        				</div>
	        			</div>
	        		</div>
	        		<div class="col-md-1"></div>
	        	</div>
	        	<div class="row">
	        		<div class="col-md-1"></div>
	        		<div class="col-md-10" align="center">
	        			<br><br><br>
	        			<button type="submit" class="btn btn-success" ng-disabled="activarBoton == false">
	        				<i class="fa fa-floppy-o" aria-hidden="true"></i>
	        				Guardar Colección
	        			</button>
	        			<br><br><br>
	        		</div>
	        		<div class="col-md-1"></div>
	        	</div>
        	</form>
        	<script>
        		if("${usuario.getRol()}" === 'Administrador'){
        			document.getElementById("adminSidebarDivider").style.display="block";
        			document.getElementById("adminSidebarTitle").style.display="block";
        			document.getElementById("adminSidebar").style.display="block";
        		}
        	</script>        	
        </div>
        
        <script>
			'use strict'
		    var app = angular.module('AppCreaFlashcards', []);
		    app.controller('CreaFlashcardsCtrl', function($scope, $http) {
		    	
		    	$scope.valueCompartir = 'publico';
		    	$scope.valueCompartirCon = '';
		    	
		    	$scope.cargadosClubes = false;
		    	$scope.cargadosAmigos = false;
		    	
		    	$scope.listaActual = [];
		    	$scope.listaClubes = [];
		    	$scope.listaAmigos = [];
		    	
		    	$scope.listaFlashcards = [];
		    	$scope.anverso = '';
		    	$scope.reverso = '';
		    	
		    	$scope.activarBoton = false;
		    	$scope.checkCompartirCon = false;
		    	$scope.checkCards = false;
		    	
		    	$http({
	    	        method: 'GET',
	    	        url: 'getClubesFlashcards.html',
	                headers : {
	                	'Accept': 'application/json'
	                }
	    	    }).then(function mySuccess(response) {
	    	    	$scope.listaClubes = response.data;
	    	    	$scope.cargadosClubes = true;
	    	    }, function myError(response) {
	    	    	$scope.listaClubes = [];
	    	    	$scope.cargadosClubes = true;
	    	    });
		    	
		    	$http({
	    	        method: 'GET',
	    	        url: 'getAmigosFlashcards.html',
	                headers : {
	                	'Accept': 'application/json'
	                }
	    	    }).then(function mySuccess(response) {
	    	    	$scope.listaAmigos = response.data;
	    	    	$scope.cargadosAmigos = true;
	    	    }, function myError(response) {
	    	    	$scope.listaAmigos = [];
	    	    	$scope.cargadosAmigos = true;
	    	    });
		    	
		    	$scope.changeSelect = function(value){
		    		
		    		document.getElementById("showTableClubes").style.display = 'none';
		    		document.getElementById("showTableAmigos").style.display = 'none';
		    		document.getElementById("notClubes").style.display = 'none';
		    		document.getElementById("notAmigos").style.display = 'none';
		    		
	    			$scope.listaActual = [];
	    			
		    		if(value == "club"){
		    			$scope.listaActual = $scope.listaClubes;
		    			
		    			if($scope.listaActual.length > 0){
		    				$scope.valueCompartirCon = $scope.listaActual[0].idClub;
		    				document.getElementById("showTableClubes").style.display = 'block';
		    			}else{
		    				$scope.valueCompartirCon = '';
		    				document.getElementById("notClubes").style.display = 'block';
		    			}
		    			
		    		}else if(value == "usuario"){
		    			$scope.listaActual = $scope.listaAmigos;
		    			
		    			if($scope.listaActual.length > 0){
		    				$scope.valueCompartirCon = $scope.listaActual[0];
		    				document.getElementById("showTableAmigos").style.display = 'block';
		    			}else{
		    				$scope.valueCompartirCon = '';
		    				document.getElementById("notAmigos").style.display = 'block';
		    			}
		    			
		    		}
		    		
		    		$scope.habilitarBoton();
		    	}
		    	
		    	$scope.habilitarBoton = function(){
		    		$scope.activarBoton = false;
		    		
		    		$scope.checkCards = false;
			    	$scope.checkCompartirCon = false;
			    	
			    	if($scope.listaFlashcards.length > 0){
			    		$scope.checkCards = true;
			    	}else{
			    		$scope.checkCards = false;
			    	}
			    	
			    	if(($scope.valueCompartir == 'publico') || ($scope.valueCompartir == 'privado')){
			    		
			    		$scope.checkCompartirCon = true;
			    		
			    	}else if(($scope.valueCompartir == 'club') && ($scope.valueCompartirCon != '')){
			    		
			    		$scope.checkCompartirCon = true;
			    		
			    	}else if(($scope.valueCompartir == 'usuario') && ($scope.valueCompartirCon != '')){
			    		
			    		$scope.checkCompartirCon = true;
			    		
			    	}else{
			    		$scope.checkCompartirCon = false;
			    	}
			    	
			    	if(($scope.checkCards == true) && ($scope.checkCompartirCon == true)){
			    		$scope.activarBoton = true;
			    	}else{
			    		$scope.activarBoton = false;
			    	}
			    	
			    }
		    	
		    	$scope.refreshCarrousel = function(){
					$('#carouselCrearFlashcards').carousel({});
					$(document).ready(function(){
						  $('.carousel').each(function(){
						    $(this).find('.carousel-item').eq(0).addClass('active');
						  });
						});
				};
		    	
		    	$scope.insertarTarjeta = function(){
		    		
		    		if(($scope.anverso != '') && ($scope.reverso != '')){
			    		var tarjeta = {
			    				'anverso': $scope.anverso,
			    				'reverso': $scope.reverso
			    		};
			    		
			    		$http({
			    	        method: 'GET',
			    	        url: 'addTarjeta.html?anverso=' + $scope.anverso + '&reverso=' + $scope.reverso,
			                headers : {
			                	'Accept': 'application/json'
			                }
			    	    }).then(function mySuccess(response) {
			    	    	if(response.data = true){
			    	    		$scope.listaFlashcards.push(tarjeta);
			    	    		$scope.anverso = '';
			    				$scope.reverso = '';
			    				if($scope.listaFlashcards.length == 1){
			    					$scope.refreshCarrousel();
			    				}
			    				$scope.habilitarBoton();
			    	    	}
			    	    });
		    		}else{
		    			bootbox.alert("El campo anverso o reverso estan vacios y no se puede agregar la tarjeta");
		    		}
		    		
		    	}
		    	
				$scope.eliminarTarjeta = function(tarjetaColeccion, indice){
		    		
		    		$http({
		    	        method: 'GET',
		    	        url: 'deleteTarjeta.html?anverso=' + tarjetaColeccion.anverso + '&reverso=' + tarjetaColeccion.reverso,
		                headers : {
		                	'Accept': 'application/json'
		                }
		    	    }).then(function mySuccess(response) {
		    	    	if(response.data = true){
		    	    		$scope.listaFlashcards.splice(indice, 1);
		    	    		$scope.habilitarBoton();
		    	    		$scope.refreshCarrousel();
		    	    	}
		    	    });
		    		
		    	}
	        	
	        });
		    
		    
		    
		</script>
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