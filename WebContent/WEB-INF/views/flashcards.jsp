<html>
	<head>
		<title>Menu Flashcards - Flashcards</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
	</head>
	<body>
		<%@ page import="com.flashcards.modelo.UsuarioDTO" %>
		<% 
			UsuarioDTO user = ((UsuarioDTO)(session.getAttribute("usuario")));
			if(user==null || user.getNombreUsuario().equals("")){
				response.sendRedirect("https://sistemaflashcards.herokuapp.com");
			}
			session.setAttribute("usuario", user);
		%>
		<script language="JavaScript" type="text/javascript">
			if("${mensaje}" != ""){
				alert("${mensaje}");
			}
		</script>
		
		<style>
			div.center {
			    text-align: center;
			}
			
			.navbar-nav > li > a, .navbar-brand {
			    padding-top:4px !important; 
			    padding-bottom:0 !important;
			    height: 28px;
			}
			.navbar {min-height:28px !important;}	
			
						
			.card {
			  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
			  max-width: 300px;
			  margin: auto;
			  text-align: center;
			  font-family: arial;
			}
			
			.title {
			  color: grey;
			  font-size: 10px;
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
			<div class="collapse navbar-collapse" id="collapsibleNavbar">
			    <ul class="navbar-nav mr-auto">
					<li class="nav-item">
						<a class="nav-link" href="inicio.html?usuario=${usuario.getNombreUsuario()}">
							Inicio
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link active" href="flashcards.html?usuario=${usuario.getNombreUsuario()}">
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
                    	<a href="#" class="nav-link dropdown-toggle " id="navDropDownLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Hola ${usuario.getNombreApellidos()}!!!</a>
	                    <div class="dropdown-menu" aria-labelledby="navDropDownLink">
	                        <a class="dropdown-item" href="miPerfil.html?usuario=${usuario.getNombreUsuario()}">Mi Perfil</a>
	                        <a class="dropdown-item" href="configuracion.html?usuario=${usuario.getNombreUsuario()}">Configuración</a>
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
			<br><br><br><br>
		</div>
		<div class="row">
			<div class="col-md-3">
				<div class="card">
					<img src="/resources/img/cards.jpg" alt="Perfil" style="width:100%">
					<h4>Crear Flashcards</h4>
					<br>
						<p class="title">Crea tu propia colección de Flashcards y compártela con quién quieras (club, un amigo, con todos o sólo para tí)</p>
					<br>
					<div style="margin: 24px 0;">
						<h6><a href="crearColeccion.html">Pincha Aquí</a></h6> 
					</div>
				</div>
			</div>
			<div class="col-md-3">
				
			</div>
			<div class="col-md-3">
				
			</div>
			<div class="col-md-3">
				
			</div>
		</div>
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		<!-- 
		<div class="row">
			<div class="col-md-2">
			</div>
			<div class="col-md-3">
				<div class="row">
					<div class="col-md-12" style="width:100%">
						<form action="crearColeccion.html">
							<button class="btn btn-lg btn-primary btn-block btn-signin" type="submit">Crear Coleccion Flashcards</button>
						</form>
					</div>
				</div>
				<div class="row" ng-app="myFlashApp" ng-controller="flashCtrl">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<input class="form-control" ng-model="expression" placeholder="Buscar Colecciones Disponibles..." />
						</div>
						<div class="panel-body fixed-panel">
							<table class="table table-bordered table-striped">
								<tbody>
									<tr ng-repeat="flash in flashes | filter:expression">
										<td>
											<a href="https://sistemaflashcards.herokuapp.com/verFlashcard.html?usuario=${usuario.getUsuario()}&id={{ flash.id }}&card=0">{{ flash.name }}</a>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-2">
			</div>
			<div class="col-md-3">
				<div class="row">
					<div class="col-md-12" style="width:100%">
						<form action="serModerador.html" method="post" class="border-login" id="form2">
							<input id="usuario" name="usuario" type="hidden" value="${usuario.getUsuario()}">
						  	<button type="submit" class="btn btn-success">
						  		Solicitar Ser Moderador
						  	</button>
						</form>
						<div id="form3">
							<h6>Debe esperar a la contestación de solicitud para ser moderador.</h6>
						</div>
					</div>
				</div>
				<div class="row" ng-app="myFlashApp" ng-controller="evaluaCtrl" id="form5">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<input class="form-control" ng-model="expression" placeholder="Colecciones para Evaluar..." />
						</div>
						<div class="panel-body fixed-panel">
							<table class="table table-bordered table-striped">
								<tbody>
									<tr ng-repeat="evalua in evaluar | filter:expression">
										<td>
											<a href="https://sistemaflashcards.herokuapp.com/verFlashcard.html?usuario=${usuario.getUsuario()}&id={{ flash.id }}&card=0">{{ flash.name }}</a>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-2">
			</div>
		</div>
		<div class="row">
			<div class="col-md-4">
			</div>
			<div class="col-md-4">
				
			</div>
			<div class="col-md-4">
			</div>
		</div>
		<script language="JavaScript" type="text/javascript">
			var comp = ${solicitado};
			var comp2 = ${usuario.isModerador()};
			
			if(comp){
				document.getElementById("form2").style.visibility="hidden";
				document.getElementById("form3").style.visibility="visible";
				document.getElementById("form5").style.visibility="hidden";
			}else if (comp2){
				document.getElementById("form2").style.visibility="hidden";
				document.getElementById("form3").style.visibility="hidden";
				document.getElementById("form5").style.visibility="visible";
			}else{
				document.getElementById("form2").style.visibility="visible";
				document.getElementById("form3").style.visibility="hidden";
				document.getElementById("form5").style.visibility="hidden";
			}
		</script>
		
		<script>
			var flashesControlador = function($scope){
				$scope.flashes = [];
				var cadena = "${listaFlashcards}";
				var array = cadena.split("****////nCol////****");
				var i;
		        if(cadena != ""){
			        for (i = 0; i < array.length; i++) { 
			        	var user = array[i].split("****////identificador////****");
			        	$scope.flashes.push({
			        		name: user[0],
			        		id: user[1]
			        	});
			        }
		        }
			};
			
			var evaluaControlador = function($scope){
				$scope.evaluar = [];
				var cadena = "${evaluarFlashcards}";
				var array = cadena.split("****////nCol////****");
				var i;
		        if(cadena != ""){
			        for (i = 0; i < array.length; i++) { 
			        	var user = array[i].split("****////identificador////****");
			        	$scope.evaluar.push({
			        		name: user[0],
			        		id: user[1]
			        	});
			        }
		        }
			};
			
			var app = angular.module('myFlashApp', []);
			app.controller('flashCtrl', flashesControlador);
			app.controller('evaluaCtrl', evaluaControlador);
		</script>
		-->
	</body>
</html>