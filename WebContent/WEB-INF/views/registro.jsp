<html>
	<head>
		<title>REGISTRO DE USUARIOS</title>
	</head>
	<body>
		<form action="crear.html" method="post" class="form-signin" name="form1">
		    <div>
		        Nombre de Usuario: 
		        <input type="text" name="nombreUsuario" id="nombreUsuario" required />
		    </div>
		    <div>
		        Clave: 
		        <input type="password" name="clave" id="clave" required />
		    </div>
		    <div>
		        Email: 
		        <input type="email" name="email" id="email" required />
		    </div>
		    <div>
		        Nombre: 
		        <input type="text" name="nombre" id="nombre" required />
		    </div>
		    <div>
		        Apellidos: 
		        <input type="text" name="apellidos" id="apellidos" required />
		    </div>
		    <div>
		        Edad: 
		        <input type="number" name="edad" id="edad" min="1" max="200" required >
		    </div>
		    <div>
		        Ciudad: 
		        <input type="text" name="ciudad" id="ciudad" required />
		    </div>
		    <div>
		        Pais: 
		        <input type="text" name="pais" id="pais" required />
		    </div>
		    <div>
		    	Genero:
		    	<input type="radio" name="genero" id="genero" value="Hombre" required > Hombre<br>
		    	<input type="radio" name="genero" id="genero" value="Mujer" required> Mujer<br>
		    </div>
		    		    
		    <div class="button">
		        <button type="submit">Registrarse</button>
		    </div>
		</form>
	</body>
</html>