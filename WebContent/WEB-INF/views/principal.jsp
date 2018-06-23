<!DOCTYPE html>
<html>
	<head>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Principal - Flashcards</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">	
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"></script>
	</head>
	<body>
		<%@ page import="com.flashcards.modelo.Usuario" %>
		<% 
			Usuario user = ((Usuario)(session.getAttribute("usuario")));
			if(user==null || user.getUsuario().equals("")){
				response.sendRedirect("https://sistemaflashcards.herokuapp.com");
			}
			session.setAttribute("usuario", user);
		%>
				
		<style>
			div.center {
			    text-align: center;
			}
			
			.navbar-nav > li > a, .navbar-brand {
			    padding-top:4px !important; 
			    padding-bottom:0 !important;
			    height: 28px;
			}
			.navbar-inner {min-height:28px;}	
			
			.card {
			  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
			  max-width: 300px;
			  margin: auto;
			  text-align: center;
			  font-family: arial;
			}
			
			.title {
			  color: grey;
			  font-size: 18px;
			}
			
			button {
			  border: none;
			  outline: 0;
			  display: inline-block;
			  padding: 8px;
			  color: white;
			  background-color: #000;
			  text-align: center;
			  cursor: pointer;
			  width: 100%;
			  font-size: 18px;
			}
					
			button:hover{
			  opacity: 0.7;
			}
		</style>
		
		<nav class="navbar navbar-expand-md bg-dark navbar-dark">
			<div class="navbar-inner navbar-collapse" id="collapsibleNavbar">
			    <ul class="navbar-nav mr-auto">
					<li class="nav-item active">
						<a class="nav-link" href="inicio.html?usuario=${usuario.getUsuario()}">
							Inicio
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="flashcards.html?usuario=${usuario.getUsuario()}">
							Flashcards
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="gente.html?usuario=${usuario.getUsuario()}">
							Gente
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="clubes.html?usuario=${usuario.getUsuario()}">
							Clubes
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="gestionar.html?usuario=${usuario.getUsuario()}" id="btn-Gestion">
							Gestionar Cuentas
						</a>
					</li>
	    		</ul>
	    		<ul class="navbar-nav ml-auto">
	    			<li class="nav-item dropdown">
                    	<a href="#" class="nav-link dropdown-toggle" id="navDropDownLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Hola ${usuario.getUsuario()}!!!</a>
	                    <div class="dropdown-menu" aria-labelledby="navDropDownLink">
	                        <a class="dropdown-item" href="miPerfil.html?usuario=${usuario.getUsuario()}">Mi Perfil</a>
	                        <a class="dropdown-item" href="configuracion.html?usuario=${usuario.getUsuario()}">Configuración</a>
	                        <div class="dropdown-divider"></div>
	                        <a class="dropdown-item" href="cerrarSesion.html" onclick="return confirm('¿Desea Cerrar Sesión?');">Cerrar Sesión</a>
	                    </div>
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
			<div class="col-md-4">
				<h2 style="text-align:center">Mi Profile Card</h2>
				<div class="card">
				  <img src="http://www.personalbrandingblog.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640-300x300.png" alt="Perfil" style="width:100%">
				  <h5>${usuario.getNombreApellidos()}</h5>
				  <p class="title">${rol}</p>
				  <div style="margin: 24px 0;">
				    <h6><a href="miPerfil.html?usuario=${usuario.getUsuario()}">Mi Perfil y Logros<i class="fa fa-dribbble"></i></a></h6> 
				 </div>
				</div>
			</div>
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
			</script>-->
	</body>
</html>