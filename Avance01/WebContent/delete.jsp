<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
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
String nom=request.getParameter("Nombres");
ps=con.prepareStatement("delete from user where nombres="+nom);
ps.executeUpdate();
response.sendRedirect("index.jsp");%>
</body>
</html>