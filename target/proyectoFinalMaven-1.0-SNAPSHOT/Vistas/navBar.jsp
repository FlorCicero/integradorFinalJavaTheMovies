<%-- 
    Document   : navBar
    Created on : 5 ene 2023, 2:30:23
    Author     : Flor
--%>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
      <a class="navbar-brand" href="#">The Movies!</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor02" aria-controls="navbarColor02" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarColor02">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item">
          <a class="nav-link <% if(request.getRequestURL().indexOf("index.jsp")>0){out.print("active");} %>" href="index.jsp"> <i class="fa-solid fa-house"></i> Home
            <span class="visually-hidden">(current)</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link <% if(request.getRequestURL().indexOf("peliculas.jsp")>0){out.print("active");} %>" href="MoviesController"> <i class="fa-solid fa-clapperboard"></i> Listado de Peliculas</a>
        </li>
      </ul>

    </div>
  </div>
</nav>