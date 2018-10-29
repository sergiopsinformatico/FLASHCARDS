<!DOCTYPE html>
<html>
	<head>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	    <title>Modificar Perfil - Flashcards</title>
		<meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	    <meta http-equiv="x-ua-compatible" content="ie=edge">
	    <link rel="stylesheet" href="https://unpkg.com/bootstrap-material-design@4.1.1/dist/css/bootstrap-material-design.min.css" integrity="sha384-wXznGJNEXNG1NFsbm0ugrLFMQPWswR3lds2VeinahP8N0zJw9VWSopbjv2x7WCvX" crossorigin="anonymous">
	    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
		<script src="https://unpkg.com/popper.js@1.12.6/dist/umd/popper.js" integrity="sha384-fA23ZRQ3G/J53mElWqVJEGJzU0sTs+SvzG8fXVWP+kJQ1lwFAOkcUOysnlKJC33U" crossorigin="anonymous"></script>
		<script src="https://unpkg.com/bootstrap-material-design@4.1.1/dist/js/bootstrap-material-design.js" integrity="sha384-CauSuKpEqAFajSpkdjv3z9t8E7RlpJ1UP0lKM/+NdtSarroVKu069AlsRPKkFBz9" crossorigin="anonymous"></script>
		<script>$(document).ready(function() { $('body').bootstrapMaterialDesign(); });</script>
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
	</head>
	<body>
		<%@ page import="com.flashcards.modelo.UsuarioDTO" %>
		<% 
			UsuarioDTO user = ((UsuarioDTO)(session.getAttribute("usuario")));
			if(user==null || user.getNombreUsuario().equals("")){
				response.sendRedirect("https://sistemaflashcards.herokuapp.com");
			}
			session.setAttribute("usuario", user);
		%>
		<script language="JavaScript" type="text/javascript">
			if("${mensaje}" != ""){
				alert("${mensaje}");
			}
		</script>
		<style>
		    div.left {
			    text-align: left;
			}
			div.center {
			    text-align: center;
			}
			textarea {
			   resize: none;
			}
			.scene {
			  width: 100%;
			  height: 450px;
			  border: 1px solid #CCC;
			  margin: 40px 0;
			  perspective: 600px;
			}
			
			.card {
			  width: 100%;
			  height: 450px;
			  transition: transform 1s;
			  transform-style: preserve-3d;
			  cursor: pointer;
			  position: relative;
			}
			
			.card.is-flipped {
			  transform: rotateY(180deg);
			}
			
			.card__face {
			  position: absolute;
			  width: 100%;
			  height: 100%;
			  color: white;
			  text-align: center;
			  font-weight: bold;
			  font-size: 12pxvw;
			  backface-visibility: hidden;
			}
			
			.card__face--front {
			  background: red;
			}
			
			.card__face--back {
			  background: blue;
			  transform: rotateY(180deg);
			}
			
			.formato-img{
				height: 180px;
				min-height: 180px;
				max-height: 180px;
				width: auto;
				display: block;
			    margin-left: auto;
			    margin-right: auto;
			}	
	    </style>
		<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
	      <button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#navbarsExample03" aria-controls="navbarsExample03" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="navbar-toggler-icon"></span>
	      </button>
	
	      <div class="navbar-collapse collapse" id="navbarsExample03" style="width: 100%;">
	        <ul class="navbar-nav mr-auto">
	          <li class="nav-item">
	    		<a class="nav-link" href="inicio.html?usuario=${usuario.getNombreUsuario()}">
					Inicio
				</a>
	          </li>
	          <li class="nav-item">
				<a class="nav-link" href="flashcards.html?usuario=${usuario.getNombreUsuario()}">
					Flashcards
				</a>
			  </li>
			  <li class="nav-item">
			  	<a class="nav-link" href="gente.html?usuario=${usuario.getNombreUsuario()}">
					Gente
				</a>
			  </li>
			  <li class="nav-item">
			  	<a class="nav-link" href="clubes.html?usuario=${usuario.getNombreUsuario()}">
					Clubes
				</a>
			  </li>
			  <li class="nav-item">
			  	<a class="nav-link" href="gestionar.html?usuario=${usuario.getNombreUsuario()}" id="btn-Gestion">
					Gestionar Cuentas
				</a>
			  </li>
	        </ul>
	        <ul class="navbar-nav ml-auto">
	        <li class="nav-item active dropdown">
	            <a class="nav-link dropdown-toggle" href="" id="dropdown03" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Bienvenido ${usuario.getNombreApellidos()} </a>
	            <div class="dropdown-menu dropdown-primary" aria-labelledby="dropdown03">
	              <a class="dropdown-item" href="miPerfil.html?usuario=${usuario.getNombreUsuario()}&perfil=${usuario.getUsuario()}">Mi Perfil</a>
	              <a class="dropdown-item" href="configuracion.html?usuario=${usuario.getNombreUsuario()}">Configuración</a>
	              <div class="dropdown-divider"></div>
				  <a class="dropdown-item" href="cerrarSesion.html" onclick="return confirm('¿Desea Cerrar Sesión?');">Cerrar Sesión</a>
	            </div>
	            <script>
	            	$('.dropdown-toggle').dropdown();
	            </script>
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
			<div class="col-md-1"></div>
			<div class="col-md-11">
				<br><br>
				<h4 align="center" style="font-weight: bold;"> Modificar Perfil</h4>
				<br><br>
			</div>
		</div>
		
		<form action="mPerfil.html" class="form-signin" method="post" id="form1" name="form1">
			<div class="row">
				<input type="hidden" id="usuarioAntiguo" name="usuarioAntiguo" value="${usuario.getNombreUsuario()}">
				<div class="col-md-1"></div>
				<div class="col-md-4">
					<div class="form-group">
						<label for="nombreUsuario" style="font-weight: bold;">Nombre de Usuario</label>
						<input type="text" class="form-control" id="nombreUsuario" name="nombreUsuario" placeholder="Nombre de Usuario" value="${usuario.getNombreUsuario()}" required>
					</div>
					<div class="form-group">
						<label for="email" style="font-weight: bold;">Email</label>
						<input type="email" class="form-control" id="email" name="email" placeholder="Email" value="${usuario.getEmail()}" required>
					</div>
					<div class="form-group">
						<label for="clave" style="font-weight: bold;">Clave</label>
						<input type="password" class="form-control" id="clave" name="clave" placeholder="Clave" value="${usuario.getClave()}" required>
					</div>
					<div class="form-group">
						<label for="repiteClave" style="font-weight: bold;">Repite la Clave</label>
						<input type="password" class="form-control" id="repiteClave" name="repiteClave" placeholder="Repite la Clave" value="${usuario.getClave()}" required>
					</div>
					<!-- <div class="card"> -->
					<div class="card text-white bg-danger mb-3" style="max-width: 100%;">
						<div class="card-body">
							<h6 align="center">ADVERTENCIA</h6><br>
							El nombre de usuario DEBE CUMPLIR el siguiente requisito: <br>
				    			<ul> 
									<li>Sólo puede contener mayúsculas, minúsculas y números</li>
									<li>El nombre de usuario no debe contener espacios</li>
								</ul>
							<br>
							La clave DEBE CUMPLIR los siguientes requisitos: <br>
				    			<ul> 
									<li>Longitud Mínima de la Clave: 4 carácteres</li> 
									<li>Sólo puede contener mayúsculas, minúsculas y números</li> 
									<li>Al menos debe haber una mayúscula (A-Z)</li> 
									<li>Al menos debe haber una minúscula (a-z)</li> 
									<li>Al menos debe haber un número (0-9)</li> 
									<li>La clave no debe contener espacios</li>
								</ul>
						</div>
					</div>
				</div>
				<div class="col-md-2"></div>
				<div class="col-md-4">
					<div class="form-group">
						<label for="nombreApellidos" style="font-weight: bold;">Nombre y Apellidos</label>
						<input type="text" class="form-control" id="nombreApellidos" name="nombreApellidos" placeholder="Nombre y Apellidos" value="${usuario.getNombreApellidos()}" required>
					</div>
					<div class="form-group">
						<label for="edad" style="font-weight: bold;">Edad (mínimo 18 años)</label>
						<input type="number" class="form-control" id="edad" name="edad" min="18" placeholder="Edad" value="${usuario.getEdad()}" required>
					</div>
					<div class="form-group">
						<label for="ciudad" style="font-weight: bold;">Ciudad</label>
						<input type="text" class="form-control" id="ciudad" name="ciudad" placeholder="Ciudad" value="${usuario.getCiudad()}" required>
					</div>
					<div class="form-group">
						<label for="pais" style="font-weight: bold;">Pais</label>
						<input type="text" class="form-control" id="pais" name="pais" placeholder="Pais" value="${usuario.getPais()}" required>
					</div>
					<div class="form-group">
						<label for="genero" class="cols-sm-2 control-label" style="font-weight: bold;">Género</label>
						<div class="form-check">
							<input class="form-check-input" type="radio" name="genero" id="genero_Hombre" value="Hombre" required>
							<label class="form-check-label" for="genero_Hombre"> Hombre </label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="radio" name="genero" id="genero_Mujer" value="Mujer" required>
							<label class="form-check-label" for="genero_Mujer"> Mujer </label>
						</div>
					</div>
					
					<div class="form-group ">
						<button type="submit" class="btn btn-primary btn-lg btn-block login-button">Guardar Cambios</button>
					</div>
				</div>
				<div class="col-md-1"></div>
			</div>
		</form>
		<script language="JavaScript" type="text/javascript">
			var genero = "${usuario.getGenero()}";
			var hombre = "Hombre";
			var mujer = "Mujer";
			var result = genero.localeCompare(hombre);
			var resultado = genero.localeCompare(mujer);
			if (result == 0){
				document.getElementById("genero_Hombre").checked = true;
				document.getElementById("genero_Mujer").checked = false;
			}else{
				if(resultado == 0){
					document.getElementById("genero_Hombre").checked = false;
					document.getElementById("genero_Mujer").checked = true;
				}else{
					document.getElementById("genero_Hombre").checked = false;
					document.getElementById("genero_Mujer").checked = false;
				}
			}
		</script>
		
	</body>
</html>