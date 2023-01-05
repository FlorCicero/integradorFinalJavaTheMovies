package models;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MoviesDao {

    Conexion conexion;
    Connection connect;
    
    public MoviesDao(){
        conexion = new Conexion();
        connect = conexion.getConnection();
    }
    
    public List<Movies> listarPeliculas(){
        
        PreparedStatement ps;
        ResultSet rs;
        List<Movies> peliculas = new ArrayList<>();
        
        try{
            ps = connect.prepareStatement("SELECT * FROM movies ORDER BY `rank`;");
            rs = ps.executeQuery();
            
            while(rs.next()){
                
                int id = rs.getInt("id");
                int rank = rs.getInt("rank");
                int year = rs.getInt("year");
                String title = rs.getString("title");
                //String fullTitle = rs.getString("fullTitle");
                String image = rs.getString("image");
                String crew = rs.getString("crew");
                float imDbRating = rs.getFloat("imDbRating");
                
                Movies pelicula = new Movies(id, rank, year, title, image, crew, imDbRating);
                peliculas.add(pelicula);
            }
            return peliculas;
        }
        catch(SQLException e){
            System.out.println(e.toString());
            return null;
        }
    }
    
    public Movies mostrarPelicula(int refId){
        
        PreparedStatement ps;
        ResultSet rs;
        Movies pelicula = null;
        
        try{
            ps= connect.prepareStatement("SELECT * FROM movies WHERE id=?;");
            ps.setInt(1, refId);
            rs = ps.executeQuery();

            while(rs.next()){
                int id = rs.getInt("id");
                int rank = rs.getInt("rank");
                int year = rs.getInt("year");
                String title = rs.getString("title");
                //String fullTitle = rs.getString("fullTitle");
                String image = rs.getString("image");
                String crew = rs.getString("crew");
                float imDbRating = rs.getFloat("imDbRating");
                
                pelicula = new Movies(id, rank, year, title, image, crew, imDbRating);
            }
                return pelicula;
        }
        catch(SQLException e){
            System.out.println(e.toString());
            return pelicula;                
        }
        
    }
        
    public boolean agregarPelicula(Movies pelicula){

        PreparedStatement ps;

        try{
            ps = connect.prepareStatement("INSERT INTO movies (`rank`,title,`year`,image,crew,imDbRating) VALUES (?,?,?,?,?,?);");
            
            ps.setInt(1,pelicula.getRank());
            ps.setString(2, pelicula.getTitle());
            ps.setInt(3, pelicula.getYear());
            ps.setString(4, pelicula.getImage());
            ps.setString(5, pelicula.getCrew());
            ps.setFloat(6, pelicula.getImDbRating());
            //System.out.println("HOLA MURRINO");
            ps.execute();
            return true;
        }
        catch(SQLException e){
            System.out.println(e.toString());
            return false;
        }
    }

    public boolean actualizarPelicula(Movies pelicula){

        PreparedStatement ps;

        try{
            ps = connect.prepareStatement("UPDATE movies SET `rank`=?, title=?, `year`=?, image=?, crew=?, imDbRating=? WHERE id=?;");
            ps.setInt(1,pelicula.getRank());
            ps.setString(2, pelicula.getTitle());
            ps.setInt(3, pelicula.getYear());
            ps.setString(4, pelicula.getImage());
            ps.setString(5, pelicula.getCrew());
            ps.setFloat(6, pelicula.getImDbRating());
            ps.setInt(7,pelicula.getId());
            System.out.println(ps);            
            ps.execute();
            return true;            
        }
        catch(SQLException e){
            System.out.println(e.toString());
            return false;                
        }
    }

    public boolean borrarPelicula(int refId){

        PreparedStatement ps;

          try{
            ps = connect.prepareStatement("DELETE FROM movies WHERE id=?;");
            ps.setInt(1, refId);
            ps.execute();
            return true;            
        }
        catch(SQLException e){
            System.out.println(e.toString());
            return false;                
        }
    }
}
