<html>
	<head>
		<title>Modificar Perfil - Flashcards</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<style>		
			div.center {
			    text-align: center;
			}
			
			.navbar-nav > li > a, .navbar-brand {
			    padding-top:4px !important; 
			    padding-bottom:0 !important;
			    height: 28px;
			}
			.navbar {min-height:28px !important;}
			
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
			if(user==null || user.getUsuario().equals("")){
				response.sendRedirect("https://sistemaflashcards.herokuapp.com");
			}
			session.setAttribute("usuario", user);
		%>
		<script language="JavaScript" type="text/javascript">
			if("${mensaje}" != ""){
				alert("${mensaje}");
			}
		</script>
		<nav class="navbar navbar-default">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="#">WebSiteName</a>
	    		</div>
	    		<ul class="nav navbar-nav">
	      			<li class="active"><a href="inicio.html">Inicio</a></li>
	      			<li><a href="miPerfil.html">Mi Perfil</a></li>
	      			<li><a href="gente.html">Gente</a></li>
	      			<li><a href="clubes.html">Clubes</a></li>
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
		<div class="row"> 
		    <div class="container">
		        <div class="card card-container">
					<form action="mPerfil.html" class="form-horizontal" method="post" id="form1" name="form1">
						<input type="hidden" name="usuarioAntiguo" id="usuarioAntiguo" value = "${usuario.getUsuario()}">
						<div class="row">
							<div class="col-md-5">
								<div class="form-group">
									<label for="nombreUsuario" class="cols-sm-2 control-label">Nombre de Usuario</label>
									<div class="cols-sm-10">
										<div class="input-group">
											<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
											<input type="text" class="form-control" name="nombreUsuario" id="nombreUsuario" value = ${usuario.getUsuario()} required/>
										</div>
									</div>
								</div>
				
								<div class="form-group">
									<label for="email" class="cols-sm-2 control-label">Email</label>
									<div class="cols-sm-10">
										<div class="input-group">
											<span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
											<input type="email" class="form-control" name="email" id="email"  value = ${usuario.getEmail()} required/>
										</div>
									</div>
								</div>
								
								<div class="form-group">
									<label for="clave" class="cols-sm-2 control-label">Clave</label>
									<div class="cols-sm-10">
										<div class="input-group">
											<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
											<input type="password" class="form-control" name="clave" id="clave" value = ${usuario.getClave()} required/>
										</div>
									</div>
								</div>
				
								<div class="form-group">
									<label for="repiteClave" class="cols-sm-2 control-label">Confirma Clave</label>
									<div class="cols-sm-10">
										<div class="input-group">
											<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
											<input type="password" class="form-control" name="repiteClave" id="repiteClave"  value = ${usuario.getClave()} required/>
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
											<input type="text" class="form-control" name="nombreApellidos" id="nombreApellidos" value = ${usuario.getNombreApellidos()} required />
										</div>
									</div>
								</div>
				
								<div class="form-group">
									<label for="edad" class="cols-sm-2 control-label">Edad</label>
									<div class="cols-sm-10">
										<div class="input-group">
											<span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
											<input type="number" class="form-control" name="edad" id="edad"  min="1" max="200" value = ${usuario.getEdad()} required />
										</div>
									</div>
								</div>
								
								<div class="form-group">
									<label for="ciudad" class="cols-sm-2 control-label">Ciudad</label>
									<div class="cols-sm-10">
										<div class="input-group">
											<span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
											<input type="text" class="form-control" name="ciudad" id="ciudad" value = ${usuario.getCiudad()} required />
										</div>
									</div>
								</div>
								
								<div class="form-group">
									<label for="pais" class="cols-sm-2 control-label">Pais</label>
									<div class="cols-sm-10">
										<div class="input-group">
											<span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
											<input type="text" class="form-control" name="pais" id="pais" value = ${usuario.getPais()} required />
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
									<button type="submit" class="btn btn-primary btn-lg btn-block login-button">Guardar Cambios</button>
								</div>
							</div>
						</div>
					</form>
					<script language="JavaScript" type="text/javascript">
						var genero = "${usuario.getGenero()}";
						var hombre = "Hombre";
						var result = genero.localeCompare(hombre);
						if (result == 0){
							document.getElementById("genero_Hombre").checked = true;
							document.getElementById("genero_Mujer").checked = false;
						}else{
							document.getElementById("genero_Hombre").checked = false;
							document.getElementById("genero_Mujer").checked = true;
						}
					</script>
				</div>
			</div>
		</div>
	</body>
</html>