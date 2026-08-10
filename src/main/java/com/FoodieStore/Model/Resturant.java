package com.FoodieStore.Model;

public class Resturant {

    private int resturant_id;
    private String resturant_name;
    private String resturant_email;
    private String address;
    private double ratings;
    private String status;
    private String ETA;
    private String image;

    // Without ID
    public Resturant(String resturant_name, String resturant_email,
            String address, double ratings, String status,
            String ETA) {

        this.resturant_name = resturant_name;
        this.resturant_email = resturant_email;
        this.address = address;
        this.ratings = ratings;
        this.status = status;
        this.ETA = ETA;
    }

    // With ID
    public Resturant(int resturant_id, String resturant_name,
            String resturant_email, String address,
            double ratings, String status, String ETA) {

        this.resturant_id = resturant_id;
        this.resturant_name = resturant_name;
        this.resturant_email = resturant_email;
        this.address = address;
        this.ratings = ratings;
        this.status = status;
        this.ETA = ETA;
    }

    // Without ID, With Image
    public Resturant(String resturant_name, String resturant_email,
            String address, double ratings, String status,
            String ETA, String image) {

        this.resturant_name = resturant_name;
        this.resturant_email = resturant_email;
        this.address = address;
        this.ratings = ratings;
        this.status = status;
        this.ETA = ETA;
        this.image = image;
    }

    // ✅ With ID and Image (ADD THIS)
    public Resturant(int resturant_id, String resturant_name,
            String resturant_email, String address,
            double ratings, String status,
            String ETA, String image) {

        this.resturant_id = resturant_id;
        this.resturant_name = resturant_name;
        this.resturant_email = resturant_email;
        this.address = address;
        this.ratings = ratings;
        this.status = status;
        this.ETA = ETA;
        this.image = image;
    }

    public int getResturant_id() {
        return resturant_id;
    }

    public void setResturant_id(int resturant_id) {
        this.resturant_id = resturant_id;
    }

    public String getResturant_name() {
        return resturant_name;
    }

    public void setResturant_name(String resturant_name) {
        this.resturant_name = resturant_name;
    }

    public String getResturant_email() {
        return resturant_email;
    }

    public void setResturant_email(String resturant_email) {
        this.resturant_email = resturant_email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public double getRatings() {
        return ratings;
    }

    public void setRatings(double ratings) {
        this.ratings = ratings;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getETA() {
        return ETA;
    }

    public void setETA(String ETA) {
        this.ETA = ETA;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return "Resturant [resturant_id=" + resturant_id +
                ", resturant_name=" + resturant_name +
                ", resturant_email=" + resturant_email +
                ", address=" + address +
                ", ratings=" + ratings +
                ", status=" + status +
                ", ETA=" + ETA +
                ", image=" + image + "]";
    }
}