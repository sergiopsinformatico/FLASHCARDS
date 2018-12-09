<html>
	<head>
		<!-- <title>Mi Perfil - Flashcards</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">	
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
		<script src="//ajax.googleapis.com/ajax/libs/angularjs/1.2.11/angular.min.js"></script> -->
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	    <title>Perfil de ${usuario.getNombreApellidos()} - Flashcards</title>
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
		<%@ page import="com.flashcards.dto.UsuarioDTO" %>
		<% 
			UsuarioDTO user = ((UsuarioDTO)(session.getAttribute("usuario")));
			if(user==null || user.getUsername().equals("")){
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
		    div.left {
			    text-align: left;
			}
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
			  height: 450px;
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
			
			.formato-img{
				height: 180px;
				min-height: 180px;
				max-height: 180px;
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
	    		<a class="nav-link" href="inicio.html?usuario=${usuario.getNombreUsuario()}">
					Inicio
				</a>
	          </li>
	          <li class="nav-item active">
				<a class="nav-link" href="flashcards.html?usuario=${usuario.getNombreUsuario()}">
					Flashcards
				</a>
			  </li>
			  <li class="nav-item">
			  	<a class="nav-link" href="gente.html?usuario=${usuario.getNombreUsuario()}">
					Gente
				</a>
			  </li>
			  <li class="nav-item">
			  	<a class="nav-link" href="clubes.html?usuario=${usuario.getNombreUsuario()}">
					Clubes
				</a>
			  </li>
			  <li class="nav-item">
			  	<a class="nav-link" href="gestionar.html?usuario=${usuario.getNombreUsuario()}" id="btn-Gestion">
					Gestionar Cuentas
				</a>
			  </li>
	        </ul>
	        <ul class="navbar-nav ml-auto">
	        <li class="nav-item dropdown">
	            <a class="nav-link dropdown-toggle" href="" id="dropdown03" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Bienvenido ${usuario.getNombreApellidos()} </a>
	            <div class="dropdown-menu dropdown-primary" aria-labelledby="dropdown03">
	              <a class="dropdown-item" href="miPerfil.html?usuario=${usuario.getNombreUsuario()}">Mi Perfil</a>
	              <a class="dropdown-item" href="configuracion.html?usuario=${usuario.getNombreUsuario()}">Configuración</a>
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
			body {
			  background: #F1F3FA;
			}
			
			/* Profile container */
			.profile {
			  margin: 20px 0;
			}
			
			/* Profile sidebar */
			.profile-sidebar {
			  padding: 20px 0 10px 0;
			  background: #fff;
			}
			
			.profile-userpic img {
			  float: none;
			  margin: 0 auto;
			  width: 50%;
			  height: 50%;
			  -webkit-border-radius: 50% !important;
			  -moz-border-radius: 50% !important;
			  border-radius: 50% !important;
			}
			
			.profile-usertitle {
			  text-align: center;
			  margin-top: 20px;
			}
			
			.profile-usertitle-name {
			  color: #5a7391;
			  font-size: 16px;
			  font-weight: 600;
			  margin-bottom: 7px;
			}
			
			.profile-usertitle-job {
			  text-transform: uppercase;
			  color: #5b9bd1;
			  font-size: 12px;
			  font-weight: 600;
			  margin-bottom: 15px;
			}
			
			.profile-userbuttons {
			  text-align: center;
			  margin-top: 10px;
			}
			
			.profile-userbuttons .btn {
			  text-transform: uppercase;
			  font-size: 11px;
			  font-weight: 600;
			  padding: 6px 15px;
			  margin-right: 5px;
			}
			
			.profile-userbuttons .btn:last-child {
			  margin-right: 0px;
			}
			    
			.profile-usermenu {
			  margin-top: 30px;
			}
			
			.profile-usermenu ul li {
			  border-bottom: 1px solid #f0f4f7;
			}
			
			.profile-usermenu ul li:last-child {
			  border-bottom: none;
			}
			
			.profile-usermenu ul li a {
			  color: #93a3b5;
			  font-size: 14px;
			  font-weight: 400;
			}
			
			.profile-usermenu ul li a i {
			  margin-right: 8px;
			  font-size: 14px;
			}
			
			.profile-usermenu ul li a:hover {
			  background-color: #fafcfd;
			  color: #5b9bd1;
			}
			
			.profile-usermenu ul li.active {
			  border-bottom: none;
			}
			
			.profile-usermenu ul li.active a {
			  color: #5b9bd1;
			  background-color: #f6f9fb;
			  border-left: 2px solid #5b9bd1;
			  margin-left: -2px;
			}
			
			/* Profile Content */
			.profile-content {
			  padding: 20px;
			  background: #fff;
			  min-height: 460px;
			}
		</style>
		<div class="container">
		    <div class="row profile">
				<div class="col-md-3">
					<div class="profile-sidebar">
						
						<!-- <div class="profile-userpic">
							<img src="http://www.personalbrandingblog.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640-300x300.png" class="img-responsive" alt="" style="height: 35%; width:100%;">
						</div>-->
						
						<div class="row">
							<img src=${usuario.getPhoto()} alt="Perfil" class="formato-img">
						</div>
						
						<div class="profile-usertitle">
							<div class="profile-usertitle-name">
								${perfil.getNombreApellidos()} (${perfil.getNombreUsuario()})
							</div>
							<div class="profile-usertitle-job">
								${rol}
							</div>
						</div>
						
						<div class="profile-userbuttons" id="showModificar">
							<form action="modificarMiPerfil.html" method="post">
								<input type="hidden" id="usuario" name="usuario" value="${perfil.getNombreUsuario()}">
								<input type="submit" class="btn btn-success btn-sm" value="Modificar Mi Perfil">
							</form>
						</div>
						
						<script>
							var componente = document.getElementById("showModificar");
							var check = ${modificar};
							if(check == true){
								componente.style.display = "block";
							}else{
								componente.style.display = "none";
							}
						</script>
						
						<div class="profile-usermenu">
							<h6 style="font-weight: bold;">Edad: </h6><h6>${perfil.getEdad()} años </h6><br>
							<h6 style="font-weight: bold;">Genero: </h6><h6>${perfil.getGenero()}</h6><br>
							<h6 style="font-weight: bold;">Localización: </h6><h6>${perfil.getCiudad()} (${perfil.getPais()}) </h6><br>
						</div>
					</div>
				</div>
				<div class="col-md-9">
		            <div class="profile-content">
					   
		            </div>
				</div>
			</div>
		</div>
	</body>
</html>