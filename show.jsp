<%-- Ceci est une page de connexion avec la BDD --%>
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
<% 
      String nom = request.getParameter("name"); 
      String nm = null;
      Connection connexion = null;
      Statement stmt = null;
      List<Integer> idList = new ArrayList<Integer>();
      int id = 0;
      try {
         Class.forName("org.postgresql.Driver");
         connexion = DriverManager
            .getConnection("jdbc:postgresql://localhost:5432/projet",
            "luz", "djibouti");
         connexion.setAutoCommit(true);
      
      stmt = connexion.createStatement();
      ResultSet rs = stmt.executeQuery("select * from utilisateur where nom='"+nom+"';");
      while( rs.next()) {
      
        nm = rs.getString("nom");
        id = rs.getInt("idutilisateur");
        
      }
      rs.close();
      stmt.close();
      connexion.close();
      } catch (Exception e) {
         e.printStackTrace();
         System.err.println(e.getClass().getName()+": "+e.getMessage());
      }
%>

<h1> Details of <%= nom %></h1>
<ul>
<li> His name is : <%= nm %></li>
<li> His id is : <%= id %></li>
</ul>

<div class="row">
  <div class="small-3 small-centered columns">
    <a href="http://localhost:8080/index.jsp" class="button large">
      Index
  </a>
  </div>
</div>
