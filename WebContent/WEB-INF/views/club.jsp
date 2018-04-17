<html>
	<head>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Ver Club - ${club.getNombre()}</title>
	</head>
	<body>
		<h1>CLUB: ${club.getNombre()}</h1>
		<form action="incluirMiembro.html" method="post" id="form1">
			<input id="club" name="club" type="hidden" value="${club.getNombre()}">
			<input id="usuario" name="usuario" type="hidden" value="${usuario}">
			Nombre del Miembro: <input type="text" name="miembro">
		    <div class="button">
		        <button type="submit">Añadir Miembro</button>
		    </div>
		</form>
		<br>
		<h3>Miembros:</h3>
		<c:if test="${not empty club.getColeccionMiembros()}">
			<table>
				<c:forEach items="${club.getColeccionMiembros()}" var="miembro">
					<tr>
						<td>
							${miembro}
						</td>
						<td>
							<form action="eliminarMiembro.html" method="post" id="form2">
								<input id="club" name="club" type="hidden" value="${club.getNombre()}">
								<input id="usuario" name="usuario" type="hidden" value="${usuario}">
								<input id="miembro" name="miembro" type="hidden" value="${miembro}">
							    <div class="button">
							        <button type="submit">Eliminar Miembro</button>
							    </div>
							</form>
						</td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
		<br><br>
		<form action="eliminarClub.html" method="post" id="form3">
			<input id="usuario" name="usuario" type="hidden" value="${usuario}">
			<input id="club" name="club" type="hidden" value="${club.getNombre()}">
		    <div class="button">
		        <button type="submit">Eliminar Club</button>
		    </div>
		</form>
		<br><br>
		<form action="clubes.html" method="post">
			<input id="usuario" name="usuario" type="hidden" value="${usuario}">
		    <div class="button">
		        <button type="submit">Volver a Clubes</button>
		    </div>
		</form>
		
		<script language="JavaScript" type="text/javascript">

			if(('${usuario}'.localeCompare('${club.getAdministrador()}')) == 0){
				document.getElementById("form1").style.visibility="visible";
				document.getElementById("form2").style.visibility="visible";
				document.getElementById("form3").style.visibility="visible";
			}else{
				document.getElementById("form1").style.visibility="hidden";
				document.getElementById("form2").style.visibility="hidden";
				document.getElementById("form3").style.visibility="hidden";
			}
		</script>
	</body>
</html>