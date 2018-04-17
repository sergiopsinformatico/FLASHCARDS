<html>
	<head>
		<title>Mi Perfil</title>
	</head>
	<body>
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
		<form action="principalLogueado.html" method="post" class="form-signin" name="form2">
			<input id="usuario" name="usuario" type="hidden" value="${usuario.getUsuario()}">
			<div class="button">
				<button type="submit">Atras</button>
		    </div>
		</form>	
	</body>
</html>