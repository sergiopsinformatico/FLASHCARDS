<html>
	<head>
		<title>Clubes</title>
	</head>
	<body>
		<h1>CLUBES</h1>
		<form action="crearClub.html" method="post">
			Nombre del Club<input type="text" name="nClub">
			<input id="usuario" name="usuario" type="hidden" value="${usuario}">
		    <div class="button">
		        <button type="submit">Crear Un Club</button>
		    </div>
		</form>
		<c:if test="${not empty clubes}">
			<table>
			    <c:forEach items="${clubes}" var="club">
			    	<tr>
			    		<td>
			    			${club}
			    		</td>
			    		<td>
			    			<form action="verClub.html" method="post">
								<input id="club" name="club" type="hidden" value="${club}">
								<input id="usuario" name="usuario" type="hidden" value="${usuario}">
							    <div class="button">
							        <button type="submit">Ver Club</button>
							    </div>
							</form>
			    		</td>
			    	</tr>
			    </c:forEach>
			</table>
		</c:if>
		
		<form action="principal.html" method="post">
			<input id="usuario" name="usuario" type="hidden" value="${usuario}">
		    <div class="button">
		        <button type="submit">Volver a Pagina Principal</button>
		    </div>
		</form>
	</body>
</html>