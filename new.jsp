<%-- Ceci est une page de connexion avec la BDD --%>
<head>
  <link rel="stylesheet" type="text/css" href="foundation.css"/>
  <link rel="stylesheet" type="text/css" href="index.css"/>
</head>
<%@page contentType="text/html"%>
<%@page errorPage="erreur.jsp"%>
<%-- Importation d'un paquetage (package) --%>
<%@page import="java.util.*"%>
<h1>New personn </h1>
<form method="post" action="http://localhost:8080/create.jsp">
  Nom :<input type="text" name="nom"/>

  <button> create </button>
  <a href="http://localhost:8080/index.jsp" class="button"> cancel </a>
</form>
