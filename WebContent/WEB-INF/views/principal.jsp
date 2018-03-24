<html>
	<head>
		<title>Flashcards</title>
	</head>
	<body>
		<br>
		<br>
		<div style="font-family: verdana; padding: 10px; border-radius: 10px; font-size: 12px; text-align:center;">
			Bienvenido a mi pagina de FLASHCARDS!!!!
		</div>
		<form action="miPerfil.html" method="post">
			<input id="usuario" name="usuario" type="hidden" value="${nUsuario}">
		    <div class="button">
		        <button type="submit">Ver Perfil</button>
		    </div>
		</form>
		<form action="modificar.html" method="post">
			<input id="usuario" name="usuario" type="hidden" value="${nUsuario}">
		    <div class="button">
		        <button type="submit">Modificar Perfil</button>
		    </div>
		</form>
	</body>
</html>