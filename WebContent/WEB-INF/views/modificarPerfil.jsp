<html>
	<head>
		<title>REGISTRO DE USUARIOS</title>
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
		<script language="JavaScript" type="text/javascript">
			if("${mensaje}" != ""){
				alert("${mensaje}");
			}
		</script>
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
		<form action="mPerfil.html" method="post" class="form-signin" name="form1">
			<input id="usuarioAntiguo" name="usuarioAntiguo" type="hidden" value="${usuario.getEmail()}">
			<div>
		        Email: 
		        <input type="email" name="email" id="email" value = ${usuario.getEmail()} required />
		    </div>
		    <div>
		        Nombre de Usuario: 
		        <input type="text" name="nombreUsuario" id="nombreUsuario" value = ${usuario.getUsuario()} required />
		    </div>
		    <div>
		        Clave: 
		        <input type="password" name="clave" id="clave" value = ${usuario.getClave()} required />
		    </div>
		    <div>
		    	<ul> La clave debe cumplir los siguientes requisitos: <br>
					<li>La longitud mínima de la clave, debe ser de 4 carácteres como mínimo.</li> 
					<li>Al menos debe contener una mayúscula (A - Z)</li> 
					<li>Al menos debe contener una minúscula (a - z)</li> 
					<li>Al menos debe contener un número (0 - 9)</li> 
				</ul> 
		    </div>
		    <div>
		        Nombre: 
		        <input type="text" name="nombre" id="nombre" value = ${usuario.getNombre()} required />
		    </div>
		    <div>
		        Apellidos: 
		        <input type="text" name="apellidos" id="apellidos" value = ${usuario.getApellidos()} required />
		    </div>
		    <div>
		        Edad: 
		        <input type="number" name="edad" id="edad" min="1" max="200" value = ${usuario.getEdad()} required >
		    </div>
		    <div>
		        Ciudad: 
		        <input type="text" name="ciudad" id="ciudad" value = ${usuario.getCiudad()} required />
		    </div>
		    <div>
		        Pais: 
		        <input type="text" name="pais" id="pais" value = ${usuario.getPais()} required />
		    </div>
		    <div>
		    	Genero:
		    	<input type="radio" name="genero" id="genero_Hombre" value="Hombre" required > Hombre<br>
		    	<input type="radio" name="genero" id="genero_Mujer" value="Mujer" required> Mujer<br>
		    </div>
		    		    
		    <div class="button">
		        <button type="submit">Modificar Perfil</button>
		    </div>
		</form>
		<script language="JavaScript" type="text/javascript">
			var genero = "${usuario.getGenero()}";
			var hombre = "Hombre";
			var result = genero.localeCompare(hombre);
			if (result == 0){
				document.getElementById("genero_Hombre").checked = true;
				document.getElementById("genero_Mujer").checked = false;
			}else{
				document.getElementById("genero_Hombre").checked = false;
				document.getElementById("genero_Mujer").checked = true;
			}
		</script>
	</body>
</html>