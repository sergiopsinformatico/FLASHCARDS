<html>
	<head>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	    <title>Clubes - Flashcards</title>
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
	</head>
	<body ng-app="clubsApp">
		<%@ page import="com.flashcards.modelo.Usuario" %>
		<% 
			Usuario user = ((Usuario)(session.getAttribute("usuario")));
			if(user==null || user.getUsuario().equals("")){
				response.sendRedirect("https://sistemaflashcards.herokuapp.com");
			}
			session.setAttribute("usuario", user);
		%>
		<style>
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
	          <li class="nav-item">
				<a class="nav-link" href="flashcards.html?usuario=${usuario.getUsuario()}">
					Flashcards
				</a>
			  </li>
			  <li class="nav-item">
			  	<a class="nav-link" href="gente.html?usuario=${usuario.getUsuario()}">
					Gente
				</a>
			  </li>
			  <li class="nav-item active">
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
		
		<div class="row">
			<div class="col-md-12">
				<br>
					<h1 align="center">CLUBES</h1>
				<br>
			</div>
		</div>
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-2">
				<br><br><br><br>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="viewOption" id="todos" value="todos" onclick="check(this)" checked>
					<label class="form-check-label" for="todos">Todos los Clubes</label>
				</div>
				<br>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="viewOption" id="misClubes" value="misClubes" onclick="check(this)">
					<label class="form-check-label" for="misClubes">Mis Clubes</label>
				</div>
			</div>
			<div class="col-md-3">
				<script>
					document.getElementById("showTodosClubes").style.display = "none";
					document.getElementById("showMisClubes").style.display = "none";
					
					function initialize(){
						document.getElementById("showTodosClubes").style.display = "block";
						document.getElementById("showMisClubes").style.display = "none";
					}
				
					function check(myRadio){
						var option = myRadio.value;
						if(option=="todos"){
							document.getElementById("showTodosClubes").style.display = "block";
							document.getElementById("showMisClubes").style.display = "none";
						}else {
							document.getElementById("showTodosClubes").style.display = "none";
							document.getElementById("showMisClubes").style.display = "block";
						}
					}
				</script>
				<style>					    								    	
			    	.container{
					     width: 100%;
					     min-width: 100%;
					     max-width: 100%;
						 height: 500px;
						 min-height: 500px;
						 max-height: 500px;
				     }
				     
				     .card-mini{
				     	width: 90%;
				     	min-width: 90%;
				     	max-width: 90%;
				     	height: 50%;
				     	min-height: 50%;
				     	max-height: 50%;
				     	margin: 0 auto;
				     }
				     
				     .card-crea{
				     	width: 100%;
				     	min-width: 100%;
				     	max-width: 100%;
				     	height: 550px;
				     	min-height: 550px;
				     	max-height: 550px;
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
				
				<div id="showTodosClubes" ng-controller="clubesCtrl">
					<div ng-if="clubes.length==0">
						<br><br><br><br><br><br>
						<h6 style="font-weight: bold;">No hay clubes aún creados. ¡Anímate y sé el primero en crear un club!</h6>
					</div>
					<div ng-if="clubes.length>0">
						<div id="clubesCarousel" class="carousel slide">
					        <div class="container">
					            <div class="carousel-inner row w-100 mx-auto">
									<div class="carousel-item" ng-repeat="club in clubes | filter:expression">
								        <div class="card card-flip h-100">
							                <div class="card-front card text-center" style="background-color: yellow;">
							                	<br>
							                    <img class="card-img-top formato-img" src="resources/img/club.jpg" alt="Card image cap">
												<div class="card-body">
							                        <p class="card-text">
							                        	<h5 align="center" style="font-weight: bold;">
															{{ club.club }}
														</h5>
							                        </p>
							                    </div>
							                </div>
							                <div class="card-back card text-center" style="background-color: red;">
							                    <div class="card-body">
							                        <br>
							                        <h6 align="center" style="font-weight: bold;">
														<a href="https://sistemaflashcards.herokuapp.com/verClub.html?usuario=${usuario.getUsuario()}&club={{ club.id }}" style="color: white;">
															Ver Club: {{ club.club }}
														</a>
													</h6>
													<br>
							                    	<div class="card card-mini text-white bg-success">
							                    		<p class="card-text">
							                    			<br><h6 align="center" style="font-weight: bold;">Descripción:</h6>
							                    			<br><h6 align="left">{{ club.descripcion }}</h6>
							                    		</p>
							                    	</div>							       					
							                    </div>
							                </div>
							            </div>								
					                </div>
					            </div>
						        <a class="carousel-control-prev" href="#clubesCarousel" role="button" data-slide="prev">
							      <span class="carousel-control-prev-icon" aria-hidden="true" style="color: black;"></span>
							      <span class="sr-only">Previous</span>
							    </a>
							    <a class="carousel-control-next" href="#clubesCarousel" role="button" data-slide="next">
							      <span class="carousel-control-next-icon" aria-hidden="true" style="color: black;"></span>
							      <span class="sr-only">Next</span>
							    </a>
						    </div>
						</div>
						<script>
							$('#clubesCarousel').carousel({
								})
						</script>
					</div>
				</div>
				
				<div id="showMisClubes" ng-controller="misClubesCtrl">
					<div ng-if="misClubes.length==0">
						<br><br><br><br><br><br>
						<h6 style="font-weight: bold;">Aún no perteneces a ningún club.</h6>
					</div>
					<div ng-if="misClubes.length>0">
						<div id="miClubesCarousel" class="carousel slide">
					        <div class="container">
					            <div class="carousel-inner row w-100 mx-auto">
									<div class="carousel-item" ng-repeat="miClub in misClubes | filter:expression">
								        <div class="card card-flip h-100">
							                <div class="card-front card text-center" style="background-color: yellow;">
							                	<br>
							                    <img class="card-img-top formato-img" src="resources/img/club.jpg" alt="Card image cap">
												<div class="card-body">
							                        <p class="card-text">
							                        	<h5 align="center" style="font-weight: bold;">
															{{ miClub.club }}
														</h5>
							                        </p>
							                    </div>
							                </div>
							                <div class="card-back card text-center" style="background-color: red;">
							                    <div class="card-body">
							                    	<br>
							                    	<h6 align="center" style="font-weight: bold;">
														<a href="https://sistemaflashcards.herokuapp.com/verClub.html?usuario=${usuario.getUsuario()}&club={{ miClub.id }}" style="color: white;">
															Ver Club: {{ miClub.club }}
														</a>
													</h6>
													<br>
							                    	<div class="card card-mini text-white bg-success">
							                    		<p class="card-text">
							                    			<br><h6 align="center" style="font-weight: bold;">Descripción:</h6>
							                    			<br><h6 align="left">{{ miClub.descripcion }}</h6>
							                    		</p>
							                    	</div>							       					
							                    </div>
							                </div>
							            </div>								
					                </div>
					            </div>
						        <a class="carousel-control-prev" href="#miClubesCarousel" role="button" data-slide="prev">
							      <span class="carousel-control-prev-icon" aria-hidden="true" style="color: black;"></span>
							      <span class="sr-only">Previous</span>
							    </a>
							    <a class="carousel-control-next" href="#miClubesCarousel" role="button" data-slide="next">
							      <span class="carousel-control-next-icon" aria-hidden="true" style="color: black;"></span>
							      <span class="sr-only">Next</span>
							    </a>
						    </div>
						</div>
						<script>
							$('#miClubesCarousel').carousel({
								})
						</script>
					</div>
				</div>
				
				
				<script>
					initialize();
					$(document).ready(function(){
						  $('.carousel').each(function(){
						    $(this).find('.carousel-item').eq(0).addClass('active');
						  });
						});
					
				</script>				
			</div>
			<div class="col-md-4">
				<div class="card card-crea bg-info">
					<form action="crearClub.html" method="post">
						<div class="row">
							<br><br>
						</div>
						<div class="row">
							<div class="col-md-2"></div>
							<div class="col-md-8">
								<br><h6 align="center" style="font-weight: bold;">¿No encuentra un club sobre un tema? </h6>
								<h6 align="center" style="font-weight: bold;">Puedes crearlo ahora:</h6><br>
								<div class="form-group">
									<label for="nClub">Nombre del Club</label>
									<input type="text" class="form-control" id="nClub" name="nClub" placeholder="Nombre del Club...." required>
								</div>
								<style>
									textarea {
									   resize: none;
									}
								</style>
								<div class="form-group">
		    						<label for="exampleFormControlTextarea1">Descripción del Club</label>
		    						<textarea rows="4" maxlength="30" class="form-control" id="descripcionClub" name="descripcionClub" placeholder="Descripcion..." required></textarea>
		  						</div>
								<input id="usuario" name="usuario" type="hidden" value="${usuario.getUsuario()}">
								<br><br><br><br>
							    <div class="button" align="center">
							        <button type="submit" class="btn btn-raised btn-warning text-white" style="align: center;">Crear Un Club</button>
							    </div>
							</div>
							<div class="col-md-2"></div>
						</div>
					</form>
				</div>
			</div>
			<div class="col-md-1"></div>
		</div>
		<script>
			var clubesControlador = function ($scope, $http) {
		        $scope.clubes = [];
		        var cadena = "${clubes}";
		        var array = cadena.split("///****nuevoCLUB****///");
		        var i;
		        if(cadena != ""){
			        for (i = 0; i < array.length; i++) { 
			        	var nClub = array[i].split("////-////");
			        	$scope.clubes.push({
			        		club: nClub[0],
			        		id: nClub[1],
			        		descripcion: nClub[2]
			        	});
			        }
		        }
			}
			var misClubesControlador = function ($scope, $http) {
		        $scope.misClubes = [];
		        var cadena = "${misClubes}";
		        var array = cadena.split("///****nuevoCLUB****///");
		        var i;
		        if(cadena != ""){
			        for (i = 0; i < array.length; i++) { 
			        	var nClub = array[i].split("////-////");
			        	$scope.misClubes.push({
			        		club: nClub[0],
			        		id: nClub[1],
			        		descripcion: nClub[2]
			        	});
			        }
		        }
			}
			var app = angular.module('clubsApp', []);
			app.controller('clubesCtrl', clubesControlador);
			app.controller('misClubesCtrl', misClubesControlador);
		</script>
	</body>
</html>