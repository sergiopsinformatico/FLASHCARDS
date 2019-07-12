<!DOCTYPE html>
<html lang="en">
  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Flashcards - Activación Cuenta de ${activa.getUsername()}</title>

    <!-- Bootstrap core CSS -->
    <link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">

    <!-- Plugin CSS -->
    <link href="resources/vendor/magnific-popup/magnific-popup.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="resources/css/accesoFlashcards.css"/>

    <!-- Custom styles for this template -->
    <link href="resources/css/freelancer.min.css" rel="stylesheet">
    
    <!-- Angular JS -->
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
    
    
    
  </head>

  <body id="page-top">		

   <!-- Navigation -->
    <header class="header">
	    <nav class="navbar navbar-expand-lg bg-secondary fixed-top text-uppercase" id="mainNav">
	      <div class="container">
	        <a class="navbar-brand js-scroll-trigger" href="inicio.html">
	        	<img class="logoFlashcards" src="resources/img/logoFlashcards.JPG" alt=""/>
	        </a>
	      </div>
	    </nav>
	</header>
	    
    <section class="background">
   		<br><br><br><br>
    	<div class="row">
    		<div class="col-md-4"></div>
    		<div class="col-md-4 formAccess textCenter container">
    			<br>
    			<h4 class="title">Activar Cuenta</h4>
	    		<br>
	    		<div class="row">
	    			<div class="col-md-2"></div>
	    			<div class="col-md-8">
		    			<div class="row" style="text-align: center;">
		    				<p class="mensajeInfo">¡Enhorabuena ${activa.getUsername()}! Su cuenta ha sido activada correctamente.</p>
		    				<p class="mensajeInfo">De manera opcional, puede rellenar los siguientes campos. Cuando finalice pulse en siguiente:</p>
		    			</div>
		    			<div class="row">
		    				<form action="infoExtra.do" method="post" id="ActivaCuenta" name="ActivaCuenta">
		    					<div class="form-group">
						            <input type="text" class="form-control" id="inputNyA" name="inputNyA" placeholder="Nombre y Apellidos">
						        </div>
						        <div class="form-group">
						            <input type="text" class="form-control" id="inputCiudad" name="inputCiudad" placeholder="Ciudad">
						        </div>
						        <div class="form-group">
						            <input type="text" class="form-control" id="inputPais" name="inputPais" placeholder="Pais">
						        </div>
						        <br>
						        <h6 class="mensajeInfo">Foto de Perfil (con GRAVATAR)</h6>
						        <div class="form-group">
						        	<p class="mensajeNotifica"><b>GRAVATAR</b> es un servicio que ofrece un avatar único globalmente a través de tu email. Si no estás registrado, accede <a href="https://es.gravatar.com/" target="_blank">aquí</a> para registrarte y elige que foto de perfil. Indica en el siguiente campo, el email con el que estás registrado en Gravatar.</p>
									<br>
									<input type="text" class="form-control" id="inputEmailAvatar" name="inputEmailAvatar" placeholder="">
									<br>
									<p class="mensajeNotifica">Si no incluyes ninguna dirección de email, se te asignará una foto de perfil por defecto.</p>
								</div>
								<input type="hidden" id="username" name="username" value="${activa.getUsername()}">
						        <br>
						        <div class="row middle">
						        	<button type="submit" class="btn btn-success">Siguiente</button>
						        </div>
						        <div class="row">
						        	<br><br>
						        </div>
						    </form>
		    			</div>
	    			</div>
	    			<div class="col-md-2"></div>
	    		</div>
    		</div>
    		<div class="col-md-4"></div>
		</div>
    </section>

    <!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
    <div class="scroll-to-top d-lg-none position-fixed ">
      <a class="js-scroll-trigger d-block text-center text-white rounded" href="#page-top">
        <i class="fa fa-angle-up"></i>
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
    
    <!--Re captcha google-->
    <script src='https://www.google.com/recaptcha/api.js'></script>
	
	<!-- Alert de Bootbox -->
    <script src="resources/js/bootbox.min.js"></script>
	
	<script>
		if("${mensaje}" != ""){
			bootbox.alert("${mensaje}");
		}
	</script>

  </body>

</html>