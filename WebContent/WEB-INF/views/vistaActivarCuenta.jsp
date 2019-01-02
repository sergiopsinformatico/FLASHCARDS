<!DOCTYPE html>
<html lang="en">
  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Flashcards - Activación Cuenta "${activa.getUsername()}</title>

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
    
    <style>
	    .profile-userpic img {
		  float: none;
		  margin: 0 auto;
		  width: 50%;
		  height: 50%;
		  -webkit-border-radius: 50% !important;
		  -moz-border-radius: 50% !important;
		  border-radius: 50% !important;
		}
    </style>
    
  </head>

  <body id="page-top">		
  
	<script language="JavaScript" type="text/javascript">
		if("${mensaje}" != ""){
			alert("${mensaje}");
		}
	</script>

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg bg-secondary fixed-top text-uppercase" id="mainNav">
      <div class="container">
        <a class="navbar-brand js-scroll-trigger" href="https://sistemaflashcards.herokuapp.com">FLASHCARDS</a>
      </div>
    </nav>
    <section>
    	<div class="row">
    		<br><br>
    	</div>
    	<div class="row">
    		<div class="col-md-4"></div>
    		<div class="col-md-4">
    			<div class="row" style="text-align: center;">
    				<span class = "label label-success" style="width:40px;">¡Enhorabuena ${activa.getUsername()}! Su cuenta ha sido activada correctamente.</span>
    			</div>
    			<div class="row">
    				<form action="activar.html" method="post" id="ActivaCuenta" name="ActivaCuenta">
    					De manera opcional, puede rellenar los siguientes campos. Cuando finalice pulse en siguiente:
				        <div class="form-group">
				            <input type="text" class="form-control" id="inputNyA" name="inputNyA" placeholder="Nombre y Apellidos" required>
				        </div>
				        <div class="form-group">
				            <input type="text" class="form-control" id="inputCiudad" name="inputCiudad" placeholder="Ciudad" required>
				        </div>
				        <div class="form-group">
				            <input type="text" class="form-control" id="inputPais" name="inputPais" placeholder="Pais" required>
				        </div>
				        <div class="form-group">
				        	<table align="center" style="width:50%">
							  <tr>
							    <th>
							    	<input type="radio" value="/resources/img/avatarNone.png" name="foto" checked>Sin foto
							    </th>
							  </tr>
							  <tr>
							    <th>
							    	<input type="radio" value="/resources/img/avatarGeneral.png" name="foto">Avatar
							    </th> 
							    <th>
							    	<div class="profile-userpic">
				            			<img src="/resources/img/avatarGeneral.png" class="img-responsive" alt="">
									</div>
							    </th>
							  </tr>
				        	</table>
						</div>
						<input type="hidden" id="username" name="username" value="${activa.getUsername()}">
				        <br>
				        <div class="row">
				        	<div class="col-md-3"></div>
				        	<div class="col-md-6">
				        		<button type="submit" id="buttonSiguiente" name="buttonSiguiente" class="btn-login">Siguiente</button>
				        	</div>
				        	<div class="col-md-3"></div>
				        </div>
				    </form>
    			</div>
			</div>
    		<div class="col-md-4"></div>
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
	    

  </body>

</html>