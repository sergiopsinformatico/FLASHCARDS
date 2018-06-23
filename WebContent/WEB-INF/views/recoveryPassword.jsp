<html>
	<head>
		<title>Recuperaci�n de Credenciales - Flashcards</title>
		<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
		<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
		<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
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
		<% session.removeAttribute("usuario"); %>
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
				Recuperaci�n de Credenciales.
			  </h3>
		    </div>
		</div>
		<div class="row">
		</div>
		<div class="row">
		    <div class="col-md-12">
		      <h4 align="center">
				Por favor, introduzca su email o su nombre de usuario para recuperar sus datos.<br>
				Dichos datos ser�n enviados al email que nos proporcion� en su registro.
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
		                Si a�n no tienes cuenta, reg�strate
		            </a>
		        </div>
		    </div> 
		</div>
	</body>
</html>