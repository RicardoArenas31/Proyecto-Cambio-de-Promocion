<%-- 
    Document   : index
    Created on : 14/07/2020, 12:31:43 AM
    Author     : ricar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.Usuario" %>
<%@page session="true"%>
<%
    Usuario us = new Usuario();
    if (request.getParameter("btnIngresar")!=null) {
            String email = request.getParameter("email");
            String contra = request.getParameter("password");
            HttpSession sesion = request.getSession();
            us.setCorreo(email);
            us.setContrasena(contra);
            if(us.loguear()){
                switch(us.getNivel()){
                    case 1:
                        
                    sesion.setAttribute("user", email);
                    sesion.setAttribute("nivel", "1");
                    sesion.setAttribute("id_user", us.getIdUsuario());
                    response.sendRedirect("admin.jsp");
                    break;
                case 2:
                    sesion.setAttribute("user", email);
                    sesion.setAttribute("nivel", "2");
                    sesion.setAttribute("id_user", us.getIdUsuario());
                    response.sendRedirect("registrarPuntos.jsp");
                    break;
                default:
                    String mensaje="<script language='javascript'>alert('Ingresa una contraseña y/o usuario correcto');</script>";
                    out.println(mensaje);
                    break;
                }
            }else{
                String mensaje="<script language='javascript'>alert('Ingresa una contraseña y/o usuario correcto');</script>";
                out.println(mensaje);
            }
            
        }
    if(request.getParameter("cerrar")!= null){
        session.invalidate();
    }
    
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link href="css/estilo.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <div id="container1">
            <h1>Ingresar ahora!</h1>
            <form id= "form1" action="index.jsp" method="POST">
                <img src="img/usuario.jpg" alt=""/>
                <input type="email" name="email" placeholder="Correo Electrónico"/>
                <hr>
                <img src="img/usuario.jpg" alt=""/>
                <input type="password" name="password" placeholder="Password"/>
                <hr>
                <input type="submit" name="btnIngresar" value="Entrar"/>
            </form>
        </div>
        <div id="container2">
            <form id= "form2">
                <input type="submit" value="Create Account"/>
            </form>
            <div id="referencia">
                <a>Refrescos CO</a>
                <a href="">Term of Use</a>
                <a href="">Privacy Policy</a>
            </div>
        </div>
    </body>
</html>

