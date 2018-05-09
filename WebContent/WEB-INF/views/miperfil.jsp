<html>
	<head>
		<title>Mi Perfil</title>
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
		<nav class="navbar navbar-default">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="#">Flashcards</a>
	    		</div>
	    		<ul class="nav navbar-nav">
	      			<li><a href="inicio.html">Inicio</a></li>
	      			<li class="active"><a href="miPerfil.html">Mi Perfil</a></li>
	      			<li><a href="gente.html">Gente</a></li>
	      			<li><a href="clubes.html">Clubes</a></li>
	      			<li><a href="modificar.html">Modificar Perfil</a></li>
	      			<li><a href="gestionar.html" id="btn-Gestion">Gestionar Cuentas</a></li>
	    		</ul>
	    		<ul class="nav navbar-nav navbar-right">
	    			<li><a href="eliminar.html" onclick="return confirm('¿Desea Eliminar la Cuenta?');">Eliminar Cuenta</a></li>
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
		Username: ${usuario.getUsuario()}
		<br>Email: ${usuario.getEmail()}
		<br><br><br>
		Nombre: ${usuario.getNombre()}
		<br>Apellidos: ${usuario.getApellidos()}
		<br>Edad: ${usuario.getEdad()}
		<br>Ciudad: ${usuario.getCiudad()}
		<br>Pais: ${usuario.getPais()}
		<br>Genero: ${usuario.getGenero()}
		<br><br><br>	
	</body>
</html>