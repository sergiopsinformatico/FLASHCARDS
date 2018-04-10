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
				    		${pend}
				    	</td>
				    	<td>
					    	<form action="aceptar.html" method="POST">
					    		<input id="peticion" name="peticion" type="hidden" value="${pend}">
								<input id="usuario" name="usuario" type="hidden" value="${usuario}">
							    <input type="submit" name="action" value="Aceptar Petición" />
							</form>
						</td>
						<td>
							<form action="rechazar.html" method="POST">
					    		<input id="peticion" name="peticion" type="hidden" value="${pend}">
								<input id="usuario" name="usuario" type="hidden" value="${usuario}">
							    <input type="submit" name="action" value="Rechazar Petición" />
							</form>
						</td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
		<h1>AMIGOS</h1>
	</body>
</html>