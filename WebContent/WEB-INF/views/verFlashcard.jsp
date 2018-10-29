<html>
	<head>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	    <title>Ver Colección Flashcard: ${nombre} - Flashcards</title>
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
	<body ng-app="showColeccion">
		<%@ page import="com.flashcards.modelo.UsuarioDTO" %>
		<% 
			UsuarioDTO user = ((UsuarioDTO)(session.getAttribute("usuario")));
			if(user==null || user.getNombreUsuario().equals("")){
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
			
			.container{
			     width: 100%;
			     min-width: 100%;
			     max-width: 100%;
				 height: 600px;
				 min-height: 600px;
				 max-height: 600px;
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
				<h1 align="center" style="font-weight: bold;">VER COLECCIÓN DE FLASHCARDS - ${nombre} </h1>
				<br>
			</div>
		</div>			
		
		<div class="row">
			<div class="col-md-4"></div>
			<div class="col-md-4" ng-controller="coleccionCtrl">
				<div ng-if="cards.length == 0">
					<h6 align="center">Todas las peticiones de amistad enviadas, han sido aceptadas o rechazadas</h6>
				</div>
				<div ng-if="cards.length > 0">
					<div id="carouselFlashcards" class="carousel slide">
				        <div class="container">
				            <div class="carousel-inner row w-100 mx-auto">
								<div class="carousel-item" ng-repeat="card in cards | filter:expression">
							        <div class="card card-flip h-100">
						                <div class="card-front card text-center" style="background: blue;">
						                    <div class="card-body">
						                        <p class="card-text">{{ card.anverso }}</p>
						                    </div>
						                </div>
						                <div class="card-back card text-center" style="background: green;">
						                    <div class="card-body">
						                        <p class="card-text">{{ card.reverso }}</p>
						                        <br>
						                    </div>
						                </div>
						            </div>								
				                </div>
				            </div>
					        <a class="carousel-control-prev" href="#carouselFlashcards" role="button" data-slide="prev">
						      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
						      <span class="sr-only">Previous</span>
						    </a>
						    <a class="carousel-control-next" href="#carouselFlashcards" role="button" data-slide="next">
						      <span class="carousel-control-next-icon" aria-hidden="true"></span>
						      <span class="sr-only">Next</span>
						    </a>
					    </div>
					</div>
					<script>
						$('#carouselFlashcards').carousel({})
					</script>
				</div>
			</div>
			<script>
				$(document).ready(function(){
					  $('.carousel').each(function(){
					    $(this).find('.carousel-item').eq(0).addClass('active');
					  });
					});
			</script>
			<div class="col-md-4"></div>
			<script>
				var coleccionControlador = function ($scope){
					$scope.cards = [];
					var col = "${coleccion}";
			        var tarjetas = col.split("///****nuevaCARD****///");
			        var i;
			        if(col != ""){
				        for (i = 0; i < tarjetas.length; i++) { 
				        	var tarjeta = tarjetas[i].split("///****resp****///");
				        	$scope.cards.push({
				        		anverso: tarjeta[0],
				        		reverso: tarjeta[1]
				        	});
				        }
			        }
				};
				
				var app = angular.module('showColeccion', []);
				app.controller('coleccionCtrl', coleccionControlador);
			</script>
		</div>
	</body>
</html>