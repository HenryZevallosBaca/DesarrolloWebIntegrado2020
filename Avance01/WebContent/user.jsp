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
		
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>   

    </head>
	<body style="margin-top: 30px"> 
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
			</header>
			
<!-- partial:index.partial.html -->
        
        <% 
        Connection con;
        String url = "jdbc:mysql://localhost:3306/avance01";
        String Driver = "com.mysql.jdbc.Driver";
        String user = "root";
        String clave = "";
        Class.forName(Driver);
        con = DriverManager.getConnection(url, user, clave);
        PreparedStatement ps;//Emnpezamos Listando los Datos de la Tabla Usuario
        Statement smt;
        ResultSet rs;
        smt = con.createStatement();
        rs = smt.executeQuery("select * from user"); 
        %>
  
        
        <div class="container">            
            <button type="button" class="btn btn-success btn-lg" data-toggle="modal" data-target="#myModal"> Agregar Nuevo</button>
             </div>  
              
        <br>
        <div class="container">               
                  
             <table class="table table-bordered"  id="tablaDatos">
                    <thead>
                        <tr>
                            <th class="text-center">Nombres</th>
                            <th class="text-center">Apellidos</th>
                            <th class="text-center">Email</th>
                            <th class="text-center">Contraseña</th>
                        </tr>
                    </thead>
                    <tbody id="tbodys">
                    <%
                    while(rs.next()){

                    %>
                       
                        <tr>
                            <td class="text-center"><%=rs.getString("nombres")%></td>
                            <td class="text-center"><%=rs.getString("apellidos")%></td>
                            <td class="text-center"><%=rs.getString("email")%></td>
                            <td class="text-center"><%=rs.getString("contraseña")%></td>
                            <td class="text-center">
                            <!-- <input type="hidden" value="<//%= rs.getInt("Id_Usuario")%>" id="Editar"/><input type="submit" class="btn btn-warning" data-toggle="modal" data-target="#myModal1" value="Editar"/> -->
                                
                               
                                <a href="Editar.jsp" class="btn btn-primary">Editar</a>
                                <a href="delete.jsp" class="btn btn-danger">Delete</a>
                            </td>
                        </tr>
                        <%}%>
                        
                </table>
            </div>        
        <div class="container">          
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document" style="z-index: 9999; width: 450px">
                    <div class="modal-content">
                        <div class="modal-header">                            
                            <h4 class="modal-title" id="myModalLabel">Agregar Registro</h4>
                        </div>
                        <div class="modal-body">
                            <form action="" method="post">
                                <label>Nombres:</label> 
                                <input type="text" name="txtNom" class="form-control"/><br>
                                <label>DNI:</label> 
                                <input type="text" name="txtDNI" class="form-control"/>                                      
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>                            
                                    <input type="submit" value="Guardar" class="btn btn-primary"/>
                                </div>
                            </form>
                        </div>
                    </div>                    
                </div>
            </div>
           
        </div>        
        <script src="js/jquery.js" type="text/javascript"></script>             
        <script src="js/bootstrap.min.js" type="text/javascript"></script>        
    </body>
</body>
<%@include file="footer.jsp" %>