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
				RECUPERACIÓN DE DATOS DE LA CUENTA
			</h2>
			<h3>
				Por favor, introduzca su email o su nombre de usuario para recuperar sus datos.<br>
				Sus datos serán enviados al email que nos proporcionó en su registro.
			</h3>
			<br><br><br><br>
			<form action="recuperar.html" method="post" class="form-signin" name="form1">
			    <div>
			        Nombre de Usuario o Email: 
			        <input type="text" name="usuario" id="usuario" required />
			    </div>
			    <div class="button">
			        <button type="submit">Recuperar Datos</button>
			    </div>
			</form>
			<form action="principal.html" method="post" class="form-signin" name="form2">
				<div class="button">
					<button type="submit">Volver a Pagina Inicio</button>
			    </div>
			</form>
		</div>
	</body>
</html>