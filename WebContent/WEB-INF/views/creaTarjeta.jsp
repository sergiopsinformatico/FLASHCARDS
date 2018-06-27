<html>
	<head>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	    <title>Crear Tarjeta - Flashcard</title>
		<meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	    <meta http-equiv="x-ua-compatible" content="ie=edge">
	    <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	    <link href="resources/css/bootstrap.min.css" rel="stylesheet">
	    <link href="resources/css/mdb.min.css" rel="stylesheet">
	    <link href="resources/css/style.css" rel="stylesheet">-->
	    
	    
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

	<body ng-app="myAppCard">
		<%@ page import="com.flashcards.modelo.Usuario" %>
		<% 
			Usuario user = ((Usuario)(session.getAttribute("usuario")));
			if(user==null || user.getUsuario().equals("")){
				response.sendRedirect("https://sistemaflashcards.herokuapp.com");
			}
			session.setAttribute("usuario", user);
		%>
		<script language="JavaScript" type="text/javascript">
			if("${mensaje}" != ""){
				alert("${mensaje}");
			}
		</script>
		<style>
		    .list_data { margin-bottom: 2rem }
		    table, th, td { border: 1px solid #AAA }
		    th { cursor: pointer }
		    div.left {
			    text-align: left;
			}
			.navbar-nav > li > a, .navbar-brand {
			    padding-top:4px !important; 
			    padding-bottom:0 !important;
			    height: 28px;
			}
			.navbar {min-height:28px !important;}
			div.center {
			    text-align: center;
			}
			textarea {
			   resize: none;
			}
			.scene {
			  /*width: 300px;*/
			  width: 100%;
			  height: 450px;
			  border: 1px solid #CCC;
			  margin: 40px 0;
			  perspective: 600px;
			}
			
			.card {
			  width: 100%;
			  height: 100%;
			  transition: transform 1s;
			  transform-style: preserve-3d;
			  cursor: pointer;
			  position: relative;
			}
			
			.card.is-flipped {
			  transform: rotateY(180deg);
			}
			
			.card__face {
			  position: absolute;
			  width: 100%;
			  height: 100%;
			  color: white;
			  text-align: center;
			  font-weight: bold;
			  font-size: 12pxvw;
			  backface-visibility: hidden;
			}
			
			.card__face--front {
			  background: red;
			}
			
			.card__face--back {
			  background: blue;
			  transform: rotateY(180deg);
			}
	    </style>
		<nav class="navbar navbar-expand-md bg-dark navbar-dark">
			<div class="collapse navbar-collapse" id="collapsibleNavbar">
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
                    	<a href="#" class="nav-link dropdown-toggle" id="navDropDownLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Hola ${usuario.getUsuario()}!!!</a>
	                    <div class="dropdown-menu" aria-labelledby="navDropDownLink">
	                        <a class="dropdown-item" href="miPerfil.html?usuario=${usuario.getUsuario()}">Mi Perfil</a>
	                        <a class="dropdown-item" href="configuracion.html?usuario=${usuario.getUsuario()}">Configuración</a>
	                        <div class="dropdown-divider"></div>
	                        <a class="dropdown-item" href="cerrarSesion.html" onclick="return confirm('¿Desea Cerrar Sesión?');">Cerrar Sesión</a>
	                    </div>
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
			<br>
		</div>
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-11" ng-controller="showCtrl">
				<div class="row">
					<div class="col-sm-5">
						<div class="row">
							<div class="col-sm-6">
								<b><h6 align="center">Vista Previa de la Tarjeta</h6></b>
								<div class="scene scene--card">
								  <div class="card text-center">
								    <div class="card__face card__face--front align-items-center justify-content-center">
								    	<br>
								    	<p class="card-text">{{ newAnverso }}</p>
									</div>
								    <div class="card__face card__face--back align-items-center justify-content-center">
								    	<br>
								    	<p class="card-text">{{ newReverso }}</p>
									</div>
								  </div>
								</div>
							</div>
							<div class="col-sm-6">
							<br><br>
								<div class="form-group">
									<label for="anverso">Anverso de la Tarjeta</label>
									<textarea class="form-control" id="anverso" style="width:100%;" name="anverso" maxlength="250" rows="6" ng-model="newAnverso"></textarea>
									<small id="creadorHelp" class="form-text text-muted">{{ newAnverso.length }} carácteres de 250 carácteres máximo.</small>
								</div>
								<div class="form-group">
									<label for="reverso">Reverso de la Tarjeta</label>
									<textarea class="form-control" id="reverso" style="width:100%;" name="reverso" maxlength="250" rows="6" ng-model="newReverso"></textarea>
									<small id="creadorHelp" class="form-text text-muted">{{ newReverso.length }} carácteres de 250 carácteres máximo.</small>
								</div>
								<button type="submit" class="btn btn-primary" ng-click="Add()">Insertar</button>
								<button type="submit" class="btn btn-primary" ng-click="Reset()">Limpiar Campos</button>
							</div>
						</div>
					</div>
					<div class="col-sm-1"></div>
					<div class="col-sm-5">
						<div class="row">
							<!-- https://codepen.io/kreigd/pen/ybYNoN -->
							<script>
								$("#myCarousel").on("slide.bs.carousel", function(e) {
									  var $e = $(e.relatedTarget);
									  var idx = $e.index();
									  var itemsPerSlide = 3;
									  var totalItems = $(".carousel-item").length;
	
									  if (idx >= totalItems - (itemsPerSlide - 1)) {
									    var it = itemsPerSlide - (totalItems - idx);
									    for (var i = 0; i < it; i++) {
									      // append slides to end
									      if (e.direction == "left") {
									        $(".carousel-item")
									          .eq(i)
									          .appendTo(".carousel-inner");
									      } else {
									        $(".carousel-item")
									          .eq(0)
									          .appendTo($(this).find(".carousel-inner"));
									      }
									    }
									  }
									});
							</script>
							<style>
								@media (min-width: 768px) {
								  /* show 3 items */
								  .carousel-inner .active,
								  .carousel-inner .active + .carousel-item,
								  .carousel-inner .active + .carousel-item + .carousel-item {
								    display: block;
								  }
								
								  .carousel-inner
								    .carousel-item.active:not(.carousel-item-right):not(.carousel-item-left),
								  .carousel-inner
								    .carousel-item.active:not(.carousel-item-right):not(.carousel-item-left)
								    + .carousel-item,
								  .carousel-inner
								    .carousel-item.active:not(.carousel-item-right):not(.carousel-item-left)
								    + .carousel-item
								    + .carousel-item {
								    transition: none;
								  }
								
								  .carousel-inner .carousel-item-next,
								  .carousel-inner .carousel-item-prev {
								    position: relative;
								    transform: translate3d(0, 0, 0);
								  }
								
								  .carousel-inner
								    .active.carousel-item
								    + .carousel-item
								    + .carousel-item
								    + .carousel-item {
								    position: absolute;
								    top: 0;
								    right: -33.3333%;
								    z-index: -1;
								    display: block;
								    visibility: visible;
								  }
								
								  /* left or forward direction */
								  .active.carousel-item-left + .carousel-item-next.carousel-item-left,
								  .carousel-item-next.carousel-item-left + .carousel-item,
								  .carousel-item-next.carousel-item-left + .carousel-item + .carousel-item,
								  .carousel-item-next.carousel-item-left
								    + .carousel-item
								    + .carousel-item
								    + .carousel-item {
								    position: relative;
								    transform: translate3d(-100%, 0, 0);
								    visibility: visible;
								  }
								
								  /* farthest right hidden item must be abso position for animations */
								  .carousel-inner .carousel-item-prev.carousel-item-right {
								    position: absolute;
								    top: 0;
								    left: 0;
								    z-index: -1;
								    display: block;
								    visibility: visible;
								  }
								
								  /* right or prev direction */
								  .active.carousel-item-right + .carousel-item-prev.carousel-item-right,
								  .carousel-item-prev.carousel-item-right + .carousel-item,
								  .carousel-item-prev.carousel-item-right + .carousel-item + .carousel-item,
								  .carousel-item-prev.carousel-item-right
								    + .carousel-item
								    + .carousel-item
								    + .carousel-item {
								    position: relative;
								    transform: translate3d(100%, 0, 0);
								    visibility: visible;
								    display: block;
								    visibility: visible;
								  }
								}
							</style>
							<div class="container-fluid">
							  <h1 class="text-center mb-3">Bootstrap Multi-Card Carousel</h1>
							  <div id="myCarousel" class="carousel slide" data-ride="carousel">
							    <div class="carousel-inner row w-100 mx-auto">
							      <div class="carousel-item col-md-4 active">
							        <div class="card">
							          <img class="card-img-top img-fluid" src="http://placehold.it/800x600/f44242/fff" alt="Card image cap">
							          <div class="card-body">
							            <h4 class="card-title">Card 1</h4>
							            <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
							            <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
							          </div>
							        </div>
							      </div>
							      <div class="carousel-item col-md-4">
							        <div class="card">
							          <img class="card-img-top img-fluid" src="http://placehold.it/800x600/418cf4/fff" alt="Card image cap">
							          <div class="card-body">
							            <h4 class="card-title">Card 2</h4>
							            <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
							            <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
							          </div>
							        </div>
							      </div>
							      <div class="carousel-item col-md-4">
							        <div class="card">
							          <img class="card-img-top img-fluid" src="http://placehold.it/800x600/3ed846/fff" alt="Card image cap">
							          <div class="card-body">
							            <h4 class="card-title">Card 3</h4>
							            <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
							            <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
							          </div>
							        </div>
							      </div>
							      <div class="carousel-item col-md-4">
							        <div class="card">
							          <img class="card-img-top img-fluid" src="http://placehold.it/800x600/42ebf4/fff" alt="Card image cap">
							          <div class="card-body">
							            <h4 class="card-title">Card 4</h4>
							            <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
							            <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
							          </div>
							        </div>
							      </div>
							      <div class="carousel-item col-md-4">
							        <div class="card">
							          <img class="card-img-top img-fluid" src="http://placehold.it/800x600/f49b41/fff" alt="Card image cap">
							          <div class="card-body">
							            <h4 class="card-title">Card 5</h4>
							            <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
							            <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
							          </div>
							        </div>
							      </div>
							      <div class="carousel-item col-md-4">
							        <div class="card">
							          <img class="card-img-top img-fluid" src="http://placehold.it/800x600/f4f141/fff" alt="Card image cap">
							          <div class="card-body">
							            <h4 class="card-title">Card 6</h4>
							            <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
							            <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
							          </div>
							        </div>
							      </div>
							      <div class="carousel-item col-md-4">
							        <div class="card">
							          <img class="card-img-top img-fluid" src="http://placehold.it/800x600/8e41f4/fff" alt="Card image cap">
							          <div class="card-body">
							            <h4 class="card-title">Card 7</h4>
							            <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
							            <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
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
					<div class="col-sm-1"></div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-1">
			</div>
			<div class="col-sm-11">
				<form action="guardarFlashcard.html" method="post" name="form1" id="form1">
					<div class="row">
						<div class="col-sm-3">
							<div class="form-group">
							    <label for="creador">Creador</label>
							    <input type="text" class="form-control" id="creador" aria-describedby="emailHelp" value="${usuario.getUsuario()}" disabled>
								<small id="creadorHelp" class="form-text text-muted">El creador de la colección será el usuario registrado</small>
							</div>
							<br>
							<div class="form-group">
							    <label for="nombre">Nombre de la Colección</label>
							    <input type="text" class="form-control" id="nombre" aria-describedby="emailHelp" placeholder="Nombre" required>
							</div>
							<br><br>
							<button type="submit" class="btn btn-primary">Guardar Colección</button>
						</div>
						<div class="col-sm-1"></div>
						<div class="col-sm-3">
							<div class="form-group">
								<label for="descripcion">Descripción</label>
							    <textarea class="form-control" id="descripción" rows="3" maxlength="100" style="resize: none;" required></textarea>
							</div>
						</div>
						<div class="col-sm-1"></div>
						<div class="col-sm-3">
							<script>
							    function option(that) {
							        if (that.value == "club") {
							            document.getElementById("club").style.display = "block";
							            document.getElementById("usuario").style.display = "none";
							        } else if(that.value == "usuario"){
							        	document.getElementById("club").style.display = "none";
							            document.getElementById("usuario").style.display = "block";
							        }else{
							        	document.getElementById("club").style.display = "none";
							            document.getElementById("usuario").style.display = "none";
							        }
							    }
							</script>
							<div class="form-group">
								<label for="shareWith">Compartir con</label>
								<select class="form-control" name="shareWith" id="shareWith" onchange="option(this);" required>
							    	<option value="publico">Todo el Mundo</option>
									<option value="privado">Solo yo</option>
									<option value="club">Club</option>
									<option value="usuario">Usuario</option>
								</select>
							</div>
							<script language="JavaScript" type="text/javascript">
								change();
							</script>
							<br><br>
							<div class="form-group" style="min-width: 100%;" id="club" ng-controller="clubCtrl">
								<div ng-if="clubes.length == 0"> 
							        No pertenece a ningún club.
							        <br>
							    </div>
							     <div ng-if="clubes.length > 0">
									<label for="selectClub">Nombre del Club</label>
									<input class="form-control" style="min-width: 100%;" ng-model="expression" placeholder="Buscar club..." />
									<select multiple class="form-control" style="min-width: 100%;" name="selectClub" id="selectClub">
										<option ng-repeat="club in clubes | filter:expression" value="{{ club.identificador }}">{{ club.name }}</option>
									</select>
								</div>
							</div>
							<div class="form-group" style="min-width: 100%;" id="usuario" ng-controller="usuarioCtrl">
								<div ng-if="people.length == 0"> 
							        No tiene aún amigos.
							        <br>
							    </div>
							     <div ng-if="people.length > 0">
									<label for="selectUsuario">Nombre del Usuario</label>
									<input class="form-control" style="min-width: 100%;" ng-model="expression" placeholder="Buscar usuario..." />
									<select multiple class="form-control" style="min-width: 100%;" name="selectUsuario" id="selectUsuario">
										<option ng-repeat="person in people | filter:expression" value="{{ person.usuario }}">{{ person.name }} ({{ person.usuario }})</option>
									</select>
								</div>
							</div>							
						</div>
						<div class="col-sm-1"></div>
					</div>
				</form>
			</div>
		</div>
		
		
		
		
		
		
		
		
		
		
		
		
		
		<!-- 
		<div class="row">
			<form action="guardarFlashcard.html" method="post" name="form1" id="form1">
				<script>
				    function option(that) {
				        if (that.value == "club") {
				            document.getElementById("club").style.display = "block";
				            document.getElementById("usuario").style.display = "none";
				        } else if(that.value == "usuario"){
				        	document.getElementById("club").style.display = "none";
				            document.getElementById("usuario").style.display = "block";
				        }else{
				        	document.getElementById("club").style.display = "none";
				            document.getElementById("usuario").style.display = "none";
				        }
				    }
				    
				    function change(){
						document.form1.shareWith.value = "publico";
					}
				</script>
				<div class="row" style="min-width: 100%;">
					<div class="col-md-1"></div>
					<div class="col-md-3">
						<div class="row">
							<div class="form-group" style="min-width: 100%;">
								<label for="creador" class="cols-md-2 control-label">Creador</label>
								<div class="cols-md-10">
									<div class="input-group">
										<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
										<input type="text" class="form-control" name="creador" id="creador" value=${usuario.getUsuario()} disabled/>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="form-group" style="min-width: 100%;">
								<label for="nombre" class="cols-md-2 control-label">Nombre de la Colección</label>
								<div class="cols-md-10">
									<div class="input-group">
										<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
										<input type="text" class="form-control" name="nombre" id="nombre" placeholder="Nombre de la Colección" required />
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="form-group" style="min-width: 100%;">
								<div class="cols-md-12">
									<div class="input-group">
										<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
										<br> <button type="submit" class="btn btn-primary">Guardar Coleccion</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="row">
							<div class="form-group" style="min-width: 100%;">
								<label for="descripcion" class="cols-md-2 control-label">Descripción</label>
								<div class="cols-md-10">
									<div class="input-group">
										<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
										<style>
											textarea {
											   resize: none;
											}
										</style>
										<textarea rows="4" cols="50" id="descripcion" class="form-control" name="descripcion" form="form1" placeholder="Descripción" required></textarea>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="row">
							<div class="form-group" style="min-width: 100%;">
								<label for="shareWith" class="cols-md-2 control-label">Compartir con:</label>
								<div class="cols-md-10">
									<div class="input-group">
										<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
										<select name="shareWith" id="shareWith" onchange="option(this);" required>
										    <option value="publico">Todo el Mundo</option>
										    <option value="privado">Solo yo</option>
										    <option value="club">Club</option>
										    <option value="usuario">Usuario</option>
										  </select>
									</div>
								</div>
							</div>
							<div class="panel panel-primary" style="min-width: 100%;" id="club" ng-controller="clubCtrl">
								<div ng-if="clubes.length == 0"> 
							        No pertenece a ningún club.
							        <br>
							        <script language="JavaScript" type="text/javascript">
										change();
									</script>
							    </div>
							    <div ng-if="clubes.length > 0">
									<div class="panel-heading">
										<br>Nombre del Club<br>
										<input class="form-control" ng-model="expression" placeholder="Buscar..." />
									</div>
									<div class="panel-body" style="min-width: 100%;max-height:200px;overflow-y: scroll;overflow: -moz-scrollbars-vertical;">
										<table class="table table-bordered table-striped">
											<tbody>
												<tr ng-repeat="club in clubes | filter:expression">
													<td><input type="radio" class="form-control" name="selectClub" value="{{ club.identificador }}" /></td>
													<td>{{ club.name }}</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
							<div class="panel panel-primary" style="min-width: 100%;" id="usuario" ng-controller="usuarioCtrl">
								<div ng-if="people.length == 0"> 
							        No tiene aún amigos.
							        <br>
							        <script language="JavaScript" type="text/javascript">
										change();
									</script>
							    </div>
								<div ng-if="people.length > 0">
									<div class="panel-heading">
										<br>Nombre del Usuario<br>
										<input class="form-control" ng-model="expression" placeholder="Buscar..." />
									</div>
									<div class="panel-body" style="min-width: 100%;max-height: 200px;overflow-y: scroll;overflow: -moz-scrollbars-vertical;" >
										<table class="table table-bordered table-striped">
											<tbody>
												<tr ng-repeat="person in people | filter:expression">
													<td><input type="radio" class="form-control" name="selectUsuario" value="{{ person.usuario }}" /></td>
													<td>{{ person.name }} ({{ person.usuario }})</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
		-->
		<!-- <div class="row">
			<br><br>
		</div>
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-6" ng-controller="showCtrl">
				<div class="row">
					<div class="col-md-5">
						<h6 align="center">Vista Previa de la Tarjeta</h6>
						<div class="scene scene--card">
						  <div class="card text-center">
						    <div class="card__face card__face--front align-items-center justify-content-center">
						    	<br>
						    	<p class="card-text">{{ newAnverso }}</p>
							</div>
						    <div class="card__face card__face--back align-items-center justify-content-center">
						    	<br>
						    	<p class="card-text">{{ newReverso }}</p>
							</div>
						  </div>
						</div>
					</div>
					<div class="col-md-1"></div>
					<div class="col-md-5">
						<div class="row">
							<br><br>
						</div>
						<div class="row">
							<h6>Anverso de la Tarjeta (max. 250 caracteres)</h6>
						</div>
						<div class="row">
							<textarea rows="6" cols="50" maxlength="250" id="anverso" name="anverso" form="form2" ng-model="newAnverso"></textarea>
						</div>
						<div class="row">
							<br><br>
						</div>
						<div class="row">
							<h6>Reverso de la Tarjeta (max. 250 caracteres)</h6>
						</div>
						<div class="row">
							<textarea rows="6" cols="50" maxlength="250" id="reverso" name="reverso" form="form3" ng-model="newReverso"></textarea>
						</div>
						<div class="row">
							<br>
						</div>
						<div class="row">
							<div class="action col-md-4">
								<button ng-click="Add()">Insertar</button>
							</div>
							<div class="action col-md-8">
								<button ng-click="Reset()">Limpiar Campos</button>
							</div>
						</div>
					</div>
					<div class="col-md-1"></div>
				</div>
				<div class="row">
				</div>
			</div>
			<script>
				document.form1.nombre.value = "${name}";
				document.form1.descripcion.value = "${description}";
				document.form1.shareWith.value = "${shareOption}";
			    option(document.form1.shareWith);
			    var optionWith = "${shareOptionWith}";
			    var optionGeneric = "${shareOption}";
			    var vacio = optionWith.localeCompare("");
			    if(vacio != 0){
			    	var club = "club";
			    	var usuario = "usuario";
			    	var isClub = optionGeneric.localeCompare(club);
			    	var isUsuario = optionGeneric.localeCompare(usuario);
			    	if(isClub == 0){
			    		document.getElementById("selectClub").value = optionWith;
			    	}else{
			    		if(isUsuario == 0){
			    			document.getElementById("selectUsuario").value = optionWith;
			    		}
			    	}		    		
			    }
			    
			</script>
			<script>
			var card = document.querySelector('.card');
			card.addEventListener( 'click', function() {
				  card.classList.toggle('is-flipped');
				});
			</script>
			<script>
				var app = angular.module('myAppCard', []);
			
				var controller = function ($scope, $http) {
					
					 $scope.records=[];
					
					$scope.newAnverso = "Anverso";
				    $scope.newReverso = "Reverso";
					
			       		
			        $scope.Reset = function () {
			        	$scope.newAnverso = '';
			        	$scope.newReverso = '';
			        }
		
			        $scope.Add = function () {
			            if (!$scope.newAnverso || !$scope.newReverso)
			                return;
			            
			            $scope.records.push({
			                anverso: $scope.newAnverso,
			                reverso: $scope.newReverso
			            });
			            
			            $http.post('https://sistemaflashcards.herokuapp.com/tarjeta.html', 
				            {
				            	anverso: $scope.newAnverso,
				            	reverso: $scope.newReverso
				            });          
			  	            $scope.Reset();
			            
			        }
			        // Undo action (delete)
			        $scope.Undo = function () {
			            var elemento = $scope.history[ $scope.history.length - 1 ];
			            $http.post('https://sistemaflashcards.herokuapp.com/tarjeta.html', 
				            {
				            	anverso: elemento.anverso,
				            	reverso: elemento.reverso
				            });  
			            $scope.records.push(elemento);
			            $scope.history.pop();
			        }
				};
				
				var usuarioControlador = function ($scope){
					$scope.people = [];
					var cadena = "${amigos}";
			        var array = cadena.split("///****nuevoAmigo****///");
			        var i;
			        if(cadena != ""){
				        for (i = 0; i < array.length; i++) { 
				        	var person = array[i].split("///****user****///");
				        	$scope.people.push({
				        		name: person[0],
				        		usuario: person[1]
				        	});
				        }
			        }
				};
				
				var clubControlador = function ($scope){
					$scope.clubes = [];
					var cadena = "${clubes}";
			        var array = cadena.split("///****nuevoCLUB****///");
			        var i;
			        if(cadena != ""){
				        for (i = 0; i < array.length; i++) { 
				        	var club = array[i].split("///****id****///");
				        	$scope.clubes.push({
				        		name: club[0],
				        		identificador: club[1]
				        	});
				        }
			        }
				};
				
				app.controller('showCtrl', controller);
				app.controller('clubCtrl', clubControlador);
				app.controller('usuarioCtrl', usuarioControlador);
			</script>
		</div>-->
		<script>
			function change(){
				document.form1.shareWith.value = "publico";
				option(document.form1.shareWith);
			}
			change();
			document.form1.nombre.value = "${name}";
			document.form1.descripcion.value = "${description}";
			document.form1.shareWith.value = "${shareOption}";
		    option(document.form1.shareWith);
		    var optionWith = "${shareOptionWith}";
		    var optionGeneric = "${shareOption}";
		    var vacio = optionWith.localeCompare("");
		    if(vacio != 0){
		    	var club = "club";
		    	var usuario = "usuario";
		    	var isClub = optionGeneric.localeCompare(club);
		    	var isUsuario = optionGeneric.localeCompare(usuario);
		    	if(isClub == 0){
		    		document.getElementById("selectClub").value = optionWith;
		    	}else{
		    		if(isUsuario == 0){
		    			document.getElementById("selectUsuario").value = optionWith;
		    		}
		    	}		    		
		    }
		    
		</script>
		<script>
			var card = document.querySelector('.card');
			card.addEventListener( 'click', function() {
				  card.classList.toggle('is-flipped');
				});
			
			var showControlador = function($scope, $http){
				$scope.newAnverso="Ejemplo de Anverso";
				$scope.newReverso="Ejemplo de Reverso";
				
				$scope.records=[];
				
				$scope.Reset = function () {
		            $scope.newAnverso = '';
		            $scope.newReverso = '';
		        }
				
				$scope.Add = function () {
		            if (!$scope.newAnverso || !$scope.newReverso)
		                return;
		            
		            $scope.records.push({
		                anverso: $scope.newAnverso,
		                reverso: $scope.newReverso
		            });
		            
		            $http.post('https://sistemaflashcards.herokuapp.com/tarjeta.html', 
			            {
			            	anverso: $scope.newAnverso,
			            	reverso: $scope.newReverso
			            });          
		  	            $scope.Reset();
		            
		        }
				
			};
			
			var recordControlador = function ($scope, $http) {
	
		        $scope.history = [];
	
		        $scope.records = [];
		        
		        var cadena = "${cards}";
		        var array = cadena.split("///****nuevaCARD****///");
		        var i;
		        if(cadena != ""){
			        for (i = 0; i < array.length; i++) { 
			        	var elemento = array[i].split("///****resp****///");
			        	$scope.records.push({
			        		enunciado: elemento[0],
			        		respuesta: elemento[1]
			        	});
			        }
		        }
		        
		        $scope.Delete = function (index) {
		            // Remove first / oldest element from history if it reaches maximum capacity of 10 records
		            if ($scope.history.length === 10)
		                $scope.history.shift();
	
		            var eliminar = $scope.records[index];
		            $http.post('https://sistemaflashcards.herokuapp.com/eliminarTarjeta.html', 
			            {
			            	enunciado: eliminar.enunciado,
			            	respuesta: eliminar.respuesta
			            });
		            $scope.history.push(eliminar);
		            $scope.records.splice(index, 1);
		        };
	
		        $scope.Reset = function () {
		            $scope.newEnunciado = '';
		            $scope.newRespuesta = '';
		        }
		        $scope.Reset();
	
		        $scope.Add = function () {
		            if (!$scope.newEnunciado || !$scope.newRespuesta)
		                return;
		            
		            $scope.records.push({
		                enunciado: $scope.newEnunciado,
		                respuesta: $scope.newRespuesta
		            });
		            
		            $http.post('https://sistemaflashcards.herokuapp.com/tarjeta.html', 
			            {
			            	enunciado: $scope.newEnunciado,
			            	respuesta: $scope.newRespuesta
			            });          
		  	            $scope.Reset();
		            
		        }
		        // Undo action (delete)
		        $scope.Undo = function () {
		            var elemento = $scope.history[ $scope.history.length - 1 ];
		            $http.post('https://sistemaflashcards.herokuapp.com/tarjeta.html', 
			            {
			            	enunciado: elemento.enunciado,
			            	respuesta: elemento.respuesta
			            });  
		            $scope.records.push(elemento);
		            $scope.history.pop();
		        }
			};
			
			var usuarioControlador = function ($scope){
				$scope.people = [];
				var cadena = "${amigos}";
		        var array = cadena.split("///****nuevoAmigo****///");
		        var i;
		        if(cadena != ""){
			        for (i = 0; i < array.length; i++) { 
			        	var person = array[i].split("///****user****///");
			        	$scope.people.push({
			        		name: person[0],
			        		usuario: person[1]
			        	});
			        }
		        }
			};
			
			var clubControlador = function ($scope){
				$scope.clubes = [];
				var cadena = "${clubes}";
		        var array = cadena.split("///****nuevoCLUB****///");
		        var i;
		        if(cadena != ""){
			        for (i = 0; i < array.length; i++) { 
			        	var club = array[i].split("///****id****///");
			        	$scope.clubes.push({
			        		name: club[0],
			        		identificador: club[1]
			        	});
			        }
		        }
			};
			
			var app = angular.module('myAppCard', []);
			app.controller('clubCtrl', clubControlador);
			app.controller('usuarioCtrl', usuarioControlador);
			app.controller('recordCtrl', recordControlador);
			app.controller('showCtrl', showControlador);
		</script>
	</body>
</html>
		
		<!-- 
		<div class="row">
			<div class="col-md-1">
				<br><br>
			</div>
			<div class="col-md-11">
				<br><h1>CREACIÓN DE UNA COLECCIÓN DE FLASHCARDS</h1><br>
			</div>
		</div> 
		<div class="row">
			<div class="col-md-1">
			</div>
			<div class="col-md-10">
				<div class="container">
			        <div class="card card-container">
							<div class="row">
								<div class="col-md-1"></div>
								<div class="col-md-4">
									<form action="guardarFlashcard.html" method="post" class="border-login" name="form1" id="form1">
										<br>
										<div class="form-group">
											<label for="creador" class="cols-sm-2 control-label">Creador</label>
											<div class="cols-sm-10">
												<div class="input-group">
													<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
													<input type="text" class="form-control" name="creador" id="creador" value=${usuario.getUsuario()} disabled/>
												</div>
											</div>
										</div>
										<div class="form-group">
											<label for="nombre" class="cols-sm-2 control-label">Nombre de la Colección</label>
											<div class="cols-sm-10">
												<div class="input-group">
													<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
													<input type="text" class="form-control" name="nombre" id="nombre" placeholder="Nombre de la Colección" required />
												</div>
											</div>
										</div>
										<div class="form-group">
											<label for="descripcion" class="cols-sm-2 control-label">Descripción</label>
											<div class="cols-sm-10">
												<div class="input-group">
													<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
													<style>
														textarea {
														   resize: none;
														}
													</style>
													<textarea rows="4" cols="50" id="descripcion" class="form-control" name="descripcion" form="form1" placeholder="Descripción" required></textarea>
												</div>
											</div>
										</div>
										<div class="form-group">
											<label for="shareWith" class="cols-sm-2 control-label">Compartir con:</label>
											<div class="cols-sm-10">
												<div class="input-group">
													<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
													<select name="shareWith" id="shareWith" onchange="option(this);" required>
													    <option value="publico">Todo el Mundo</option>
													    <option value="privado">Solo yo</option>
													    <option value="club">Club</option>
													    <option value="usuario">Usuario</option>
													  </select>
												</div>
											</div>
										</div>
										<div class="panel panel-primary" id="club" ng-controller="clubCtrl">
											<div ng-if="clubes.length == 0"> 
										        No pertenece a ningún club.
										        <br>
										        <script language="JavaScript" type="text/javascript">
													change();
												</script>
										    </div>
										    <div ng-if="clubes.length > 0">
												<div class="panel-heading">
													<br>Nombre del Club<br>
													<input class="form-control" ng-model="expression" placeholder="Buscar..." />
												</div>
												<div class="panel-body" style="max-height: 200px;overflow-y: scroll;overflow: -moz-scrollbars-vertical;">
													<table class="table table-bordered table-striped">
														<tbody>
															<tr ng-repeat="club in clubes | filter:expression">
																<td><input type="radio" class="form-control" name="selectClub" value="{{ club.identificador }}" /></td>
																<td>{{ club.name }}</td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
										</div>									
										<div class="panel panel-primary" id="usuario" ng-controller="usuarioCtrl">
											<div ng-if="people.length == 0"> 
										        No tiene aún amigos.
										        <br>
										        <script language="JavaScript" type="text/javascript">
													change();
												</script>
										    </div>
											<div ng-if="people.length > 0">
												<div class="panel-heading">
													<br>Nombre del Usuario<br>
													<input class="form-control" ng-model="expression" placeholder="Buscar..." />
												</div>
												<div class="panel-body" style="max-height: 200px;overflow-y: scroll;overflow: -moz-scrollbars-vertical;" >
													<table class="table table-bordered table-striped">
														<tbody>
															<tr ng-repeat="person in people | filter:expression">
																<td><input type="radio" class="form-control" name="selectUsuario" value="{{ person.usuario }}" /></td>
																<td>{{ person.name }} ({{ person.usuario }})</td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
										</div>
										<div class="form-group">
											<div class="cols-sm-10">
												<div class="input-group">
													<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
													<br> <button type="submit" class="btn btn-primary">Guardar Coleccion</button>
												</div>
											</div>
										</div>
										
									</form>
								</div>
								<div class="col-md-2"></div>
								<div class="col-md-4">
									<div ng-controller="recordCtrl">				  
									    <div class="add_data">
									    	<br>
									        <h5>Insertar Nueva Tarjeta</h5>
									        <form>
									            <div class="field">
									                <label for="enunciado">Enunciado: </label><br>
									                <textarea rows="2" cols="50" id="enunciado" name="enunciado" placeholder="Enunciado" form="form2" ng-model="newEnunciado"></textarea>
									            </div>
									             <div class="field">
									                <label for="respuesta">Respuesta: </label><br>
									                <textarea rows="4" cols="50" id="respuesta" name="respuesta" placeholder="Respuesta" form="form3" ng-model="newRespuesta"></textarea>
									            </div>
									            <div class="action">
									                <button ng-click="Add()">Insertar</button>
									                <button ng-click="Reset()">Limpiar Campos</button>
									            </div>
									        </form>
									    </div>
									    <div class="list_data">
									    	<br><h5>Lista de Tarjetas</h5><br>
									        <div ng-if="records.length == 0"> 
										        Aún, no hay creada ninguna tarjeta. Como mínimo, la colección debe estar formada por una tarjeta.
										    </div>
										    <div ng-if="records.length > 0">
										        <table>
										            <tr>
										                <th ng-click="type = 'enunciado'; reverse = !reverse">Enunciado</th>
										                <th ng-click="type = 'respuesta'; reverse = !reverse">Respuesta</th>
										                <th>Eliminar</th>
										            </tr>
										            <tr ng-repeat="record in records">
										                <td>{{record.enunciado}}</td>
										                <td>{{record.respuesta}}</td>
										                <td><button ng-click="Delete($index)">Eliminar Tarjeta</button></td>
										            </tr>
										        </table>
										    </div>
									        <button ng-show="history.length > 0" ng-click="Undo()">Deshacer Tarjeta Eliminada</button>
									    </div>
									</div>
								</div>
								<div class="col-md-1"></div>
							</div>
					</div>
				</div>
			</div>
			<div class="col-md-1">
			</div>
		</div>
		
		-->
