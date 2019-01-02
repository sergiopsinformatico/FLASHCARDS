<!DOCTYPE html>
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
	    		<a class="nav-link" href="inicio.html?usuario=${usuario.getNombreUsuario()}">
					Inicio
				</a>
	          </li>
	          <li class="nav-item">
				<a class="nav-link" href="flashcards.html?usuario=${usuario.getNombreUsuario()}">
					Flashcards
				</a>
			  </li>
			  <li class="nav-item">
			  	<a class="nav-link" href="gente.html?usuario=${usuario.getNombreUsuario()}">
					Gente
				</a>
			  </li>
			  <li class="nav-item">
			  	<a class="nav-link" href="clubes.html?usuario=${usuario.getNombreUsuario()}">
					Clubes
				</a>
			  </li>
			  <li class="nav-item">
			  	<a class="nav-link" href="gestionar.html?usuario=${usuario.getNombreUsuario()}" id="btn-Gestion">
					Gestionar Cuentas
				</a>
			  </li>
	        </ul>
	        <ul class="navbar-nav ml-auto">
	        <li class="nav-item dropdown">
	            <a class="nav-link dropdown-toggle" href="" id="dropdown03" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Bienvenido ${usuario.getNombreApellidos()} </a>
	            <div class="dropdown-menu dropdown-primary" aria-labelledby="dropdown03">
	              <a class="dropdown-item" href="miPerfil.html?usuario=${usuario.getNombreUsuario()}&perfil=${usuario.getNombreUsuario()}">Mi Perfil</a>
	              <a class="dropdown-item" href="configuracion.html?usuario=${usuario.getNombreUsuario()}">Configuraci�n</a>
	              <div class="dropdown-divider"></div>
				  <a class="dropdown-item" href="cerrarSesion.html" onclick="return confirm('�Desea Cerrar Sesi�n?');">Cerrar Sesi�n</a>
	            </div>
	            <script>
	            	$('.dropdown-toggle').dropdown();
	            </script>
	          </li>
	        </ul>
	      </div>
	    </nav>
		
		<script language="JavaScript" type="text/javascript">
			var comp = ${usuario.isAdministrador()};
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
						<h6 align="center"><a href="miPerfil.html?usuario=${usuario.getNombreUsuario()}&perfil=${usuario.getNombreUsuario()}">Mi Perfil<i class="fa fa-dribbble"></i></a></h6> 
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
				        No hay ninguna notificaci�n pendiente.
				    </div>
				    <div ng-if="notificaciones.length > 0">
						<table class="table table-bordered table-striped">
							<thead>
								<tr>
									<th>Notificaci�n</th>
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
			</script>-->
	</body>
</html>