<!DOCTYPE html>
<html lang="es">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Flashcards - Gestion Clubes - Administrador ${usuario.getUsername()}</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
  <link href="resources/css/comunes.css" rel="stylesheet">
  
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

      <!-- Nav Item - Dashboard--> 
      <li class="nav-item">
        <a class="nav-link" href="inicio.html">
          <i class="fa fa-home" aria-hidden="true"></i>
          <span>Pagina Principal</span></a>
      </li>      
      
      <!-- Nav Item - Dashboard--> 
      <hr class="sidebar-divider" id="adminSidebarDivider" style="display: none;">
      <div class="sidebar-heading" id="adminSidebarTitle" style="display: none;">
        Administrador
      </div>
      <li class="nav-item active" id="adminSidebar" style="display: none;">
        <a class="nav-link" href="panelAdministrador.html">
          <i class="fa fa-universal-access" aria-hidden="true"></i>
          <span>Panel Administrador</span></a>
      </li>
      
      <hr class="sidebar-divider">
      <div class="sidebar-heading">
        Flashcards
      </div>
      <li class="nav-item">
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
                <span class="mr-2 d-none d-lg-inline text-gray-600 small">Bienvenido ${usuario.getUsername()}</span>
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
                  Configuraci�n
                </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" data-toggle="modal" onclick="dialogCS()">
                  <i class="fa fa-power-off" aria-hidden="true"></i>
                  <!-- <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>-->
                  Cerrar Sesi�n
                </a>
              </div>
            </li>

          </ul>

        </nav>
        
        <script>
	        function dialogCS(){
		    	bootbox.confirm({ 
	    		  size: "small",
	    		  message: "�Desea salir del sistema?", 
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
        var app = angular.module('AppClubesAdministrador', []);
        app.controller('ClubesAdministradorCtrl', function($scope, $http) {
        	$scope.listaClubes = [];
        	$scope.checkGet = false;
        	var indice = 0;
        	var user;
        	
        	$scope.rellenarTabla = function(){
        		
	       		$http.get("getClubesAdmin.do")
	       			.then(function(response) {
	       				$scope.listaClubes = response.data;
	       				$scope.checkGet = true;
	       		  	}, function myError(response) {
		       		  	$scope.listaClubes = [];
	       				$scope.checkGet = true;
		       	    }
	       		);
        		
        	};
        	
			$scope.eliminaClub = function(club){
				
				bootbox.confirm({
				    message: "�Quiere eliminar el club "+club.nombreClub+"?",
				    buttons: {
				        cancel: {
				            label: '<i class="fa fa-times"></i> No'
				        },
				        confirm: {
				            label: '<i class="fa fa-check"></i> Si'
				        }
				    },
				    callback: function (result) {
				    	if(result == true){
					    	console.log('Eliminar a: ' + result);
					    	window.location.href = "administradorEliminaClub.do?idClub="+club.idClub;
				    	}
				    }
				});
        	};
        	
        	$scope.rellenarTabla();        	
        	
        });
        </script>
        
        <div class="container-fluid" ng-app="AppClubesAdministrador" ng-controller="ClubesAdministradorCtrl">
        	<div class="row">
        		<div class="col-md-12">
		        	<div class="row">
		        		<div class="col-md-1"></div>
		        		<div class="col-md-10">
				            <div ng-if="!checkGet">
				            	<h6 align="center">Cargando clubes...</h6>
				            </div>
				            <div ng-if="checkGet && listaClubes.length == 0">
				            	<h6 align="center">No hay clubes en el sistema</h6>
				            </div>
				            <div ng-if="checkGet && listaClubes.length > 0">
				            	<div class="input-group">
					            	<input type="text" ng-model="filterClubes" class="form-control" placeholder="Filtrar por nombre de clubes" />
					            </div>
					            <br>
					            <table width="100%" border="1">  
								   <tr>  
								      <th align="center" style="text-align:center;">Club</th>  
								      <th align="center" style="width:168px; text-align:center;">Eliminar Club</th>   
								   </tr>  
								   <tr>
								   		<td colspan=2>
								   		<div style="overflow-y:scroll;height:500px;">
								   			<table width=100% border="1">
								   				<tr ng-repeat = "eClub in listaClubes | filter:filterClubes:strict">  
											      <td align="center">
											      	<strong>Nombre del Club: </strong><a href="verClub.html?idClub={{ eClub.idClub }}">{{ eClub.nombreClub }}</a>
											      	<br><strong>Id del Club: </strong> {{ eClub.idClub }}
											      	<br><strong>Creador: </strong> {{ eClub.administrador }}
											      </td>  
											      <td style="width:150px;">
												      <form ng-submit="eliminaClub(eClub)">
													     <button type="submit" style="display:block;margin:auto;"><i class="fa fa-trash" aria-hidden="true"></i></button>
													  </form>
											      </td>    
											   </tr>
								   			</table>
								   		</div>
								   </tr>
								</table> 
							</div>
		        		</div>
		        		<div class="col-md-1"></div>
		        	</div>
		        </div>
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



