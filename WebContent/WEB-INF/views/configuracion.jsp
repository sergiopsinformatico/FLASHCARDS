<!DOCTYPE html>
<html>
	<head>
		<title>Configuracion - Flashcards</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
		<script src="//ajax.googleapis.com/ajax/libs/angularjs/1.2.11/angular.min.js"></script>
		
	</head>
	<body>
		<%@ page import="com.flashcards.modelo.Usuario" %>
		<% 
			Usuario user = ((Usuario)(session.getAttribute("usuario")));
			if(user==null || user.getUsuario().equals("")){
				response.sendRedirect("https://sistemaflashcards.herokuapp.com");
			}
			session.setAttribute("usuario", user);
		%>
				
		<style>
			div.center {
			    text-align: center;
			}
			
			.navbar-nav > li > a, .navbar-brand {
			    padding-top:4px !important; 
			    padding-bottom:0 !important;
			    height: 28px;
			}
			.navbar-inner {min-height:28px;}		
		</style>
		
		<nav class="navbar navbar-expand-md bg-dark navbar-dark">
			<div class="navbar-inner navbar-collapse" id="collapsibleNavbar">
			    <ul class="navbar-nav mr-auto">
					<li class="nav-item">
						<a class="nav-link" href="inicio.html?usuario=${usuario.getUsuario()}">
							Inicio
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="flashcards.html?usuario=${usuario.getUsuario()}">
							Flashcards
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="gente.html?usuario=${usuario.getUsuario()}">
							Gente
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="clubes.html?usuario=${usuario.getUsuario()}">
							Clubes
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="gestionar.html?usuario=${usuario.getUsuario()}" id="btn-Gestion">
							Gestionar Cuentas
						</a>
					</li>
	    		</ul>
	    		<ul class="navbar-nav ml-auto">
	    			<li class="nav-item dropdown">
                    	<a href="#" class="nav-link dropdown-toggle active" id="navDropDownLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Hola ${usuario.getUsuario()}!!!</a>
	                    <div class="dropdown-menu" aria-labelledby="navDropDownLink">
	                        <a class="dropdown-item" href="miPerfil.html?usuario=${usuario.getUsuario()}">Mi Perfil</a>
	                        <a class="dropdown-item" href="configuracion.html?usuario=${usuario.getUsuario()}">Configuraci�n</a>
	                        <div class="dropdown-divider"></div>
	                        <a class="dropdown-item" href="cerrarSesion.html" onclick="return confirm('�Desea Cerrar Sesi�n?');">Cerrar Sesi�n</a>
	                    </div>
	                </li>
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
		<div class="row">
			<br><br>
		</div>
		<div class="row">
			<div class="col-md-2 center">
			
			</div>
			<div class="col-md-3 center">
				<form action="eliminar.html?usuario=${usuario.getUsuario()}">
					<button class="btn btn-lg btn-primary btn-block btn-signin" type="submit" onclick="return confirm('�Desea Eliminar la Cuenta?');">Eliminar Cuenta</button>
				</form>
		   		<!-- <a href="" onclick="return confirm('�Desea Eliminar la Cuenta?'+'\nNota: Si da a aceptar, dispone de 14 d�as para recuperar la cuenta, iniciando sesi�n de nuevo o se eliminar� definitivamente. Recibir� un email con la informacion.');">Eliminar Cuenta</a> -->
				Nota: Si da a aceptar, dispone de 14 d�as para recuperar la cuenta, iniciando sesi�n de nuevo o se eliminar� definitivamente. Recibir� un email con toda la informacion.
			</div>
			<div class="col-md-2 center">
			
			</div>
			<div class="col-md-3 center">
			
			</div>
			<div class="col-md-2 center">
			
			</div>
		</div>
	</body>
</html>