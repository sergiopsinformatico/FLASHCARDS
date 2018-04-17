<html>
	<head>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Gente</title>
	</head>
	<body>
		<h1>PERSONAS</h1>
		<c:if test="${not empty usuarios}">
			<table>
			    <c:forEach items="${usuarios}" var="user">
			    	<tr>
			    		<td> ${user.getNombre()} ${user.getApellidos()} </td>
			    		<td>
					    	<form action="peticionAmistad.html" method="POST">
					    		<input id="peticion" name="peticion" type="hidden" value="${user.getUsuario()}">
								<input id="usuario" name="usuario" type="hidden" value="${usuario}">
							    <input type="submit" name="action" value="Añadir Amigo" />
							</form>
						</td>
						<td>
							<form action="bloquear.html" method="POST">
					    		<input id="bloquear" name="bloquear" type="hidden" value="${user.getUsuario()}">
								<input id="usuario" name="usuario" type="hidden" value="${usuario}">
							    <input type="submit" name="action" value="Bloquear Usuario" />
							</form>
						</td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
		<h1>PETICIONES ENVIADAS</h1>
		<br>
		<c:if test="${not empty enviadas}">
			<table>
			    <c:forEach items="${enviadas}" var="peticion">
			    	<tr>
				    	<td>
				    		${peticion.getRecibe()}
				    	</td>
				    	<td>
					    	<form action="eliminarPeticion.html" method="POST">
					    		<input id="envia" name="envia" type="hidden" value="${peticion.getEnvia()}">
					    		<input id="recibe" name="recibe" type="hidden" value="${peticion.getRecibe()}">
								<input id="usuario" name="usuario" type="hidden" value="${peticion.getEnvia()}">
							    <input type="submit" name="action" value="Eliminar Petición" />
							</form>
						</td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
		<h1>PETICIONES PENDIENTES</h1>
		<br>
		<c:if test="${not empty pendientes}">
			<table>
			    <c:forEach items="${pendientes}" var="pend">
			    	<tr>
				    	<td>
				    		${pend.getNombre()} ${pend.getApellidos()}
				    	</td>
				    	<td>
					    	<form action="aceptar.html" method="POST">
					    		<input id="peticion" name="peticion" type="hidden" value="${pend.getUsuario()}">
								<input id="usuario" name="usuario" type="hidden" value="${usuario}">
							    <input type="submit" name="action" value="Aceptar Petición" />
							</form>
						</td>
						<td>
							<form action="rechazar.html" method="POST">
					    		<input id="peticion" name="peticion" type="hidden" value="${pend.getUsuario()}">
								<input id="usuario" name="usuario" type="hidden" value="${usuario}">
							    <input type="submit" name="action" value="Rechazar Petición" />
							</form>
						</td>
						<td>
							<form action="bloquearPeticion.html" method="POST">
					    		<input id="bloquear" name="bloquear" type="hidden" value="${pend.getUsuario()}">
								<input id="usuario" name="usuario" type="hidden" value="${usuario}">
							    <input type="submit" name="action" value="Bloquear Usuario" />
							</form>
						</td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
		<h1>AMIGOS</h1>
		<br>
		<c:if test="${not empty amigos}">
			<table>
			    <c:forEach items="${amigos}" var="amigo">
			    	<tr>
				    	<td>
				    		${amigo.getNombre()} ${amigo.getApellidos()}
				    	</td>
				    	<td>
					    	<form action="eliminarAmigo.html" method="POST">
					    		<input id="eliminar" name="eliminar" type="hidden" value="${amigo.getUsuario()}">
								<input id="usuario" name="usuario" type="hidden" value="${usuario}">
							    <input type="submit" name="action" value="Eliminar Amigo" />
							</form>
						</td>
						<td>
							<form action="bloquearAmigo.html" method="POST">
					    		<input id="bloquear" name="bloquear" type="hidden" value="${amigo.getUsuario()}">
								<input id="usuario" name="usuario" type="hidden" value="${usuario}">
							    <input type="submit" name="action" value="Bloquear Amigo" />
							</form>
						</td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
		<h1>BLOQUEADOS</h1>
		<br>
		<c:if test="${not empty bloqueados}">
			<table>
			    <c:forEach items="${bloqueados}" var="bloqueado">
			    	<tr>
				    	<td>
				    		${bloqueado.getNombre()} ${bloqueado.getApellidos()}
				    	</td>
						<td>
							<form action="desbloquear.html" method="POST">
								<input id="bloqueado" name="bloqueado" type="hidden" value="${bloqueado.getUsuario()}">
								<input id="usuario" name="usuario" type="hidden" value="${usuario}">
							    <input type="submit" name="action" value="Desbloquear" />
							</form>
						</td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
		<form action="principalLogueado.html" method="post" class="form-signin" name="form2">
			<input id="usuario" name="usuario" type="hidden" value="${usuario}">
			<div class="button">
				<button type="submit">Atras</button>
		    </div>
		</form>	
	</body>
</html>