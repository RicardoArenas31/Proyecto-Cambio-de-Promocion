<%-- 
    Document   : registrarParticipante
    Created on : 15/07/2020, 04:59:28 PM
    Author     : ricar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.Usuario"%>
<%@page import="modelo.Codigo"%>
<%@page import="modelo.Puntos"%>
<% HttpSession sesion = request.getSession();
    String email;
    String nivel;
    String id_usuario;
    Codigo co= new Codigo();
    Puntos pun = new Puntos();
    if (request.getParameter("btnRegistrar")!=null) {
            String codigo = request.getParameter("txtCodigo");
            co.setCodigo(codigo);
            switch(co.validarFormato()){
                case 1:
                    String nulo="<script language='javascript'>alert('Codigo vacio, Favor de rellenar los datos');</script>";
                    out.println(nulo);
                    break;
                case 2:
                    String largo="<script language='javascript'>alert('Codigo muy largo, Inserta un codigo valido');</script>";
                    out.println(largo);
                    break;
                case 3:
                    String corto="<script language='javascript'>alert('Codigo muy corto, Inserta un codigo valido');</script>";
                    out.println(corto);
                    break;
                case 5:
                    if (co.existeCodigo()) {
                            switch(co.obtenerPuntos()){
                                case 20:
                                    pun.setPuntos(20);
                                    String c="<script language='javascript'>alert('Felicidades, Se han sumado 20 PUNTOS!');</script>";
                                    out.println(c);
                                    break;
                                case 50:
                                    pun.setPuntos(50);
                                    String m="<script language='javascript'>alert('Felicidades, Se han sumado 50 PUNTOS!');</script>";
                                    out.println(m);
                                    break;
                                case 100:
                                    pun.setPuntos(100);
                                    String g="<script language='javascript'>alert('Felicidades, Se han sumado 100 PUNTOS!');</script>";
                                    out.println(g);
                                    break;
                                case 300:
                                    pun.setPuntos(300);
                                    String e="<script language='javascript'>alert('Felicidades, Se han sumado 300 PUNTOS!');</script>";
                                    out.println(e);
                                    break;
                            }
                            co.cambiarEstado();
                            pun.setIdCodigo(co.getId_codigo());
                            pun.setIdParticipante(Integer.valueOf(sesion.getAttribute("id_user").toString()));
                            pun.addPuntos();
                        }else{
                            String cot="<script language='javascript'>alert('Inserta un codigo que este en la base de datos');</script>";
                            out.println(cot);
                    }
                    break;
                default:
                    String e="<script language='javascript'>alert('Inserta un codigo que este en Base de datos');</script>";
                    out.println(e);
                    break;
            }
        }
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <!-- Fuente roboto -->
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,700&display=swap" rel="stylesheet">
        <%--Iconos de Fontawesome--%>
        <script src="https://unpkg.com/ionicons@5.1.2/dist/ionicons.js"></script>    <%--Hoja de estilos--%>
        <link href="css/estiloRegU.css" rel="stylesheet">
        <title>Registrar Seguidor</title>
    </head>
    <body>
        <section class="contact-box">
            <div class="row no-gutters bg-dark">
                <div class="col-xl-5 col-lg-12 register-bg">
                    <div class="position-absolute testiomonial p-4">
                        <h3 class="font-weight-bold text-light"> Acumula puntos y gana</h3>
                        <p class="lead text-light"> Increibles premios y viajes!</p>
                    </div>
                </div>
                <div class="col-xl-7 col-lg-12 d-flex">
                    <div class="container align-self-center p-6">
                        <div class="col-xl-7 col-lg-12 d-flex">
                            <div class="col-md-12">
                                <%
                                    if (session.getAttribute("user") != null && sesion.getAttribute("nivel") != null) {
                                        email = sesion.getAttribute("user").toString();
                                        nivel = sesion.getAttribute("nivel").toString();
                                        id_usuario = sesion.getAttribute("id_user").toString();
                                        out.print("<a href= 'index.jsp?cerrar=true'><h5>Cerrar Sesion " + email + "Usu:"+ id_usuario +"</h5></a>");
                                    } else {
                                        response.sendRedirect("index.jsp");
                                    }
                                %>
                            </div>

                        </div>
                        <h1 class="font-weight-bold">Registrate tus puntos</h1>
                        <div class="form-group col-lg-12 align-self-center">
                            <img src="img/p.jfif" style="height: 300px; width: 90%;">
                        </div>
                        <p class="text-muted mb-5">Ingresa un código válido</p>

                        <form action="registrarPuntos.jsp" name="formulario" method="POST">
                            <div class="form-row mb-2">
                                <div class="form-group col-md-12">
                                    <label class="font-weight-bold">Código <span class="text-danger">*</span></label>
                                    <input type="text" name="txtCodigo" class="form-control" placeholder="Ingresa un código" >
                                </div>

                            </div>

                            <input type="submit" name="btnRegistrar" class="btn btn-primary width-100" value="Registrar">
                            <button class="btn btn-primary width-100"><a href="inicio.jsp" style="color:#FF0000; ">Cancelar</a></button>
                        </form>
                        <small class="d-inline-block text-muted mt-5">Quieres ver tus Puntos? <a href="#">Click aquí</a></small>
                    </div>
                </div>
            </div>
        </section>


        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>
