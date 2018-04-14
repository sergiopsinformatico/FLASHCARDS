<html>
	<head>
		<title>Ver Club - ${club.getNombre()}</title>
	</head>
	<body>
		<h1>CLUB: ${club.getNombre()}</h1>
		<?php if (strcmp(${usuario}, ${club.getAdministrador()}) == 0){?>
			<form action="incluirMiembro.html" method="post">
				<input id="club" name="club" type="hidden" value="${club.getNombre()}">
				Nombre del Miembro: <input type="text" name="miembro">
			    <div class="button">
			        <button type="submit">Añadir Miembro</button>
			    </div>
			</form>
		<?php } ?>	
		<br>
		<h3>Miembros:</h3>
		<c:if test="${not empty club.getMiembros()}">
			<table>
				<c:forEach items="${club.getMiembros()}" var="miembro">
					<tr>
						<td>
							${miembro}
						</td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
		
	</body>
</html>