
<!DOCTYPE html>
<html lang="en">
  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Flashcards - Pagina Principal</title>

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
		
		.profile-usertitle {
		  text-align: center;
		  margin-top: 20px;
		}
		
		.profile-usertitle-username {
		  color: #5a7391;
		  font-size: 14px;
		  font-weight: 600;
		  margin-bottom: 7px;
		}
		
		.btn-principal{
			width: 80%;
			text-align:center;
			margin:auto;
			display: flex; 
			justify-content: center;
		}
		
		.container-Paneles {
		  position: relative;
		  width: 50%;
		}
		
		.image {
		  opacity: 1;
		  display: block;
		  width: 40%;
		  height: auto;
		  transition: .5s ease;
		  backface-visibility: hidden;
		}
		
		.middle {
		  transition: .5s ease;
		  opacity: 0;
		  position: absolute;
		  top: 50%;
		  left: 50%;
		  transform: translate(-50%, -50%);
		  -ms-transform: translate(-50%, -50%);
		  text-align: center;
		}
		
		.container-Paneles:hover .image {
		  opacity: 0.3;
		}
		
		.container-Paneles:hover .middle {
		  opacity: 1;
		}
		
		.text {
		  background-color: #97BBFF;
		  color: white;
		  font-size: 16px;
		  padding: 16px 32px;
		}
		
		#panelUsuarioGente, #panelUsuarioClubes{
			display:inline,
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
        <a class="navbar-brand js-scroll-trigger" href="https://sistemaflashcards.herokuapp.com">FLASHCARDS</a>
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
					<div class="profile-sidebar">
						<div class="profile-userpic">
							<img src="${usuario.getFoto()}" class="img-responsive" alt="">
						</div>
						<div class="profile-usertitle">
							<div class="profile-usertitle-username">
								¡Hola ${usuario.getUsername()}!
							</div>
						</div>
						<br>
						<br>
						<div>
							<form action="/verPerfil.html" method="GET">
								<button type="submit" id="buttonVerPefil" name="buttonVerPefil" class="btn btn-outline-success btn-principal">
									Ver Mi Perfil
								</button>
							</form>
						</div>
						<br>
						<div>
							<form action="/modificarPerfil.html" method="GET">
								<button type="submit" id="buttonModificarPefil" name="buttonModificarPefil" class="btn btn-outline-info btn-principal" >
									Modificar Mi Perfil
								</button>
							</form>
						</div>
						<br>
						<br>
						<div>
							<button type="submit" id="buttonCerrarSesion" name="buttonCerrarSesion" onclick="dialogCS()" class="btn btn-outline-warning btn-principal">
								Cerrar Sesión
							</button>
						</div>
						<br>
						<div>
							<button type="submit" id="buttonEliminarCuenta" name="buttonEliminarCuenta" onclick="dialogElimina()" class="btn btn-outline-danger btn-principal">
								Eliminar Cuenta
							</button>
						</div>
						<br>
						<br>
						<br>
						<br>
					</div>
				</div>
				<div class="col-md-9">	
				
					<div id="panelAdmin" class="panel panel-default" style="display: none;">
				      <div class="panel-heading">
				      	<h4>Panel Administrador</h4>
				      </div>
				      <div class="panel-body">
				      	Panel Content
				      </div>
				    </div>
				    
				    <br>
				    
				    <div id="panelUsuario" class="panel panel-default">
				      <div class="panel-heading">
				      	<h4>Panel Usuario</h4>
				      </div>
				      <div class="panel-body">
				      	<div class="table-responsive">          
						  <table class="table">
						    <tbody>
						      <tr>
						        <td>
						        	<img src="/resources/img/personas.png" alt="Gente" class="image" style="width:100%">
						        	<br>
						        	<a href="/gente.html">Gente</a>
						        </td>
						        <td>
						        	<img src="/resources/img/clubes.png" alt="Clubes" class="image" style="width:100%">
						        	<br>
						        	<a href="/clubes.html">Clubes</a>								
								</td>
						      </tr>
						    </tbody>
						  </table>
						</div>
				      </div>
				    </div>
				    
				    <script>
				    	/*var divAdmin = document.getElementById("panelAdmin");
				    	if("${usuario.isRolAdministrador()}"==true){
				    		divAdmin.style.display = "block";
				    	}*/
				    </script>
				    
				    
					<!-- <div id="panelUsuario">
						
						<div id="panelUsuarioGente" class="container-Paneles">
						  <img src="/resources/img/personas.png" alt="Gente" class="image" style="width:100%">
						  <div class="middle">
						    <div class="text"><a href="/gente.html">Gente</a></div>
						  </div>
						</div>
												
						<div id="panelUsuarioClubes" class="container-Paneles">
						  <img src="/resources/img/clubes.png" alt="Clubes" class="image" style="width:100%">
						  <div class="middle">
						    <div class="text"><a href="/clubes.html">Clubes</a></div>
						  </div>
						</div>
					
					</div>-->
				</div>
			</div>
		</div>
	</section>
	
	<script>	    
	    function dialogCS(){
	    	bootbox.confirm({ 
    		  size: "small",
    		  message: "¿Desea salir del sistema?", 
    		  callback: function(result){ 
    			if(result){
    				window.location.href = "/cerrarSesion.html";
    			}  
    		  }
    		})
	    }
	    
	    function dialogElimina(){
	    	bootbox.confirm({ 
    		  size: "small",
    		  message: "¿Desea eliminar la cuenta? Dispone de 14 dias para recuperarla, siguiendo las instrucciones enviadas a su email.", 
    		  callback: function(result){ 
    			if(result){
    				window.location.href = "/eliminarCuenta.html";
    			}  
    		  }
    		})
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