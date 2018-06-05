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
			  min-width: 600;
			  max-width: 600;
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
			<div class="col-md-1">
			</div>
			<div class="col-md-11">
				<br><h1><b>Gente</b></h1><br>
			</div>
		</div>
		<div class="row">
			<div class="col-md-1">
			</div>
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
									<td>{{ person.name }}</td>
									<td>{{ person.age }}</td>
									<td>{{ person.hobbies.join(', ') }}</td>
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
										<td>{{ person.name }}</td>
										<td>{{ person.age }}</td>
										<td>{{ person.hobbies.join(', ') }}</td>
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
										<td>{{ person.name }}</td>
										<td>{{ person.age }}</td>
										<td>{{ person.hobbies.join(', ') }}</td>
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
										<td>{{ person.name }}</td>
										<td>{{ person.age }}</td>
										<td>{{ person.hobbies.join(', ') }}</td>
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
										<td>{{ person.name }}</td>
										<td>{{ person.age }}</td>
										<td>{{ person.hobbies.join(', ') }}</td>
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
		<script>
			
			var peopleControlador = function($scope){
				$scope.people = [
					{name: 'Jalel', age: '31', hobbies: ['Crossfit', 'Video Games', 'Sport', 'Cryptography', 'Astronomy']},
					{name: 'Meriem', age: '23', hobbies: ['Sport', 'Hiking', 'Drawing', 'Cycling']},
					{name: 'Alice', age: '25', hobbies: ['Board games', 'Cooking', 'Fashion']},
					{name: 'Rich', age: '28', hobbies: ['Sport', 'Basketball', 'Ice skating']},
					{name: 'Jalel', age: '31', hobbies: ['Crossfit', 'Video Games', 'Sport', 'Cryptography', 'Astronomy']},
					{name: 'Meriem', age: '23', hobbies: ['Sport', 'Hiking', 'Drawing', 'Cycling']},
					{name: 'Alice', age: '25', hobbies: ['Board games', 'Cooking', 'Fashion']},
					{name: 'Rich', age: '28', hobbies: ['Sport', 'Basketball', 'Ice skating']},
					{name: 'Jalel', age: '31', hobbies: ['Crossfit', 'Video Games', 'Sport', 'Cryptography', 'Astronomy']},
					{name: 'Meriem', age: '23', hobbies: ['Sport', 'Hiking', 'Drawing', 'Cycling']},
					{name: 'Alice', age: '25', hobbies: ['Board games', 'Cooking', 'Fashion']},
					{name: 'Rich', age: '28', hobbies: ['Sport', 'Basketball', 'Ice skating']},
					{name: 'Jalel', age: '31', hobbies: ['Crossfit', 'Video Games', 'Sport', 'Cryptography', 'Astronomy']},
					{name: 'Meriem', age: '23', hobbies: ['Sport', 'Hiking', 'Drawing', 'Cycling']},
					{name: 'Alice', age: '25', hobbies: ['Board games', 'Cooking', 'Fashion']},
					{name: 'Rich', age: '28', hobbies: ['Sport', 'Basketball', 'Ice skating']},
					{name: 'Jalel', age: '31', hobbies: ['Crossfit', 'Video Games', 'Sport', 'Cryptography', 'Astronomy']},
					{name: 'Meriem', age: '23', hobbies: ['Sport', 'Hiking', 'Drawing', 'Cycling']},
					{name: 'Alice', age: '25', hobbies: ['Board games', 'Cooking', 'Fashion']},
					{name: 'Rich', age: '28', hobbies: ['Sport', 'Basketball', 'Ice skating']},
					{name: 'Jalel', age: '31', hobbies: ['Crossfit', 'Video Games', 'Sport', 'Cryptography', 'Astronomy']},
					{name: 'Meriem', age: '23', hobbies: ['Sport', 'Hiking', 'Drawing', 'Cycling']},
					{name: 'Alice', age: '25', hobbies: ['Board games', 'Cooking', 'Fashion']},
					{name: 'Rich', age: '28', hobbies: ['Sport', 'Basketball', 'Ice skating']},
					{name: 'Jalel', age: '31', hobbies: ['Crossfit', 'Video Games', 'Sport', 'Cryptography', 'Astronomy']},
					{name: 'Meriem', age: '23', hobbies: ['Sport', 'Hiking', 'Drawing', 'Cycling']},
					{name: 'Alice', age: '25', hobbies: ['Board games', 'Cooking', 'Fashion']},
					{name: 'Rich', age: '28', hobbies: ['Sport', 'Basketball', 'Ice skating']},
					{name: 'Jalel', age: '31', hobbies: ['Crossfit', 'Video Games', 'Sport', 'Cryptography', 'Astronomy']},
					{name: 'Meriem', age: '23', hobbies: ['Sport', 'Hiking', 'Drawing', 'Cycling']},
					{name: 'Alice', age: '25', hobbies: ['Board games', 'Cooking', 'Fashion']},
					{name: 'Rich', age: '28', hobbies: ['Sport', 'Basketball', 'Ice skating']},
					{name: 'Jalel', age: '31', hobbies: ['Crossfit', 'Video Games', 'Sport', 'Cryptography', 'Astronomy']},
					{name: 'Meriem', age: '23', hobbies: ['Sport', 'Hiking', 'Drawing', 'Cycling']},
					{name: 'Alice', age: '25', hobbies: ['Board games', 'Cooking', 'Fashion']},
					{name: 'Rich', age: '28', hobbies: ['Sport', 'Basketball', 'Ice skating']},
					{name: 'Jalel', age: '31', hobbies: ['Crossfit', 'Video Games', 'Sport', 'Cryptography', 'Astronomy']},
					{name: 'Meriem', age: '23', hobbies: ['Sport', 'Hiking', 'Drawing', 'Cycling']},
					{name: 'Alice', age: '25', hobbies: ['Board games', 'Cooking', 'Fashion']},
					{name: 'Rich', age: '28', hobbies: ['Sport', 'Basketball', 'Ice skating']},
					{name: 'Jalel', age: '31', hobbies: ['Crossfit', 'Video Games', 'Sport', 'Cryptography', 'Astronomy']},
					{name: 'Meriem', age: '23', hobbies: ['Sport', 'Hiking', 'Drawing', 'Cycling']},
					{name: 'Alice', age: '25', hobbies: ['Board games', 'Cooking', 'Fashion']},
					{name: 'Rich', age: '28', hobbies: ['Sport', 'Basketball', 'Ice skating']},
					{name: 'Jalel', age: '31', hobbies: ['Crossfit', 'Video Games', 'Sport', 'Cryptography', 'Astronomy']},
					{name: 'Meriem', age: '23', hobbies: ['Sport', 'Hiking', 'Drawing', 'Cycling']},
					{name: 'Alice', age: '25', hobbies: ['Board games', 'Cooking', 'Fashion']},
					{name: 'Rich', age: '28', hobbies: ['Sport', 'Basketball', 'Ice skating']},
					{name: 'Jalel', age: '31', hobbies: ['Crossfit', 'Video Games', 'Sport', 'Cryptography', 'Astronomy']},
					{name: 'Meriem', age: '23', hobbies: ['Sport', 'Hiking', 'Drawing', 'Cycling']},
					{name: 'Alice', age: '25', hobbies: ['Board games', 'Cooking', 'Fashion']},
					{name: 'Rich', age: '28', hobbies: ['Sport', 'Basketball', 'Ice skating']}
				];
			};
			
			var friendsControlador = function($scope){
				$scope.people = [
					{name: 'Jalel', age: '31', hobbies: ['Crossfit', 'Video Games', 'Sport', 'Cryptography', 'Astronomy']},
					{name: 'Meriem', age: '23', hobbies: ['Sport', 'Hiking', 'Drawing', 'Cycling']},
					{name: 'Alice', age: '25', hobbies: ['Board games', 'Cooking', 'Fashion']},
					{name: 'Rich', age: '28', hobbies: ['Sport', 'Basketball', 'Ice skating']},
					{name: 'Jalel', age: '31', hobbies: ['Crossfit', 'Video Games', 'Sport', 'Cryptography', 'Astronomy']},
					{name: 'Meriem', age: '23', hobbies: ['Sport', 'Hiking', 'Drawing', 'Cycling']},
					{name: 'Alice', age: '25', hobbies: ['Board games', 'Cooking', 'Fashion']},
					{name: 'Rich', age: '28', hobbies: ['Sport', 'Basketball', 'Ice skating']},
					{name: 'Jalel', age: '31', hobbies: ['Crossfit', 'Video Games', 'Sport', 'Cryptography', 'Astronomy']},
					{name: 'Meriem', age: '23', hobbies: ['Sport', 'Hiking', 'Drawing', 'Cycling']},
					{name: 'Alice', age: '25', hobbies: ['Board games', 'Cooking', 'Fashion']},
					{name: 'Rich', age: '28', hobbies: ['Sport', 'Basketball', 'Ice skating']},
					{name: 'Jalel', age: '31', hobbies: ['Crossfit', 'Video Games', 'Sport', 'Cryptography', 'Astronomy']},
					{name: 'Meriem', age: '23', hobbies: ['Sport', 'Hiking', 'Drawing', 'Cycling']},
					{name: 'Alice', age: '25', hobbies: ['Board games', 'Cooking', 'Fashion']},
					{name: 'Rich', age: '28', hobbies: ['Sport', 'Basketball', 'Ice skating']},
					{name: 'Jalel', age: '31', hobbies: ['Crossfit', 'Video Games', 'Sport', 'Cryptography', 'Astronomy']},
					{name: 'Meriem', age: '23', hobbies: ['Sport', 'Hiking', 'Drawing', 'Cycling']},
					{name: 'Alice', age: '25', hobbies: ['Board games', 'Cooking', 'Fashion']},
					{name: 'Rich', age: '28', hobbies: ['Sport', 'Basketball', 'Ice skating']},
					{name: 'Jalel', age: '31', hobbies: ['Crossfit', 'Video Games', 'Sport', 'Cryptography', 'Astronomy']},
					{name: 'Meriem', age: '23', hobbies: ['Sport', 'Hiking', 'Drawing', 'Cycling']},
					{name: 'Alice', age: '25', hobbies: ['Board games', 'Cooking', 'Fashion']},
					{name: 'Rich', age: '28', hobbies: ['Sport', 'Basketball', 'Ice skating']},
					{name: 'Jalel', age: '31', hobbies: ['Crossfit', 'Video Games', 'Sport', 'Cryptography', 'Astronomy']},
					{name: 'Meriem', age: '23', hobbies: ['Sport', 'Hiking', 'Drawing', 'Cycling']},
					{name: 'Alice', age: '25', hobbies: ['Board games', 'Cooking', 'Fashion']},
					{name: 'Rich', age: '28', hobbies: ['Sport', 'Basketball', 'Ice skating']},
					{name: 'Jalel', age: '31', hobbies: ['Crossfit', 'Video Games', 'Sport', 'Cryptography', 'Astronomy']},
					{name: 'Meriem', age: '23', hobbies: ['Sport', 'Hiking', 'Drawing', 'Cycling']},
					{name: 'Alice', age: '25', hobbies: ['Board games', 'Cooking', 'Fashion']},
					{name: 'Rich', age: '28', hobbies: ['Sport', 'Basketball', 'Ice skating']},
					{name: 'Jalel', age: '31', hobbies: ['Crossfit', 'Video Games', 'Sport', 'Cryptography', 'Astronomy']},
					{name: 'Meriem', age: '23', hobbies: ['Sport', 'Hiking', 'Drawing', 'Cycling']},
					{name: 'Alice', age: '25', hobbies: ['Board games', 'Cooking', 'Fashion']},
					{name: 'Rich', age: '28', hobbies: ['Sport', 'Basketball', 'Ice skating']},
					{name: 'Jalel', age: '31', hobbies: ['Crossfit', 'Video Games', 'Sport', 'Cryptography', 'Astronomy']},
					{name: 'Meriem', age: '23', hobbies: ['Sport', 'Hiking', 'Drawing', 'Cycling']},
					{name: 'Alice', age: '25', hobbies: ['Board games', 'Cooking', 'Fashion']},
					{name: 'Rich', age: '28', hobbies: ['Sport', 'Basketball', 'Ice skating']},
					{name: 'Jalel', age: '31', hobbies: ['Crossfit', 'Video Games', 'Sport', 'Cryptography', 'Astronomy']},
					{name: 'Meriem', age: '23', hobbies: ['Sport', 'Hiking', 'Drawing', 'Cycling']},
					{name: 'Alice', age: '25', hobbies: ['Board games', 'Cooking', 'Fashion']},
					{name: 'Rich', age: '28', hobbies: ['Sport', 'Basketball', 'Ice skating']},
					{name: 'Jalel', age: '31', hobbies: ['Crossfit', 'Video Games', 'Sport', 'Cryptography', 'Astronomy']},
					{name: 'Meriem', age: '23', hobbies: ['Sport', 'Hiking', 'Drawing', 'Cycling']},
					{name: 'Alice', age: '25', hobbies: ['Board games', 'Cooking', 'Fashion']},
					{name: 'Rich', age: '28', hobbies: ['Sport', 'Basketball', 'Ice skating']},
					{name: 'Jalel', age: '31', hobbies: ['Crossfit', 'Video Games', 'Sport', 'Cryptography', 'Astronomy']},
					{name: 'Meriem', age: '23', hobbies: ['Sport', 'Hiking', 'Drawing', 'Cycling']},
					{name: 'Alice', age: '25', hobbies: ['Board games', 'Cooking', 'Fashion']},
					{name: 'Rich', age: '28', hobbies: ['Sport', 'Basketball', 'Ice skating']}
				];
			};
			
			var enviadasControlador = function($scope){
				$scope.people = [
					{name: 'Jalel', age: '31', hobbies: ['Crossfit', 'Video Games', 'Sport', 'Cryptography', 'Astronomy']},
					{name: 'Meriem', age: '23', hobbies: ['Sport', 'Hiking', 'Drawing', 'Cycling']},
					{name: 'Alice', age: '25', hobbies: ['Board games', 'Cooking', 'Fashion']},
					{name: 'Rich', age: '28', hobbies: ['Sport', 'Basketball', 'Ice skating']},
					{name: 'Jalel', age: '31', hobbies: ['Crossfit', 'Video Games', 'Sport', 'Cryptography', 'Astronomy']},
					{name: 'Meriem', age: '23', hobbies: ['Sport', 'Hiking', 'Drawing', 'Cycling']},
					{name: 'Alice', age: '25', hobbies: ['Board games', 'Cooking', 'Fashion']},
					{name: 'Rich', age: '28', hobbies: ['Sport', 'Basketball', 'Ice skating']},
					{name: 'Jalel', age: '31', hobbies: ['Crossfit', 'Video Games', 'Sport', 'Cryptography', 'Astronomy']},
					{name: 'Meriem', age: '23', hobbies: ['Sport', 'Hiking', 'Drawing', 'Cycling']},
					{name: 'Alice', age: '25', hobbies: ['Board games', 'Cooking', 'Fashion']},
					{name: 'Rich', age: '28', hobbies: ['Sport', 'Basketball', 'Ice skating']},
					{name: 'Jalel', age: '31', hobbies: ['Crossfit', 'Video Games', 'Sport', 'Cryptography', 'Astronomy']},
					{name: 'Meriem', age: '23', hobbies: ['Sport', 'Hiking', 'Drawing', 'Cycling']},
					{name: 'Alice', age: '25', hobbies: ['Board games', 'Cooking', 'Fashion']},
					{name: 'Rich', age: '28', hobbies: ['Sport', 'Basketball', 'Ice skating']},
					{name: 'Jalel', age: '31', hobbies: ['Crossfit', 'Video Games', 'Sport', 'Cryptography', 'Astronomy']},
					{name: 'Meriem', age: '23', hobbies: ['Sport', 'Hiking', 'Drawing', 'Cycling']},
					{name: 'Alice', age: '25', hobbies: ['Board games', 'Cooking', 'Fashion']},
					{name: 'Rich', age: '28', hobbies: ['Sport', 'Basketball', 'Ice skating']},
					{name: 'Jalel', age: '31', hobbies: ['Crossfit', 'Video Games', 'Sport', 'Cryptography', 'Astronomy']},
					{name: 'Meriem', age: '23', hobbies: ['Sport', 'Hiking', 'Drawing', 'Cycling']},
					{name: 'Alice', age: '25', hobbies: ['Board games', 'Cooking', 'Fashion']},
					{name: 'Rich', age: '28', hobbies: ['Sport', 'Basketball', 'Ice skating']},
					{name: 'Jalel', age: '31', hobbies: ['Crossfit', 'Video Games', 'Sport', 'Cryptography', 'Astronomy']},
					{name: 'Meriem', age: '23', hobbies: ['Sport', 'Hiking', 'Drawing', 'Cycling']},
					{name: 'Alice', age: '25', hobbies: ['Board games', 'Cooking', 'Fashion']},
					{name: 'Rich', age: '28', hobbies: ['Sport', 'Basketball', 'Ice skating']},
					{name: 'Jalel', age: '31', hobbies: ['Crossfit', 'Video Games', 'Sport', 'Cryptography', 'Astronomy']},
					{name: 'Meriem', age: '23', hobbies: ['Sport', 'Hiking', 'Drawing', 'Cycling']},
					{name: 'Alice', age: '25', hobbies: ['Board games', 'Cooking', 'Fashion']},
					{name: 'Rich', age: '28', hobbies: ['Sport', 'Basketball', 'Ice skating']},
					{name: 'Jalel', age: '31', hobbies: ['Crossfit', 'Video Games', 'Sport', 'Cryptography', 'Astronomy']},
					{name: 'Meriem', age: '23', hobbies: ['Sport', 'Hiking', 'Drawing', 'Cycling']},
					{name: 'Alice', age: '25', hobbies: ['Board games', 'Cooking', 'Fashion']},
					{name: 'Rich', age: '28', hobbies: ['Sport', 'Basketball', 'Ice skating']},
					{name: 'Jalel', age: '31', hobbies: ['Crossfit', 'Video Games', 'Sport', 'Cryptography', 'Astronomy']},
					{name: 'Meriem', age: '23', hobbies: ['Sport', 'Hiking', 'Drawing', 'Cycling']},
					{name: 'Alice', age: '25', hobbies: ['Board games', 'Cooking', 'Fashion']},
					{name: 'Rich', age: '28', hobbies: ['Sport', 'Basketball', 'Ice skating']},
					{name: 'Jalel', age: '31', hobbies: ['Crossfit', 'Video Games', 'Sport', 'Cryptography', 'Astronomy']},
					{name: 'Meriem', age: '23', hobbies: ['Sport', 'Hiking', 'Drawing', 'Cycling']},
					{name: 'Alice', age: '25', hobbies: ['Board games', 'Cooking', 'Fashion']},
					{name: 'Rich', age: '28', hobbies: ['Sport', 'Basketball', 'Ice skating']},
					{name: 'Jalel', age: '31', hobbies: ['Crossfit', 'Video Games', 'Sport', 'Cryptography', 'Astronomy']},
					{name: 'Meriem', age: '23', hobbies: ['Sport', 'Hiking', 'Drawing', 'Cycling']},
					{name: 'Alice', age: '25', hobbies: ['Board games', 'Cooking', 'Fashion']},
					{name: 'Rich', age: '28', hobbies: ['Sport', 'Basketball', 'Ice skating']},
					{name: 'Jalel', age: '31', hobbies: ['Crossfit', 'Video Games', 'Sport', 'Cryptography', 'Astronomy']},
					{name: 'Meriem', age: '23', hobbies: ['Sport', 'Hiking', 'Drawing', 'Cycling']},
					{name: 'Alice', age: '25', hobbies: ['Board games', 'Cooking', 'Fashion']},
					{name: 'Rich', age: '28', hobbies: ['Sport', 'Basketball', 'Ice skating']}
				];
			};
			
			var recibidasControlador = function($scope){
				$scope.people = [
					{name: 'Jalel', age: '31', hobbies: ['Crossfit', 'Video Games', 'Sport', 'Cryptography', 'Astronomy']},
					{name: 'Meriem', age: '23', hobbies: ['Sport', 'Hiking', 'Drawing', 'Cycling']},
					{name: 'Alice', age: '25', hobbies: ['Board games', 'Cooking', 'Fashion']},
					{name: 'Rich', age: '28', hobbies: ['Sport', 'Basketball', 'Ice skating']},
					{name: 'Jalel', age: '31', hobbies: ['Crossfit', 'Video Games', 'Sport', 'Cryptography', 'Astronomy']},
					{name: 'Meriem', age: '23', hobbies: ['Sport', 'Hiking', 'Drawing', 'Cycling']},
					{name: 'Alice', age: '25', hobbies: ['Board games', 'Cooking', 'Fashion']},
					{name: 'Rich', age: '28', hobbies: ['Sport', 'Basketball', 'Ice skating']},
					{name: 'Jalel', age: '31', hobbies: ['Crossfit', 'Video Games', 'Sport', 'Cryptography', 'Astronomy']},
					{name: 'Meriem', age: '23', hobbies: ['Sport', 'Hiking', 'Drawing', 'Cycling']},
					{name: 'Alice', age: '25', hobbies: ['Board games', 'Cooking', 'Fashion']},
					{name: 'Rich', age: '28', hobbies: ['Sport', 'Basketball', 'Ice skating']},
					{name: 'Jalel', age: '31', hobbies: ['Crossfit', 'Video Games', 'Sport', 'Cryptography', 'Astronomy']},
					{name: 'Meriem', age: '23', hobbies: ['Sport', 'Hiking', 'Drawing', 'Cycling']},
					{name: 'Alice', age: '25', hobbies: ['Board games', 'Cooking', 'Fashion']},
					{name: 'Rich', age: '28', hobbies: ['Sport', 'Basketball', 'Ice skating']},
					{name: 'Jalel', age: '31', hobbies: ['Crossfit', 'Video Games', 'Sport', 'Cryptography', 'Astronomy']},
					{name: 'Meriem', age: '23', hobbies: ['Sport', 'Hiking', 'Drawing', 'Cycling']},
					{name: 'Alice', age: '25', hobbies: ['Board games', 'Cooking', 'Fashion']},
					{name: 'Rich', age: '28', hobbies: ['Sport', 'Basketball', 'Ice skating']},
					{name: 'Jalel', age: '31', hobbies: ['Crossfit', 'Video Games', 'Sport', 'Cryptography', 'Astronomy']},
					{name: 'Meriem', age: '23', hobbies: ['Sport', 'Hiking', 'Drawing', 'Cycling']},
					{name: 'Alice', age: '25', hobbies: ['Board games', 'Cooking', 'Fashion']},
					{name: 'Rich', age: '28', hobbies: ['Sport', 'Basketball', 'Ice skating']},
					{name: 'Jalel', age: '31', hobbies: ['Crossfit', 'Video Games', 'Sport', 'Cryptography', 'Astronomy']},
					{name: 'Meriem', age: '23', hobbies: ['Sport', 'Hiking', 'Drawing', 'Cycling']},
					{name: 'Alice', age: '25', hobbies: ['Board games', 'Cooking', 'Fashion']},
					{name: 'Rich', age: '28', hobbies: ['Sport', 'Basketball', 'Ice skating']},
					{name: 'Jalel', age: '31', hobbies: ['Crossfit', 'Video Games', 'Sport', 'Cryptography', 'Astronomy']},
					{name: 'Meriem', age: '23', hobbies: ['Sport', 'Hiking', 'Drawing', 'Cycling']},
					{name: 'Alice', age: '25', hobbies: ['Board games', 'Cooking', 'Fashion']},
					{name: 'Rich', age: '28', hobbies: ['Sport', 'Basketball', 'Ice skating']},
					{name: 'Jalel', age: '31', hobbies: ['Crossfit', 'Video Games', 'Sport', 'Cryptography', 'Astronomy']},
					{name: 'Meriem', age: '23', hobbies: ['Sport', 'Hiking', 'Drawing', 'Cycling']},
					{name: 'Alice', age: '25', hobbies: ['Board games', 'Cooking', 'Fashion']},
					{name: 'Rich', age: '28', hobbies: ['Sport', 'Basketball', 'Ice skating']},
					{name: 'Jalel', age: '31', hobbies: ['Crossfit', 'Video Games', 'Sport', 'Cryptography', 'Astronomy']},
					{name: 'Meriem', age: '23', hobbies: ['Sport', 'Hiking', 'Drawing', 'Cycling']},
					{name: 'Alice', age: '25', hobbies: ['Board games', 'Cooking', 'Fashion']},
					{name: 'Rich', age: '28', hobbies: ['Sport', 'Basketball', 'Ice skating']},
					{name: 'Jalel', age: '31', hobbies: ['Crossfit', 'Video Games', 'Sport', 'Cryptography', 'Astronomy']},
					{name: 'Meriem', age: '23', hobbies: ['Sport', 'Hiking', 'Drawing', 'Cycling']},
					{name: 'Alice', age: '25', hobbies: ['Board games', 'Cooking', 'Fashion']},
					{name: 'Rich', age: '28', hobbies: ['Sport', 'Basketball', 'Ice skating']},
					{name: 'Jalel', age: '31', hobbies: ['Crossfit', 'Video Games', 'Sport', 'Cryptography', 'Astronomy']},
					{name: 'Meriem', age: '23', hobbies: ['Sport', 'Hiking', 'Drawing', 'Cycling']},
					{name: 'Alice', age: '25', hobbies: ['Board games', 'Cooking', 'Fashion']},
					{name: 'Rich', age: '28', hobbies: ['Sport', 'Basketball', 'Ice skating']},
					{name: 'Jalel', age: '31', hobbies: ['Crossfit', 'Video Games', 'Sport', 'Cryptography', 'Astronomy']},
					{name: 'Meriem', age: '23', hobbies: ['Sport', 'Hiking', 'Drawing', 'Cycling']},
					{name: 'Alice', age: '25', hobbies: ['Board games', 'Cooking', 'Fashion']},
					{name: 'Rich', age: '28', hobbies: ['Sport', 'Basketball', 'Ice skating']}
				];
			};
			
			var bloqueadosControlador = function($scope){
				$scope.people = [
					{name: 'Jalel', age: '31', hobbies: ['Crossfit', 'Video Games', 'Sport', 'Cryptography', 'Astronomy']},
					{name: 'Meriem', age: '23', hobbies: ['Sport', 'Hiking', 'Drawing', 'Cycling']},
					{name: 'Alice', age: '25', hobbies: ['Board games', 'Cooking', 'Fashion']},
					{name: 'Rich', age: '28', hobbies: ['Sport', 'Basketball', 'Ice skating']},
					{name: 'Jalel', age: '31', hobbies: ['Crossfit', 'Video Games', 'Sport', 'Cryptography', 'Astronomy']},
					{name: 'Meriem', age: '23', hobbies: ['Sport', 'Hiking', 'Drawing', 'Cycling']},
					{name: 'Alice', age: '25', hobbies: ['Board games', 'Cooking', 'Fashion']},
					{name: 'Rich', age: '28', hobbies: ['Sport', 'Basketball', 'Ice skating']},
					{name: 'Jalel', age: '31', hobbies: ['Crossfit', 'Video Games', 'Sport', 'Cryptography', 'Astronomy']},
					{name: 'Meriem', age: '23', hobbies: ['Sport', 'Hiking', 'Drawing', 'Cycling']},
					{name: 'Alice', age: '25', hobbies: ['Board games', 'Cooking', 'Fashion']},
					{name: 'Rich', age: '28', hobbies: ['Sport', 'Basketball', 'Ice skating']},
					{name: 'Jalel', age: '31', hobbies: ['Crossfit', 'Video Games', 'Sport', 'Cryptography', 'Astronomy']},
					{name: 'Meriem', age: '23', hobbies: ['Sport', 'Hiking', 'Drawing', 'Cycling']},
					{name: 'Alice', age: '25', hobbies: ['Board games', 'Cooking', 'Fashion']},
					{name: 'Rich', age: '28', hobbies: ['Sport', 'Basketball', 'Ice skating']},
					{name: 'Jalel', age: '31', hobbies: ['Crossfit', 'Video Games', 'Sport', 'Cryptography', 'Astronomy']},
					{name: 'Meriem', age: '23', hobbies: ['Sport', 'Hiking', 'Drawing', 'Cycling']},
					{name: 'Alice', age: '25', hobbies: ['Board games', 'Cooking', 'Fashion']},
					{name: 'Rich', age: '28', hobbies: ['Sport', 'Basketball', 'Ice skating']},
					{name: 'Jalel', age: '31', hobbies: ['Crossfit', 'Video Games', 'Sport', 'Cryptography', 'Astronomy']},
					{name: 'Meriem', age: '23', hobbies: ['Sport', 'Hiking', 'Drawing', 'Cycling']},
					{name: 'Alice', age: '25', hobbies: ['Board games', 'Cooking', 'Fashion']},
					{name: 'Rich', age: '28', hobbies: ['Sport', 'Basketball', 'Ice skating']},
					{name: 'Jalel', age: '31', hobbies: ['Crossfit', 'Video Games', 'Sport', 'Cryptography', 'Astronomy']},
					{name: 'Meriem', age: '23', hobbies: ['Sport', 'Hiking', 'Drawing', 'Cycling']},
					{name: 'Alice', age: '25', hobbies: ['Board games', 'Cooking', 'Fashion']},
					{name: 'Rich', age: '28', hobbies: ['Sport', 'Basketball', 'Ice skating']},
					{name: 'Jalel', age: '31', hobbies: ['Crossfit', 'Video Games', 'Sport', 'Cryptography', 'Astronomy']},
					{name: 'Meriem', age: '23', hobbies: ['Sport', 'Hiking', 'Drawing', 'Cycling']},
					{name: 'Alice', age: '25', hobbies: ['Board games', 'Cooking', 'Fashion']},
					{name: 'Rich', age: '28', hobbies: ['Sport', 'Basketball', 'Ice skating']},
					{name: 'Jalel', age: '31', hobbies: ['Crossfit', 'Video Games', 'Sport', 'Cryptography', 'Astronomy']},
					{name: 'Meriem', age: '23', hobbies: ['Sport', 'Hiking', 'Drawing', 'Cycling']},
					{name: 'Alice', age: '25', hobbies: ['Board games', 'Cooking', 'Fashion']},
					{name: 'Rich', age: '28', hobbies: ['Sport', 'Basketball', 'Ice skating']},
					{name: 'Jalel', age: '31', hobbies: ['Crossfit', 'Video Games', 'Sport', 'Cryptography', 'Astronomy']},
					{name: 'Meriem', age: '23', hobbies: ['Sport', 'Hiking', 'Drawing', 'Cycling']},
					{name: 'Alice', age: '25', hobbies: ['Board games', 'Cooking', 'Fashion']},
					{name: 'Rich', age: '28', hobbies: ['Sport', 'Basketball', 'Ice skating']},
					{name: 'Jalel', age: '31', hobbies: ['Crossfit', 'Video Games', 'Sport', 'Cryptography', 'Astronomy']},
					{name: 'Meriem', age: '23', hobbies: ['Sport', 'Hiking', 'Drawing', 'Cycling']},
					{name: 'Alice', age: '25', hobbies: ['Board games', 'Cooking', 'Fashion']},
					{name: 'Rich', age: '28', hobbies: ['Sport', 'Basketball', 'Ice skating']},
					{name: 'Jalel', age: '31', hobbies: ['Crossfit', 'Video Games', 'Sport', 'Cryptography', 'Astronomy']},
					{name: 'Meriem', age: '23', hobbies: ['Sport', 'Hiking', 'Drawing', 'Cycling']},
					{name: 'Alice', age: '25', hobbies: ['Board games', 'Cooking', 'Fashion']},
					{name: 'Rich', age: '28', hobbies: ['Sport', 'Basketball', 'Ice skating']},
					{name: 'Jalel', age: '31', hobbies: ['Crossfit', 'Video Games', 'Sport', 'Cryptography', 'Astronomy']},
					{name: 'Meriem', age: '23', hobbies: ['Sport', 'Hiking', 'Drawing', 'Cycling']},
					{name: 'Alice', age: '25', hobbies: ['Board games', 'Cooking', 'Fashion']},
					{name: 'Rich', age: '28', hobbies: ['Sport', 'Basketball', 'Ice skating']}
				];
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











<!-- 
<html>
	<head>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Gente</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	</head>
	<body>
		<% 
			if(session.getAttribute("usuario")==null){
				response.sendRedirect("https://sistemaflashcards.herokuapp.com");
			}
		%>
		<nav class="navbar navbar-default">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="#">WebSiteName</a>
	    		</div>
	    		<ul class="nav navbar-nav">
	      			<li><a href="inicio.html">Inicio</a></li>
	      			<li><a href="miPerfil.html">Mi Perfil</a></li>
	      			<li class="active"><a href="gente.html">Gente</a></li>
	      			<li><a href="clubes.html">Clubes</a></li>
	      			<li><a href="modificar.html">Modificar Perfil</a></li>
	      			<li><a href="gestionar.html" id="btn-Gestion">Gestionar Cuentas</a></li>
	    		</ul>
	    		<ul class="nav navbar-nav navbar-right">
	    			<li><a href="eliminar.html" onclick="return confirm('¿Desea Eliminar la Cuenta?'+'\nNota: Si da a aceptar, dispone de 14 días para recuperar la cuenta, iniciando sesión de nuevo o se eliminará definitivamente. Recibirá un email con la informacion.');">Eliminar Cuenta</a></li>
	      			<li><a href="cerrarSesion.html" onclick="return confirm('¿Desea Cerrar Sesión?');">Cerrar Sesión</a></li>
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
		
		<input type="text" placeholder="Busca a...">
		
		
		<h1>PERSONAS</h1>
		<c:if test="${not empty usuarios}">
			<table>
			    <c:forEach items="${usuarios}" var="user">
			    	<tr>
			    		<td> ${user.getNombreApellidos()} </td>
			    		<td>
					    	<form action="peticionAmistad.html" method="POST">
					    		<input id="peticion" name="peticion" type="hidden" value="${user.getUsuario()}">
								<input id="usuario" name="usuario" type="hidden" value="${usuario.getUsuario()}">
							    <input type="submit" name="action" value="Añadir Amigo" />
							</form>
						</td>
						<td>
							<form action="bloquear.html" method="POST">
					    		<input id="bloquear" name="bloquear" type="hidden" value="${user.getUsuario()}">
								<input id="usuario" name="usuario" type="hidden" value="${usuario.getUsuario()}">
							    <input type="submit" name="action" value="Bloquear Usuario" />
							</form>
						</td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
		<h1>PETICIONES ENVIADAS</h1>
		<br>
		<c:if test="${not empty enviadas}">
			<table>
			    <c:forEach items="${enviadas}" var="peticion">
			    	<tr>
				    	<td>
				    		${peticion.getRecibe()}
				    	</td>
				    	<td>
					    	<form action="eliminarPeticion.html" method="POST">
					    		<input id="envia" name="envia" type="hidden" value="${peticion.getEnvia()}">
					    		<input id="recibe" name="recibe" type="hidden" value="${peticion.getRecibe()}">
								<input id="usuario" name="usuario" type="hidden" value="${peticion.getEnvia()}">
							    <input type="submit" name="action" value="Eliminar Petición" />
							</form>
						</td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
		<h1>PETICIONES PENDIENTES</h1>
		<br>
		<c:if test="${not empty pendientes}">
			<table>
			    <c:forEach items="${pendientes}" var="pend">
			    	<tr>
				    	<td>
				    		${pend.getNombre()} ${pend.getApellidos()}
				    	</td>
				    	<td>
					    	<form action="aceptar.html" method="POST">
					    		<input id="peticion" name="peticion" type="hidden" value="${pend.getUsuario()}">
								<input id="usuario" name="usuario" type="hidden" value="${usuario.getUsuario()}">
							    <input type="submit" name="action" value="Aceptar Petición" />
							</form>
						</td>
						<td>
							<form action="rechazar.html" method="POST">
					    		<input id="peticion" name="peticion" type="hidden" value="${pend.getUsuario()}">
								<input id="usuario" name="usuario" type="hidden" value="${usuario.getUsuario()}">
							    <input type="submit" name="action" value="Rechazar Petición" />
							</form>
						</td>
						<td>
							<form action="bloquearPeticion.html" method="POST">
					    		<input id="bloquear" name="bloquear" type="hidden" value="${pend.getUsuario()}">
								<input id="usuario" name="usuario" type="hidden" value="${usuario.getUsuario()}">
							    <input type="submit" name="action" value="Bloquear Usuario" />
							</form>
						</td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
		<h1>AMIGOS</h1>
		<br>
		<c:if test="${not empty amigos}">
			<table>
			    <c:forEach items="${amigos}" var="amigo">
			    	<tr>
				    	<td>
				    		${amigo.getNombre()} ${amigo.getApellidos()}
				    	</td>
				    	<td>
					    	<form action="eliminarAmigo.html" method="POST">
					    		<input id="eliminar" name="eliminar" type="hidden" value="${amigo.getUsuario()}">
								<input id="usuario" name="usuario" type="hidden" value="${usuario.getUsuario()}">
							    <input type="submit" name="action" value="Eliminar Amigo" />
							</form>
						</td>
						<td>
							<form action="bloquearAmigo.html" method="POST">
					    		<input id="bloquear" name="bloquear" type="hidden" value="${amigo.getUsuario()}">
								<input id="usuario" name="usuario" type="hidden" value="${usuario.getUsuario()}">
							    <input type="submit" name="action" value="Bloquear Amigo" />
							</form>
						</td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
		<h1>BLOQUEADOS</h1>
		<br>
		<c:if test="${not empty bloqueados}">
			<table>
			    <c:forEach items="${bloqueados}" var="bloqueado">
			    	<tr>
				    	<td>
				    		${bloqueado.getNombre()} ${bloqueado.getApellidos()}
				    	</td>
						<td>
							<form action="desbloquear.html" method="POST">
								<input id="bloqueado" name="bloqueado" type="hidden" value="${bloqueado.getUsuario()}">
								<input id="usuario" name="usuario" type="hidden" value="${usuario.getUsuario()}">
							    <input type="submit" name="action" value="Desbloquear" />
							</form>
						</td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
	</body>
</html> -->