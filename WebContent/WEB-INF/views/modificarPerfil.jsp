<html>
	<head>
		<title>REGISTRO DE USUARIOS</title>
	</head>
	<body>
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
		<form action="principalLogueado.html" method="post" class="form-signin" name="form2">
			<input id="usuario" name="usuario" type="hidden" value="${usuario.getUsuario()}">
			<div class="button">
				<button type="submit">Atras</button>
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