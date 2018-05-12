<!DOCTYPE html>
<html>
	<head>
		<title>Flashcards</title>
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
			div.center {
			    text-align: center;
			}
		
		</style>
		
		<nav class="navbar navbar-default">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="#">WebSiteName</a>
	    		</div>
	    		<ul class="nav navbar-nav">
	      			<li class="active"><a href="inicio.html">Inicio</a></li>
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
		  <div class="col-md-12 center">
		  	<h1>Bienvenido ${usuario.getUsuario()} !!! => ${mensaje}</h1>
		  </div>
		</div>
		<br><br><br><br>
		<div class="row">
			<div class="col-md-3 center">
				<h1>Notificaciones</h1>
			</div>
			<div class="col-md-9 center">
				<div class="row">
				  <div class="col-md-12 center">
				  	<form action="crearColeccion.html" method="post" class="border-login" id="form1">
					  	<button type="submit" class="btn btn-info">
					  		<h3>Crear Colección de Tarjetas</h3>
					  	</button>
					</form>
				  </div>
				</div>
				<br><br><br><br>
				<div class="row">
				  <div class="col-md-12 center">
				  	<form action="verColecciones.html" method="post" class="border-login" id="form2">
					  	<button type="submit" class="btn btn-success">
					  		<h3>Mis Colecciones de Tarjetas</h3>
					  	</button>
					</form>
				  </div>
				</div>
				<br><br><br><br>
				<div class="row">
				  <div class="col-md-12 center">
				  	<form action="evaluarColecciones.html" method="post" class="border-login" id="form3">
					  	<button type="submit" class="btn btn-warning">
					  		<h3>Evaluar Colecciones de Tarjetas</h3>
					  	</button>
				  	</form>
				  </div>
				</div>
			</div>
		</div>
		
		<script language="JavaScript" type="text/javascript">
			var comp2 = ${usuario.isModerador()};
			if (comp2){
				document.getElementById("form3").style.visibility="visible";
			}else{
				document.getElementById("form3").style.visibility="hidden";
			}
		</script>
	</body>
</html>