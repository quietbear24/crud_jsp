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
<body style="position:relative;">
<h1> Name List of Users </h1>

<%-- Controleur --%>
<% 
      String etat="";   
      Connection c = null;
      Statement stmt = null;
      List<String> nomList = new ArrayList<String>();
      try {
         Class.forName("org.postgresql.Driver");
         c = DriverManager
            .getConnection("jdbc:postgresql://localhost:5432/projet",
            "luz", "djibouti");
         c.setAutoCommit(true);

      stmt = c.createStatement();
      ResultSet rs = stmt.executeQuery(" select nom from utilisateur;");
      while( rs.next()) {
        String nom = rs.getString("nom");
        nomList.add(nom);
      }
      rs.close();
      stmt.close();
      c.close();
      } catch (Exception e) {
         e.printStackTrace();
      }
%>
<%-- Display variable --%>
<% if (!(nomList.isEmpty())) { %>
<table>
  <tr> 
    <th> Nom </th>
    <th> Show </th>
    <th> Edit </th>
    <th> Delete </th>
  </tr>
  <tr> <% for(String nom : nomList){  %>
    <td> <%= nom %></td>
    <td> <a href="http://localhost:8080/show.jsp?name=<%=nom%>"> show     </a></td>
    <td> <a href="http://localhost:8080/edit.jsp?name=<%=nom%>"> edit     </a></td>
    <td> <a href="http://localhost:8080/delete.jsp?name=<%=nom%>"> X </a></td>
  </tr>
  <%}%>
</table>
<%}%>
<% if (nomList.isEmpty()) { %>
<div data-alert class="alert-box info round" style="text-align:center;"> There are no users yet in DataBase, use button new to add one ! </div>
<%}%>
<div class="row">
  <div class="small-3 small-centered columns">
    <a href="http://localhost:8080/new.jsp" class="button large">
      New
  </a>
  </div>
</div>
</body>
