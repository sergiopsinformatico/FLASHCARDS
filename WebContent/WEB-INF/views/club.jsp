<html>
	<head>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Ver Club - ${club.getNombre()}</title>
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
	    			<li><a href="eliminar.html" onclick="return confirm('¿Desea Eliminar la Cuenta?');">Eliminar Cuenta</a></li>
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
		
		<h1>CLUB: ${club.getNombre()}</h1>
		<form action="incluirMiembro.html" method="post" id="form1">
			<input id="club" name="club" type="hidden" value="${club.getNombre()}">
			<!-- <input id="usuario" name="usuario" type="hidden" value="${usuario}"> -->
			Nombre del Miembro: <input type="text" name="miembro">
		    <div class="button">
		        <button type="submit">Añadir Miembro</button>
		    </div>
		</form>
		<form action="invitarPersonaClub.html" method="post" id="form4">
			<input id="club" name="club" type="hidden" value="${club.getNombre()}">
			<!-- <input id="usuario" name="usuario" type="hidden" value="${usuario}"> -->
			Invitación para: <input type="text" name="recibe">
		    <div class="button">
		        <button type="submit">Invitar Miembro</button>
		    </div>
		</form>
		<form action="solicitarAccesoClub.html" method="post" id="form5">
			<input id="club" name="club" type="hidden" value="${club.getNombre()}">
			<!-- <input id="usuario" name="usuario" type="hidden" value="${usuario}"> -->
		    <div class="button">
		        <button type="submit">Solicitar Acceso</button>
		    </div>
		</form>
		
		<h3>Miembros:</h3>
		<c:if test="${not empty club.getColeccionMiembros()}">
			<table>
				<c:forEach items="${club.getColeccionMiembros()}" var="miembro">
					<tr>
						<td>
							${miembro}
						</td>
						<td>
							<form action="eliminarMiembro.html" method="post" name="form2" id="form2">
								<input id="club" name="club" type="hidden" value="${club.getNombre()}">
								<!-- <input id="usuario" name="usuario" type="hidden" value="${usuario}"> -->
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
			<!-- <input id="usuario" name="usuario" type="hidden" value="${usuario}"> -->
			<input id="club" name="club" type="hidden" value="${club.getNombre()}">
		    <div class="button">
		        <button type="submit">Eliminar Club</button>
		    </div>
		</form>
		<br><br>
		<script language="JavaScript" type="text/javascript">
			if(("${usuario.getUsuario()}".localeCompare("${club.getAdministrador()}")) == 0){
				document.getElementById("form1").style.visibility="visible";
				document.getElementById("form3").style.visibility="visible";
				document.getElementById("form4").style.visibility="hidden";
				document.getElementById("form5").style.visibility="hidden";	
				document.getElementById("form2").style.visibility="visible";			
			}else if ( ${pertenece} == true){
				document.getElementById("form1").style.visibility="hidden";
				document.getElementById("form3").style.visibility="hidden";
				document.getElementById("form4").style.visibility="visible";
				document.getElementById("form5").style.visibility="hidden";
				document.getElementById("form2").style.visibility="hidden";				
			}else{
				document.getElementById("form1").style.visibility="hidden";
				document.getElementById("form3").style.visibility="hidden";
				document.getElementById("form4").style.visibility="hidden";
				document.getElementById("form5").style.visibility="visible";
				document.getElementById("form2").style.visibility="hidden";
			}
		</script>
	</body>
</html>