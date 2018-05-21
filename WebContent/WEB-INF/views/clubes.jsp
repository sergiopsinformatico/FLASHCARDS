<html>
	<head>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Clubes</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	</head>
	<body>
	
		<% 
			if(session.getAttribute("usuario")==null){
				response.sendRedirect("/Flashcards");
			}
		%>
		<nav class="navbar navbar-default">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="#">WebSiteName</a>
	    		</div>
	    		<ul class="nav navbar-nav">
	      			<li><a href="inicio.html">Inicio</a></li>
	      			<li><a href="miPerfil.html">Mi Perfil</a></li>
	      			<li><a href="gente.html">Gente</a></li>
	      			<li class="active"><a href="clubes.html">Clubes</a></li>
	      			<li><a href="modificar.html">Modificar Perfil</a></li>
	      			<li><a href="gestionar.html" id="btn-Gestion">Gestionar Cuentas</a></li>
	    		</ul>
	    		<ul class="nav navbar-nav navbar-right">
	    			<li><a href="eliminar.html" onclick="return confirm('¿Desea Eliminar la Cuenta?'+'\nNota: Si da a aceptar, dispone de 14 días para recuperar la cuenta, iniciando sesión de nuevo o se eliminará definitivamente. Recibirá un email con la informacion.');">Eliminar Cuenta</a></li>
	      			<li><a href="cerrarSesion.html" onclick="return confirm('¿Desea Cerrar Sesión?');">Cerrar Sesión</a></li>
	    		</ul>
	  		</div>
		</nav>
		
		<script language="JavaScript" type="text/javascript">
			var comp = ${usuario.isAdministrador()};
			if (comp){
				document.getElementById("btn-Gestion").style.visibility="visible";
			}else{
				document.getElementById("btn-Gestion").style.visibility="hidden";
			}
		</script> 
	
		<h1>CLUBES</h1>
		<form action="crearClub.html" method="post">
			Nombre del Club<input type="text" name="nClub">
			<!-- <input id="usuario" name="usuario" type="hidden" value="${usuario}"> -->
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
								<!-- <input id="usuario" name="usuario" type="hidden" value="${usuario}"> -->
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
	</body>
</html>