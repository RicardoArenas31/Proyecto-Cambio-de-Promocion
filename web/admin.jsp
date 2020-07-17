<%-- 
    Document   : admin
    Created on : 16/07/2020, 12:37:14 PM
    Author     : ricar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Admin</h1>
        <h1>Hello World!</h1>
        <%
            HttpSession sesion = request.getSession();
            String email;
            String nivel;
            String id_usuario;

            if (session.getAttribute("user") != null && sesion.getAttribute("nivel") != null) {
                email = sesion.getAttribute("user").toString();
                nivel = sesion.getAttribute("nivel").toString();
                id_usuario = sesion.getAttribute("id_user").toString();
                out.print("<a href= 'index.jsp?cerrar=true'><h5>Cerrar Sesion " + email +  "</h5></a>");
            } else {
                response.sendRedirect("index.jsp");
            }
        %>
    </body>
</html>
