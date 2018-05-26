<!DOCTYPE html>
<html>
	<head>
		<title>Flashcards</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
		<script src="//ajax.googleapis.com/ajax/libs/angularjs/1.2.11/angular.min.js"></script>
		
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
			
			ul{
			 margin:0;
			}
		
		</style>
		
		<nav class="navbar navbar-expand-md bg-dark navbar-dark">
			<div class="collapse navbar-collapse" id="collapsibleNavbar">
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
						<a class="nav-link" href="modificar.html?usuario=${usuario.getUsuario()}">
							Modificar Perfil
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
	                        <a class="dropdown-item" href="cerrarSesion.html?usuario=${usuario.getUsuario()}" onclick="return confirm('¿Desea Cerrar Sesión?');">Cerrar Sesión</a>
	                    </div>
	                </li>
	    		</ul>
	  		</div>
		</nav>
		<!-- 
   			<li><a href="eliminar.html" onclick="return confirm('¿Desea Eliminar la Cuenta?'+'\nNota: Si da a aceptar, dispone de 14 días para recuperar la cuenta, iniciando sesión de nuevo o se eliminará definitivamente. Recibirá un email con la informacion.');">Eliminar Cuenta</a></li>
		 -->
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
			<div class="col-md-3 center">
				<h2>Notificaciones</h2>
				<div class="container" ng-app="Notifications" ng-controller="NotificationCtrl">
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
			<div class="col-md-9 center">
				<div class="row">
				  <div class="col-md-12 center">
				  	<form action="crearColeccion.html" method="post" class="border-login" id="form1">
					  	<button type="submit" class="btn btn-info">
					  		<h3>Crear Colección de Tarjetas</h3>
					  	</button>
					</form>
				  </div>
				</div>
				<br><br><br><br>
				<div class="row">
				  <div class="col-md-12 center">
				  	<form action="verColecciones.html" method="post" class="border-login" id="form2">
					  	<button type="submit" class="btn btn-success">
					  		<h3>Mis Colecciones de Tarjetas</h3>
					  	</button>
					</form>
				  </div>
				</div>
				<br><br><br><br>
				<div class="row">
				  <div class="col-md-12 center">
				  	<form action="evaluarColecciones.html" method="post" class="border-login" id="form3">
					  	<button type="submit" class="btn btn-warning">
					  		<h3>Evaluar Colecciones de Tarjetas</h3>
					  	</button>
				  	</form>
				  </div>
				</div>
			</div>
		</div>
		
		<script language="JavaScript" type="text/javascript">
			var comp2 = ${usuario.isModerador()};
			if (comp2){
				document.getElementById("form3").style.visibility="visible";
			}else{
				document.getElementById("form3").style.visibility="hidden";
			}
		</script>
	</body>
</html>