<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		 <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

		<title>Ventas Electronicas UTP</title>

		<!-- Google font -->
		<link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

		<!-- Bootstrap -->
		<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>

		<!-- Slick -->
		<link type="text/css" rel="stylesheet" href="css/slick.css"/>
		<link type="text/css" rel="stylesheet" href="css/slick-theme.css"/>

		<!-- nouislider -->
		<link type="text/css" rel="stylesheet" href="css/nouislider.min.css"/>

		<!-- Font Awesome Icon -->
		<link rel="stylesheet" href="css/font-awesome.min.css">

		<!-- Custom stlylesheet -->
		<link type="text/css" rel="stylesheet" href="css/style.css"/>

		<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
		<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
		<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
		<link rel="stylesheet" href="./style.css">

    </head>
	<body>
		<!-- HEADER -->
		<header>
			<!-- TOP HEADER -->
			<div id="top-header">
				<div class="container">
					<ul class="header-links pull-left">
						<li><a href="#"><i class="fa fa-phone"></i> (054) 412630</a></li>
						<li><a href="#"><i class="fa fa-envelope-o"></i> electronicos@gmail.com</a></li>
						<li><a href="#"><i class="fa fa-map-marker"></i> Tacna y Arica 160</a></li>
					</ul>
					<ul class="header-links pull-right">
						<li><a href="#"><i class="fa fa-dollar"></i> USD</a></li>
						<li><a href="./new_user.jsp"><i class="fa fa-user-o"></i> Registrar cuenta</a></li>
						<li><a href="./login.jsp"><i class="fa fa-user-o"></i> Login</a></li>
					</ul>
				</div>
			</div>
			<!-- /TOP HEADER -->

			<!-- MAIN HEADER -->
			<div id="header">
				<!-- container -->
				<div class="container">
					<!-- row -->
					<div class="row">
						<!-- LOGO -->
						<div class="col-md-3">
							<div class="header-logo">
								<a href="./index.jsp" class="logo">
									<img src="./img/logo.png" alt="">
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
<!-- partial:index.partial.html -->
		<%//CONECTANOD A LA BASE DE DATOS:
		Connection con;
		String url="jdbc:mysql://localhost:3306/avance01";
		String Driver="com.mysql.jdbc.Driver";
		String user="root";
		String clave="";
		Class.forName(Driver);
		con=DriverManager.getConnection(url,user,clave);
		//Emnpezamos Listando los Datos de la Tabla Usuario pero de la fila seleccionada
		PreparedStatement ps;
		String nom, ape, em, cont;
		nom=request.getParameter("Nombres");
		ape=request.getParameter("Apellidos");
		em=request.getParameter("Email");
		cont=request.getParameter("password");

		if(nom!=null && ape!=null && em!=null && cont!=null){
			ps=con.prepareStatement("insert into user(nombres, apellidos, email, contraseña)values('"+nom+"','"+ape+"','"+em+"','"+cont+"')");
			ps.executeUpdate();
			//response.sendRedirect("index.jsp");
			}
		%>
        
		

<form action="#" method="post">
  <h2>Crear Cuenta</h2>
        <p>
			<label for="Nombres" class="floatLabel">Nombres</label>
			<input id="Nombres" name="Nombres" type="text">
		</p>
		<p>
			<label for="Apellidos" class="floatLabel">Apellidos</label>
			<input id="Email" name="Apellidos" type="text">
		</p>
		<p>
			<label for="Apellidos" class="floatLabel">Email</label>
			<input id="Email" name="Email" type="text">
		</p>
		<p>
			<label for="password" class="floatLabel">Contraseña</label>
			<input id="password" name="password" type="password">
			<span>Ingrese una contraseña de más de 8 caracteres</span>
		</p>
		<p>
			<label for="confirm_password" class="floatLabel">Confirmar Contraseña</label>
			<input id="confirm_password" name="confirm_password" type="password">
			<span>Tus contraseñas no coinciden</span>
		</p>
		<p>
			<input type="submit" value="Crear mi cuenta" id="submit">
		</p>
	</form>
<!-- partial -->
  <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script><script  src="./script.js"></script>

</body>
<%@include file="footer.jsp" %>
