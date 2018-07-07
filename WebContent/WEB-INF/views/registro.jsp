<html>
	<head>
		<!-- <title>Registro - Flashcards</title>
		<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
		<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
		<script src="//code.jquery.com/jquery-1.11.1.min.js"></script> -->
		
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
		<%@ page import="com.flashcards.modelo.Usuario" %>
		<% 
			Usuario user = ((Usuario)(session.getAttribute("usuario")));
			if(user!=null && (!user.getUsuario().equals(""))){
				response.sendRedirect("https://sistemaflashcards.herokuapp.com/inicio.html?usuario="+((Usuario)(session.getAttribute("usuario"))).getUsuario());
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
			</div>
		</div>
		<form action="crear.html" class="form-horizontal" method="post" id="form1" name="form1">
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-4">
					<div class="form-group">
						<label for="nombreUsuario">Nombre de Usuario</label>
						<input type="text" class="form-control" id="nombreUsuario" name="nombreUsuario" placeholder="Nombre de Usuario">
					</div>
					<div class="form-group">
						<label for="email">Email</label>
						<input type="email" class="form-control" id="email" name="email" placeholder="Email">
					</div>
					<div class="form-group">
						<label for="clave">Clave</label>
						<input type="password" class="form-control" id="clave" name="clave" placeholder="Clave">
					</div>
					<div class="form-group">
						<label for="repiteClave">Repite la Clave</label>
						<input type="password" class="form-control" id="repiteClave" name="repiteClave" placeholder="Repite la Clave">
					</div>
					La clave debe cumplir los siguientes requisitos: <br>
				    <ul> 
						<li>La longitud mínima de la clave, debe ser de 4 carácteres como mínimo.</li> 
						<li>Sólo puede contener estos carácteres [A-Z][a-z][0-9]</li> 
						<li>Al menos debe contener una mayúscula (A-Z)</li> 
						<li>Al menos debe contener una minúscula (a-z)</li> 
						<li>Al menos debe contener un número (0-9)</li> 
					</ul>
				</div>
				<div class="col-md-2"></div>
				<div class="col-md-4">
				
				</div>
				<div class="col-md-1"></div>
			</div>
		</form>
				<!-- <form action="crear.html" class="form-horizontal" method="post" id="form1" name="form1">
					<div class="row">
						<div class="col-md-5">
							<div class="form-group">
								<label for="nombreUsuario" class="cols-sm-2 control-label">Nombre de Usuario</label>
								<div class="cols-sm-10">
									<div class="input-group">
										<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
										<input type="text" class="form-control" name="nombreUsuario" id="nombreUsuario" placeholder="introduce tú nombre de usuario" required/>
									</div>
								</div>
							</div>
	
							<div class="form-group">
								<label for="email" class="cols-sm-2 control-label">Email</label>
								<div class="cols-sm-10">
									<div class="input-group">
										<span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
										<input type="email" class="form-control" name="email" id="email"  placeholder="Introduce tú email" required/>
									</div>
								</div>
							</div>
							
							<div class="form-group">
								<label for="clave" class="cols-sm-2 control-label">Clave</label>
								<div class="cols-sm-10">
									<div class="input-group">
										<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
										<input type="password" class="form-control" name="clave" id="clave"  placeholder="Introduce tú clave" required/>
									</div>
								</div>
							</div>
	
							<div class="form-group">
								<label for="repiteClave" class="cols-sm-2 control-label">Confirma Clave</label>
								<div class="cols-sm-10">
									<div class="input-group">
										<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
										<input type="password" class="form-control" name="repiteClave" id="repiteClave"  placeholder="Vuelve a introducir tú clave" required/>
									</div>
								</div>
							</div>
							
							
						    La clave debe cumplir los siguientes requisitos: <br>
						    <ul> 
								<li>La longitud mínima de la clave, debe ser de 4 carácteres como mínimo.</li> 
								<li>Al menos debe contener una mayúscula (A - Z)</li> 
								<li>Al menos debe contener una minúscula (a - z)</li> 
								<li>Al menos debe contener un número (0 - 9)</li> 
							</ul>
						</div>
						<div class="col-md-2">
							
						</div>
							
						<div class="col-md-5">
							<div class="form-group">
								<label for="nombreApellidos" class="cols-sm-2 control-label">Nombre y Apellidos</label>
								<div class="cols-sm-10">
									<div class="input-group">
										<span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
										<input type="text" class="form-control" name="nombreApellidos" id="nombreApellidos"  placeholder="Introduce tú nombre y tus apellidos" required />
									</div>
								</div>
							</div>
	
							<div class="form-group">
								<label for="edad" class="cols-sm-2 control-label">Edad</label>
								<div class="cols-sm-10">
									<div class="input-group">
										<span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
										<input type="number" class="form-control" name="edad" id="edad"  min="1" max="200" placeholder="Introduce tu edad" required />
									</div>
								</div>
							</div>
							
							<div class="form-group">
								<label for="ciudad" class="cols-sm-2 control-label">Ciudad</label>
								<div class="cols-sm-10">
									<div class="input-group">
										<span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
										<input type="text" class="form-control" name="ciudad" id="ciudad"  placeholder="Introduce tu ciudad" required />
									</div>
								</div>
							</div>
							
							<div class="form-group">
								<label for="pais" class="cols-sm-2 control-label">Pais</label>
								<div class="cols-sm-10">
									<div class="input-group">
										<span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
										<input type="text" class="form-control" name="pais" id="pais"  placeholder="Introduce tu pais" required />
									</div>
								</div>
							</div>
							
							<div class="form-group">
								<label for="genero" class="cols-sm-2 control-label">Género</label>
								<div class="cols-sm-10">
										<div class="row">
											<div class="col-md-4 center">
												<br>Hombre
											</div>
											<div class="col-md-2">
												<input type="radio" class="form-control" name="genero" id="genero_Hombre"  value="Hombre" required />
											</div>
											<div class="col-md-4 center">
												<br>Mujer
											</div>
											<div class="col-md-2">
												<input type="radio" class="form-control" name="genero" id="genero_Mujer"  value="Mujer" required />
											</div>
										</div>
								</div>
							</div>
	
							<div class="form-group ">
								<button type="submit" class="btn btn-primary btn-lg btn-block login-button">Registrarse</button>
							</div>
							
							<a href="https://sistemaflashcards.herokuapp.com" class="login centro">
				                Login
				            </a><br>
				            <a href="recovery.html" class="forgot-password">
				                ¿Olvidaste la Clave?
				            </a>
						</div>
					</div>
				</form>-->
		<script language="JavaScript" type="text/javascript">
			/*document.form1.nombreUsuario.value = "${usuario.getUsuario()}";
			document.form1.clave.value = "${usuario.getClave()}";
			document.form1.repiteClave.value = "${usuario.getClave()}";
			document.form1.email.value = "${usuario.getEmail()}";
			document.form1.nombreApellidos.value = "${usuario.getNombreApellidos()}";
			document.form1.edad.value = "${usuario.getEdad()}";
			document.form1.ciudad.value = "${usuario.getCiudad()}";
			document.form1.pais.value = "${usuario.getPais()}";*/
			
			document.getElementById("nombreUsuario").value = "${usuario.getUsuario()}";
			document.getElementById("clave").value = "${usuario.getClave()}";
			document.getElementById("repiteClave").value = "${usuario.getClave()}";
			document.getElementById("email").value = "${usuario.getEmail()}";
			document.getElementById("nombreApellidos").value = "${usuario.getNombreApellidos()}";
			document.getElementById("edad").value = "${usuario.getEdad()}";
			document.getElementById("ciudad").value = "${usuario.getCiudad()}";
			document.getElementById("pais").value = "${usuario.getPais()}";
			
			var genero = "${usuario.getGenero()}";
			var hombre = "Hombre";
			var mujer = "Mujer";
			var resultH = genero.localeCompare(hombre);
			var resultM = genero.localeCompare(mujer);
			if(resultH eq 0){
				document.getElementById("genero_Hombre").checked = true;
				document.getElementById("genero_Mujer").checked = false;
			}else{
				if(resultM eq 0){
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