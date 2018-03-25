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
		<?php if (${usuario.isAdministrador()}){?>
			<form action="gestionar.html" method="post">
				<input id="admin" name="admin" type="hidden" value="${usuario}">
			    <div class="button">
			        <button type="submit">Gestionar Cuentas</button>
			    </div>
			</form>
		<?php } ?>
		<form action="eliminar.html" method="post">
			<input id="usuario" name="usuario" type="hidden" value="${nUsuario}">
		    <div class="button">
		        <button type="submit">Eliminar Cuenta</button>
		    </div>
		</form>
	</body>
</html>