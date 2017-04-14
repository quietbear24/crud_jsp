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

<h1> Delete Page </h1>
<% String name          = request.getParameter("name");
   Connection connexion = null;
   Statement stmt       = null;
   try{
   Class.forName("org.postgresql.Driver");
   connexion = DriverManager.getConnection("jdbc:postgresql://localhost:5432/projet","luz","djibouti");
   connexion.setAutoCommit(true);
   stmt = connexion.createStatement();
   stmt.executeUpdate("delete from utilisateur where nom='"+name+"';");
   stmt.close();
   connexion.close();

   }catch (Exception e){
   e.printStackTrace();
   System.out.println(e.getClass().getName()+": "+e.getMessage());
   }
%>
<div data-alert class="alert-box success round" style="text-align:center;">
<%= name %> is been deleted with success !
</div>
<div class="row">
  <div class="small-3 small-centered columns">
    <a href="http://localhost:8080/index.jsp" class="button large">
      Index
  </a>
  </div>
</div>
