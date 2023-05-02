package BookLandComm.example.BookLand.model;

import jakarta.persistence.*;

@Entity
public class BookLandBook {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(nullable = false, updatable = false)
    private Long isbn10;
    private String title;
    private String author;
    private String categorie;
    private String description;
    private String publish_year;
    private int num_pages;
    private double ratings_avg;

    public String getImage_path() {
        return image_path;
    }

    public void setImage_path(String image_path) {
        this.image_path = image_path;
    }

    public String getImage_url() {
        return image_url;
    }

    public void setImage_url(String image_url) {
        this.image_url = image_url;
    }

    private String image_path;
    private String image_url;
    public BookLandBook(Long isbn10, String title, String author, String categorie, String description, String published_year, int num_pages, double ratings_avg, String image_path, String image_url) {
        this.isbn10 = isbn10;
        this.title = title;
        this.author = author;
        this.categorie = categorie;
        this.description = description;
        this.publish_year = published_year;
        this.num_pages = num_pages;
        this.ratings_avg = ratings_avg;
        this.image_path=image_path;
        this.image_url=image_url;
    }

    public Long getIsbn10() {
        return isbn10;
    }

    public void setIsbn10(Long isbn10) {
        this.isbn10 = isbn10;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getCategorie() {
        return categorie;
    }

    public void setCategorie(String categorie) {
        this.categorie = categorie;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPublish_year() {
        return publish_year;
    }

    public void setPublish_year(String published_year) {
        this.publish_year = published_year;
    }

    public int getNum_pages() {
        return num_pages;
    }

    public void setNum_pages(int num_pages) {
        this.num_pages = num_pages;
    }

    public double getRatings_count() {
        return ratings_avg;
    }

    public void setRatings_count(double ratings_avg) {
        this.ratings_avg = ratings_avg;
    }

    public BookLandBook() {
    }

}
