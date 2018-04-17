<html>
	<head>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
		<br><br>
		<c:if test="${not empty clubes}">
			<table>
			    <c:forEach items="${clubes}" var="club">
			    	<tr>
			    		<td> ${club} </td>
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
		<br><br>
		<form action="principalLogueado.html" method="post" class="form-signin" name="form2">
			<input id="usuario" name="usuario" type="hidden" value="${usuario}">
			<div class="button">
				<button type="submit">Atras</button>
		    </div>
		</form>
	</body>
</html>