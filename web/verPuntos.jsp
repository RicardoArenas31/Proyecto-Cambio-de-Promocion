<%-- 
    Document   : puntos
    Created on : 16/07/2020, 12:00:04 PM
    Author     : ricar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<%@page import="modelo.Puntos"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%
            HttpSession sesion= request.getSession();
            String email;
            String nivel;
            String id_usuario="";
            Integer puntos;
            
            if(session.getAttribute("user")!=null && sesion.getAttribute("nivel")!=null){
                email = sesion.getAttribute("user").toString();
                nivel = sesion.getAttribute("nivel").toString();
                id_usuario = sesion.getAttribute("id_user").toString();
                out.print("<a href= 'index.jsp?cerrar=true'><h5>Cerrar Sesion "+email+ "</h5></a>");
            }else{
                response.sendRedirect("index.jsp");
            }
            Puntos p = new Puntos();
            p.setIdParticipante(Integer.valueOf(id_usuario));
            puntos = p.mostrarPuntos();
        %>
    </head>
    <body>
        <h1>Puntos: <% out.print(puntos);%> <a href="registrarPuntos.jsp">Registrar puntos</a></h1>
        <br>
        <%if(puntos>=1000){%>
        <h2>Felicidades, tienes igual o más de 1000 puntos</h2>
        <h3>Puedes cambiar tus puntos por premios <a href="#">aqui</a></h3>
        <%}else{%>
        <h1>Sigue acumulando puntos </h1>
        <%}%>
        
    </body>
</html>
