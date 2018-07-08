<html>
	<head>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	    <title>Recuperación de Credenciales - Flashcards</title>
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
			body, html {
			    height: 100%;
			    background-repeat: no-repeat;
			    background-image: linear-gradient(rgb(104, 145, 162), rgb(12, 97, 33));
			}
			
			.card-container.card {
			    max-width: 350px;
			    padding: 40px 40px;
			}
			
			.btn {
			    font-weight: 700;
			    height: 36px;
			    -moz-user-select: none;
			    -webkit-user-select: none;
			    user-select: none;
			    cursor: default;
			}
			
			/*
			 * Card component
			 */
			.card {
			    background-color: #F7F7F7;
			    /* just in case there no content*/
			    padding: 20px 25px 30px;
			    margin: 0 auto 25px;
			    margin-top: 50px;
			    /* shadows and rounded borders */
			    -moz-border-radius: 2px;
			    -webkit-border-radius: 2px;
			    border-radius: 2px;
			    -moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
			    -webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
			    box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
			}
			
			.profile-img-card {
			    width: 96px;
			    height: 96px;
			    margin: 0 auto 10px;
			    display: block;
			    -moz-border-radius: 50%;
			    -webkit-border-radius: 50%;
			    border-radius: 50%;
			}
			
			/*
			 * Form styles
			 */
			.profile-name-card {
			    font-size: 16px;
			    font-weight: bold;
			    text-align: center;
			    margin: 10px 0 0;
			    min-height: 1em;
			}
			
			.reauth-email {
			    display: block;
			    color: #404040;
			    line-height: 2;
			    margin-bottom: 10px;
			    font-size: 14px;
			    text-align: center;
			    overflow: hidden;
			    text-overflow: ellipsis;
			    white-space: nowrap;
			    -moz-box-sizing: border-box;
			    -webkit-box-sizing: border-box;
			    box-sizing: border-box;
			}
			
			.form-signin #usuario {
			    direction: ltr;
			    height: 44px;
			    font-size: 16px;
			}
			
			.form-signin input[type=email],
			.form-signin input[type=password],
			.form-signin input[type=text],
			.form-signin button {
			    width: 100%;
			    display: block;
			    margin-bottom: 10px;
			    z-index: 1;
			    position: relative;
			    -moz-box-sizing: border-box;
			    -webkit-box-sizing: border-box;
			    box-sizing: border-box;
			}
			
			.form-signin .form-control:focus {
			    border-color: rgb(104, 145, 162);
			    outline: 0;
			    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgb(104, 145, 162);
			    box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgb(104, 145, 162);
			}
			
			.btn.btn-signin {
			    /*background-color: #4d90fe; */
			    background-color: rgb(104, 145, 162);
			    /* background-color: linear-gradient(rgb(104, 145, 162), rgb(12, 97, 33));*/
			    padding: 0px;
			    font-weight: 700;
			    font-size: 14px;
			    height: 36px;
			    -moz-border-radius: 3px;
			    -webkit-border-radius: 3px;
			    border-radius: 3px;
			    border: none;
			    -o-transition: all 0.218s;
			    -moz-transition: all 0.218s;
			    -webkit-transition: all 0.218s;
			    transition: all 0.218s;
			}
			
			.btn.btn-signin:hover,
			.btn.btn-signin:active,
			.btn.btn-signin:focus {
			    background-color: rgb(12, 97, 33);
			}
			
			.login,
			.register {
			    color: rgb(104, 145, 162);
			}
			
			.login:hover,
			.login:active,
			.login:focus,
			.register:hover,
			.register:active,
			.register:focus{
			    color: rgb(12, 97, 33);
			}
			
			.centro{
				align: center;
			}
			
		</style>
	</head>
	<body>
		<%@ page import="com.flashcards.modelo.Usuario" %>
		<% 
		Usuario user = ((Usuario)(session.getAttribute("usuario")));
			if(user!=null && (!user.getUsuario().equals(""))){
				response.sendRedirect("https://sistemaflashcards.herokuapp.com/inicio.html?usuario="+((Usuario)(session.getAttribute("usuario"))).getUsuario());
			}
		%>
		<script language="JavaScript" type="text/javascript">
			if("${mensaje}" != ""){
				alert("${mensaje}");
			}
		</script>
		
		<div class="row">
			<br><br>
		</div>
		<div class="row">
		    <div class="col-md-12">
		      <h2 align="center" style="color:blue;">
				FLASHCARDS. Sistema Basado En Aprendizaje con Tarjetas.
			  </h2>
			  <br><br>
		    </div>
		</div>
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6">
				<br><br><br>
			    <form action="recuperar.html" method="post" class="form-signin">
			      <h1 class="h3 mb-3 font-weight-normal" style="font-weight: bold;">Recuperación de Credenciales.</h1>
			      <h6 align="center" style="font-weight: bold;">
					Por favor, introduzca su email o su nombre de usuario para recuperar sus datos.<br>
					Dichos datos serán enviados al email que nos proporcionó en su registro.
				  </h6>
			      <label for="usuario" class="sr-only" style="font-weight: bold;">Usuario o Email</label>
			      <input type="text" id="usuario" name="usuario" class="form-control" placeholder="Usuario o Email" required>
			      <button class="btn btn-primary" type="submit">Recuperar Datos</button>
			    </form>
			   	<a href="https://sistemaflashcards.herokuapp.com" class="login centro">
		        	Login
		        </a><br>
		        <a href="registro.html" class="register centro">
		        	Si aún no tienes cuenta, regístrate
		       	</a>
			</div>
			<div class="col-md-3"></div>
		</div>
	
	
	
	
	
	
	
	
	
	
		<!-- 
		<script language="JavaScript" type="text/javascript">
			if("${mensaje}" != ""){
				alert("${mensaje}");
			}
		</script>
		<div class="row">
			<br><br>
		</div>
		<div class="row">
		    <div class="col-md-12">
		      <h2 align="center">
				FLASHCARDS. Sistema Basado En Aprendizaje con Tarjetas.
			  </h2>
		    </div>
		</div>
		<div class="row">
		</div>
		<div class="row">
		    <div class="col-md-12">
		      <h3 align="center">
				
			  </h3>
		    </div>
		</div>
		<div class="row">
		</div>
		<div class="row">
		    <div class="col-md-12">
		      <h4 align="center">
				Por favor, introduzca su email o su nombre de usuario para recuperar sus datos.<br>
				Dichos datos serán enviados al email que nos proporcionó en su registro.
			  </h4>
		    </div>
		</div>
		<div class="row">
		    <div class="container">
		        <div class="card card-container">
					<form action="recuperar.html" method="post" class="form-signin" name="form1">
					    <div>
					        Nombre de Usuario o Email: 
					        <input type="text" name="usuario" id="usuario" required />
					    </div>
					    <div class="button">
					        <button type="submit">Recuperar Datos</button>
					    </div>
					</form>
					<a href="https://sistemaflashcards.herokuapp.com" class="login centro">
		                Login
		            </a><br>
		            <a href="registro.html" class="register centro">
		                Si aún no tienes cuenta, regístrate
		            </a>
		        </div>
		    </div> 
		</div>-->
	</body>
</html>