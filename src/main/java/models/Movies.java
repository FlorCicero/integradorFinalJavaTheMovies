package models;

public class Movies {

    private int id, rank, year;
    private String title, image, crew;
    private float imDbRating;
    
    public Movies(int id, int rank, int year, String title, String image, String crew, float imDbRating) {
        this.id = id;
        this.rank = rank;
        this.year = year;
        this.title = title;
        //this.fullTitle = fullTitle;
        this.image = image;
        this.crew = crew;
        this.imDbRating = imDbRating;
    }

    public int getId() {
        return id;
    }
    public int getRank() {
        return rank;
    }

    public int getYear() {
        return year;
    }

    public String getTitle() {
        return title;
    }

    public String getImage() {
        return image;
    }

    public String getCrew() {
        return crew;
    }

    public float getImDbRating() {
        return imDbRating;
    }
}
