<html>
	<head>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	    <title>Crear Tarjeta - Flashcard</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">	
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
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
		    .list_data { margin-bottom: 2rem }
		    table, th, td { border: 1px solid #AAA }
		    th { cursor: pointer }
		    div.left {
			    text-align: left;
			}
			.navbar-nav > li > a, .navbar-brand {
			    padding-top:4px !important; 
			    padding-bottom:0 !important;
			    height: 28px;
			}
			.navbar {min-height:28px !important;}
			div.center {
			    text-align: center;
			}
			textarea {
			   resize: none;
			}
			.scene {
			  width: 200px;
			  height: 350px;
			  border: 1px solid #CCC;
			  margin: 40px 0;
			  perspective: 600px;
			}
			
			.card {
			  width: 100%;
			  height: 100%;
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
			  font-size: 60px;
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
		<nav class="navbar navbar-expand-md bg-dark navbar-dark">
			<div class="collapse navbar-collapse" id="collapsibleNavbar">
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
                    	<a href="#" class="nav-link dropdown-toggle" id="navDropDownLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Hola ${usuario.getUsuario()}!!!</a>
	                    <div class="dropdown-menu" aria-labelledby="navDropDownLink">
	                        <a class="dropdown-item" href="miPerfil.html?usuario=${usuario.getUsuario()}">Mi Perfil</a>
	                        <a class="dropdown-item" href="configuracion.html?usuario=${usuario.getUsuario()}">Configuraci�n</a>
	                        <div class="dropdown-divider"></div>
	                        <a class="dropdown-item" href="cerrarSesion.html" onclick="return confirm('�Desea Cerrar Sesi�n?');">Cerrar Sesi�n</a>
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
			<br>
		</div>
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-4"></div>
			<div class="col-md-2"></div>
			<div class="col-md-4">
				<div class="row">
					<div class="col-md-6">
						<div class="scene scene--card">
						  <div class="card">
						    <div class="card__face card__face--front">
								newEnunciado
							</div>
						    <div class="card__face card__face--back">
								newRespuesta
							</div>
						  </div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="row">
							<textarea rows="2" cols="50" id="enunciado" name="enunciado" placeholder="Anverso..." form="form2" ng-model="newEnunciado"></textarea>
						</div>
						<div class="row">
							<textarea rows="4" cols="50" id="respuesta" name="respuesta" placeholder="Reverso..." form="form3" ng-model="newRespuesta"></textarea>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-1"></div>
		</div>
		
		<script>
			var card = document.querySelector('.card');
			card.addEventListener( 'click', function() {
				  card.classList.toggle('is-flipped');
				});
		</script>
		
		
		
		
		<!-- 
		<div class="row">
			<div class="col-md-1">
				<br><br>
			</div>
			<div class="col-md-11">
				<br><h1>CREACI�N DE UNA COLECCI�N DE FLASHCARDS</h1><br>
			</div>
		</div> 
		<div class="row">
			<div class="col-md-1">
			</div>
			<div class="col-md-10">
				<div class="container">
			        <div class="card card-container">
							<div class="row">
								<div class="col-md-1"></div>
								<div class="col-md-4">
									<form action="guardarFlashcard.html" method="post" class="border-login" name="form1" id="form1">
										<br>
										<div class="form-group">
											<label for="creador" class="cols-sm-2 control-label">Creador</label>
											<div class="cols-sm-10">
												<div class="input-group">
													<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
													<input type="text" class="form-control" name="creador" id="creador" value=${usuario.getUsuario()} disabled/>
												</div>
											</div>
										</div>
										<div class="form-group">
											<label for="nombre" class="cols-sm-2 control-label">Nombre de la Colecci�n</label>
											<div class="cols-sm-10">
												<div class="input-group">
													<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
													<input type="text" class="form-control" name="nombre" id="nombre" placeholder="Nombre de la Colecci�n" required />
												</div>
											</div>
										</div>
										<div class="form-group">
											<label for="descripcion" class="cols-sm-2 control-label">Descripci�n</label>
											<div class="cols-sm-10">
												<div class="input-group">
													<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
													<style>
														textarea {
														   resize: none;
														}
													</style>
													<textarea rows="4" cols="50" id="descripcion" class="form-control" name="descripcion" form="form1" placeholder="Descripci�n" required></textarea>
												</div>
											</div>
										</div>
										<div class="form-group">
											<label for="shareWith" class="cols-sm-2 control-label">Compartir con:</label>
											<div class="cols-sm-10">
												<div class="input-group">
													<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
													<select name="shareWith" id="shareWith" onchange="option(this);" required>
													    <option value="publico">Todo el Mundo</option>
													    <option value="privado">Solo yo</option>
													    <option value="club">Club</option>
													    <option value="usuario">Usuario</option>
													  </select>
												</div>
											</div>
										</div>
										<div class="panel panel-primary" id="club" ng-controller="clubCtrl">
											<div ng-if="clubes.length == 0"> 
										        No pertenece a ning�n club.
										        <br>
										        <script language="JavaScript" type="text/javascript">
													change();
												</script>
										    </div>
										    <div ng-if="clubes.length > 0">
												<div class="panel-heading">
													<br>Nombre del Club<br>
													<input class="form-control" ng-model="expression" placeholder="Buscar..." />
												</div>
												<div class="panel-body" style="max-height: 200px;overflow-y: scroll;overflow: -moz-scrollbars-vertical;">
													<table class="table table-bordered table-striped">
														<tbody>
															<tr ng-repeat="club in clubes | filter:expression">
																<td><input type="radio" class="form-control" name="selectClub" value="{{ club.identificador }}" /></td>
																<td>{{ club.name }}</td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
										</div>									
										<div class="panel panel-primary" id="usuario" ng-controller="usuarioCtrl">
											<div ng-if="people.length == 0"> 
										        No tiene a�n amigos.
										        <br>
										        <script language="JavaScript" type="text/javascript">
													change();
												</script>
										    </div>
											<div ng-if="people.length > 0">
												<div class="panel-heading">
													<br>Nombre del Usuario<br>
													<input class="form-control" ng-model="expression" placeholder="Buscar..." />
												</div>
												<div class="panel-body" style="max-height: 200px;overflow-y: scroll;overflow: -moz-scrollbars-vertical;" >
													<table class="table table-bordered table-striped">
														<tbody>
															<tr ng-repeat="person in people | filter:expression">
																<td><input type="radio" class="form-control" name="selectUsuario" value="{{ person.usuario }}" /></td>
																<td>{{ person.name }} ({{ person.usuario }})</td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
										</div>
										<div class="form-group">
											<div class="cols-sm-10">
												<div class="input-group">
													<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
													<br> <button type="submit" class="btn btn-primary">Guardar Coleccion</button>
												</div>
											</div>
										</div>
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
									</form>
								</div>
								<div class="col-md-2"></div>
								<div class="col-md-4">
									<div ng-controller="recordCtrl">				  
									    <div class="add_data">
									    	<br>
									        <h5>Insertar Nueva Tarjeta</h5>
									        <form>
									            <div class="field">
									                <label for="enunciado">Enunciado: </label><br>
									                <textarea rows="2" cols="50" id="enunciado" name="enunciado" placeholder="Enunciado" form="form2" ng-model="newEnunciado"></textarea>
									            </div>
									             <div class="field">
									                <label for="respuesta">Respuesta: </label><br>
									                <textarea rows="4" cols="50" id="respuesta" name="respuesta" placeholder="Respuesta" form="form3" ng-model="newRespuesta"></textarea>
									            </div>
									            <div class="action">
									                <button ng-click="Add()">Insertar</button>
									                <button ng-click="Reset()">Limpiar Campos</button>
									            </div>
									        </form>
									    </div>
									    <div class="list_data">
									    	<br><h5>Lista de Tarjetas</h5><br>
									        <div ng-if="records.length == 0"> 
										        A�n, no hay creada ninguna tarjeta. Como m�nimo, la colecci�n debe estar formada por una tarjeta.
										    </div>
										    <div ng-if="records.length > 0">
										        <table>
										            <tr>
										                <th ng-click="type = 'enunciado'; reverse = !reverse">Enunciado</th>
										                <th ng-click="type = 'respuesta'; reverse = !reverse">Respuesta</th>
										                <th>Eliminar</th>
										            </tr>
										            <tr ng-repeat="record in records">
										                <td>{{record.enunciado}}</td>
										                <td>{{record.respuesta}}</td>
										                <td><button ng-click="Delete($index)">Eliminar Tarjeta</button></td>
										            </tr>
										        </table>
										    </div>
									        <button ng-show="history.length > 0" ng-click="Undo()">Deshacer Tarjeta Eliminada</button>
									    </div>
									</div>
								</div>
								<div class="col-md-1"></div>
							</div>
					</div>
				</div>
			</div>
			<div class="col-md-1">
			</div>
		</div>
		<script>
			document.form1.nombre.value = "${name}";
			document.form1.descripcion.value = "${description}";
			document.form1.shareWith.value = "${shareOption}";
		    option(document.form1.shareWith);
		    var optionWith = "${shareOptionWith}";
		    var optionGeneric = "${shareOption}";
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
			function change(){
				document.form1.shareWith.value = "publico";
			}
		
			var recordControlador = function ($scope, $http) {
	
		        $scope.history = [];
	
		        $scope.records = [];
		        
		        var cadena = "${cards}";
		        var array = cadena.split("///****nuevaCARD****///");
		        var i;
		        if(cadena != ""){
			        for (i = 0; i < array.length; i++) { 
			        	var elemento = array[i].split("///****resp****///");
			        	$scope.records.push({
			        		enunciado: elemento[0],
			        		respuesta: elemento[1]
			        	});
			        }
		        }
		        
		        $scope.Delete = function (index) {
		            // Remove first / oldest element from history if it reaches maximum capacity of 10 records
		            if ($scope.history.length === 10)
		                $scope.history.shift();
	
		            var eliminar = $scope.records[index];
		            $http.post('https://sistemaflashcards.herokuapp.com/eliminarTarjeta.html', 
			            {
			            	enunciado: eliminar.enunciado,
			            	respuesta: eliminar.respuesta
			            });
		            $scope.history.push(eliminar);
		            $scope.records.splice(index, 1);
		        };
	
		        $scope.Reset = function () {
		            $scope.newEnunciado = '';
		            $scope.newRespuesta = '';
		        }
		        $scope.Reset();
	
		        $scope.Add = function () {
		            if (!$scope.newEnunciado || !$scope.newRespuesta)
		                return;
		            
		            $scope.records.push({
		                enunciado: $scope.newEnunciado,
		                respuesta: $scope.newRespuesta
		            });
		            
		            $http.post('https://sistemaflashcards.herokuapp.com/tarjeta.html', 
			            {
			            	enunciado: $scope.newEnunciado,
			            	respuesta: $scope.newRespuesta
			            });          
		  	            $scope.Reset();
		            
		        }
		        // Undo action (delete)
		        $scope.Undo = function () {
		            var elemento = $scope.history[ $scope.history.length - 1 ];
		            $http.post('https://sistemaflashcards.herokuapp.com/tarjeta.html', 
			            {
			            	enunciado: elemento.enunciado,
			            	respuesta: elemento.respuesta
			            });  
		            $scope.records.push(elemento);
		            $scope.history.pop();
		        }
			}
			
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
			app.controller('recordCtrl', recordControlador);
		</script>
		-->
	</body>
</html>