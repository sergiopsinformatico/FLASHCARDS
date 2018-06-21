<html>
	<head>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Ver Club - ${club.getNombre()}</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">	
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
	</head>
	<body ng-app="myClubApp">
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
					<li class="nav-item active">
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
				<br><h1>CLUB: ${club.getNombre()}</h1><br>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-5">
				<div class="row">
					<h6>Administrador del Grupo:</h6> 
				</div>
				<div class="row">
					${administrador}
				</div>
				<div class="row">
					<br>
					<form action="eliminarClub.html" method="post" id="formDeleteClub">
						<input id="usuario" name="usuario" type="hidden" value="${usuario.getUsuario()}"> 
						<input id="identificador" name="identificador" type="hidden" value="${club.getIdentificador()}">
					    <div class="button">
					        <button type="submit">Eliminar Club</button>
					    </div>
					</form>
				</div>
				<div class="row">
					<br><br>
				</div>
				<div class="row">
					<h6>Descripción del Grupo:</h6> 
				</div>
				<div class="row">
					${club.getDescripcion()}
				</div>
				<div class="row">
					<br><br>
				</div>
				<div class="row">
					<h6>Miembros:</h6>
				</div>
				<div class="row">
					<div ng-controller="membersCtrl">
						<div ng-if="miembros.length == 0">
							El unico miembro de este club es el administrador: ${administrador}
						</div>
						<div ng-if="miembros.length > 0">
							<div class="panel-heading">
								<input class="form-control" ng-model="expression" placeholder="Buscar..." />
							</div>
							<div class="panel-body" style="min-width: 100%;max-width: 100%;max-height: 200px;overflow-y: scroll;overflow: -moz-scrollbars-vertical;">
								<table class="table table-bordered table-striped">
									<tbody>
										<tr ng-repeat="miembro in miembros | filter:expression">
											<td>{{ miembro.name }} ({{ miembro.usuario }})</td>
											<td>
												<form action="eliminarMiembro.html" method="post" name="form2{{ miembro.usuario }}" id="form2{{ miembro.usuario }}">
													<input id="identificador" name="identificador" type="hidden" value="${club.getIdentificador()}">
													<!-- <input id="usuario" name="usuario" type="hidden" value="${usuario}"> -->
													<input id="miembro" name="miembro" type="hidden" value="{{ miembro.usuario }}">
												    <div class="button">
												        <button type="submit">Eliminar Miembro</button>
												    </div>
												</form>
												<script>
													var form = "form2";
													var miembro = "{{ miembro.usuario }}";
													var administrador = "${club.getAdministrador()}";
													var usuario = "${usuario.getUsuario()}";
													document.getElementById(form.concat(miembro)).style.visibility="hidden";
													if( usuario == administrador ){
														document.getElementById(form.concat(miembro)).style.visibility="visible";	
													}
												</script>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-1"></div>
			<div class="col-md-4">
				<div id="formSolicitadoAcceso">
					<br><h6>Ya ha solicitado acceso a este club. Debe esperar a que la acepten o la rechazen.</h6>
				</div>
				<!-- <form action="invitarPersonaClub.html" method="post" id="form4">
					<input id="identificador" name="identificador" type="hidden" value="${club.getIdentificador()}">
					<input id="usuario" name="usuario" type="hidden" value="${usuario.getUsuario()}">
					Invitación para: <input type="text" name="recibe">
				    <div class="button">
				        <button type="submit">Invitar Miembro</button>
				    </div>
				</form>-->
				<br>
				<form action="dejarClub.html" method="post" id="formDejarClub">
					<input id="identificador" name="identificador" type="hidden" value="${club.getIdentificador()}">
					<input id="usuario" name="usuario" type="hidden" value="${usuario.getUsuario()}">
				    <div class="button">
				        <button type="submit">Abandonar Club</button>
				    </div>
				</form>
				<br>
				<form action="solicitarAccesoClub.html" method="post" id="formSolicitarAcceso">
					<input id="identificador" name="identificador" type="hidden" value="${club.getIdentificador()}">
					<input id="usuario" name="usuario" type="hidden" value="${usuario.getUsuario()}">
				    <div class="button">
				        <button type="submit">Solicitar Acceso</button>
				    </div>
				</form>
				<div ng-controller="newMemberCtrl" id="formNuevos">
					<h6>Nuevos Usuarios que pueden formar parte de este Club</h6>
					<div ng-if="nuevos.length == 0">
						Todos los usuarios forman parte de este grupo. 
					</div>
					<div ng-if="nuevos.length > 0">
						<div class="panel-heading">
							<input class="form-control" ng-model="expression" placeholder="Buscar un nuevo miembro..." />
						</div>
						<div class="panel-body" style="min-width: 100%;max-width: 100%;max-height: 200px;overflow-y: scroll;overflow: -moz-scrollbars-vertical;">
							<table class="table table-bordered table-striped">
								<tbody>
									<tr ng-repeat="nuevo in nuevos | filter:expression">
										<td>{{ nuevo.name }} ({{ nuevo.usuario }})</td>
										<td>
											<form action="incluirMiembro.html" method="post">
												<input id="identificador" name="identificador" type="hidden" value="${club.getIdentificador()}">
												<input id="usuario" name="usuario" type="hidden" value="${usuario.getUsuario()}">
												<input type="hidden" id="miembro" name="miembro" value="{{ nuevo.usuario }}">
											    <div class="button">
											        <button type="submit">Añadir Miembro</button>
											    </div>
											</form>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div ng-controller="solicitudesCtrl" id="formSolicitudes">
					<br>
					<h6>Solicitudes de Acceso al Club Pendientes</h6>
					<div ng-if="solicitudes.length == 0">
						No hay solicitudes pendientes. 
					</div>
					<div ng-if="solicitudes.length > 0">
						<div class="panel-heading">
							<input class="form-control" ng-model="expression" placeholder="Buscar un nuevo miembro..." />
						</div>
						<div class="panel-body" style="min-width: 100%;max-width: 100%;max-height: 200px;overflow-y: scroll;overflow: -moz-scrollbars-vertical;">
							<table class="table table-bordered table-striped">
								<tbody>
									<tr ng-repeat="solicitud in solicitudes | filter:expression">
										<td>{{ solicitud.name }} ({{ solicitud.usuario }})</td>
										<td>
											<form action="aceptarSolicitud.html" method="post">
												<input id="identificador" name="identificador" type="hidden" value="${club.getIdentificador()}">
												<input id="usuario" name="usuario" type="hidden" value="${usuario.getUsuario()}">
												<input type="hidden" id="miembro" name="miembro" value="{{ solicitud.usuario }}">
											    <div class="button">
											        <button type="submit">Aceptar Solicitud de Acceso</button>
											    </div>
											</form>
										</td>
										<td>
											<form action="denegarSolicitud.html" method="post">
												<input id="identificador" name="identificador" type="hidden" value="${club.getIdentificador()}">
												<input id="usuario" name="usuario" type="hidden" value="${usuario.getUsuario()}">
												<input type="hidden" id="miembro" name="miembro" value="{{ solicitud.usuario }}">
											    <div class="button">
											        <button type="submit">Denegar Solicitud de Acceso</button>
											    </div>
											</form>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div ng-controller="adminCtrl" id="formAdmin">
					<br>
					<h6>Cambio de Administrador del Club</h6>
					<div ng-if="admins.length == 0">
						Si el club no tiene más miembros, no puede cambiarse el administrador. 
					</div>
					<div ng-if="admins.length > 0">
						<div class="panel-heading">
							<input class="form-control" ng-model="expression" placeholder="Buscar un nuevo administrador..." />
						</div>
						<div class="panel-body" style="min-width: 100%;max-width: 100%;max-height: 200px;overflow-y: scroll;overflow: -moz-scrollbars-vertical;">
							<table class="table table-bordered table-striped">
								<tbody>
									<tr ng-repeat="admin in admins | filter:expression">
										<td>{{ admin.name }} ({{ admin.usuario }})</td>
										<td>
											<form action="nuevoAdministrador.html" method="post">
												<input id="identificador" name="identificador" type="hidden" value="${club.getIdentificador()}">
												<input id="usuario" name="usuario" type="hidden" value="${usuario.getUsuario()}">
												<input type="hidden" id="miembro" name="miembro" value="{{ admin.usuario }}">
											    <div class="button">
											        <button type="submit">Convertir en Nuevo Administrador del Club</button>
											    </div>
											</form>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-1"></div>
			<script>
				if(("${usuario.getUsuario()}".localeCompare("${club.getAdministrador()}")) == 0){
					document.getElementById("formNuevos").style.visibility="visible";
					document.getElementById("formDeleteClub").style.visibility="visible";
					document.getElementById("formSolicitarAcceso").style.visibility="hidden";
					document.getElementById("formDejarClub").style.visibility="hidden";
					document.getElementById("formSolicitudes").style.visibility="visible";
					document.getElementById("formAdmin").style.visibility="visible";
					document.getElementById("formSolicitadoAcceso").style.visibility="hidden";
				} else if ( ${esAdministrador} == true){
					document.getElementById("formNuevos").style.visibility="hidden";
					document.getElementById("formDeleteClub").style.visibility="hidden";
					document.getElementById("formSolicitarAcceso").style.visibility="hidden";
					document.getElementById("formDejarClub").style.visibility="hidden";
					document.getElementById("formSolicitudes").style.visibility="hidden";
					document.getElementById("formAdmin").style.visibility="visible";
					document.getElementById("formSolicitadoAcceso").style.visibility="hidden";
				}else if ( ${pertenece} == true){
					document.getElementById("formNuevos").style.visibility="visible";
					document.getElementById("formDeleteClub").style.visibility="hidden";
					document.getElementById("formSolicitarAcceso").style.visibility="hidden";
					document.getElementById("formDejarClub").style.visibility="visible";
					document.getElementById("formSolicitudes").style.visibility="hidden";
					document.getElementById("formAdmin").style.visibility="hidden";
					document.getElementById("formSolicitadoAcceso").style.visibility="hidden";
				}else if( ${solicitado} == true){
					document.getElementById("formNuevos").style.visibility="hidden";
					document.getElementById("formDeleteClub").style.visibility="hidden";
					document.getElementById("formSolicitarAcceso").style.visibility="hidden";
					document.getElementById("formDejarClub").style.visibility="hidden";
					document.getElementById("formSolicitudes").style.visibility="hidden";
					document.getElementById("formAdmin").style.visibility="hidden";
					document.getElementById("formSolicitadoAcceso").style.visibility="visible";
				}else{
					document.getElementById("formNuevos").style.visibility="hidden";
					document.getElementById("formDeleteClub").style.visibility="hidden";
					document.getElementById("formSolicitarAcceso").style.visibility="visible";
					document.getElementById("formDejarClub").style.visibility="hidden";
					document.getElementById("formSolicitudes").style.visibility="hidden";
					document.getElementById("formAdmin").style.visibility="hidden";
					document.getElementById("formSolicitadoAcceso").style.visibility="hidden";
				}
			</script>
		</div>
		<script>
			
		var miembrosControlador = function ($scope){
			$scope.miembros = [];
			var cadena = "${miembros}";
	        var array = cadena.split("///****nMiembro****///");
	        var i;
	        if(cadena != ""){
		        for (i = 0; i < array.length; i++) { 
		        	var miembro = array[i].split("///****user****///");
		        	$scope.miembros.push({
		        		name: miembro[0],
		        		usuario:miembro[1]
		        	});
		        }
	        }
		};
		
		var nuevosControlador = function ($scope){
			$scope.nuevos = [];
			var cadena = "${nuevosMiembros}";
	        var array = cadena.split("///****nMiembro****///");
	        var i;
	        if(cadena != ""){
		        for (i = 0; i < array.length; i++) { 
		        	var miembro = array[i].split("///****user****///");
		        	$scope.nuevos.push({
		        		name: miembro[0],
		        		usuario:miembro[1]
		        	});
		        }
	        }
		};
		
		var administradorControlador = function ($scope){
			$scope.admins = [];
			var cadena = "${miembros}";
	        var array = cadena.split("///****nMiembro****///");
	        var i;
	        if(cadena != ""){
		        for (i = 0; i < array.length; i++) { 
		        	var miembro = array[i].split("///****user****///");
		        	$scope.admins.push({
		        		name: miembro[0],
		        		usuario:miembro[1]
		        	});
		        }
	        }
		};
		
		var solicAccControlador = function ($scope){
			$scope.solicitudes = [];
			var cadena = "${solicitudesAcceso}";
	        var array = cadena.split("///****nMiembro****///");
	        var i;
	        if(cadena != ""){
		        for (i = 0; i < array.length; i++) { 
		        	var miembro = array[i].split("///****user****///");
		        	$scope.solicitudes.push({
		        		name: miembro[0],
		        		usuario:miembro[1]
		        	});
		        }
	        }
		};
		
		var app = angular.module('myClubApp', []);
		app.controller('membersCtrl', miembrosControlador);
		app.controller('newMemberCtrl', nuevosControlador);
		app.controller('adminCtrl', administradorControlador);
		app.controller('solicitudesCtrl', solicAccControlador);
		</script>
	</body>
</html>