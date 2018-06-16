<!DOCTYPE html>
<html>
	<head>
		<title>Administrador - Flashcards</title>
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
			if(user==null || user.getUsuario().equals("") || !user.isAdministrador()){
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
		</style>
		
		<nav class="navbar navbar-expand-md bg-dark navbar-dark">
			<div class="navbar-inner navbar-collapse" id="collapsibleNavbar">
			    <ul class="navbar-nav mr-auto">
					<li class="nav-item">
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
					<li class="nav-item active">
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
			<div class="col-md-2">
			</div>
			<div class="col-md-8">
				<br><h1>USUARIOS</h1><br>
			</div>
			<div class="col-md-2">
			</div>
		</div>
		<div class="row">
			<div class="col-md-2">
			
			</div>
			<div class="col-md-8" ng-app="myAdminApp" ng-controller="adminCtrl">
				<div ng-if="usuarios.length == 0"> 
			        Actualmente, el sistema no cuenta con más usuarios.
			        <br>
			    </div>
			    <div ng-if="usuarios.length > 0">
					<div class="panel-heading">
						<input class="form-control" ng-model="expression" placeholder="Buscar..." />
					</div>
					<div class="panel-body" style="max-width: 100%;max-height: 800px;min-width: 100%;min-height: 800px;overflow-y: scroll;overflow: -moz-scrollbars-vertical;">
						<table class="table table-bordered table-striped">
							<tbody>
								<tr ng-repeat="usuario in usuarios | filter:expression">
									<td>{{ usuario.nombre }} ({{ usuario.usuario }}) <br>
									Rol del Usuario: {{ usuario.rol }}</td>
									<td>
								    	<form action="adminEliminaCuenta.html" id="eliminaForm" method="POST">
								    		<input id="usuario" name="usuario" type="hidden" value="{{ usuario.usuario }}">
											<input id="admin" name="admin" type="hidden" value="${admin}">
										    <input type="submit" name="action" value="Eliminar Cuenta de Usuario" />
										</form>
									</td>
									<td>
										<form action="adminCambiaRol.html" method="POST" id="cambia" name="cambia">
											<input type="radio" name="rol" id="{{ usuario.usuario }}usuarioCheck" value="usuario"> Usuario <br>
											<input type="radio" name="rol" id="{{ usuario.usuario }}moderadorCheck" value="moderador"> Moderador <br>
											<input type="radio" name="rol" id="{{ usuario.usuario }}administradorCheck" value="administrador"> Administrador
											<input id="admin" name="admin" type="hidden" value="${admin}">
											<input id="usuario" name="usuario" type="hidden" value="{{ usuario.usuario }}">
											<br><input type="submit" name="action" value="Guardar Cambio Rol" />
										</form>										
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<script>
				var adminControlador = function ($scope, $http) {	
			        $scope.usuarios = [];
			        
			        var cadena = "${usuarios}";
			        var array = cadena.split("///****nuevoUsuario****///");
			        var i;
			        if(cadena != ""){
				        for (i = 0; i < array.length; i++) { 
				        	var elemento = array[i].split("///****elem****///");
				        	$scope.usuarios.push({
				        		nombre: elemento[0],
				        		usuario: elemento[1],
				        		rol: elemento[2]
				        	});
				        }
			        }
				}
				var app = angular.module('myAdminApp', []);
				app.controller('adminCtrl', adminControlador);
			</script>
			<div class="col-md-2">
			</div>
		</div>
		<br><br>
	</body>
</html>