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
<h1> create page </h1>
<% 
      String nom = request.getParameter("nom"); 
      Connection connexion = null;
      Statement stmt = null;
      try {
         Class.forName("org.postgresql.Driver");
         connexion = DriverManager
            .getConnection("jdbc:postgresql://localhost:5432/projet",
            "luz", "djibouti");
         connexion.setAutoCommit(true);
      
      stmt = connexion.createStatement();
      stmt.executeUpdate("insert into  utilisateur(nom) values ('"+nom+ "');");
      stmt.close();
      connexion.close();
      } catch (Exception e) {
         e.printStackTrace();
         System.err.println(e.getClass().getName()+": "+e.getMessage());
         //System.exit(0);
      }
%>
<div data-alert class="alert-box success round" style="text-align:center;">
  <%= nom %>  has been created !
</div>
<div class="row">
  <div class="small-3 small-centered columns">
    <a href="http://localhost:8080/index.jsp" class="button large">
      index
  </a>
  </div>
</div>
