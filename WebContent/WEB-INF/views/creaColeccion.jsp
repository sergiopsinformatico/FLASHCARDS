<html>
	<head>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	    <title>Crear Colección de Flashcards - Flashcards</title>
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

	<body ng-app="myAppCard">
		<%@ page import="com.flashcards.modelo.Usuario" %>
		<% 
			Usuario user = ((Usuario)(session.getAttribute("usuario")));
			if(user==null || user.getUsuario().equals("")){
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
	    </style>
		<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
	      <button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#navbarsExample03" aria-controls="navbarsExample03" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="navbar-toggler-icon"></span>
	      </button>
	
	      <div class="navbar-collapse collapse" id="navbarsExample03" style="width: 100%;">
	        <ul class="navbar-nav mr-auto">
	          <li class="nav-item">
	    		<a class="nav-link" href="inicio.html?usuario=${usuario.getUsuario()}">
					Inicio
				</a>
	          </li>
	          <li class="nav-item active">
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
	            <a class="nav-link dropdown-toggle" href="" id="dropdown03" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Bienvenido ${usuario.getNombreApellidos()} </a>
	            <div class="dropdown-menu dropdown-primary" aria-labelledby="dropdown03">
	              <a class="dropdown-item" href="miPerfil.html?usuario=${usuario.getUsuario()}">Mi Perfil</a>
	              <a class="dropdown-item" href="configuracion.html?usuario=${usuario.getUsuario()}">Configuración</a>
	              <div class="dropdown-divider"></div>
				  <a class="dropdown-item" href="cerrarSesion.html" onclick="return confirm('¿Desea Cerrar Sesión?');">Cerrar Sesión</a>
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
			<!-- <div class="col-sm-1"></div>-->
			<div class="col-md-1"></div>
			<!-- <div class="col-sm-11"> -->
			<div class="col-md-11">
				<br>
				<h3 align="center">Creación de una Colección de Flashcards</h3>
				<br>
			</div>
		</div>
		<div class="row" ng-controller="showCtrl">
			<!-- <div class="col-sm-1"></div>-->
			<div class="col-md-1"></div>
			<!-- <div class="col-sm-11"> -->
			<div class="col-md-11">
				<div class="row">
					<!-- <div class="col-sm-5"> -->
					<div class="col-md-5">
						<div class="row">
							<!-- <div class="col-sm-6"> -->
							<div class="col-md-6">
								<h6 align="center" style="font-weight: bold;">Vista Previa de la Tarjeta</h6>
								<div class="scene scene--card">
								  <div class="card text-center">
								    <div class="card__face card__face--front align-items-center justify-content-center">
								    	<br>
								    	<p class="card-text">{{ newAnverso }}</p>
									</div>
								    <div class="card__face card__face--back align-items-center justify-content-center">
								    	<br>
								    	<p class="card-text">{{ newReverso }}</p>
									</div>
								  </div>
								</div>
							</div>
							<!-- <div class="col-sm-6"> -->
							<div class="col-md-6">
							<br><br>
								<div class="form-group">
									<textarea class="form-control" id="anverso" style="width:100%;" name="anverso" maxlength="250" rows="6" ng-model="newAnverso"></textarea>
									<small id="creadorHelp" class="form-text text-muted">{{ newAnverso.length }} carácteres de 250 carácteres máximo.</small>
								</div>
								<div class="form-group">
									<textarea class="form-control" id="reverso" style="width:100%;" name="reverso" maxlength="250" rows="6" ng-model="newReverso"></textarea>
									<small id="creadorHelp" class="form-text text-muted">{{ newReverso.length }} carácteres de 250 carácteres máximo.</small>
								</div>
								<button type="submit" class="btn btn-primary" ng-click="Add()">Insertar</button>
								<button type="submit" class="btn btn-primary" ng-click="Reset()">Limpiar Campos</button>
							</div>
						</div>
					</div>
					<!-- <div class="col-sm-1"></div> -->
					<div class="col-md-1"></div>
					<!-- <div class="col-sm-5"> -->
					<div class="col-md-5">
						<div id="myVisorCards" class="row" style="text-align: center;">
							<div ng-if="records.length == 0">
								<h6 align="center" style="font-weight: bold;">Aun no hay tarjetas creadas</h6>
							</div>
							<div ng-if="records.length > 0">
								<h6 align="center" style="font-weight: bold;">Colección de Tarjetas: {{ records.length }} </h6>
								<br>
								    <style>						    								    	
								    	.container{
										     min-width:260px;
										     max-width:260px;
										     widt:260px;
										     min-height:450px;
											 max-height:450px;
											 height:450px;
									     }
								    	
										.card-flip > div {
										  backface-visibility: hidden;
										  transition: transform 300ms;
										  transition-timing-function: linear;
										  width: 100%;
										  height: 100%;
										  margin: 0;
										  display: flex;
										}
										
										.card-front {
										  transform: rotateY(0deg);
										}
										
										.card-back {
										  transform: rotateY(180deg);
										  position: absolute;
										  top: 0;
										}
										
										.card-flip:hover .card-front {
										  transform: rotateY(-180deg);
										}
										  
										.card-flip:hover .card-back {
										  transform: rotateY(0deg);
										}								
								</style>
					    		<div id="myCarousel" class="carousel slide">
							        <div class="container">
							            <div class="carousel-inner row w-100 mx-auto">
							            	<!-- <div class="carousel-item active">
							                    <div class="card bg-success">
										          <div class="card-body">
										            <h4 class="card-title">Coleccion de Tarjetas</h4>
										          </div>
										        </div>
											</div>-->
											<div class="carousel-item" ng-repeat="tarjeta in records | filter:expression">
										        <div class="card card-flip h-100">
									                <div class="card-front bg-danger card text-center">
									                    <div class="card-body">
									                        <p class="card-text">{{ tarjeta.anverso }}</p>
									                    </div>
									                </div>
									                <div class="card-back bg-info card text-center">
									                    <div class="card-body">
									                        <p class="card-text">{{ tarjeta.reverso }}</p>
									                        <br>
									                       <button type="submit" class="btn btn-primary" ng-click="Delete(tarjeta)">Eliminar Tarjeta</button>
									                    </div>
									                </div>
									            </div>								
							                </div>
							            </div>
								        <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
									      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
									      <span class="sr-only">Previous</span>
									    </a>
									    <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
									      <span class="carousel-control-next-icon" aria-hidden="true"></span>
									      <span class="sr-only">Next</span>
									    </a>
								    </div>
								</div>
							</div>
							<script>
								$('.carousel-item').first().addClass('active');
							</script>
						</div>
					</div>
					<!-- <div class="col-sm-1"></div> -->
					<div class="col-md-1"></div>
				</div>
			</div>
		</div>
		<div class="row">
			<!-- <div class="col-sm-1"> -->
			<div class="col-md-1">
			</div>
			<!-- <div class="col-sm-11">-->
			<div class="col-md-11">
				<form action="guardarFlashcard.html" method="post" name="form1" id="form1">
					<div class="row">
						<div class="col-md-3">
						<!-- <div class="col-sm-3"> -->
							<div class="form-group">
							    <label for="creador">Creador</label>
							    <input type="text" class="form-control" id="creador" aria-describedby="emailHelp" value="${usuario.getUsuario()}" disabled>
								<small id="creadorHelp" class="form-text text-muted">El creador de la colección será el usuario registrado</small>
							</div>
							<br>
							<div class="form-group">
							    <label for="nombre">Nombre de la Colección</label>
							    <input type="text" class="form-control" name="nombre" id="nombre" aria-describedby="emailHelp" placeholder="Nombre" required>
							</div>
							<br><br>
							<button type="submit" class="btn btn-primary">Guardar Colección</button>
						</div>
						<div class="col-md-1"></div>
						<div class="col-md-3">
							<div class="form-group">
								<label for="descripcion">Descripción</label>
							    <textarea class="form-control" name="descripcion" id="descripcion" rows="3" maxlength="100" style="resize: none;" required></textarea>
							</div>
						</div>
						<div class="col-md-1"></div>
						<div class="col-md-3">
							<script>
							    function option(that) {
							        if (that.value == "club") {
							            document.getElementById("club").style.display = "block";
							            document.getElementById("usuario").style.display = "none";
							        } else if(that.value == "usuario"){
							        	document.getElementById("club").style.display = "none";
							            document.getElementById("usuario").style.display = "block";
							        }else{
							        	document.getElementById("club").style.display = "none";
							            document.getElementById("usuario").style.display = "none";
							        }
							    }
							</script>
							<div class="form-group">
								<label for="shareWith">Compartir con</label>
								<select class="form-control" name="shareWith" id="shareWith" onchange="option(this);" required>
							    	<option value="publico">Todo el Mundo</option>
									<option value="privado">Solo yo</option>
									<option value="club">Club</option>
									<option value="usuario">Usuario</option>
								</select>
							</div>
							<script language="JavaScript" type="text/javascript">
								change();
							</script>
							<br><br>
							<div class="form-group" style="min-width: 100%;" id="club" ng-controller="clubCtrl">
								<div ng-if="clubes.length == 0"> 
							        No pertenece a ningún club.
							        <br>
							    </div>
							     <div ng-if="clubes.length > 0">
									<label for="selectClub">Nombre del Club</label>
									<input class="form-control" style="min-width: 100%;" ng-model="expression" placeholder="Buscar club..." />
									<select multiple class="form-control" style="min-width: 100%;" name="selectClub" id="selectClub">
										<option ng-repeat="club in clubes | filter:expression" value="{{ club.identificador }}">{{ club.name }}</option>
									</select>
								</div>
							</div>
							<div class="form-group" style="min-width: 100%;" id="usuario" ng-controller="usuarioCtrl">
								<div ng-if="people.length == 0"> 
							        No tiene aún amigos.
							        <br>
							    </div>
							     <div ng-if="people.length > 0">
									<label for="selectUsuario">Nombre del Usuario</label>
									<input class="form-control" style="min-width: 100%;" ng-model="expression" placeholder="Buscar usuario..." />
									<select multiple class="form-control" style="min-width: 100%;" name="selectUsuario" id="selectUsuario">
										<option ng-repeat="person in people | filter:expression" value="{{ person.usuario }}">{{ person.name }} ({{ person.usuario }})</option>
									</select>
								</div>
							</div>							
						</div>
						<div class="col-md-1"></div>
					</div>
				</form>
			</div>
		</div>
		
		<script>
			function change(){
				document.form1.shareWith.value = "publico";
				option(document.form1.shareWith);
			}
			change();
			document.form1.nombre.value = "${name}";
			document.form1.descripcion.value = "${description}";
			document.form1.shareWith.value = "${shareWith}";
		    option(document.form1.shareWith);
		    var optionWith = "${shareOptionWith}";
		    var optionGeneric = "${shareWith}";
		    var vacio = optionWith.localeCompare("");
		    if(vacio != 0){
		    	var club = "club";
		    	var usuario = "usuario";
		    	var isClub = optionGeneric.localeCompare(club);
		    	var isUsuario = optionGeneric.localeCompare(usuario);
		    	if(isClub == 0){
		    		document.getElementById("selectClub").value = optionWith;
		    	}else{
		    		if(isUsuario == 0){
		    			document.getElementById("selectUsuario").value = optionWith;
		    		}
		    	}		    		
		    }
		    
		</script>
		<script>
			
			var showControlador = function($scope, $http){
				$scope.newAnverso="Anverso de la Tarjeta";
				$scope.newReverso="Reverso de la Tarjeta";
				$scope.setInterval = false;
				
				$scope.records=[];
				
				var tarjetas ="${cards}";
				var i = 0;
				if(tarjetas != ""){
					var t = tarjetas.split("///****nuevaCARD****///");
					for(i=0; i<t.length; i++){
						var c = t[i];
						var tj = c.split("///****resp****///");
						$scope.records.push({
			                anverso: tj[0],
			                reverso: tj[1]
			            });
					}
				}
				
				var card = document.querySelector('.card');
				card.addEventListener( 'click', function() {
					  card.classList.toggle('is-flipped');
					});
				
				$scope.Reset = function () {
		            $scope.newAnverso = '';
		            $scope.newReverso = '';
		        };
				
				$scope.Add = function () {
		            if (!$scope.newAnverso || !$scope.newReverso)
		                return;
		            
		            $scope.records.push({
		                anverso: $scope.newAnverso,
		                reverso: $scope.newReverso
		            });
		            
		           $http.post('https://sistemaflashcards.herokuapp.com/tarjeta.html', 
			            {
			            	anverso: $scope.newAnverso,
			            	reverso: $scope.newReverso
			            });          
		  	            $scope.Reset();
		  	          
		        };
		        
		        $scope.Delete = function (tarjeta) {
		        	var indice = $scope.records.indexOf(tarjeta);
		        	$scope.records.splice(indice, 1);
		            $http.post('https://sistemaflashcards.herokuapp.com/eliminarTarjeta.html', 
			            {
			            	anverso: tarjeta.anverso,
			            	reverso: tarjeta.reverso
			            });
		            
		        };
				
			};
			
			var usuarioControlador = function ($scope){
				$scope.people = [];
				var cadena = "${amigos}";
		        var array = cadena.split("///****nuevoAmigo****///");
		        var i;
		        if(cadena != ""){
			        for (i = 0; i < array.length; i++) { 
			        	var person = array[i].split("///****user****///");
			        	$scope.people.push({
			        		name: person[0],
			        		usuario: person[1]
			        	});
			        }
		        }
			};
			
			var clubControlador = function ($scope){
				$scope.clubes = [];
				var cadena = "${clubes}";
		        var array = cadena.split("///****nuevoCLUB****///");
		        var i;
		        if(cadena != ""){
			        for (i = 0; i < array.length; i++) { 
			        	var club = array[i].split("///****id****///");
			        	$scope.clubes.push({
			        		name: club[0],
			        		identificador: club[1]
			        	});
			        }
		        }
			};
			
			var app = angular.module('myAppCard', []);
			app.controller('clubCtrl', clubControlador);
			app.controller('usuarioCtrl', usuarioControlador);
			app.controller('showCtrl', showControlador);
		</script>
	</body>
</html>