<%@page import="models.MoviesDao"%>
<%@page import="models.Movies"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- CSS only -->
        <link rel="stylesheet" href="./assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="./assets/css/all.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Peliculas</title>
    </head>
    <body>

        <jsp:include page="navBar.jsp"/>

        <%
            List<Movies> resultado = null;    
            MoviesDao movie = new MoviesDao();
            resultado = movie.listarPeliculas();    
        %>
        
        <div class="container">
            <div class="row">
                <div class="col">
                    <a class="btn btn-primary col-8 m-4" href="MoviesController?accion=nuevo"><i class="fa-sharp fa-solid fa-film"></i> Agregar Pelicula</a>    
                </div>
                <div class="col">
                    <ul class="list-group m-4">
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                        Cantidad de Peliculas:
                        <span class="badge bg-primary rounded-pill"><%= resultado.size() %></span>
                    </li>
                  </ul>    
                </div>
                
            </div>
            <div class="row">
                <table class="table">
                    
                    <thead>
                        <tr>
                            <th>Poster</th>
                            <th class="text-center">Id</th>
                            <th class="text-center">Posición</th>
                            <th class="text-center">Titulo</th>
                            <th class="text-center">Año</th>
                            <th class="text-center">Realizadores</th>
                            <th class="text-center">Puntaje</th>
                            <th class="text-center">Modificar</th>
                            <th class="text-center">Eliminar</th>
                        </tr>
                    </thead>
                    
                    <tbody>            
                        <%
                        for(int i = 0; i < resultado.size(); i++){
                            String ruta = "MoviesController?accion=modificar&id=" + resultado.get(i).getId();
                            String rutaE = "MoviesController?accion=eliminar&id=" + resultado.get(i).getId();
                        %>
                        <tr <% if(i%2==0){out.print("class=\"table-active\"");} %> >
                            <td><img src="<%= resultado.get(i).getImage()%>" alt="<%= resultado.get(i).getTitle()%> movie poster"></td>
                            <td class="text-center"><%= resultado.get(i).getId()%></td>
                            <td class="text-center"><%= resultado.get(i).getRank()%></td>
                            <td class="text-center"><%= resultado.get(i).getTitle()%></td>
                            <td class="text-center"><%= resultado.get(i).getYear()%></td>
                            <td class="text-center"><%= resultado.get(i).getCrew()%></td>
                            <td class="text-center"><%= resultado.get(i).getImDbRating()%></td>
                            
                            <td class="text-center"><a class="text-success" href=<%=ruta%>><i class="fa-sharp fa-solid fa-pen-to-square"></i></a></td>
                            <td class="text-center"><a class="text-danger" href=<%=rutaE%>><i class="fa-sharp fa-solid fa-trash-can"></i></a></td>
                        </tr>                              
                    </tbody>
                    
                    <%
                        }
                    %>
                    

                </table>
                
            </div>
            
        </div>
        
    </body>
</html>
