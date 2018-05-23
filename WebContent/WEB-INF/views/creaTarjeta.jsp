<!DOCTYPE html>
<html ng-app>

<head>
    <title>Add / List Data (AngularJS)</title>
    <style>
	    .list_data { margin-bottom: 2rem }
	    table, th, td { border: 1px solid #AAA }
	    th { cursor: pointer }
	    div.left {
		    text-align: left;
		}
    </style>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="//ajax.googleapis.com/ajax/libs/angularjs/1.2.11/angular.min.js"></script>
</head>

<body>
		<% 
			if(session.getAttribute("usuario")==null){
				response.sendRedirect("https://sistemaflashcards.herokuapp.com");
			}
		%>
	<script language="JavaScript" type="text/javascript">
		if("${mensaje}" != ""){
			alert("${mensaje}");
		}
	</script>
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">Flashcards</a>
    		</div>
    		<ul class="nav navbar-nav">
      			<li><a href="inicio.html">Inicio</a></li>
      			<li><a href="miPerfil.html">Mi Perfil</a></li>
      			<li><a href="gente.html">Gente</a></li>
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
	
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<form action="guardarFlashcard.html" method="post" class="border-login" name="form1" id="form1">
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
					  	Compartir con:
					  	<br> 
						  <select name="shareWith" id="shareWith" onchange="option(this);" required>
						    <option value="publico">Todo el Mundo</option>
						    <option value="privado">Solo yo</option>
						    <option value="club">Club</option>
						    <option value="usuario">Usuario</option>
						  </select>
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
				            document.getElementById("club").style.display = "block";
				            document.getElementById("user").style.display = "none";
				        } else if(that.value == "usuario"){
				        	document.getElementById("club").style.display = "none";
				            document.getElementById("user").style.display = "block";
				        }else{
				        	document.getElementById("club").style.display = "none";
				            document.getElementById("user").style.display = "none";
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
				                <label for="enunciado">Enunciado: </label>
				                <input id="enunciado" type="text" placeholder="Enunciado" ng-model="newEnunciado">
				            </div>
				             <div class="field">
				                <label for="respuesta">Respuesta: </label>
				                <input id="respuesta" type="text" placeholder="Respuesta" ng-model="newRespuesta">
				            </div>
				            <div class="action">
				                <button ng-click="Add()">Insertar</button>
				                <button ng-click="Reset()">Limpiar Campos</button>
				            </div>
				        </form>
				    </div>
				    
				    <div class="list_data">
				        <h1>Lista de Tarjetas</h1>
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
				        <button ng-show="history.length > 0" ng-click="Undo()">Deshacer Tarjeta Eliminada</button>
				    </div>
				    
				</div>
			</div>
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
		  	<h3>Mostrar Tarjetas: Para Escribir Respuesta o Mostrarla</h3>
 -->