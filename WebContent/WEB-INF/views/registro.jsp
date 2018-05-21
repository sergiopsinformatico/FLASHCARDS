<html>
	<head>
		<title>REGISTRO DE USUARIOS</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	</head>
	<body>
		<script>
			if("${mensaje}" != ""){
				alert("${mensaje}");
			}
		</script>
		<style>
			body, html{
			    height: 100%;
			 	background-repeat: no-repeat;
			 	background-color: #d3d3d3;
			 	font-family: 'Oxygen', sans-serif;
			}
			
			div.center{
				text-align: center;
				vertical-align: middle;
			}
			
			.main{
			 	margin-top: 70px;
			}
			
			h1.title { 
				font-size: 50px;
				font-family: 'Passion One', cursive; 
				font-weight: 400; 
			}
			
			hr{
				width: 10%;
				color: #fff;
			}
			
			.form-group{
				margin-bottom: 15px;
			}
			
			label{
				margin-bottom: 15px;
			}
			
			input,
			input::-webkit-input-placeholder {
			    font-size: 11px;
			    padding-top: 3px;
			}
			
			.main-login{
			 	background-color: #fff;
			    /* shadows and rounded borders */
			    -moz-border-radius: 2px;
			    -webkit-border-radius: 2px;
			    border-radius: 2px;
			    -moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
			    -webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
			    box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
			
			}
			
			.main-center{
			 	margin-top: 30px;
			 	margin: 0 auto;
			 	max-width: 330px;
			    padding: 40px 40px;
			
			}
			
			.login-button{
				margin-top: 5px;
			}
			
			.login-register{
				font-size: 11px;
				text-align: center;
			}
			
		</style>
		
		<div class="container">
			<div class="row main">
				<div class="panel-heading">
	               <div class="panel-title text-center">
	               		<h1 class="title">Crea tu Cuenta</h1>
	               		<hr />
	               	</div>
	            </div> 
				<div class="main-login main-center">
					<form action="crear.html" class="form-horizontal" method="post" id="form1">
						
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
									<input type="password" class="form-control" name="repiteClave" id="repiteClave"  placeholder="Confirma tu clave" required/>
								</div>
							</div>
						</div>
						
						<ul> 
					    	La clave debe cumplir los siguientes requisitos: <br>
							<li>La longitud mínima de la clave, debe ser de 4 carácteres como mínimo.</li> 
							<li>Al menos debe contener una mayúscula (A - Z)</li> 
							<li>Al menos debe contener una minúscula (a - z)</li> 
							<li>Al menos debe contener un número (0 - 9)</li> 
						</ul>
						
						<div class="form-group">
							<label for="nombre" class="cols-sm-2 control-label">Nombre</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
									<input type="text" class="form-control" name="nombre" id="nombre"  placeholder="Introduce tú nombre" required />
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="apellidos" class="cols-sm-2 control-label">Apellidos</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
									<input type="text" class="form-control" name="apellidos" id="apellidos"  placeholder="Introduce tus apellidos" required />
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
						<div class="login-register">
				            <a href="login.html">Login</a>
				         </div>
					</form>
				</div>
			</div>
		</div>

		<script language="JavaScript" type="text/javascript">
			document.form1.nombreUsuario.value = "${usuario.getUsuario()}";
			document.form1.clave.value = "${usuario.getClave()}";
			document.form1.repiteClave.value = "${usuario.getClave()}";
			document.form1.email.value = "${usuario.getEmail()}";
			document.form1.nombre.value = "${usuario.getNombre()}";
			document.form1.apellidos.value = "${usuario.getApellidos()}";
			document.form1.edad.value = "${usuario.getEdad()}";
			document.form1.ciudad.value = "${usuario.getCiudad()}";
			document.form1.pais.value = "${usuario.getPais()}";
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
	</body>
</html>