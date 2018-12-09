<html>
	<head>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	    <title>Registro - Flashcards</title>
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

		<style>
			body, html {
			    height: 100%;
			    background-repeat: no-repeat;
			    /*background-image: linear-gradient(rgb(104, 145, 162), rgb(12, 97, 33));*/
			}
			
			.card-container.card {
			    width: 100%;
			    height: 70%;
			}
			
			.btn {
			    font-weight: 700;
			    height: 36px;
			    -moz-user-select: none;
			    -webkit-user-select: none;
			    user-select: none;
			    cursor: default;
			}
			
			/*
			 * Card component
			 */
			.card {
			    background-color: #F7F7F7;
			    /* just in case there no content*/
			    
			    padding: 20px 25px 30px;
			    margin: 0 auto 25px;
			    margin-top: 50px;
			    /* shadows and rounded borders */
			    
			    -moz-border-radius: 2px;
			    -webkit-border-radius: 2px;
			    border-radius: 2px;
			    -moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
			    -webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
			    box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
			}
			
			.profile-img-card {
			    width: 96px;
			    height: 96px;
			    margin: 0 auto 10px;
			    display: block;
			    -moz-border-radius: 50%;
			    -webkit-border-radius: 50%;
			    border-radius: 50%;
			}
			
			/*
			 * Form styles
			 */
			.profile-name-card {
			    font-size: 16px;
			    font-weight: bold;
			    text-align: center;
			    margin: 10px 0 0;
			    min-height: 1em;
			}
			
			.reauth-email {
			    display: block;
			    color: #404040;
			    line-height: 2;
			    margin-bottom: 10px;
			    font-size: 14px;
			    text-align: center;
			    overflow: hidden;
			    text-overflow: ellipsis;
			    white-space: nowrap;
			    -moz-box-sizing: border-box;
			    -webkit-box-sizing: border-box;
			    box-sizing: border-box;
			}
			
			.form-signin #usuario {
			    direction: ltr;
			    height: 44px;
			    font-size: 16px;
			}
			
			.form-signin input[type=email],
			.form-signin input[type=password],
			.form-signin input[type=text],
			.form-signin button {
			    width: 100%;
			    display: block;
			    margin-bottom: 10px;
			    z-index: 1;
			    position: relative;
			    -moz-box-sizing: border-box;
			    -webkit-box-sizing: border-box;
			    box-sizing: border-box;
			}
			
			.form-signin .form-control:focus {
			    border-color: rgb(104, 145, 162);
			    outline: 0;
			    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgb(104, 145, 162);
			    box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgb(104, 145, 162);
			}
			
			.btn.btn-signin {
			    /*background-color: #4d90fe; */
			    background-color: rgb(104, 145, 162);
			    /* background-color: linear-gradient(rgb(104, 145, 162), rgb(12, 97, 33));*/
			    padding: 0px;
			    font-weight: 700;
			    font-size: 14px;
			    height: 36px;
			    -moz-border-radius: 3px;
			    -webkit-border-radius: 3px;
			    border-radius: 3px;
			    border: none;
			    -o-transition: all 0.218s;
			    -moz-transition: all 0.218s;
			    -webkit-transition: all 0.218s;
			    transition: all 0.218s;
			}
			
			.btn.btn-signin:hover,
			.btn.btn-signin:active,
			.btn.btn-signin:focus {
			    background-color: rgb(12, 97, 33);
			}
			
			.login,
			.register {
			    color: rgb(104, 145, 162);
			}
			
			.login:hover,
			.login:active,
			.login:focus,
			.register:hover,
			.register:active,
			.register:focus{
			    color: rgb(12, 97, 33);
			}
			
			.centro{
				align: center;
			}
			
		</style>
	</head>
	<body>
		<%@ page import="com.flashcards.dto.UsuarioDTO" %>
		<% 
			UsuarioDTO user = ((UsuarioDTO)(session.getAttribute("usuario")));
			if(user!=null && (!user.getUsername().equals(""))){
				response.sendRedirect("https://sistemaflashcards.herokuapp.com/inicio.html?usuario="+((UsuarioDTO)(session.getAttribute("usuario"))).getUsername());
			}
		%>
		<script language="JavaScript" type="text/javascript">
			if("${mensaje}" != ""){
				alert("${mensaje}");
			}
		</script>
		<% session.removeAttribute("usuario"); %>
		<div class="row">
			<br><br>
		</div>
		<div class="row">
		    <div class="col-md-12">
		      <h2 align="center" style="color:blue;">
				FLASHCARDS. Sistema Basado En Aprendizaje con Tarjetas.
			  </h2>
			  <br><br>
		    </div>
		</div>
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-11">
				<h4 align="center" style="font-weight: bold;"> Crear una Cuenta Nueva</h4>
				<br><br>
			</div>
		</div>
		<form action="crear.html" class="form-signin" method="post" id="form1" name="form1">
			<div class="row">
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
					<div class="card text-white bg-success mb-3" style="max-width: 100%;">
						<div class="card-body">
							Al hacer click en registrar, acepta:
							<ul> 
								<li>Que sus datos personales serán almacenados por la aplicación.</li>
								<li>Que sus datos personales puedan ser visualizados por cualquier usuario que tenga cuenta.</li>
								<li>Que sus datos personales sólo los puede rectificar o modificar mediante la aplicación.</li>
								<li>Que sus datos personales los podrá eliminar o cancelar sólo si usted elimina su cuenta.</li>
							</ul>
						</div>
					</div>
					
					<div class="form-group ">
						<button type="submit" class="btn btn-primary btn-lg btn-block login-button">Registrarse</button>
					</div>
					
					<a href="https://sistemaflashcards.herokuapp.com" class="login centro">
		                Login
		            </a><br>
		            <!-- <a href="recovery.html" class="forgot-password">
		                ¿Olvidaste la Clave?
		            </a>-->
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