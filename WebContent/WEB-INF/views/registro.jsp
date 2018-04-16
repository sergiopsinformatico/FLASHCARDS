<html>
	<head>
		<title>REGISTRO DE USUARIOS</title>
	</head>
	<body>
		<script>
			if("${mensaje}" != ""){
				alert("${mensaje}");
			}
		</script>
		<form action="crear.html" method="post" class="form-signin" name="form1">
		    <div>
		        Nombre de Usuario: 
		        <input type="text" name="nombreUsuario" id="nombreUsuario" required />
		    </div>
		    <div>
		        Clave: 
		        <input type="password" name="clave" id="clave" required />
		    </div>
		    <ul> 
		    	La clave debe cumplir los siguientes requisitos: <br>
				<li>La longitud mínima de la clave, debe ser de 4 carácteres como mínimo.</li> 
				<li>Al menos debe contener una mayúscula (A - Z)</li> 
				<li>Al menos debe contener una minúscula (a - z)</li> 
				<li>Al menos debe contener un número (0 - 9)</li> 
			</ul> 
		    
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
		    	<br><input type="radio" name="genero" id="genero" value="Hombre" required > Hombre<br>
		    	<input type="radio" name="genero" id="genero" value="Mujer" required> Mujer
		    </div>
		    <br><br>
		    <div class="button">
		        <button type="submit">Registrarse</button>
		    </div>
		</form>
		<form action="principal.html" method="post" class="form-signin" name="form2">
			<div class="button">
				<button type="submit">Volver a Pagina Inicio</button>
		    </div>
		</form>
		<script language="JavaScript" type="text/javascript">
			document.form1.nombreUsuario.value = "${usuario.getUsuario()}";
			document.form1.clave.value = "${usuario.getClave()}";
			document.form1.email.value = "${usuario.getEmail()}";
			document.form1.nombre.value = "${usuario.getNombre()}";
			document.form1.apellidos.value = "${usuario.getApellidos()}";
			document.form1.edad.value = "${usuario.getEdad()}";
			document.form1.ciudad.value = "${usuario.getCiudad()}";
			document.form1.pais.value = "${usuario.getPais()}";
		</script>
	</body>
</html>