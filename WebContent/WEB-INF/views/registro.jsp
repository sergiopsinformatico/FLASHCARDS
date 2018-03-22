<html>
	<head>
		<title>REGISTRO DE USUARIOS</title>
	</head>
	<body>
		<form action="crear.html" method="post" class="form-signin" name="form1">
		    <div>
		        Nombre de Usuario: 
		        <input type="text" name="nombreUsuario" id="nombreUsuario" />
		    </div>
		    <div>
		        Clave: 
		        <input type="password" name="clave" id="clave" />
		    </div>
		    <div>
		        Email: 
		        <input type="email" name="email" id="email" />
		    </div>
		    <div>
		        Nombre: 
		        <input type="text" name="nombre" id="nombre" />
		    </div>
		    <div>
		        Apellidos: 
		        <input type="text" name="apellidos" id="apellidos" />
		    </div>
		    <div>
		        Edad: 
		        <input type="number" name="edad" id="edad" min="1" max="200">
		    </div>
		    <div>
		        Ciudad: 
		        <input type="text" name="ciudad" id="ciudad" />
		    </div>
		    <div>
		        Pais: 
		        <input type="text" name="pais" id="pais" />
		    </div>
		    <div>
		    	Genero:
		    	<input type="radio" name="genero" id="genero" value="Hombre"> Hombre<br>
		    	<input type="radio" name="genero" id="genero" value="Mujer"> Mujer<br>
		    </div>
		    		    
		    <div class="button">
		        <button type="submit">Registrarse</button>
		    </div>
		</form>
	</body>
</html>