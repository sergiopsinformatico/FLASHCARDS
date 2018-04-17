<?php
// Date in the past
header("Expires: Mon, 26 Jul 1997 05:00:00 GMT");
header("Cache-Control: no-cache");
header("Pragma: no-cache");
?>
<html>
	<head>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Administrador - Flashcards</title>
	</head>
	<body>
		<h1>USUARIOS</h1>
		<c:if test="${not empty usuarios}">
			<table>
			    <c:forEach items="${usuarios}" var="user">
			    	<tr>
			    		<td> ${user.getNombre()} ${user.getApellidos()} </td>
			    		<td>
					    	<form action="adminEliminaCuenta.html" method="POST">
					    		<input id="usuario" name="usuario" type="hidden" value="${user.getUsuario()}">
								<input id="admin" name="admin" type="hidden" value="${admin}">
							    <input type="submit" name="action" value="Eliminar Cuenta de Usuario" />
							</form>
						</td>
						<td> </td>
						<td>
							<form action="adminCambiaRol.html" method="POST">
					    		<input id="usuario" name="usuario" type="hidden" value="${user.getUsuario()}">
								<input id="admin" name="admin" type="hidden" value="${admin}">						
								<select name="rol" id="rol" >
									<option id="usuario" value="usuario">Usuario</option>
									<option id="moderador" value="moderador">Moderador</option>
									<option id="administrador" value="administrador">Administrador</option>
								</select>
								<br>
							    <input type="submit" name="action" value="Guardar Cambio Rol" />
							</form>
						</td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
		<br><br>
		<form action="principalLogueado.html" method="post" class="form-signin" name="form2">
			<input id="usuario" name="usuario" type="hidden" value="${admin}">
			<div class="button">
				<button type="submit">Volver a la Pagina Principal</button>
		    </div>
		</form>
	</body>
</html>