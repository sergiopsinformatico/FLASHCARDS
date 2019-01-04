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
		
		.profile-usertitle-personal {
		  color: #5a7391;
		  font-size: 14px;
		  font-weight: 600;
		  margin-bottom: 7px;
		  text-align: left;
		}
		
		.profile-usertitle-infoUser {
		  color: #5a7391;
		  font-size: 12px;
		  font-weight: 600;
		  margin-bottom: 7px;
		  text-align: left;
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
				<div class="col-md-3">
					<div class="profile-sidebar">
						<div class="profile-userpic">
							<img src="${usuario.getFoto()}" class="img-responsive" alt="">
						</div>
						<div class="profile-usertitle">
							<div class="profile-usertitle-personal">
								${usuario.getUsername()}
							</div>
							<div class="profile-usertitle-personal">
								${usuario.getEmail()}
							</div>
							<div class="profile-usertitle-infoUser">
								{{nombreApellidos}}
							</div>
							<div class="profile-usertitle-infoUser">
								{{ciudad}}
							</div>
							<div class="profile-usertitle-infoUser">
								{{pais}}
							</div>
						</div>
						<br>
						<br>
						<div>
							<form action="" method="GET">
								<button type="submit" id="buttonVerPefil" name="buttonVerPefil" class="btn btn-outline-success">Ver Mi Perfil</button>
							</form>
						</div>
						<br>
						<div>
							<form action="" method="GET">
								<button type="submit" id="buttonModificarPefil" name="buttonModificarPefil" class="btn btn-outline-info" >Modificar Mi Perfil</button>
							</form>
						</div>
						<br>
						<br>
						<div>
							<form action="/cerrarSesion.html" method="POST">
								<button type="submit" id="buttonCerrarSesion" name="buttonCerrarSesion" class="btn btn-outline-warning">Cerrar Sesión</button>
							</form>
						</div>
						<br>
						<div>
							<form action="" method="POST">
								<button type="submit" id="buttonEliminarCuenta" name="buttonEliminarCuenta" class="btn btn-outline-danger">Eliminar Cuenta</button>
							</form>
						</div>
					</div>
				</div>
				<div class="col-md-9">		            
		            
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



<!-- <!DOCTYPE html>
<html>
	<head>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	    <title>Principal - Flashcards</title>
		<meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	    <meta http-equiv="x-ua-compatible" content="ie=edge">
	    <link rel="stylesheet" href="https://unpkg.com/bootstrap-material-design@4.1.1/dist/css/bootstrap-material-design.min.css" integrity="sha384-wXznGJNEXNG1NFsbm0ugrLFMQPWswR3lds2VeinahP8N0zJw9VWSopbjv2x7WCvX" crossorigin="anonymous">
	    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
		<script src="https://unpkg.com/popper.js@1.12.6/dist/umd/popper.js" integrity="sha384-fA23ZRQ3G/J53mElWqVJEGJzU0sTs+SvzG8fXVWP+kJQ1lwFAOkcUOysnlKJC33U" crossorigin="anonymous"></script>
		<script src="https://unpkg.com/bootstrap-material-design@4.1.1/dist/js/bootstrap-material-design.js" integrity="sha384-CauSuKpEqAFajSpkdjv3z9t8E7RlpJ1UP0lKM/+NdtSarroVKu069AlsRPKkFBz9" crossorigin="anonymous"></script>
		<script>$(document).ready(function() { $('body').bootstrapMaterialDesign(); });</script>
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
	</head>
	<body>
		
		<script language="JavaScript" type="text/javascript">
			if("${mensaje}" != ""){
				alert("${mensaje}");
			}
		</script>
		<style>
		    div.left {
			    text-align: left;
			}
			div.center {
			    text-align: center;
			}
			textarea {
			   resize: none;
			}
			.scene {
			  /*width: 300px;*/
			  width: 100%;
			  height: 450px;
			  border: 1px solid #CCC;
			  margin: 40px 0;
			  perspective: 600px;
			}
			
			.card {
			  width: 100%;
			  height: 450px;
			  transition: transform 1s;
			  transform-style: preserve-3d;
			  cursor: pointer;
			  position: relative;
			}
			
			.card.is-flipped {
			  transform: rotateY(180deg);
			}
			
			.card__face {
			  position: absolute;
			  width: 100%;
			  height: 100%;
			  color: white;
			  text-align: center;
			  font-weight: bold;
			  font-size: 12pxvw;
			  backface-visibility: hidden;
			}
			
			.card__face--front {
			  background: red;
			}
			
			.card__face--back {
			  background: blue;
			  transform: rotateY(180deg);
			}
			
			.formato-img{
				height: 180px;
				min-height: 180px;
				max-height: 180px;
				width: auto;
				display: block;
			    margin-left: auto;
			    margin-right: auto;
			}	
	    </style>
		<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
	      <button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#navbarsExample03" aria-controls="navbarsExample03" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="navbar-toggler-icon"></span>
	      </button>
	
	      <div class="navbar-collapse collapse" id="navbarsExample03" style="width: 100%;">
	        <ul class="navbar-nav mr-auto">
	          <li class="nav-item active">
	    		<a class="nav-link" href="inicio.html?usuario=${usuario.getUsername()}">
					Inicio
				</a>
	          </li>
	          <li class="nav-item">
				<a class="nav-link" href="flashcards.html?usuario=${usuario.getUsername()}">
					Flashcards
				</a>
			  </li>
			  <li class="nav-item">
			  	<a class="nav-link" href="gente.html?usuario=${usuario.getUsername()}">
					Gente
				</a>
			  </li>
			  <li class="nav-item">
			  	<a class="nav-link" href="clubes.html?usuario=${usuario.getUsername()}">
					Clubes
				</a>
			  </li>
			  <li class="nav-item">
			  	<a class="nav-link" href="gestionar.html?usuario=${usuario.getUsername()}" id="btn-Gestion">
					Gestionar Cuentas
				</a>
			  </li>
	        </ul>
	        <ul class="navbar-nav ml-auto">
	        <li class="nav-item dropdown">
	            <a class="nav-link dropdown-toggle" href="" id="dropdown03" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Bienvenido ${usuario.getNombreApellidos()} </a>
	            <div class="dropdown-menu dropdown-primary" aria-labelledby="dropdown03">
	              <a class="dropdown-item" href="miPerfil.html?usuario=${usuario.getUsername()}&perfil=${usuario.getUsername()}">Mi Perfil</a>
	              <a class="dropdown-item" href="configuracion.html?usuario=${usuario.getUsername()}">Configuración</a>
	              <div class="dropdown-divider"></div>
				  <a class="dropdown-item" href="/cerrarSesion.do" onclick="return confirm('¿Desea Cerrar Sesión?');">Cerrar Sesión</a>
	            </div>
	            <script>
	            	$('.dropdown-toggle').dropdown();
	            </script>
	          </li>
	        </ul>
	      </div>
	    </nav>
		
		<script language="JavaScript" type="text/javascript">
			var comp = ${usuario.isHasRolAdministrador()};
			if (comp){
				document.getElementById("btn-Gestion").style.visibility="visible";
			}else{
				document.getElementById("btn-Gestion").style.visibility="hidden";
			}
		</script>
		<div class="row">
			<br><br>
		</div>
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-2">
				<div class="card">
					<br>
					<h5 align="center">Profile Card</h5>
					<br>
					<div class="row">
						<img src=${usuario.getPhoto()} alt="Perfil" class="formato-img">
					</div>
					<h6 align="center">${usuario.getNombreApellidos()}</h6>
					<p class="title" align="center">${rol}</p>
					<div style="margin: 24px 0;">
						<h6 align="center"><a href="miPerfil.html?usuario=${usuario.getUsername()}&perfil=${usuario.getUsername()}">Mi Perfil<i class="fa fa-dribbble"></i></a></h6> 
					</div>
				</div>
			</div>
			<div class="col-md-5"></div>
			<div class="col-md-3"></div>
			<div class="col-md-1"></div>
		</div>
		
		
		
		
		
		
		<!-- 
		<div class="row">
			<div class="col-md-3 center">
				<h2>Notificaciones</h2>
			</div>
		</div>
		<div class="row">
			<div class="col-md-3 center">
				<div class="container" ng-app="Notifications" ng-controller="NotificationCtrl">
					<div ng-if="notificaciones.length == 0"> 
				        No hay ninguna notificación pendiente.
				    </div>
				    <div ng-if="notificaciones.length > 0">
						<table class="table table-bordered table-striped">
							<thead>
								<tr>
									<th>Notificación</th>
									<th>Fecha</th>
									<th>Eliminar</th>
								</tr>
							</thead>
							<tbody>
								<tr ng-repeat="notificacion in notificaciones | filter:expression">
									<td>{{ notificacion.notificacion }}</td>
									<td>{{ notificacion.fecha }}</td>
									<td><button type="button" class="btn btn-info" ng-click="Delete($index)"><span class="glyphicon glyphicon-search"></span>Eliminar Notificacion</button></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<script>
				angular.module('Notifications', []).controller('NotificationCtrl', function($scope) {
					$scope.notificaciones = [{
						notificacion: "hola",
						fecha: "21/05/2018"
					}];
					
					$scope.Delete = function (index) {
			            $scope.notificaciones.splice(index, 1);
			        };
				});
			</script>
	</body>
</html>-->