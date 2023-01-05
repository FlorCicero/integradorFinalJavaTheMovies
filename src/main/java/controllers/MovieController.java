package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Movies;
import models.MoviesDao;

@WebServlet(name = "MoviesController", 
        urlPatterns = {"/MoviesController"})
public class MovieController extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest req, 
            HttpServletResponse resp) 
            throws ServletException, IOException {
    
        MoviesDao moviesDao = new MoviesDao();
        String accion = req.getParameter("accion");
        
        RequestDispatcher dispatcher;
        
//        Métodos usados desde el GET
        
        if(accion == null || accion.isEmpty()){
            dispatcher = req.getRequestDispatcher("Vistas/peliculas.jsp");
        }
        
        else if(accion.equals("modificar")){
            dispatcher = req.getRequestDispatcher("Vistas/modificar_peli.jsp");
        }
        
        else if (accion.equals("nuevo")){
            dispatcher = req.getRequestDispatcher("Vistas/nueva_peli.jsp");
        }
        
        // Métodos traídos del POST
        
        else if(accion.equals("insert")){
            int rank = Integer.parseInt(req.getParameter("rank"));
            int year = Integer.parseInt(req.getParameter("year"));
            String title = req.getParameter("title");
            //String fullTitle = req.getParameter("fullTitle");
            String image = req.getParameter("image");
            String crew = req.getParameter("crew");
            float imDbRating = Float.parseFloat(req.getParameter("imDbRating"));
            
            Movies pelicula = new Movies(0, rank, year, title, image, crew, imDbRating);
            moviesDao.agregarPelicula(pelicula);
            
            dispatcher = req.getRequestDispatcher("Vistas/peliculas.jsp");
        }
        
        else if(accion.equals("actualizar")){
            int id = Integer.parseInt(req.getParameter("id"));
            int rank = Integer.parseInt(req.getParameter("rank"));
            int year = Integer.parseInt(req.getParameter("year"));
            String title = req.getParameter("title");
            String image = req.getParameter("image");
            String crew = req.getParameter("crew");
            float imDbRating = Float.parseFloat(req.getParameter("imDbRating"));
            
            Movies pelicula = new Movies(id, rank, year, title, image, crew, imDbRating);
            moviesDao.actualizarPelicula(pelicula);

            dispatcher = req.getRequestDispatcher("Vistas/peliculas.jsp");            
        }
        
        else if(accion.equals("eliminar")){
            int id = Integer.parseInt(req.getParameter("id"));
            moviesDao.borrarPelicula(id);
            
            dispatcher = req.getRequestDispatcher("Vistas/peliculas.jsp");
        }
        
        else {
            dispatcher = req.getRequestDispatcher("Vistas/peliculas.jsp");
        }
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req,HttpServletResponse resp) 
            throws ServletException, IOException {
        doGet(req,resp);
    }
    
    @Override
    public String getServletInfo() {return super.getServletInfo();}
}
