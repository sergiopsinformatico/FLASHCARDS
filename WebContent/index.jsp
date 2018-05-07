<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
		<title>FLASHCARDS</title>
	</head>
	<body>
		<% 
			if(session.getAttribute("usuario")!=null){
				response.sendRedirect("/Flashcards/principal.html");
			}
		%>
		<script language="JavaScript" type="text/javascript">
			if("${mensaje}" != ""){
				alert("${mensaje}");
			}
		</script>
		<style>
			body {
			    background-color: powderblue;
			}
			h4 {
			    color: blue;
			}
			h2 {
			    color: green;
			}
			form.border-login{
				border-style: solid;
    			border-width: 1px;
    			border-color: red;
    			background-color: white;
			}
		</style>
		<div class="container">
		  <div class="row">
		    <div class="col-md-12">
		      <h2 align="center">
				FLASHCARDS. Sistema Basado En Aprendizaje con Tarjetas.
			  </h2>
		    </div>
		    <br><br><br><br>
		  </div>
		  
		  <div class="row">
		    <div class="col-md-4">
		    </div>
		    <div class="col-md-4">
		      
		      <form action="iniciarSesion.html" method="post" class="border-login" name="form1">
		          <div class="row" align="center">
		          	<div class="col-md-12">
		          		<h4>Inicia Sesión con tu Cuenta</h4>
		          	</div>
		          </div>
				  <div class="row" align="center">
				    <label for="inputEmail3" class="col-md-12">Usuario o Email</label>
				  </div>
				  <div class="row" align="center">
					   <div class="col-md-1" align="center">
					   </div>
					   <div class="col-md-10" align="center">
					   	<input type="text" class="form-control" align="center" name="usuario" id="usuario" placeholder="Usuario o Email" required>
					   </div>
					   <div class="col-md-1" align="center">
					   </div>
				  </div>
				  <br>
				  <div class="row" align="center">
				    <label for="inputPassword3" class="col-md-12">Clave</label>
				  </div>
				  <div class="row" align="center">
				    <div class="col-md-1" align="center">
					</div>
					<div class="col-md-10" align="center">
				      <input type="password" class="form-control" align="center" name="clave" id="clave" placeholder="Clave" required>
				    </div>
			        <div class="col-md-1" align="center">
					</div>
				  </div>
				  <br><br>
				  <div class="form-group row" align="center">
				    <div class="col-md-2" align="center">
					</div>
					<div class="col-md-8" align="center">
				      <button type="submit" class="btn btn-primary">Iniciar Sesion</button>
				    </div>
				    <div class="col-md-2" align="center">
					</div>
				  </div>
				  <div class="row" align="center">
				  	<div class="col-md-12">
				  		<h8><a href="recovery.html">¿No recuerdas tu clave de acceso?</a></h8>
				  	</div>
				  </div>
				  <div class="row" align="center">
				  	<div class="col-md-12">
				  		<h8>Si aun no tienes cuenta, <a href="registro.html">REGISTRATE AQUÍ</a></h8>
				  	</div>
				  </div>
				</form>
		    </div>
		    <div class="col-md-4">
		    </div>
		  </div>
		  <br><br><br>
		  <div class="row">
		    <div class="col-md-12" align="center">
		      Aplicación Desarrollada por Sergio Pérez Sánchez. Año 2018.
		    </div>
		  </div>
		</div>
	</body>
</html>