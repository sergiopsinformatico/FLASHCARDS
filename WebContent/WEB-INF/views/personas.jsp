<html>
	<head>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	    <title>Gente - Flashcards</title>
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
			.fixed-panel {
			  min-width: 100%;
			  max-width: 100%;
			}
			
			div.center {
			    text-align: center;
			}
			
			.navbar-nav > li > a, .navbar-brand {
			    padding-top:4px !important; 
			    padding-bottom:0 !important;
			    height: 28px;
			}
			.navbar-inner {min-height:28px;}
		</style>
	</head>
	<body ng-app="myApp">
		<%@ page import="com.flashcards.modelo.Usuario" %>
		<% 
			Usuario user = ((Usuario)(session.getAttribute("usuario")));
			if(user==null || user.getUsuario().equals("")){
				response.sendRedirect("https://sistemaflashcards.herokuapp.com");
			}
			session.setAttribute("usuario", user);
		%>
		<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
	      <button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#navbarsExample03" aria-controls="navbarsExample03" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="navbar-toggler-icon"></span>
	      </button>
	
	      <div class="navbar-collapse collapse" id="navbarsExample03" style="width: 100%;">
	        <ul class="navbar-nav mr-auto">
	          <li class="nav-item">
	    		<a class="nav-link" href="inicio.html?usuario=${usuario.getUsuario()}">
					Inicio
				</a>
	          </li>
	          <li class="nav-item active">
				<a class="nav-link" href="flashcards.html?usuario=${usuario.getUsuario()}">
					Flashcards
				</a>
			  </li>
			  <li class="nav-item">
			  	<a class="nav-link" href="gente.html?usuario=${usuario.getUsuario()}">
					Gente
				</a>
			  </li>
			  <li class="nav-item">
			  	<a class="nav-link" href="clubes.html?usuario=${usuario.getUsuario()}">
					Clubes
				</a>
			  </li>
			  <li class="nav-item">
			  	<a class="nav-link" href="gestionar.html?usuario=${usuario.getUsuario()}" id="btn-Gestion">
					Gestionar Cuentas
				</a>
			  </li>
	        </ul>
	        <ul class="navbar-nav ml-auto">
	        <li class="nav-item dropdown">
	            <a class="nav-link dropdown-toggle" href="" id="dropdown03" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Bienvenido ${usuario.getNombreApellidos()} </a>
	            <div class="dropdown-menu dropdown-primary" aria-labelledby="dropdown03">
	              <a class="dropdown-item" href="miPerfil.html?usuario=${usuario.getUsuario()}">Mi Perfil</a>
	              <a class="dropdown-item" href="configuracion.html?usuario=${usuario.getUsuario()}">Configuración</a>
	              <div class="dropdown-divider"></div>
				  <a class="dropdown-item" href="cerrarSesion.html" onclick="return confirm('¿Desea Cerrar Sesión?');">Cerrar Sesión</a>
	            </div>
	            <script>
	            	$('.dropdown-toggle').dropdown();
	            </script>
	          </li>
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
		<style>						    								    	
	    	.container{
			     width: 100%;
			     min-width: 100%;
			     max-width: 100%;
				 height: 450px;
				 min-height: 450px;
				 max-height: 450px;
		     }
	    	
			.card-flip > div {
			  backface-visibility: hidden;
			  transition: transform 300ms;
			  transition-timing-function: linear;
			  width: 100%;
			  height: 100%;
			  margin: 0;
			  display: flex;
			}
			
			.card-front {
			  transform: rotateY(0deg);
			}
			
			.card-back {
			  transform: rotateY(180deg);
			  position: absolute;
			  top: 0;
			}
			
			.card-flip:hover .card-front {
			  transform: rotateY(-180deg);
			}
			  
			.card-flip:hover .card-back {
			  transform: rotateY(0deg);
			}	
			
			.formato-img{
				height: 200px;
				width: auto;
				display: block;
			    margin-left: auto;
			    margin-right: auto;
			}							
	    </style>
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-11">
				<br><h1 align="center" style="font-weight: bold;">Gente</h1>
			</div>
		</div>
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-3">
				<script>
					function initialize(){
						document.getElementById("showTodos").style.display = "block";
						document.getElementById("showAmigos").style.display = "none";
						document.getElementById("showPeticionesEnviadas").style.display = "none";
						document.getElementById("showPeticionesRecibidas").style.display = "none";
						document.getElementById("showBloqueados").style.display = "none";
					}
				
					function check(myRadio){
						var option = myRadio.value;
						if(option=="todos"){
							document.getElementById("showTodos").style.display = "block";
							document.getElementById("showAmigos").style.display = "none";
							document.getElementById("showPeticionesEnviadas").style.display = "none";
							document.getElementById("showPeticionesRecibidas").style.display = "none";
							document.getElementById("showBloqueados").style.display = "none";
						}else if(option=="amigos"){
							document.getElementById("showTodos").style.display = "none";
							document.getElementById("showAmigos").style.display = "block";
							document.getElementById("showPeticionesEnviadas").style.display = "none";
							document.getElementById("showPeticionesRecibidas").style.display = "none";
							document.getElementById("showBloqueados").style.display = "none";
						}else if(option=="peticionesEnviadas"){
							document.getElementById("showTodos").style.display = "none";
							document.getElementById("showAmigos").style.display = "none";
							document.getElementById("showPeticionesEnviadas").style.display = "block";
							document.getElementById("showPeticionesRecibidas").style.display = "none";
							document.getElementById("showBloqueados").style.display = "none";
						}else if(option=="peticionesRecibidas"){
							document.getElementById("showTodos").style.display = "none";
							document.getElementById("showAmigos").style.display = "none";
							document.getElementById("showPeticionesEnviadas").style.display = "none";
							document.getElementById("showPeticionesRecibidas").style.display = "block";
							document.getElementById("showBloqueados").style.display = "none";
						}else{
							document.getElementById("showTodos").style.display = "none";
							document.getElementById("showAmigos").style.display = "none";
							document.getElementById("showPeticionesEnviadas").style.display = "none";
							document.getElementById("showPeticionesRecibidas").style.display = "none";
							document.getElementById("showBloqueados").style.display = "block";
						}
					}
				</script>
				<br><br><br><br>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="viewOption" id="todos" value="todos" onclick="check(this)" checked>
					<label class="form-check-label" for="todos">Todos los Usuarios</label>
				</div>
				<br>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="viewOption" id="amigos" value="amigos" onclick="check(this)">
					<label class="form-check-label" for="amigos">Amigos</label>
				</div>
				<br>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="viewOption" id="peticionesEnviadas" value="peticionesEnviadas" onclick="check(this)">
					<label class="form-check-label" for="peticionesEnviadas">Peticiones de Amistad Enviadas</label>
				</div>
				<br>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="viewOption" id="peticionesRecibidas" value="peticionesRecibidas" onclick="check(this)">
					<label class="form-check-label" for="peticionesRecibidas">Peticiones de Amistad Recibidas</label>
				</div>
				<br>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="viewOption" id="bloqueados" value="bloqueados" onclick="check(this)">
					<label class="form-check-label" for="bloqueados">Bloqueados</label>
				</div>
			</div>
			<div class="col-md-1"></div>
			<div class="col-md-3">
			
				<div id="showTodos">
					<br>
					<h6 align="center" style="width: 100%; font-weight: bold;">Todos los Usuarios</h6>
					<br>
					<div class="panel panel-primary" ng-controller="peopleCtrl">
						<div ng-if="people.length == 0">
							<h6 align="center" style="font-weight: bold;">No hay nuevos usuarios</h6>
						</div>
						<div ng-if="people.length > 0">
							<div id="myCarousel" class="carousel slide">
						        <div class="container" style="width: 100%;">
						            <div class="carousel-inner row w-100 mx-auto">
							            <div class="carousel-item" ng-repeat="person in people | filter:expression">
									        <div class="card h-100 bg-info text-center text-white">
							                    <br>
												<img class="card-img-top formato-img" src="resources/img/profile.png" alt="Card image cap">
												<div class="card-body">
													<p class="card-text">
														<h6 align="center" style="font-weight: bold;">{{ person.name }}</h6>
													</p>
												</div>
								            </div>								
						                </div>
						            </div>
							        <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
								      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
								      <span class="sr-only">Previous</span>
								    </a>
								    <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
								      <span class="carousel-control-next-icon" aria-hidden="true"></span>
								      <span class="sr-only">Next</span>
								    </a>
							    </div>
							</div>
							<script>
								$(document).ready(function(){
								  $('.carousel').each(function(){
								    $(this).find('.carousel-item').eq(0).addClass('active');
								  });
								});
							</script>
						</div>
					</div>
				</div>
				<div id="showAmigos">
					<br>
					<h6 align="center" style="width: 100%; font-weight: bold;">Amigos</h6>
					<br>
					<div class="panel panel-primary" ng-controller="friendsCtrl">
						<div ng-if="people.length == 0">
							<h6 align="center" style="font-weight: bold;">Aún no tiene amigos</h6>
						</div>
						<div ng-if="people.length > 0">
							<div id="myCarousel" class="carousel slide">
						        <div class="container">
						            <div class="carousel-inner row w-100 mx-auto">
							            <div class="carousel-item" ng-repeat="person in people | filter:expression">
									        <div class="card h-100 bg-info text-center text-white">
							                    <br>
												<img class="card-img-top formato-img" src="resources/img/profile.png" alt="Card image cap">
												<div class="card-body">
													<p class="card-text">
														<h6 align="center" style="font-weight: bold;">
															<a href="https://sistemaflashcards.herokuapp.com/miPerfil.html?usuario=${usuario.getUsuario()}&perfil={{ person.usuario }}">
																{{ person.name }}
															</a>
														</h6>
													</p>
												</div>
								            </div>								
						                </div>
						            </div>
							        <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
								      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
								      <span class="sr-only">Previous</span>
								    </a>
								    <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
								      <span class="carousel-control-next-icon" aria-hidden="true"></span>
								      <span class="sr-only">Next</span>
								    </a>
							    </div>
							</div>
							<script>
								$(document).ready(function(){
								  $('.carousel').each(function(){
								    $(this).find('.carousel-item').eq(0).addClass('active');
								  });
								});
							</script>
						</div>
					</div>
				</div>
				<div id="showPeticionesEnviadas">
					<br>
					<h6 align="center" style="width: 100%; font-weight: bold;">Peticiones de Amistad Enviadas</h6>
					<br>
					<div class="panel panel-primary" ng-controller="pdaEnviadasCtrl">
						<div ng-if="people.length == 0">
							<h6 align="center" style="font-weight: bold;">Todas las peticiones de amistad enviadas, han sido aceptadas o rechazadas</h6>
						</div>
						<div ng-if="people.length > 0">
							<div id="myCarousel" class="carousel slide">
						        <div class="container">
						            <div class="carousel-inner row w-100 mx-auto">
							            <div class="carousel-item" ng-repeat="person in people | filter:expression">
									        <div class="card h-100 bg-info text-center text-white">
							                    <br>
												<img class="card-img-top formato-img" src="resources/img/profile.png" alt="Card image cap">
												<div class="card-body">
													<p class="card-text">
														<h6 align="center" style="font-weight: bold;">{{ person.name }}</h6>
													</p>
												</div>
								            </div>								
						                </div>
						            </div>
							        <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
								      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
								      <span class="sr-only">Previous</span>
								    </a>
								    <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
								      <span class="carousel-control-next-icon" aria-hidden="true"></span>
								      <span class="sr-only">Next</span>
								    </a>
							    </div>
							</div>
							<script>
								$(document).ready(function(){
								  $('.carousel').each(function(){
								    $(this).find('.carousel-item').eq(0).addClass('active');
								  });
								});
							</script>
						</div>
					</div>
				</div>
				<div id="showPeticionesRecibidas">
					<br>
					<h6 align="center" style="width: 100%; font-weight: bold;">Peticiones de Amistad Recibidas</h6>
					<br>
					<div class="panel panel-primary" ng-controller="pdaRecibidasCtrl">
						<div ng-if="people.length == 0">
							<h6 align="center" style="font-weight: bold;">No tiene ninguna petición nueva de amistad</h6>
						</div>
						<div ng-if="people.length > 0">
							<div id="myCarousel" class="carousel slide">
						        <div class="container">
						            <div class="carousel-inner row w-100 mx-auto">
							            <div class="carousel-item" ng-repeat="person in people | filter:expression">
									        <div class="card h-100 bg-info text-center text-white">
							                    <br>
												<img class="card-img-top formato-img" src="resources/img/profile.png" alt="Card image cap">
												<div class="card-body">
													<p class="card-text">
														<h6 align="center" style="font-weight: bold;">{{ person.name }}</h6>
													</p>
												</div>
								            </div>								
						                </div>
						            </div>
							        <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
								      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
								      <span class="sr-only">Previous</span>
								    </a>
								    <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
								      <span class="carousel-control-next-icon" aria-hidden="true"></span>
								      <span class="sr-only">Next</span>
								    </a>
							    </div>
							</div>
							<script>
								$(document).ready(function(){
								  $('.carousel').each(function(){
								    $(this).find('.carousel-item').eq(0).addClass('active');
								  });
								});
							</script>
						</div>
					</div>
				</div>
				<div id="showBloqueados">
					<br>
					<h6 align="center" style="width: 100%; font-weight: bold;">Bloqueados</h6>
					<br>
					<div class="panel panel-primary" ng-controller="bloqueadosCtrl">
						<div ng-if="people.length == 0">
							<h6 align="center" style="font-weight: bold;">No tiene usuarios bloqueados</h6>
						</div>
						<div ng-if="people.length > 0">
							<div id="myCarousel" class="carousel slide">
						        <div class="container">
						            <div class="carousel-inner row w-100 mx-auto">
							            <div class="carousel-item" ng-repeat="person in people | filter:expression">
									        <div class="card h-100 bg-info text-center text-white">
							                    <br>
												<img class="card-img-top formato-img" src="resources/img/profile.png" alt="Card image cap">
												<div class="card-body">
													<p class="card-text">
														<h6 align="center" style="font-weight: bold;">{{ person.name }}</h6>
													</p>
												</div>
								            </div>								
						                </div>
						            </div>
							        <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
								      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
								      <span class="sr-only">Previous</span>
								    </a>
								    <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
								      <span class="carousel-control-next-icon" aria-hidden="true"></span>
								      <span class="sr-only">Next</span>
								    </a>
							    </div>
							</div>
							<script>
								$(document).ready(function(){
								  $('.carousel').each(function(){
								    $(this).find('.carousel-item').eq(0).addClass('active');
								  });
								});
							</script>
						</div>
					</div>
				</div>
			
			</div>
			<script>initialize();</script>
			<div class="col-md-3"></div>
		
		</div>
		
		
		
				<!-- <div class="row">
					<h4 align="center" style="font-weight: bold;">Todos los Usuarios</h4>
				</div>
				<div class="row">
					<div class="panel panel-primary" ng-controller="peopleCtrl">
						<div ng-if="people.length == 0">
							<h6 align="center" style="font-weight: bold;">No hay nuevos usuarios</h6>
						</div>
						<div ng-if="people.length > 0">
							<div id="myCarousel" class="carousel slide">
						        <div class="container">
						            <div class="carousel-inner row w-100 mx-auto">
						            	<div class="carousel-item active">
						                    <div class="card bg-success">
									          <div class="card-body">
									            <h4 class="card-title">Todos los Usuarios</h4>
									          </div>
									        </div>
										</div>
										<div class="carousel-item" ng-repeat="person in people | filter:expression">
									        <div class="card card-flip h-100">
								                <div class="card-front bg-danger card text-center">
								                    <div class="card-body">
								                        <p class="card-text">{{ person.name }}</p>
								                    </div>
								                </div>
								                <div class="card-back bg-info card text-center">
								                    <div class="card-body">
								                        <p class="card-text">{{ person.usuario }}</p>
								                        <br>
								                    </div>
								                </div>
								            </div>								
						                </div>
						            </div>
							        <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
								      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
								      <span class="sr-only">Previous</span>
								    </a>
								    <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
								      <span class="carousel-control-next-icon" aria-hidden="true"></span>
								      <span class="sr-only">Next</span>
								    </a>
							    </div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-2">
				<div class="col-md-2">
				<div class="row">
					<h4 align="center" style="font-weight: bold;">Amigos</h4>
				</div>
				<div class="row">
					<div class="panel panel-primary" ng-controller="peopleCtrl">
						<div ng-if="people.length == 0">
							<h6 align="center" style="font-weight: bold;">No hay nuevos usuarios</h6>
						</div>
						<div ng-if="people.length > 0">
							<div id="myCarousel" class="carousel slide">
						        <div class="container">
						            <div class="carousel-inner row w-100 mx-auto">
						            	<div class="carousel-item active">
						                    <div class="card bg-success">
									          <div class="card-body">
									            <h4 class="card-title">Todos los Usuarios</h4>
									          </div>
									        </div>
										</div>
										<div class="carousel-item" ng-repeat="person in people | filter:expression">
									        <div class="card card-flip h-100">
								                <div class="card-front bg-danger card text-center">
								                    <div class="card-body">
								                        <p class="card-text">{{ person.name }}</p>
								                    </div>
								                </div>
								                <div class="card-back bg-info card text-center">
								                    <div class="card-body">
								                        <p class="card-text">{{ person.usuario }}</p>
								                        <br>
								                    </div>
								                </div>
								            </div>								
						                </div>
						            </div>
							        <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
								      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
								      <span class="sr-only">Previous</span>
								    </a>
								    <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
								      <span class="carousel-control-next-icon" aria-hidden="true"></span>
								      <span class="sr-only">Next</span>
								    </a>
							    </div>
							</div>
						</div>
					</div>
				</div>
			</div>
			</div>
			<div class="col-md-2">
				<div class="col-md-2">
				<div class="row">
					<h4 align="center" style="font-weight: bold;">Peticiones de Amistad Enviadas</h4>
				</div>
				<div class="row">
					<div class="panel panel-primary" ng-controller="peopleCtrl">
						<div ng-if="people.length == 0">
							<h6 align="center" style="font-weight: bold;">No hay nuevos usuarios</h6>
						</div>
						<div ng-if="people.length > 0">
							<div id="myCarousel" class="carousel slide">
						        <div class="container">
						            <div class="carousel-inner row w-100 mx-auto">
						            	<div class="carousel-item active">
						                    <div class="card bg-success">
									          <div class="card-body">
									            <h4 class="card-title">Todos los Usuarios</h4>
									          </div>
									        </div>
										</div>
										<div class="carousel-item" ng-repeat="person in people | filter:expression">
									        <div class="card card-flip h-100">
								                <div class="card-front bg-danger card text-center">
								                    <div class="card-body">
								                        <p class="card-text">{{ person.name }}</p>
								                    </div>
								                </div>
								                <div class="card-back bg-info card text-center">
								                    <div class="card-body">
								                        <p class="card-text">{{ person.usuario }}</p>
								                        <br>
								                    </div>
								                </div>
								            </div>								
						                </div>
						            </div>
							        <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
								      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
								      <span class="sr-only">Previous</span>
								    </a>
								    <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
								      <span class="carousel-control-next-icon" aria-hidden="true"></span>
								      <span class="sr-only">Next</span>
								    </a>
							    </div>
							</div>
						</div>
					</div>
				</div>
			</div>
			</div>
			<div class="col-md-2">
				<div class="col-md-2">
				<div class="row">
					<h4 align="center" style="font-weight: bold;">Peticiones de Amistad Recibidas</h4>
				</div>
				<div class="row">
					<div class="panel panel-primary" ng-controller="peopleCtrl">
						<div ng-if="people.length == 0">
							<h6 align="center" style="font-weight: bold;">No hay nuevos usuarios</h6>
						</div>
						<div ng-if="people.length > 0">
							<div id="myCarousel" class="carousel slide">
						        <div class="container">
						            <div class="carousel-inner row w-100 mx-auto">
						            	<div class="carousel-item active">
						                    <div class="card bg-success">
									          <div class="card-body">
									            <h4 class="card-title">Todos los Usuarios</h4>
									          </div>
									        </div>
										</div>
										<div class="carousel-item" ng-repeat="person in people | filter:expression">
									        <div class="card card-flip h-100">
								                <div class="card-front bg-danger card text-center">
								                    <div class="card-body">
								                        <p class="card-text">{{ person.name }}</p>
								                    </div>
								                </div>
								                <div class="card-back bg-info card text-center">
								                    <div class="card-body">
								                        <p class="card-text">{{ person.usuario }}</p>
								                        <br>
								                    </div>
								                </div>
								            </div>								
						                </div>
						            </div>
							        <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
								      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
								      <span class="sr-only">Previous</span>
								    </a>
								    <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
								      <span class="carousel-control-next-icon" aria-hidden="true"></span>
								      <span class="sr-only">Next</span>
								    </a>
							    </div>
							</div>
						</div>
					</div>
				</div>
			</div>
			</div>
			<div class="col-md-2">
				<div class="col-md-2">
				<div class="row">
					<h4 align="center" style="font-weight: bold;">Usuarios Bloqueados</h4>
				</div>
				<div class="row">
					<div class="panel panel-primary" ng-controller="peopleCtrl">
						<div ng-if="people.length == 0">
							<h6 align="center" style="font-weight: bold;">No hay nuevos usuarios</h6>
						</div>
						<div ng-if="people.length > 0">
							<div id="myCarousel" class="carousel slide">
						        <div class="container">
						            <div class="carousel-inner row w-100 mx-auto">
						            	<div class="carousel-item active">
						                    <div class="card bg-success">
									          <div class="card-body">
									            <h4 class="card-title">Todos los Usuarios</h4>
									          </div>
									        </div>
										</div>
										<div class="carousel-item" ng-repeat="person in people | filter:expression">
									        <div class="card card-flip h-100">
								                <div class="card-front bg-danger card text-center">
								                    <div class="card-body">
								                        <p class="card-text">{{ person.name }}</p>
								                    </div>
								                </div>
								                <div class="card-back bg-info card text-center">
								                    <div class="card-body">
								                        <p class="card-text">{{ person.usuario }}</p>
								                        <br>
								                    </div>
								                </div>
								            </div>								
						                </div>
						            </div>
							        <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
								      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
								      <span class="sr-only">Previous</span>
								    </a>
								    <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
								      <span class="carousel-control-next-icon" aria-hidden="true"></span>
								      <span class="sr-only">Next</span>
								    </a>
							    </div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		
		
		<!-- <table class="table table-bordered table-striped">
								<tbody>
									<tr ng-repeat="person in people | filter:expression">
										<td>{{ person.name }} ( {{ person.usuario }} )</td>
										<td>
									    	<form action="peticionAmistad.html" method="POST">
									    		<input id="peticion" name="peticion" type="hidden" value="{{ person.usuario }}">
												<input id="usuario" name="usuario" type="hidden" value="${usuario.getUsuario()}">
											    <input type="submit" name="action" value="Añadir Amigo" />
											</form>
											<br><br>
											<form action="bloquear.html" method="POST">
									    		<input id="bloquear" name="bloquear" type="hidden" value="{{ person.usuario }}">
												<input id="usuario" name="usuario" type="hidden" value="${usuario.getUsuario()}">
											    <input type="submit" name="action" value="Bloquear Usuario" />
											</form>
										</td>
									</tr>
								</tbody>
							</table> -->
		
		
		
		<!-- 
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<div class="row">
					<b>Todos los Usuarios</b><br>
				</div>
				<div class="row"><br></div>
				<div class="panel panel-primary" ng-controller="peopleCtrl">
					<div class="panel-heading">
						<input class="form-control" ng-model="expression" placeholder="Buscar..." />
					</div>
					<div class="panel-body fixed-panel">
						<!-- <table class="table table-bordered table-striped">
							<tbody>
								<tr ng-repeat="person in people | filter:expression">
									<td>{{ person.name }} ( {{ person.usuario }} )</td>
									<td>
								    	<form action="peticionAmistad.html" method="POST">
								    		<input id="peticion" name="peticion" type="hidden" value="{{ person.usuario }}">
											<input id="usuario" name="usuario" type="hidden" value="${usuario.getUsuario()}">
										    <input type="submit" name="action" value="Añadir Amigo" />
										</form>
										<br><br>
										<form action="bloquear.html" method="POST">
								    		<input id="bloquear" name="bloquear" type="hidden" value="{{ person.usuario }}">
											<input id="usuario" name="usuario" type="hidden" value="${usuario.getUsuario()}">
										    <input type="submit" name="action" value="Bloquear Usuario" />
										</form>
									</td>
								</tr>
							</tbody>
						</table> 
					</div>
				</div>
			</div>
			<div class="col-md-1"></div>
		</div>
		<div class="row">
			<div class="col-md-1">
			</div>
			<div class="col-md-10">
				<div class="row">
					<b>Amigos</b>
				</div>
				<div class="row"><br></div>
				<div class="row">
					<div class="panel panel-primary" ng-controller="friendsCtrl">
						<div class="panel-heading">
							<input class="form-control" ng-model="expression" placeholder="Buscar..." />
						</div>
						<div class="panel-body fixed-panel-small">
							<table class="table table-bordered table-striped">
								<tbody>
									<tr ng-repeat="person in people | filter:expression">
										<td>{{ person.name }} ( {{ person.usuario }} )</td>
										<td>
									    	<form action="eliminarAmigo.html" method="POST">
									    		<input id="eliminar" name="eliminar" type="hidden" value="{{ person.usuario }}">
												<input id="usuario" name="usuario" type="hidden" value="${usuario.getUsuario()}">
											    <input type="submit" name="action" value="Eliminar Amigo" />
											</form>
											<br><br>
											<form action="bloquearAmigo.html" method="POST">
									    		<input id="bloquear" name="bloquear" type="hidden" value="{{ person.usuario }}">
												<input id="usuario" name="usuario" type="hidden" value="${usuario.getUsuario()}">
											    <input type="submit" name="action" value="Bloquear Amigo" />
											</form>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-1">
			</div>
		</div>
		<div class="row">
			<div class="col-md-1">
			</div>
			<div class="col-md-10">
				
				<div class="row"><br></div>
				<div class="row">
					<b>Peticiones de Amistad Enviadas</b><br>
				</div>
				<div class="row"><br></div>
				<div class="row">
					<div class="panel panel-primary" ng-controller="pdaEnviadasCtrl">
						<div class="panel-heading">
							<input class="form-control" ng-model="expression" placeholder="Buscar..." />
						</div>
						<div class="panel-body fixed-panel-small">
							<table class="table table-bordered table-striped">
								<tbody>
									<tr ng-repeat="person in people | filter:expression">
										<td>{{ person.name }} ( {{ person.usuario }} )</td>
										<td>
									    	<form action="eliminarPeticion.html" method="POST">
									    		<input id="envia" name="envia" type="hidden" value="${usuario.getUsuario()}">
									    		<input id="recibe" name="recibe" type="hidden" value="{{ person.usuario }}">
												<input id="usuario" name="usuario" type="hidden" value="${usuario.getUsuario()}">
											    <input type="submit" name="action" value="Eliminar Petición" />
											</form>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			
				<div class="row"><br></div>
				<div class="row">
					<b>Peticiones de Amistad Recibidas</b><br>
				</div>
				<div class="row"><br></div>
				<div class="row">
					<div class="panel panel-primary" ng-controller="pdaRecibidasCtrl">
						<div class="panel-heading">
							<input class="form-control" ng-model="expression" placeholder="Buscar..." />
						</div>
						<div class="panel-body fixed-panel-small">
							<table class="table table-bordered table-striped">
								<tbody>
									<tr ng-repeat="person in people | filter:expression">
										<td>{{ person.name }} ( {{ person.usuario }} )</td>
										<td>
									    	<form action="aceptar.html" method="POST">
									    		<input id="peticion" name="peticion" type="hidden" value="{{ person.usuario }}">
												<input id="usuario" name="usuario" type="hidden" value="${usuario.getUsuario()}">
											    <input type="submit" name="action" value="Aceptar Petición" />
											</form>
										<br><br>
											<form action="rechazar.html" method="POST">
									    		<input id="peticion" name="peticion" type="hidden" value="{{ person.usuario }}">
												<input id="usuario" name="usuario" type="hidden" value="${usuario.getUsuario()}">
											    <input type="submit" name="action" value="Rechazar Petición" />
											</form>
										<br><br>
											<form action="bloquearPeticion.html" method="POST">
									    		<input id="bloquear" name="bloquear" type="hidden" value="{{ person.usuario }}">
												<input id="usuario" name="usuario" type="hidden" value="${usuario.getUsuario()}">
											    <input type="submit" name="action" value="Bloquear Usuario" />
											</form>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="row"><br></div>
				<div class="row">
					<b>Bloqueados</b><br>
				</div>
				<div class="row"><br></div>
				<div class="row">
					<div class="panel panel-primary" ng-controller="bloqueadosCtrl">
						<div class="panel-heading">
							<input class="form-control" ng-model="expression" placeholder="Buscar..." />
						</div>
						<div class="panel-body fixed-panel-small">
							<table class="table table-bordered table-striped">
								<tbody>
									<tr ng-repeat="person in people | filter:expression">
										<td>{{ person.name }} ( {{ person.usuario }} )</td>
										<td>
											<form action="desbloquear.html" method="POST">
												<input id="bloqueado" name="bloqueado" type="hidden" value="{{ person.usuario }}">
												<input id="usuario" name="usuario" type="hidden" value="${usuario.getUsuario()}">
											    <input type="submit" name="action" value="Desbloquear" />
											</form>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-1">
			</div>
		</div>
		<div class="row">
			<br>
		</div>
		-->
		<script>
			
			var peopleControlador = function($scope, $http){
				$scope.people = [];
				var cadena = "${people}";
				var array = cadena.split("///****nuevaP****///");
				var i;
		        if(cadena != ""){
			        for (i = 0; i < array.length; i++) { 
			        	var user = array[i].split("///-///");
			        	$scope.people.push({
			        		name: user[0],
			        		usuario: user[1]
			        	});
			        }
		        }
				
			};
			
			var friendsControlador = function($scope){
				$scope.people = [];
				var cadena = "${friends}";
				var array = cadena.split("///****nuevaP****///");
				var i;
		        if(cadena != ""){
			        for (i = 0; i < array.length; i++) { 
			        	var user = array[i].split("///-///");
			        	$scope.people.push({
			        		name: user[0],
			        		usuario: user[1]
			        	});
			        }
		        }
			};
			
			var enviadasControlador = function($scope){
				$scope.people = [];
				var cadena = "${pDAe}";
				var array = cadena.split("///****nuevaP****///");
				var i;
		        if(cadena != ""){
			        for (i = 0; i < array.length; i++) { 
			        	var user = array[i].split("///-///");
			        	$scope.people.push({
			        		name: user[0],
			        		usuario: user[1]
			        	});
			        }
		        }
			};
			
			var recibidasControlador = function($scope){
				$scope.people = [];
				var cadena = "${pDAr}";
				var array = cadena.split("///****nuevaP****///");
				var i;
		        if(cadena != ""){
			        for (i = 0; i < array.length; i++) { 
			        	var user = array[i].split("///-///");
			        	$scope.people.push({
			        		name: user[0],
			        		usuario: user[1]
			        	});
			        }
		        }
			};
			
			var bloqueadosControlador = function($scope){
				$scope.people = [];
				var cadena = "${bloq}";
				var array = cadena.split("///****nuevaP****///");
				var i;
		        if(cadena != ""){
			        for (i = 0; i < array.length; i++) { 
			        	var user = array[i].split("///-///");
			        	$scope.people.push({
			        		name: user[0],
			        		usuario: user[1]
			        	});
			        }
		        }
			};
			
			var app = angular.module('myApp', []);
			
			app.controller('peopleCtrl', peopleControlador);
			app.controller('friendsCtrl', friendsControlador);
			app.controller('pdaEnviadasCtrl', enviadasControlador);
			app.controller('pdaRecibidasCtrl', recibidasControlador);
			app.controller('bloqueadosCtrl', bloqueadosControlador);
			
		</script>
	</body>
</html>