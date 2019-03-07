
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
    	<div ng-app="adminApp" ng-controller="adminCtrl">
		    <div class="container">
		    	<br>
		    	<br>
		    	<div ng-if="users.length == 0">
					<p>No hay usuarios en la aplicación</p>
				</div>
				<div ng-if="users.length > 0">
					<table align="center" border="5" style="width:100%">
			    		<tr ng-repeat="user in users">
			    			<td>
			    				<div class="profile-userpic">
									<img src="${usuario.getFoto()}" class="img-responsive" alt="">
								</div>
			    				<p align="center">{{user.username}}</p>
			    			</td>
			    			<td>
			    				<select name="select_user.username" id="select_user.username">
								  <option value="usuario">Usuario</option>
								  <option value="moderador">Moderador</option>
								  <option value="administrador">Administrador</option>
								</select>
								
								<script>
									$("#select_{{user.username}}").val("administrador");
								</script>
								
							</td>
			    		</tr>
			    	</table>
				</div>
			</div>
		</div>
		<script>
			
			var app = angular.module('adminApp', []);
			app.controller('adminCtrl', function($scope, $http) {
				
				$http({
				    url: '/getUsersAdmin.do', 
				    method: "GET",
				    headers : {
				    	'Content-Type': 'application/json',
				    	'Accept': 'application/json'
                    }
				}).then(function mySuccess(response) {					
					
					$scope.users = [];
					$scope.originalArray = response.data;
					var indice = 0;
					
					for(indice=0;indice<$scope.originalArray.length;indice++){
						if(((($scope.originalArray[indice]).username.localeCompare("${usuario.getUsername()}"))!=0)){
							$scope.users.push($scope.originalArray[indice]);
						}
					}
					
        	    }, function myError(response) {
        	    	$scope.users = response;
        	    });
				
				$scope.defaultRadio = function(indice,usuario){
					if(usuario.rolUsuario == true){
						document.getElementById("usuario_"+indice).checked=true;
					}else if(usuario.rolModerador == true){
						document.getElementById("moderador_"+indice).checked=true;
					}else{
						document.getElementById("administrador_"+indice).checked=true;
					}
				}
				
				$scope.deleteUser = function(nombreUsuario){
					$http({
	        	        method: 'POST',
	        	        url: '/adminDeleteUser.do',
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