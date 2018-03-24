<html>
	<head>
		<title>REGISTRO DE USUARIOS</title>
	</head>
	<body>
		<form action="mPerfil.html" method="post" class="form-signin" name="form1">
			<div>
		        Email: ${usuario.getEmail()}
		        <input id="email" name="email" type="hidden" value="${usuario.getEmail()}">
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
		    	<input type="radio" name="genero" id="genero" value="Hombre" required > Hombre<br>
		    	<input type="radio" name="genero" id="genero" value="Mujer" required> Mujer<br>
		    </div>
		    		    
		    <div class="button">
		        <button type="submit">Modificar Perfil</button>
		    </div>
		</form>
	</body>
</html>