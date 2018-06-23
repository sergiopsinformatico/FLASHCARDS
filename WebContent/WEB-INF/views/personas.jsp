<html>
	<head>
		<title>Personas - Flashcards</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
		<style>
			.fixed-panel {
			  min-height: 1600;
			  max-height: 1600;
			  min-width: 475;
			  max-width: 475;
			  overflow: -moz-scrollbars-vertical; 
			  overflow-y: scroll;
			}
			
			.fixed-panel-small {
			  min-height: 300;
			  max-height: 300;
			  min-width: 600;
			  max-width: 600;
			  overflow: -moz-scrollbars-vertical; 
			  overflow-y: scroll;
			}
			
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
	</head>
	<body ng-app="myApp">
		<%@ page import="com.flashcards.modelo.Usuario" %>
		<% 
			Usuario user = ((Usuario)(session.getAttribute("usuario")));
			if(user==null || user.getUsuario().equals("")){
				response.sendRedirect("https://sistemaflashcards.herokuapp.com");
			}
			session.setAttribute("usuario", user);
		%>
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
					<li class="nav-item active">
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
			<div class="col-md-1"></div>
			<div class="col-md-11">
				<br><h1><b>Gente</b></h1><br>
			</div>
		</div>
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-4">
				<div class="row">
					<b>Todos los Usuarios</b><br>
				</div>
				<div class="row"><br></div>
				<div class="panel panel-primary" ng-controller="peopleCtrl">
					<div class="panel-heading">
						<input class="form-control" ng-model="expression" placeholder="Buscar..." />
					</div>
					<div class="panel-body fixed-panel">
						<table class="table table-bordered table-striped">
							<tbody>
								<tr ng-repeat="person in people | filter:expression">
									<td>{{ person.name }} ( {{ person.usuario }} )</td>
									<td>
								    	<form action="peticionAmistad.html" method="POST">
								    		<input id="peticion" name="peticion" type="hidden" value="{{ person.usuario }}">
											<input id="usuario" name="usuario" type="hidden" value="${usuario.getUsuario()}">
										    <input type="submit" name="action" value="Añadir Amigo" />
										</form>
										<br><br>
										<form action="bloquear.html" method="POST">
								    		<input id="bloquear" name="bloquear" type="hidden" value="{{ person.usuario }}">
											<input id="usuario" name="usuario" type="hidden" value="${usuario.getUsuario()}">
										    <input type="submit" name="action" value="Bloquear Usuario" />
										</form>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="col-md-1">
			</div>
			<div class="col-md-5">
				<div class="row">
					<b>Amigos</b>
				</div>
				<div class="row"><br></div>
				<div class="row">
					<div class="panel panel-primary" ng-controller="friendsCtrl">
						<div class="panel-heading">
							<input class="form-control" ng-model="expression" placeholder="Buscar..." />
						</div>
						<div class="panel-body fixed-panel-small">
							<table class="table table-bordered table-striped">
								<tbody>
									<tr ng-repeat="person in people | filter:expression">
										<td>{{ person.name }} ( {{ person.usuario }} )</td>
										<td>
									    	<form action="eliminarAmigo.html" method="POST">
									    		<input id="eliminar" name="eliminar" type="hidden" value="{{ person.usuario }}">
												<input id="usuario" name="usuario" type="hidden" value="${usuario.getUsuario()}">
											    <input type="submit" name="action" value="Eliminar Amigo" />
											</form>
											<br><br>
											<form action="bloquearAmigo.html" method="POST">
									    		<input id="bloquear" name="bloquear" type="hidden" value="{{ person.usuario }}">
												<input id="usuario" name="usuario" type="hidden" value="${usuario.getUsuario()}">
											    <input type="submit" name="action" value="Bloquear Amigo" />
											</form>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="row"><br></div>
				<div class="row">
					<b>Peticiones de Amistad Enviadas</b><br>
				</div>
				<div class="row"><br></div>
				<div class="row">
					<div class="panel panel-primary" ng-controller="pdaEnviadasCtrl">
						<div class="panel-heading">
							<input class="form-control" ng-model="expression" placeholder="Buscar..." />
						</div>
						<div class="panel-body fixed-panel-small">
							<table class="table table-bordered table-striped">
								<tbody>
									<tr ng-repeat="person in people | filter:expression">
										<td>{{ person.name }} ( {{ person.usuario }} )</td>
										<td>
									    	<form action="eliminarPeticion.html" method="POST">
									    		<input id="envia" name="envia" type="hidden" value="${usuario.getUsuario()}">
									    		<input id="recibe" name="recibe" type="hidden" value="{{ person.usuario }}">
												<input id="usuario" name="usuario" type="hidden" value="${usuario.getUsuario()}">
											    <input type="submit" name="action" value="Eliminar Petición" />
											</form>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="row"><br></div>
				<div class="row">
					<b>Peticiones de Amistad Recibidas</b><br>
				</div>
				<div class="row"><br></div>
				<div class="row">
					<div class="panel panel-primary" ng-controller="pdaRecibidasCtrl">
						<div class="panel-heading">
							<input class="form-control" ng-model="expression" placeholder="Buscar..." />
						</div>
						<div class="panel-body fixed-panel-small">
							<table class="table table-bordered table-striped">
								<tbody>
									<tr ng-repeat="person in people | filter:expression">
										<td>{{ person.name }} ( {{ person.usuario }} )</td>
										<td>
									    	<form action="aceptar.html" method="POST">
									    		<input id="peticion" name="peticion" type="hidden" value="{{ person.usuario }}">
												<input id="usuario" name="usuario" type="hidden" value="${usuario.getUsuario()}">
											    <input type="submit" name="action" value="Aceptar Petición" />
											</form>
										<br><br>
											<form action="rechazar.html" method="POST">
									    		<input id="peticion" name="peticion" type="hidden" value="{{ person.usuario }}">
												<input id="usuario" name="usuario" type="hidden" value="${usuario.getUsuario()}">
											    <input type="submit" name="action" value="Rechazar Petición" />
											</form>
										<br><br>
											<form action="bloquearPeticion.html" method="POST">
									    		<input id="bloquear" name="bloquear" type="hidden" value="{{ person.usuario }}">
												<input id="usuario" name="usuario" type="hidden" value="${usuario.getUsuario()}">
											    <input type="submit" name="action" value="Bloquear Usuario" />
											</form>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="row"><br></div>
				<div class="row">
					<b>Bloqueados</b><br>
				</div>
				<div class="row"><br></div>
				<div class="row">
					<div class="panel panel-primary" ng-controller="bloqueadosCtrl">
						<div class="panel-heading">
							<input class="form-control" ng-model="expression" placeholder="Buscar..." />
						</div>
						<div class="panel-body fixed-panel-small">
							<table class="table table-bordered table-striped">
								<tbody>
									<tr ng-repeat="person in people | filter:expression">
										<td>{{ person.name }} ( {{ person.usuario }} )</td>
										<td>
											<form action="desbloquear.html" method="POST">
												<input id="bloqueado" name="bloqueado" type="hidden" value="{{ person.usuario }}">
												<input id="usuario" name="usuario" type="hidden" value="${usuario.getUsuario()}">
											    <input type="submit" name="action" value="Desbloquear" />
											</form>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-1">
			</div>
		</div>
		<div class="row">
			<br>
		</div>
		<script>
			
			var peopleControlador = function($scope, $http){
				$scope.people = [];
				var cadena = "${people}";
				var array = cadena.split("///****nuevaP****///");
				var i;
		        if(cadena != ""){
			        for (i = 0; i < array.length; i++) { 
			        	var user = array[i].split("///-///");
			        	$scope.people.push({
			        		name: user[0],
			        		usuario: user[1]
			        	});
			        }
		        }
				
			};
			
			var friendsControlador = function($scope){
				$scope.people = [];
				var cadena = "${friends}";
				var array = cadena.split("///****nuevaP****///");
				var i;
		        if(cadena != ""){
			        for (i = 0; i < array.length; i++) { 
			        	var user = array[i].split("///-///");
			        	$scope.people.push({
			        		name: user[0],
			        		usuario: user[1]
			        	});
			        }
		        }
			};
			
			var enviadasControlador = function($scope){
				$scope.people = [];
				var cadena = "${pDAe}";
				var array = cadena.split("///****nuevaP****///");
				var i;
		        if(cadena != ""){
			        for (i = 0; i < array.length; i++) { 
			        	var user = array[i].split("///-///");
			        	$scope.people.push({
			        		name: user[0],
			        		usuario: user[1]
			        	});
			        }
		        }
			};
			
			var recibidasControlador = function($scope){
				$scope.people = [];
				var cadena = "${pDAr}";
				var array = cadena.split("///****nuevaP****///");
				var i;
		        if(cadena != ""){
			        for (i = 0; i < array.length; i++) { 
			        	var user = array[i].split("///-///");
			        	$scope.people.push({
			        		name: user[0],
			        		usuario: user[1]
			        	});
			        }
		        }
			};
			
			var bloqueadosControlador = function($scope){
				$scope.people = [];
				var cadena = "${bloq}";
				var array = cadena.split("///****nuevaP****///");
				var i;
		        if(cadena != ""){
			        for (i = 0; i < array.length; i++) { 
			        	var user = array[i].split("///-///");
			        	$scope.people.push({
			        		name: user[0],
			        		usuario: user[1]
			        	});
			        }
		        }
			};
			
			var app = angular.module('myApp', []);
			
			app.controller('peopleCtrl', peopleControlador);
			app.controller('friendsCtrl', friendsControlador);
			app.controller('pdaEnviadasCtrl', enviadasControlador);
			app.controller('pdaRecibidasCtrl', recibidasControlador);
			app.controller('bloqueadosCtrl', bloqueadosControlador);
			
		</script>
	</body>
</html>