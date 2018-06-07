<!DOCTYPE html>
<html ng-app>
	<head>
	    <title>Crear Tarjeta - Flashcard</title>
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
	    </style>
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
		<script language="JavaScript" type="text/javascript">
			if("${mensaje}" != ""){
				alert("${mensaje}");
			}
		</script>
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
			<br>
			<h1>CREACIÓN DE UNA COLECCIÓN DE FLASHCARDS</h1>
			<br>
		</div>
		<div class="row">
			<div class="col-md-1">
			</div>
			<div class="col-md-10">
				<div class="container">
			        <div class="card card-container">
						<form action="guardarFlashcard.html" method="post" class="border-login" name="form1" id="form1">
							<div class="row">
								<div class="col-md-1"></div>
								<div class="col-md-4">
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
										<label for="nombre" class="cols-sm-2 control-label">Nombre de la Colección</label>
										<div class="cols-sm-10">
											<div class="input-group">
												<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
												<input type="text" class="form-control" name="nombre" id="nombre" placeholder="Nombre de la Colección" required />
											</div>
										</div>
									</div>
									<div class="form-group">
										<label for="descripcion" class="cols-sm-2 control-label">Descripción</label>
										<div class="cols-sm-10">
											<div class="input-group">
												<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
												<textarea rows="4" cols="50" id="descripcion" class="form-control" name="descripcion" form="form1" required></textarea>
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
									<div class="form-group" style="display: none;" id="club">
										<label for="nClub" class="cols-sm-2 control-label">Nombre del Club</label>
										<div class="cols-sm-10">
											<div class="input-group">
												<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
												<input type="text" class="form-control" name="nClub" id="nClub" placeholder="Nombre del Club" />
											</div>
										</div>
									</div>
									<div class="form-group" style="display: none;" id="usuario">
										<label for="nUsuario" class="cols-sm-2 control-label">Nombre del Usuario</label>
										<div class="cols-sm-10">
											<div class="input-group">
												<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
												<input type="text" class="form-control" name="nUsuario" id="nUsuario" placeholder="Nombre del Usuario" />
											</div>
										</div>
									</div>
									<div class="form-group">
										<!-- <label for="nUsuario" class="cols-sm-2 control-label">Nombre del Usuario</label>-->
										<div class="cols-sm-10">
											<div class="input-group">
												<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
												<button type="submit" class="btn btn-primary">Guardar Coleccion</button>
												<!-- <input type="text" class="form-control" name="nUsuario" id="nUsuario" placeholder="Nombre del Usuario" />-->
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
								</div>
								<div class="col-md-2"></div>
								<div class="col-md-4">
								</div>
								<div class="col-md-1"></div>
							</div>
						</form>
			        </div>
				</div>
			</div>
			<div class="col-md-1">
			</div>
		</div>
		
		
		<script>
			
			function RecordCtrl ($scope, $http) {
	
		        $scope.history = [];
	
		        $scope.records = [];
		        
		        var cadena = "${flashcard.getColeccionJSON()}";
		        var array = cadena.split("FC**//--FC**//--");
		        var i;
		        if(cadena != ""){
			        for (i = 0; i < array.length; i++) { 
			        	$scope.records.push({
			        		enunciado: array[i],
			        		respuesta: array[i+1]
			        	});
			        	i = i + 2;
			        }
		        }
		        
		        $scope.Delete = function (index) {
		            // Remove first / oldest element from history if it reaches maximum capacity of 10 records
		            if ($scope.history.length === 10)
		                $scope.history.shift();
	
		            var eliminar = $scope.records[index];
		            $http.post('http://localhost:8080/Flashcards/eliminarTarjeta.html', 
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
		            
		            $http.post('http://localhost:8080/Flashcards/tarjeta.html', 
			            {
			            	enunciado: $scope.newEnunciado,
			            	respuesta: $scope.newRespuesta
			            });          
		  	            $scope.Reset();
		            
		        }
		        // Undo action (delete)
		        $scope.Undo = function () {
		            var elemento = $scope.history[ $scope.history.length - 1 ];
		            $http.post('http://localhost:8080/Flashcards/tarjeta.html', 
			            {
			            	enunciado: elemento.enunciado,
			            	respuesta: elemento.respuesta
			            });  
		            $scope.records.push(elemento);
		            $scope.history.pop();
		        }
			}
		</script>
	</body>
</html>
		
		<!-- 
					
							
								<br>
								<div class="row">
									<div class="col-md-12 left">
										Creador: ${usuario.getUsuario()}
										<input type="hidden" id="creador" name="creador" value="${usuario.getUsuario()}">
									</div>
								</div>
								<br>
								<div class="row">
									<div class="col-md-12 left">
									  	Nombre de la Colección: <input type="text" name="nombre" id="nombre" required />
									  </div>
								</div>
								<br>
								<div class="row">
									<div class="col-md-12 left">
										Descripción: <br><textarea rows="4" cols="50" id="descripcion" name="descripcion" form="form1" required></textarea>
									</div>
								</div>
								<br>
								<div class="row">
								  <div class="col-md-12 left">
								  	Compartir con:
								  	<br> 
									  <select name="shareWith" id="shareWith" onchange="option(this);" required>
									    <option value="publico">Todo el Mundo</option>
									    <option value="privado">Solo yo</option>
									    <option value="club">Club</option>
									    <option value="usuario">Usuario</option>
									  </select>
									  <br>
										<div id="nClub" style="display: none;">
											<label for="nClub">Nombre del Club</label> <input type="text" id="nClub" name="nClub" /><br />
										</div>
										<div id="nUsuario" style="display: none;">
											<label for="nUsuario">Nombre del Usuario</label> <input type="text" id="nUsuario" name="nUsuario" /><br />
										</div>
									</div>
								</div>
								<br>
								<div class="row">
									<div class="col-md-3" align="center"></div>
									<div class="col-md-6" align="center">							
										<button type="submit" class="btn btn-primary">Guardar Coleccion</button>	
									</div>
									<div class="col-md-3" align="center"></div>
								</div>
							</form>
							<script>
							    function option(that) {
							        if (that.value == "club") {
							            document.getElementById("nClub").style.display = "block";
							            document.getElementById("nUsuario").style.display = "none";
							        } else if(that.value == "usuario"){
							        	document.getElementById("nClub").style.display = "none";
							            document.getElementById("nUsuario").style.display = "block";
							        }else{
							        	document.getElementById("nClub").style.display = "none";
							            document.getElementById("nUsuario").style.display = "none";
							        }
							    }
							</script>
							<script language="JavaScript" type="text/javascript">
								document.form1.nombre.value = "${flashcard.getNombreColeccion()}";
							    document.form1.shareWith.value = "${flashcard.getCompartido()}";
							    option(document.form1.shareWith);
							</script>
						</div>
						<div class="col-md-6">
							<div ng-controller="RecordCtrl">				  
							    <div class="add_data">
							        <h1>Insertar Tarjeta</h1>
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
							        <h1>Lista de Tarjetas</h1><br>
							        <div ng-if="records.length == 0"> 
								        Aún, no hay creada ninguna tarjeta. Como mínimo, debe de haber una.
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
					</div>
				</div>
			</div>-->