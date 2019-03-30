
<!DOCTYPE html>
<html lang="en">
  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Flashcards - Usuario ${perfil.getUsername()}</title>

    <!-- Bootstrap core CSS -->
    <link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">

    <!-- Plugin CSS -->
    <link href="resources/vendor/magnific-popup/magnific-popup.css" rel="stylesheet" type="text/css">

    <!-- Custom styles for this template -->
    <link href="resources/css/freelancer.min.css" rel="stylesheet">
    
    <!-- Angular JS -->
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
    
    <link href="resources/vendor/bootstrap/css/glyphicon.css" rel="stylesheet" type="text/css">
    
    <style>
    	body {
		  background: #F1F3FA;
		}
		
		/* Profile container */
		.profile {
		  margin: 20px 0;
		  min-width: 100%;
		  min-height: 100%;
		}
		
		/* Profile sidebar */
		.profile-sidebar {
		  padding: 20px 0 10px 0;
		  background: #fff;
		  height: 100%;
		  min-height: 100%;
		  
		}
		
		.profile-userpic img {
		  float: none;
		  display: block; 
		  margin: 0 auto;
		  width: 50%;
		  height: 50%;
		  margin-left: auto;
  		  margin-right: auto;
		  -webkit-border-radius: 50% !important;
		  -moz-border-radius: 50% !important;
		  border-radius: 50% !important;
		}
		
		.text {
		  background-color: #97BBFF;
		  color: white;
		  font-size: 16px;
		  padding: 16px 32px;
		}

    </style>
    
  </head>

  <body id="page-top">
  
 	<!-- Bootstrap core JavaScript -->
    <script src="resources/vendor/jquery/jquery.min.js"></script>
    <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="resources/vendor/magnific-popup/jquery.magnific-popup.min.js"></script>

    <!-- Contact Form JavaScript -->
    <script src="resources/js/jqBootstrapValidation.js"></script>
    <script src="resources/js/contact_me.js"></script>

    <!-- Custom scripts for this template -->
    <script src="resources/js/freelancer.min.js"></script>
    
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg bg-secondary fixed-top text-uppercase" id="mainNav">
      <div class="container">
        <a class="navbar-brand js-scroll-trigger" href="/">FLASHCARDS</a>
        <!-- <button class="navbar-toggler navbar-toggler-right text-uppercase bg-primary text-white rounded" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          Menu
          <i class="fas fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item mx-0 mx-lg-1" id="adminOption">
              <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="/administrador.html">Opciones de Administrador</a>
            </li>
          </ul>
        </div>-->
      </div>
    </nav>
    
    <section>
	    <div class="container">
		    <div class="row profile">
				<div class="col-md-3">
					<div class="profile-sidebar" style="height:100%;">
						<div class="profile-userpic">
							<img src="${perfil.getFoto()}" class="img-responsive" alt="">
						</div>
						<br>
						<div class="row">
							<div class="col-md-1"></div>
							<div class="col-md-11">
								<div class="form-group">
						            <p align="justify"><b>Username:</b> ${perfil.getUsername()}</p>
						        </div>
						        <div class="form-group">
						            <p align="justify" id="textNyA" style="visibility:hidden;"><b>Nombre y Apellidos:</b>${perfil.getNombreApellidos()}</p>
						        </div>
						        <div class="form-group">
						            <p align="justify" id="textCiudad" style="visibility:hidden;"><b>Ciudad:</b>${perfil.getCiudad()}</p>
						        </div>
						        <div class="form-group">
						            <p align="justify" id="textPais" style="visibility:hidden;"><b>País:</b>${perfil.getPais()}</p>
						        </div>
							</div>
						</div>
						<div class="row" id="amigos" style="display:none">
							<form action="/eliminaAmigo.do?username=${perfil.getUsername()}&logueado=${logueado}" method="post">
								<input type="submit" class="btn btn-primary" value="Eliminar a ${perfil.getUsername()} como amigo">
							</form>
							<form action="/bloqueaUsuario.do?username=${perfil.getUsername()}&logueado=${logueado}" method="post">
								<input type="submit" class="btn btn-primary" value="Bloquear a ${perfil.getUsername()}">
							</form>
						</div>
						<div class="row" id="bloqueado" style="display:none">
							<form action="/desbloqueaUsuario.do?username=${perfil.getUsername()}&logueado=${logueado}" method="post">
								<input type="submit" class="btn btn-success" value="Desbloquear a ${perfil.getUsername()}">
							</form>
						</div>
						<div class="row" id="pdaEnvia" style="display:none">
							Solicitud de amistad enviada a ${perfil.getUsername()}.
						</div>
						<div class="row" id="pdaRecibe" style="display:none">
							<form action="/aceptaPdA.do?username=${perfil.getUsername()}&logueado=${logueado}" method="post">
								<input type="submit" class="btn btn-success" value="Aceptar peticion de ${perfil.getUsername()}">
							</form>
							<form action="/rechazaPdA.do?username=${perfil.getUsername()}&logueado=${logueado}" method="post">
								<input type="submit" class="btn btn-danger" value="Rechazar peticion de ${perfil.getUsername()}">
							</form>
							<form action="/bloqueaUsuario.do?username=${perfil.getUsername()}&logueado=${logueado}" method="post">
								<input type="submit" class="btn btn-primary" value="Bloquear a ${perfil.getUsername()}">
							</form>
						</div>
						<div class="row" id="none" style="display:none">
							<form action="/enviarPdA.do?username=${perfil.getUsername()}&logueado=${logueado}" method="post">
								<input type="submit" class="btn btn-success" value="Enviar peticion a ${perfil.getUsername()}">
							</form>
							<form action="/bloqueaUsuario.do?username=${perfil.getUsername()}&logueado=${logueado}" method="post">
								<input type="submit" class="btn btn-primary" value="Bloquear a ${perfil.getUsername()}">
							</form>
						</div>
					</div>
				</div>
				<div class="col-md-9"></div>
			</div>
		</div>
	</section>
	
	<script>
		if("${perfil.getNombreApellidos()}"!=null && "${perfil.getNombreApellidos()}"!=""){
			document.getElementById("textNyA").style.visibility="visible";
		}
		if("${perfil.getCiudad()}"!=null && "${perfil.getCiudad()}"!=""){
			document.getElementById("textCiudad").style.visibility="visible";
		}
		if("${perfil.getPais()}"!=null && "${perfil.getPais()}"!=""){
			document.getElementById("textPais").style.visibility="visible";
		}
		if("${relacion}"!=null && ("${relacion}").localeCompare("")!=0){
			if(("${relacion}").localeCompare("amigos")==0){
				document.getElementById("amigos").style.display = "block";
			}else if(("${relacion}").localeCompare("bloqueado")==0){
				document.getElementById("bloqueado").style.display = "block";
			}else if(("${relacion}").localeCompare("pdaEnvia")==0){
				document.getElementById("pdaEnvia").style.display = "block";
			}else if(("${relacion}").localeCompare("pdaRecibe")==0){
				document.getElementById("pdaRecibe").style.display = "block";
			}else if(("${relacion}").localeCompare("none")==0){
				document.getElementById("none").style.display = "block";
			}
		}
	</script>
	
	<!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
    <div class="scroll-to-top d-lg-none position-fixed ">
      <a class="js-scroll-trigger d-block text-center text-white rounded" href="#page-top">
        <i class="fa fa-chevron-up"></i>
      </a>
    </div>

	
	<!-- Bootstrap core JavaScript -->
    <script src="resources/vendor/jquery/jquery.min.js"></script>
    <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="resources/vendor/magnific-popup/jquery.magnific-popup.min.js"></script>

    <!-- Contact Form JavaScript -->
    <script src="resources/js/jqBootstrapValidation.js"></script>
    <script src="resources/js/contact_me.js"></script>

    <!-- Custom scripts for this template -->
    <script src="resources/js/freelancer.min.js"></script>
    
    <!-- Alert de Bootbox -->
    <script src="resources/js/bootbox.min.js"></script>
	
	<script>
		if("${mensaje}" != ""){
			bootbox.alert("${mensaje}");
		}
	</script>

  </body>

</html>