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
	        <a class="navbar-brand js-scroll-trigger" href="/">FLASHCARDS</a>
	        <button class="navbar-toggler navbar-toggler-right text-uppercase bg-primary text-white rounded" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
	          Menu
	          <i class="fas fa-bars"></i>
	        </button>
	        <div class="collapse navbar-collapse" id="navbarResponsive">
	          <ul class="navbar-nav ml-auto">
	            <li class="nav-item mx-0 mx-lg-1">
	              <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="/registro.html">Registrarse</a>
	            </li>
	            <!-- <li class="nav-item mx-0 mx-lg-1">
	              <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="/recuperarCuenta.html">¿Has olvidado la clave?</a>
	            </li>-->
	          </ul>
	        </div>
	      </div>
	    </nav>
	</header>
    <section class="background">
		<br><br><br><br>
    	<div class="row">
    		<!-- <div class="col-md-4"></div>-->
    		<!-- <div class="col-md-4">
    			<br>
    			<h1 align="center">Iniciar Sesión</h1>
    			<br> 
    			<form action="loguear.html" method="post" id="Login" name="Login">
			        <div class="form-group">
			            <input type="text" class="form-control" id="inputUsernameEmail" name="inputUsernameEmail" placeholder="Username o Email" required>
			        </div>
			        <div class="form-group">
			            <input type="password" class="form-control" id="inputClave" name="inputClave" placeholder="Clave" required>
			        </div>
			        <br>
			        <div class="row" align="center">
			        	<div class="g-recaptcha positionReCaptcha" data-sitekey="6LfaZ4EUAAAAAFcqOxY0fsiDeh17WHqRhLdEQPZw" data-callback="enableBtn"></div>
			        </div>
			        <br>
			        <div class="row">
			        	<div class="col-md-3"></div>
			        	<div class="col-md-6">
			        		<button type="submit" id="buttonIS" name="buttonIS" class="btn-login">Iniciar Sesion</button>
			        	</div>
			        	<script>
			        		document.getElementById("buttonIS").disabled = true;
			        	</script>
			        	<div class="col-md-3"></div>
			        </div>
			        <script>
			        	function enableBtn(){
			        		document.getElementById("buttonIS").style.background = "#61E900";
			        		document.getElementById("buttonIS").disabled = false;
			        	}
			        </script>
			    </form>
			</div>-->
			<!-- <div class="col-md-4">
				<div class="container">
			        <div class="card card-container">
			            <h5 class="card-title text-center">Iniciar Sesion</h5>
			            <form action="loguear.html" method="post" id="Login" name="Login" class="form-signin">
			                <span id="reauth-email" class="reauth-email"></span>
			                <input type="text" class="form-control" id="inputUsernameEmail" name="inputUsernameEmail" placeholder="Username o Email" required autofocus>
			                <input type="password" class="form-control" id="inputClave" name="inputClave" placeholder="Clave" required>
			                <br>
			                <div class="g-recaptcha positionReCaptcha" data-theme="light" data-sitekey="6LfaZ4EUAAAAAFcqOxY0fsiDeh17WHqRhLdEQPZw" data-callback="enableBtn"></div>
			                <br>
			                <button class="btn btn-lg btn-primary btn-block btn-signin" id="buttonIS" name="buttonIS" type="submit">Iniciar Sesión</button>
			                <script>
			                	document.getElementById("buttonIS").disabled = true;
					        	function enableBtn(){
					        		document.getElementById("buttonIS").style.background = "#61E900";
					        		document.getElementById("buttonIS").disabled = false;
					        	}
					        </script>
			            </form>
			        </div>
			    </div>
			</div>
    		<div class="col-md-4"></div>-->
    		<div class="col-md-1"></div>
    		<div class="col-md-5 middle">
				<div class="containerImg">
					<img src="resources/img/logoFlashcards.JPG" alt=""/>
				</div>
			</div>
    		<div class="col-md-5">
    			<div class="flip-card-container">
    				<div class="flip-card">
    					<div class="flip-card-front">
    						<h5 class="card-title text-center fondoLogin">Iniciar Sesion</h5>
				            <!-- <form action="loguear.html" method="post" id="Login" name="Login" class="form-signin">
				                <span id="reauth-email" class="reauth-email"></span>
				                <input type="text" class="form-control" id="inputUsernameEmail" name="inputUsernameEmail" placeholder="Username o Email" required autofocus>
				                <input type="password" class="form-control" id="inputClave" name="inputClave" placeholder="Clave" required>
				                <br>
				                <div class="g-recaptcha positionReCaptcha" data-theme="light" data-sitekey="6LfaZ4EUAAAAAFcqOxY0fsiDeh17WHqRhLdEQPZw" data-callback="enableBtn"></div>
				                <br>
				                <button class="btn btn-lg btn-primary btn-block btn-signin" id="buttonIS" name="buttonIS" type="submit">Iniciar Sesión</button>
				                <script>
				                	document.getElementById("buttonIS").disabled = true;
						        	function enableBtn(){
						        		document.getElementById("buttonIS").style.background = "#61E900";
						        		document.getElementById("buttonIS").disabled = false;
						        	}
						        </script>
				            </form>-->
				            <p onclick="gira()">Recupera</p>
				      	</div>
				      	<div class="flip-card-back fondoRecovery">
			    			<h5 class="card-title text-center">Ups!... Olvidaste la Clave</h5>
			    			<br>
			    			<p>Inserta tu nombre de usuario o email con el que te registraste y te enviaremos más información a tu correo</p>
			    			<!-- <form action="recuperaClave.html" method="post" id="Login" name="Login">
						        <div class="form-group">
						            <input type="text" class="form-control" id="inputUsernameEmail" name="inputUsernameEmail" placeholder="Introducir username o email" required>
						        </div>
						       <br>
						        <div class="row" align="center">
						        	<div class="g-recaptcha positionReCaptcha" data-sitekey="6LfaZ4EUAAAAAFcqOxY0fsiDeh17WHqRhLdEQPZw" data-callback="enableBtnRec"></div>
						        </div>
						        <br>
						        <div class="row">
						        	<div class="col-md-3"></div>
						        	<div class="col-md-6">
						        		<button type="submit" id="buttonRec" name="buttonRec" class="btn-recCuenta">Recuperar Clave</button>
						        	</div>
						        	<script>
						        		document.getElementById("buttonRec").disabled = true;
						        	</script>
						        	<div class="col-md-3"></div>
						        </div>
						        <script>
						        	function enableBtnRec(){
						        		document.getElementById("buttonRec").style.background = "#61E900";
						        		document.getElementById("buttonRec").disabled = false;
						        	}
						        </script>
						    </form>-->
						    <p onclick="gira()">Login</p>
				      	</div>
				    </div>
				 </div>
				 
				  <script>
				  function gira(){
					  /*const flipCardContainer = document.querySelector(".flip-card-container");
					  flipCardContainer.addEventListener("click", function(){
						  flipCardContainer.classList.toggle("flip");
					  });*/
					  document.querySelector(".flip-card-container").classList.toggle("flip");
				  }
				  	
				  </script>
				
				<!-- <script>
					function flip() {
					    $('.card').toggleClass('flipped');
					}
				</script>-->
    		
    			<!-- <card>
    				<h3 align="center">Regístrate</h3>
					<br>
                    <form ng-submit="envioDatos()" id="Registro" name="Registro">
	                    <div class="row">
	                        <div class="col-md-12">
	                            <div class="form-group">
	                                <input type="text" class="form-control" id="inputUsername" ng-model="username" ng-change="validateUsername($event, username)" name="inputUsername" placeholder="Username" required />
	                            </div>
	                            <div class="form-group">
	                                <input type="text" class="form-control" id="inputEmail" ng-model="email" ng-change="validateEmail($event, email)" name="inputEmail" placeholder="Email" required />
	                            </div>
	                            <div class="form-group">
	                                <input type="password" class="form-control" id="inputClave" ng-model="clave" ng-change="validateClave($event, clave, repClave)" name="inputClave" placeholder="Clave" required />
	                            </div>
	                            <div class="form-group">
	                                <input type="password" class="form-control"  id="inputRepiteClave" ng-model="repClave" ng-change="validateRepClave($event, clave, repClave)" name="inputRepiteClave" placeholder="Repetir Clave" required />
	                            </div>
	                            <div class="form-group">
	                                <small id="msgError">{{messageError}}</small>
	                            </div>
	                            <div class="form-group">
	                            	<input type="submit" class="btnRegister"  value="Registrar" id="button1" name="button1" disabled/>
	                            </div>
	                        </div>
	                    </div>
	            	</form>
    			</card>-->
    		</div>
    		<div class="col-md-1"></div>
		</div>
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