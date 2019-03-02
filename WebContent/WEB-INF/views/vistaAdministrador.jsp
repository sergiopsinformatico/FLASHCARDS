
<!DOCTYPE html>
<html lang="en">
  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Flashcards - Administrador</title>

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
    	<div ng-app="adminApp" ng-controller="adminCtrl">
    		<h6>Response: {{ users }}</h6>
		    <div class="container">
		    	<table style="width:100%">
		    		<tr>
		    			<th>Usuario</th>
		    			<th>Rol</th>
		    			<th>Eliminar Usuario</th>
		    		</tr>
		    		<tr ng-repeat="user in users">
		    			<td>{{ user.getUsername() }}</td>
		    			<td>
		    				<input type="radio" id="rol{{user.getUsername()}}_usuario" name="rol{{user.getUsername()}}" ng-model="value{{user.getUsername()}}" value="usuario" ng-change='cambioRol({{user}}, value{{user.getUsername()}})'> Usuario
		    				<input type="radio" id="rol{{user.getUsername()}}_moderador" name="rol{{user.getUsername()}}" ng-model="value{{user.getUsername()}}" value="moderador" ng-change='cambioRol({{user}}, value{{user.getUsername()}})'> Moderador
		    				<input type="radio" id="rol{{user.getUsername()}}_administrador" name="rol{{user.getUsername()}}" ng-model="value{{user.getUsername()}}" value="administrador" ng-change='cambioRol({{user}}, value{{user.getUsername()}})'> Administrador
		    				<script>
		    					if(user.isRolUsuario()){
		    						document.getElementById("rol{{user.getUsername()}}_usuario").checked = true;
		    					}else if(user.isRolModerador()){
		    						document.getElementById("rol{{user.getUsername()}}_moderador").checked = true;
		    					}else{
		    						document.getElementById("rol{{user.getUsername()}}_administrador").checked = true;
		    					}
		    				</script>
		    			</td>
		    			<td>
		    				<input type="button" value="Eliminar {{user.getUsername()}}" id="btnDelete{{user.getUsername()}}" name="btnDelete{{user.getUsername()}}" ng-click="deleteUser({{user.getUsername()}})">
		    			</td>
		    		</tr>
		    	</table>
			</div>
		</div>
		
		<script>
			
			var app = angular.module('adminApp', []);
			app.controller('adminCtrl', function($scope, $http) {
				
				$http({
				    url: '/getUsersAdmin.do', 
				    method: "GET",
				    data: "${usuario.getUsername()}",
				    headers : {
                    	'Accept': 'application/json'
                    }
				}).then(function mySuccess(response) {
        	    	$scope.users = response;
        	    }, function myError(response) {
        	    	$scope.users = response;
        	    });
				
				$scope.deleteUser = function(nombreUsuario){
					$http({
	        	        method: 'POST',
	        	        url: 'adminDeleteUser.do',
	        	        data: nombreUsuario,
	        	        headers : {
	        	        	'Content-type': 'application/json',
	                    	'Accept': 'application/json'
	                    }
	        	    });
				}
				
				$scope.cambioRol = function(usuario, rol){
					var jsonRol={
						"usuario" : usuario,
						"rol" : rol
					}
					
					$http({
	        	        method: 'POST',
	        	        url: '/adminCambiaRolUser.do',
	        	        data: jsonRol,
	        	        headers : {
	        	        	'Content-type': 'application/json',
	                    	'Accept': 'application/json'
	                    }
	        	    });
				}	
				
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