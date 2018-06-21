<html>
	<head>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Ver Flashcard</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">	
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
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
			
			body { font-family: sans-serif; }
			
			.scene {
			  /*width: 200px;*/
			  width: 100%;
			  /*height: 260px;*/
			  height: 100%;
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
			  line-height: 260px;
			  color: white;
			  text-align: center;
			  font-weight: bold;
			  font-size: 40px;
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
			<div class="navbar-inner navbar-collapse" id="collapsibleNavbar">
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
		
			<div class="col-md-2"></div>
			
			<div class="col-md-2" id="flechaLeft">
				<span class="glyphicon glyphicon-chevron-left"></span><br>
				<a href="${urlLeft}">Anterior</a>
			</div>
			
			<div class="col-md-4">
				<div class="scene scene--card">
				  <div class="card">
				    <div class="card__face card__face--front"><h6>${front}</h6></div>
				    <div class="card__face card__face--back"><h6>${back}</h6></div>
				  </div>
				</div>
			</div>
			
			<div class="col-md-2" id="flechaRight">
				<span class="glyphicon glyphicon-chevron-right"></span><br>
				<a href="${urlRight}">Siguiente</a>
			</div>
			
			<div class="col-md-2"></div>
		
		</div>			
		<script>
			var izq = "${urlLeft}";
			var dec = "${urlRight}";
			if((izq == "") && (dec == "")){
				document.getElementById("flechaLeft").style.visibility="hidden";
				document.getElementById("flechaRight").style.visibility="hidden";
			}else if((izq != "") && (dec == "")){
				document.getElementById("flechaLeft").style.visibility="visible";
				document.getElementById("flechaRight").style.visibility="hidden";
			}else if((izq == "") && (dec != "")){
				document.getElementById("flechaLeft").style.visibility="hidden";
				document.getElementById("flechaRight").style.visibility="visible";
			}else{
				document.getElementById("flechaLeft").style.visibility="visible";
				document.getElementById("flechaRight").style.visibility="visible";
			}
			
			var card = document.querySelector('.card');
			card.addEventListener( 'click', function() {
			  card.classList.toggle('is-flipped');
			});
		</script>
	</body>
</html>