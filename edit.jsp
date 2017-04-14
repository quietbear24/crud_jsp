<head>
  <link rel="stylesheet" type="text/css" href="foundation.css"/>
  <link rel="stylesheet" type="text/css" href="index.css"/>
</head>
<%@page contentType="text/html"%>
<%@page errorPage="erreur.jsp"%>
<%-- Importation d'un paquetage (package) --%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<h1> Edit Form </h1>
<% String name = request.getParameter("name"); %>
<form method="post" action="http://localhost:8080/update.jsp?name=<%=name%>">
  Nom :<input type="text" name="nom" value="<%= name %>" />
  <button> update </button>
  <a href="http://localhost:8080/index.jsp" class="button"> cancel </a>
</form>
