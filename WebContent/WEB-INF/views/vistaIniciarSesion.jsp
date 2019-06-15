<!DOCTYPE html>
<html lang="en">
  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Flashcards - Iniciar Sesión</title>

    <!-- Bootstrap core CSS -->
    <link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">

    <!-- Plugin CSS -->
    <link href="resources/vendor/magnific-popup/magnific-popup.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="resources/css/inicioSesion.css"/>

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
	        	FLASHCARDS
	        </a>
	        <button class="navbar-toggler navbar-toggler-right text-uppercase bg-primary text-white rounded" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
	          Menu
	          <i class="fas fa-bars"></i>
	        </button>
	        <div class="collapse navbar-collapse" id="navbarResponsive">
	          <ul class="navbar-nav ml-auto">
	            <li class="nav-item mx-0 mx-lg-1">
	              <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="registro.html">¡Regístrate!</a>
	            </li>
	            <li class="nav-item mx-0 mx-lg-1">
	              <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="recuperarCuenta.html">Ups... ¿Olvidaste tu Cuenta?</a>
	            </li>
	          </ul>
	        </div>
	      </div>
	    </nav>
	</header>
	
	<section class="fondoIS">
		<br><br>
		<div class="row">
			<div class="col-md-4"></div>
			<div class="col-md-4 windowLogin">
				<div class="row" style="text-align:center;">
					<br>
					<h4 class="title">Iniciar Sesión</h4>
					<br>
				</div>
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<form action="loguear.html" method="post" id="Login" name="Login" class="form-signin">
			                <span id="reauth-email" class="reauth-email"></span>
			                <input type="text" class="form-control" id="inputUsernameEmail" name="inputUsernameEmail" placeholder="Username o Email" required autofocus>
			                <br>
			                <input type="password" class="form-control" id="inputClave" name="inputClave" placeholder="Clave" required>
			                <br><br>
			                <div class="middle">
			                	<div class="g-recaptcha positionReCaptcha" data-theme="light" data-sitekey="6LfaZ4EUAAAAAFcqOxY0fsiDeh17WHqRhLdEQPZw" data-callback="enableBtn"></div>
			                </div>
			                <br><br>
			                <button class="btn btn-lg btn-block btn-signin color-block" id="buttonIS" name="buttonIS" type="submit">Iniciar Sesión</button>
			                <script>
			                	document.getElementById("buttonIS").disabled = true;
					        	function enableBtn(){
					        		/*document.getElementById("buttonIS").style.background = "#45BF1D";*/
					        		document.getElementById("buttonIS").style.background = "#457D8E";
					        		document.getElementById("buttonIS").disabled = false;
					        	}
					        </script>
					        <br><br>
					     </form>
					</div>
					<div class="col-md-2"></div>
				</div>
			</div>
			<div class="col-md-4"></div>
		</div>
		<!-- <div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<div class="row">
					<div class="col-md-4 fondoLogin container">
						<br>
						<h6 align="center" class="title">Iniciar Sesión</h6>
						<br>
		   				<form action="loguear.html" method="post" id="Login" name="Login" class="form-signin">
			                <span id="reauth-email" class="reauth-email"></span>
			                <input type="text" class="form-control" id="inputUsernameEmail" name="inputUsernameEmail" placeholder="Username o Email" required autofocus>
			                <br>
			                <input type="password" class="form-control" id="inputClave" name="inputClave" placeholder="Clave" required>
			                <br><br>
			                <div class="middle">
			                	<div class="g-recaptcha positionReCaptcha" data-theme="light" data-sitekey="6LfaZ4EUAAAAAFcqOxY0fsiDeh17WHqRhLdEQPZw" data-callback="enableBtn"></div>
			                </div>
			                <br><br>
			                <button class="btn btn-lg btn-block btn-signin color-block" id="buttonIS" name="buttonIS" type="submit">Iniciar Sesión</button>
			                <script>
			                	document.getElementById("buttonIS").disabled = true;
					        	function enableBtn(){
					        		document.getElementById("buttonIS").style.background = "#45BF1D";
					        		document.getElementById("buttonIS").disabled = false;
					        	}
					        </script>
					        <br><br>
			            </form>
		   			</div>
		   			<div class="col-md-4 middle">
						<div class="containerImg">
							<img src="resources/img/logoFlashcards.JPG" alt=""/>
						</div>
					</div>
		   			<div class="col-md-4 fondoRecovery container">
		   				<br>
		   				<h6 align="center" class="title">Ups!... ¿Olvidaste la clave?</h6>
		   				<br>
		   				<form action="recuperaClave.html" method="post" id="Login" name="Login">
		   					<span id="reauth-email" class="reauth-email"></span>
			                <input type="text" class="form-control" id="inputUsernameEmail" name="inputUsernameEmail" placeholder="Username o Email" required autofocus>
					        <br><br><br>
			                <div class="middle">
			                	<div class="g-recaptcha positionReCaptcha" data-theme="light" data-sitekey="6LfaZ4EUAAAAAFcqOxY0fsiDeh17WHqRhLdEQPZw" data-callback="enableBtnRec"></div>
			                </div>
			                <br><br>
					        <button class="btn btn-lg btn-block btn-signin color-block" id="buttonRec" name="buttonRec" type="submit">Recuperar Clave</button>
					        <script>
					        	document.getElementById("buttonRec").disabled = true;
					        	function enableBtnRec(){
					        		document.getElementById("buttonRec").style.background = "#FFD142";
					        		document.getElementById("buttonRec").disabled = false;
					        	}
					        </script>
					        <br><br>
					    </form>
		   			</div>
				</div>
			</div>
			<div class="col-md-1"></div>
		</div>-->
	</section>

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