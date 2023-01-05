<%-- 
    Document   : modificar
    Created on : 1 dic 2022, 20:13:10
    Author     : Diseno
--%>

<%@page import="models.Movies"%>
<%@page import="models.MoviesDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- CSS only -->
        <link rel="stylesheet" href="./assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="./assets/css/all.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Pelicula</title>
    </head>
    <body>
        <jsp:include page="navBar.jsp"/>
        <%
        int refId = Integer.parseInt(request.getParameter("id"));
        Movies resultado = null;
        MoviesDao pelicula = new MoviesDao();
        resultado = pelicula.mostrarPelicula(refId);
        %>
        <div class="row">
            <form class="p-5" action="MoviesController?accion=actualizar" method="POST">
             
                <div class="mb-3">
                    <input type="hidden" class="form-control" id="id" name="id" value="<%=resultado.getId()%>">
                </div>
             
                <div class="mb-3">
                <label for="title">Titulo</label>
                <input type="text" class="form-control" id="title" name="title" value="<%=resultado.getTitle()%>">
                </div>

                <div class="mb-3">
                <label for="image">Poster</label>
                <input type="text" class="form-control" id="image" name="image" value="<%=resultado.getImage()%>">
                </div>
                
                <div class="mb-3">
                <label for="rank">Posición</label>
                <input type="text" class="form-control" id="rank" name="rank" value="<%=resultado.getRank()%>">
                </div>
                
                <div class="mb-3">
                <label for="crew">Realizadores</label>
                <input type="text" class="form-control" id="crew" name="crew" value="<%=resultado.getCrew()%>">
                </div>
                
                <div class="mb-3">
                <label for="year">Año</label>
                <input type="text" class="form-control" id="year" name="year" value="<%=resultado.getYear()%>">
                </div>
                
                <div class="mb-3">
                <label for="imDbRating">Puntaje</label>
                <input type="text" class="form-control" id="imDbRating" name="imDbRating" value="<%=resultado.getImDbRating()%>">
                </div>
            
                <button type="submit" class="btn btn-primary">Modificar</button>
            </form>
        </div>
    </body>
</html>
