<html>
	<head>
		<title>Crear Tarjeta</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	</head>
	<body>
		<% 
			if(session.getAttribute("usuario")==null){
				response.sendRedirect("/Flashcards");
			}
		%>
		<style>
			div.left {
			    text-align: left;
			}
		
		</style>
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
		<div class="row">
		  <div class="col-md-12 left">
		  	<h3>Creador: ${usuario.getUsuario()}</h3>
		  </div>
		</div>
		<br><br>
		<div class="row">
		  <div class="col-md-12 left">
		  	<h3>Nombre de la Colección: </h3> <input type="text" name="nombre" id="nombre" required />
		  </div>
		</div>
		<br><br>
		<div class="row">
		  <div class="col-md-12 left">
		  	<h3>Compartir con: Todos los Usuarios (Publico) / Privado / Club / Usuario Determinado</h3>
		  	<form action="">
			  <input type="radio" name="compartir" value="publico"> Todos los Usuarios <br>
			  <input type="radio" name="compartir" value="yo"> Solo Yo <br>
			  <input type="radio" name="compartir" value="club"> Club: <input type="text" name="nClub" id="nClub" required /><br>
			  <input type="radio" name="compartir" value="usuario"> Usuario: <input type="text" name="nUsuario" id="nUsuario" required />
			</form>
		  </div>
		</div>
		<br><br>
		<div class="row">
		  <div class="col-md-12 left">
		  	<h3>Mostrar Tarjetas: Para Escribir Respuesta/Seleccionar Opciones/Mostrar Respuesta al dar un botón</h3>
		  </div>
		</div>
		<br><br>
		<div class="row">
		  <div class="col-md-12 left">
		  	<h3>Tarjeta:
					Pregunta:
					Respuesta:</h3>
		  </div>
		</div>
		<div class="row">
		  <div class="col-md-12 left">
		  	<h3>Estado ==> Sin Evaluar</h3>
		  </div>
		</div>
		
	</body>
</html>