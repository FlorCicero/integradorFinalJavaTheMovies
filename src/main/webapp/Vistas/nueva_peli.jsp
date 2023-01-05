<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- CSS only -->
        <link rel="stylesheet" href="./assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="./assets/css/all.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Pelicula</title>
    </head>
    <body>
        
        <div class="container">
            <h1 class="text-center">Agregar Pelicula</h1>
            
            <form class="p-5" action="MoviesController?accion=insert" method="POST">
                
                <div class="mb-3">
                <label for="title">Titulo</label>
                <input type="text" class="form-control" id="title" name="title">
                </div>

                <div class="mb-3">
                <label for="image">Poster</label>
                <input type="text" class="form-control" id="image" name="image">
                </div>
                
                <div class="mb-3">
                <label for="rank">Posición</label>
                <input type="text" class="form-control" id="rank" name="rank">
                </div>
                
                <div class="mb-3">
                <label for="crew">Realizadores</label>
                <input type="text" class="form-control" id="crew" name="crew">
                </div>
                
                <div class="mb-3">
                <label for="year">Año</label>
                <input type="text" class="form-control" id="year" name="year">
                </div>
                
                <div class="mb-3">
                <label for="imDbRating">Puntaje</label>
                <input type="text" class="form-control" id="imDbRating" name="imDbRating">
                </div>
                
                
                <button type="submit" class="btn btn-primary">Agregar</button>
            </form>
            
            
        </div>
    </body>
</html>
