<html>
	<head>
		<title>FLASHCARDS</title>
	</head>
	<body>
		<script>
			if("${mensaje}" != ""){
				alert("${mensaje}");
			}
		</script>
		<br>
		<div style="text-align:center">
			<h2>
				Bienvenido a la Aplicación de Flashcards.!!!!!<br> <br>
			</h2>
			<h3>
				Si aun no tienes cuenta, <a href="registro.html">REGISTRATE AQUÍ</a>
			</h3>
			<br><br><br><br>
			<h3> Si ya tienes cuenta, loguéate: </h3>
			<form action="loguear.html" method="post" class="form-signin" name="form1">
			    <div>
			        Nombre de Usuario o Email: 
			        <input type="text" name="usuario" id="usuario" required />
			    </div>
			    <div>
			        Clave: 
			        <input type="password" name="clave" id="clave" required />
			    </div>
			    <div class="button">
			        <button type="submit">Iniciar Sesion</button>
			    </div>
			</form>
			<br><br><br><br>
			<h3>
				¿No recuerdas tu clave o tu usuario de acceso? <a href="recovery.html">Recuperar Datos</a>
			</h3>
			
		</div>
	</body>
</html>