<html>
	<head>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Clubes</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">	
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
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
				<br>
					<h1>CLUBES</h1>
				<br>
			</div>
		</div>
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-5" ng-app="clubsApp" ng-controller="clubsCtrl">
				<div ng-if="clubes.length == 0"> 
			        No existen clubes.
			        <br>
			    </div>
				<div ng-if="clubes.length > 0">
					<div class="panel-heading">
						<input class="form-control" ng-model="expression" placeholder="Buscar un club..." />
					</div>
					<div class="panel-body" style="min-width: 100%;max-width: 100%;max-height: 200px;overflow-y: scroll;overflow: -moz-scrollbars-vertical;" >
						<table class="table table-bordered table-striped">
							<tbody>
								<tr ng-repeat="club in clubes | filter:expression">
									<td>
									<a href="https://sistemaflashcards.herokuapp.com/verClub.html?usuario=${usuario.getUsuario()}&club={{ club.id }}">{{ club.club }}</a></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="col-md-1"></div>
			<div class="col-md-4">
				<div class="container">
			        <div class="card card-container">
						<form action="crearClub.html" method="post">
							<br>
							<h6>¿No encuentra un club sobre un tema? Puedes crearlo ahora:</h6>
							Nombre del Club<br>
							<input type="text" name="nClub" placeholder="Nombre del club..." required><br><br>
							<style>
								textarea {
								   resize: none;
								}
							</style>
							Descripción del Club<br>
							<textarea rows="4" cols="50" id="descripcionClub" name="descripcionClub" placeholder="Descripcion..." required></textarea>
							<input id="usuario" name="usuario" type="hidden" value="${usuario.getUsuario()}">
							<br><br><br><br>
						    <div class="button">
						        <button type="submit">Crear Un Club</button>
						    </div>
						</form>
					</div>
				</div>
			</div>
			<div class="col-md-1"></div>
		</div>
		<script>
			var clubesControlador = function ($scope, $http) {
		        $scope.clubes = [];
		        var cadena = "${clubes}";
		        var array = cadena.split("///****nuevoCLUB****///");
		        var i;
		        if(cadena != ""){
			        for (i = 0; i < array.length; i++) { 
			        	var club = array[i].split("////id////");
			        	$scope.clubes.push({
			        		club: club[0],
			        		id: club[1]
			        	});
			        }
		        }
			}
			var app = angular.module('clubsApp', []);
			app.controller('clubsCtrl', clubesControlador);
		</script>
	</body>
</html>


<!-- 
		<form action="crearClub.html" method="post">
			Nombre del Club<input type="text" name="nClub">
			<input id="usuario" name="usuario" type="hidden" value="${usuario}">
		    <div class="button">
		        <button type="submit">Crear Un Club</button>
		    </div>
		</form>
		<br><br>
		<c:if test="${not empty clubes}">
			<table>
			    <c:forEach items="${clubes}" var="club">
			    	<tr>
			    		<td> ${club} </td>
			    		<td>
			    			<form action="verClub.html" method="post">
								<input id="club" name="club" type="hidden" value="${club}">
								 <input id="usuario" name="usuario" type="hidden" value="${usuario}"> 
							    <div class="button">
							        <button type="submit">Ver Club</button>
							    </div>
							</form>
			    		</td>
			    	</tr>
			    </c:forEach>
			</table>
		</c:if> 
-->