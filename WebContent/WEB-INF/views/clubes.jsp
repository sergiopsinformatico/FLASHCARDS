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
	<body>
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
			<div class="col-md-1"></div>
			<div class="col-md-11">
				<br>
					<h1 align="center">CLUBES</h1>
				<br>
			</div>
		</div>
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-3">
				<script>
					function initialize(){
						document.getElementById("showTodos").style.display = "block";
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
				
				<div id="showTodosClubes" ng-app="clubsApp" ng-controller="clubsCtrl">
					<div ng-if="clubes.length==0">
						No hay clubes aún creados. ¡Anímate y sé el primero en crear un club!
					</div>
					<div ng-if="clubes.length>0">
						<div id="clubesCarousel" class="carousel slide">
					        <div class="container">
					            <div class="carousel-inner row w-100 mx-auto">
									<div class="carousel-item" ng-repeat="club in clubes | filter:expression">
								        <div class="card card-flip h-100">
							                <div class="card-front bg-danger card text-center">
							                    <img class="card-img-top formato-img" src="resources/img/club.jpg" alt="Card image cap">
												<div class="card-body">
							                        <p class="card-text">
							                        	<h5 align="center" style="font-weight: bold;">
															{{ club.club }}
														</h5>
							                        </p>
							                    </div>
							                </div>
							                <div class="card-back bg-info card text-center">
							                    <div class="card-body">
							                        <p class="card-text">{{ club.descripcion }}</p>
							                        <br>
							       					<h5 align="center" style="font-weight: bold;">
														<a href="https://sistemaflashcards.herokuapp.com/verClub.html?usuario=${usuario.getUsuario()}&club={{ club.id }}" style="color: white;">
															Ver Club: {{ club.club }}
														</a>
													</h5>
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
				
				<div id="showMisClubes" ng-app="clubsApp" ng-controller="misClubsCtrl">
					<div ng-if="clubes.length==0">
						Aún no perteneces a ningún club.
					</div>
					<div ng-if="clubes.length>0">
						<div id="miClubesCarousel" class="carousel slide">
					        <div class="container">
					            <div class="carousel-inner row w-100 mx-auto">
									<div class="carousel-item" ng-repeat="club in clubes | filter:expression">
								        <div class="card card-flip h-100">
							                <div class="card-front bg-danger card text-center">
							                    <img class="card-img-top formato-img" src="resources/img/club.jpg" alt="Card image cap">
												<div class="card-body">
							                        <p class="card-text">
							                        	<h5 align="center" style="font-weight: bold;">
															{{ club.club }}
														</h5>
							                        </p>
							                    </div>
							                </div>
							                <div class="card-back bg-info card text-center">
							                    <div class="card-body">
							                        <p class="card-text">{{ club.descripcion }}</p>
							                        <br>
							       					<h5 align="center" style="font-weight: bold;">
														<a href="https://sistemaflashcards.herokuapp.com/verClub.html?usuario=${usuario.getUsuario()}&club={{ club.id }}" style="color: white;">
															Ver Club: {{ club.club }}
														</a>
													</h5>
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
					$(document).ready(function(){
						  $('.carousel').each(function(){
						    $(this).find('.carousel-item').eq(0).addClass('active');
						  });
						});
					initialize();
				</script>
				
				
				<!-- <div ng-if="clubes.length == 0"> 
			        No existen clubes.
			        <br>
			    </div>
				<div ng-if="clubes.length > 0">
					
					<div id="myCarousel" class="carousel slide">
				        <div class="container" style="width: 100%;">
				            <div class="carousel-inner row w-100 mx-auto">
					            <div class="carousel-item" ng-repeat="club in clubes | filter:expression">
							        <div class="card h-100 bg-info text-center text-white">
					                    
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
					</script>-->
					
					<!-- <div class="panel-heading">
						<input class="form-control" ng-model="expression" placeholder="Buscar un club..." />
					</div>
					<div class="panel-body" style="min-width: 100%;max-width: 100%;max-height: 200px;overflow-y: scroll;overflow: -moz-scrollbars-vertical;" >
						<table class="table table-bordered table-striped">
							<tbody>
								<tr ng-repeat="club in clubes | filter:expression">
									<td>
									<a href="https://sistemaflashcards.herokuapp.com/verClub.html?usuario=${usuario.getUsuario()}&club={{ club.id }}">{{ club.club }}</a></td>
								</tr>
							</tbody>
						</table>
					</div>-->
					
					
			</div>
			<div class="col-md-4">
				<div class="container">
			        <div class="card card-container">
						<form action="crearClub.html" method="post">
							<br>
							<h6>¿No encuentra un club sobre un tema? Puedes crearlo ahora:</h6>
							Nombre del Club<br>
							<input type="text" name="nClub" placeholder="Nombre del club..." required><br><br>
							<style>
								textarea {
								   resize: none;
								}
							</style>
							Descripción del Club<br>
							<textarea rows="4" cols="50" id="descripcionClub" name="descripcionClub" placeholder="Descripcion..." required></textarea>
							<input id="usuario" name="usuario" type="hidden" value="${usuario.getUsuario()}">
							<br><br><br><br>
						    <div class="button">
						        <button type="submit">Crear Un Club</button>
						    </div>
						</form>
					</div>
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
			        	var club = array[i].split("////-////");
			        	$scope.clubes.push({
			        		club: club[0],
			        		id: club[1],
			        		descripcion: club[2]
			        	});
			        }
		        }
			}
			var misClubesControlador = function ($scope, $http) {
		        $scope.clubes = [];
		        var cadena = "${misClubes}";
		        var array = cadena.split("///****nuevoCLUB****///");
		        var i;
		        if(cadena != ""){
			        for (i = 0; i < array.length; i++) { 
			        	var club = array[i].split("////-////");
			        	$scope.clubes.push({
			        		club: club[0],
			        		id: club[1],
			        		descripcion: club[2]
			        	});
			        }
		        }
			}
			var app = angular.module('clubsApp', []);
			app.controller('clubsCtrl', clubesControlador);
			app.controller('misClubsCtrl', misClubesControlador);
		</script>
	</body>
</html>