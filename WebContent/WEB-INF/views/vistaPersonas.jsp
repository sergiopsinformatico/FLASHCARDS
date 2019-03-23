
<!DOCTYPE html>
<html lang="en">
  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Flashcards - Gente</title>

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
		  width: 60px;
		  height: auto;
		  margin-left: auto;
  		  margin-right: auto;
		  -webkit-border-radius: 50% !important;
		  -moz-border-radius: 50% !important;
		  border-radius: 50% !important;
		}
		
		.text {
		  background-color: #97BBFF;
		  color: white;
		  font-size: 16px;
		  padding: 16px 32px;
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
        <a class="navbar-brand js-scroll-trigger" href="/">FLASHCARDS</a>
      </div>
    </nav>
    
    <section>
    	<br>
    	<br>
    	<div ng-app="personasApp" ng-controller="personasCtrl">
    		Lista final: {{listaFinal}}
    		Lista people: {{listaPeople}}
    		Lista amigos: {{listaAmigos}}
    		Lista pda env: {{peticionesEnv}}
    		Lista pda rec: {{peticionesRec}}
    		Lista bloqueados: {{listaBloqueados}}
    		Lista bloqueadores: {{listaBloqueadores}}
			<div class="container">
		    	<br>
		    	<br>
		    	<div ng-if="listaFinal.length == 0">
					<p>No hay más usuarios en la aplicación</p>
				</div>
				<div ng-if="listaFinal.length > 0">
					<div class="panel-heading">
						<input class="form-control" ng-model="searchUserAdmin" placeholder="Buscar Usuario..." />
					</div>
					<br>
					<table align="center" border="5" style="width:100%">
			    		<tr ng-repeat="user in listaFinal | filter:searchUserAdmin">
			    			<td>
			    				<br>
			    				<div class="profile-userpic">
									<img src="{{user.foto}}" class="img-responsive" alt="">
								</div>
			    				<p align="center">
			    					Usuario: {{user.usuario.username}}
			    					<br>Rol: {{user.usuario.rol}}
			    				</p>
			    				<br>
			    			</td>
			    			<td>
								<!-- <input type="radio" ng-model="user.nuevoRol" value="usuario"> Usuario <br>
								<input type="radio" ng-model="user.nuevoRol" value="moderador"> Moderador <br>
								<input type="radio" ng-model="user.nuevoRol" value="administrador"> Administrador
								<br><input type="button" ng-click="changeRol(user)" value="Cambiar Rol"/>-->
								{{user.relacion}}
							</td>
			    		</tr>
			    	</table>
				</div>
			</div>
		</div>
		<script>
			
			var app = angular.module('personasApp', []);
			app.controller('personasCtrl', function($scope, $http) {
				
				//Variables
				
				$scope.listaFinal = [];
				
				$scope.listaPeople = [];
				$scope.listaAmigos = [];
				$scope.peticionesEnv = [];
				$scope.peticionesRec = [];
				$scope.listaBloqueados = [];
				$scope.listaBloqueadores = [];
				
				
				$scope.fillTable();
				
				$scope.fillTable() = function(){
					$scope.getAllPeople();
					$scope.getAmigos();
					$scope.getPdAEnviadas();
					$scope.getPdARecibidas();
					$scope.getBloqueados();
					$scope.getBloqueadores();
					
					//Rellenar listaFinal
					
					var indice = 0;
					
					for(indice=0;indice<$scope.listaPeople.length;indice++){
						$scope.listaFinal.push({
							'usuario': $scope.listaPeople[indice],
							'relacion': 'none'
						});
					}
					
				};
				
				//Get Data
				
				$scope.getAllPeople() = function(){
					$http({
					    url: '/allPeople.do?username='+"${usuario.getUsername()}", 
					    method: "GET",
					    headers : {
					    	'Content-Type': 'application/json',
					    	'Accept': 'application/json'
	                    }
					}).then(function mySuccess(response) {					
						$scope.listaPeople = response.data;						
	        	    }, function myError(response) {
	        	    	$scope.listaPeople = [];
	        	    });
				};
				
				$scope.getAmigos() = function(){
					$http({
					    url: '/amigos.do?username='+"${usuario.getUsername()}", 
					    method: "GET",
					    headers : {
					    	'Content-Type': 'application/json',
					    	'Accept': 'application/json'
	                    }
					}).then(function mySuccess(response) {					
						$scope.listaAmigos = response.data;						
	        	    }, function myError(response) {
	        	    	$scope.listaAmigos = [];
	        	    });
				};
				
				$scope.getPdAEnviadas() = function(){
					$http({
					    url: '/pdaEnv.do?username='+"${usuario.getUsername()}", 
					    method: "GET",
					    headers : {
					    	'Content-Type': 'application/json',
					    	'Accept': 'application/json'
	                    }
					}).then(function mySuccess(response) {					
						$scope.peticionesEnv = response.data;						
	        	    }, function myError(response) {
	        	    	$scope.peticionesEnv = [];
	        	    });
				};
				
				$scope.getPdARecibidas() = function(){
					$http({
					    url: '/pdaRec.do?username='+"${usuario.getUsername()}", 
					    method: "GET",
					    headers : {
					    	'Content-Type': 'application/json',
					    	'Accept': 'application/json'
	                    }
					}).then(function mySuccess(response) {					
						$scope.peticionesRec = response.data;						
	        	    }, function myError(response) {
	        	    	$scope.peticionesRec = [];
	        	    });
				};
				
				$scope.getBloqueados() = function(){
					$http({
					    url: '/bloqueados.do?username='+"${usuario.getUsername()}", 
					    method: "GET",
					    headers : {
					    	'Content-Type': 'application/json',
					    	'Accept': 'application/json'
	                    }
					}).then(function mySuccess(response) {					
						$scope.listaBloqueados = response.data;						
	        	    }, function myError(response) {
	        	    	$scope.listaBloqueados = [];
	        	    });
				};
				
				$scope.getBloqueadores() = function(){
					$http({
					    url: '/bloqueadores.do?username='+"${usuario.getUsername()}", 
					    method: "GET",
					    headers : {
					    	'Content-Type': 'application/json',
					    	'Accept': 'application/json'
	                    }
					}).then(function mySuccess(response) {					
						$scope.listaBloqueadores = response.data;						
	        	    }, function myError(response) {
	        	    	$scope.listaBloqueadores = [];
	        	    });
				};
				
			});
				
		</script>
		
	</section>
	
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