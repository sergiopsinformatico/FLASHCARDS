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
		<form action="gente.html" method="post">
			<input id="usuario" name="usuario" type="hidden" value="${nUsuario}">
		    <div class="button">
		        <button type="submit">Gente</button>
		    </div>
		</form>
		<form action="clubes.html" method="post">
			<input id="usuario" name="usuario" type="hidden" value="${nUsuario}">
		    <div class="button">
		        <button type="submit">Clubes</button>
		    </div>
		</form>
		<form action="modificar.html" method="post">
			<input id="usuario" name="usuario" type="hidden" value="${nUsuario}">
		    <div class="button">
		        <button type="submit">Modificar Perfil</button>
		    </div>
		</form>
        <form action="gestionar.html" method="post" id="form3">
			<input id="admin" name="admin" type="hidden" value="${usuario}">
		    <div class="button">
		        <button type="submit">Gestionar Cuentas</button>
		    </div>
		</form>
		<form action="eliminar.html" method="post">
			<input id="usuario" name="usuario" type="hidden" value="${nUsuario}">
		    <div class="button">
		        <button type="submit">Eliminar Cuenta</button>
		    </div>
		</form>
		<form action="principal.html" method="post" class="form-signin" name="form2">
			<div class="button">
				<button type="submit">Cerrar Sesion</button>
		    </div>
		</form>
		
		<script language="JavaScript" type="text/javascript">
		var comp = ${usuario.isAdministrador()};
			if (comp){
				document.getElementById("form3").style.visibility="visible";
			}else{
				document.getElementById("form3").style.visibility="hidden";
			}
		</script>
	</body>
</html>