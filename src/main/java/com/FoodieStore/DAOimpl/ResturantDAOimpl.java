package com.FoodieStore.DAOimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.FoodieStore.DAO.ResturantDAO;
import com.FoodieStore.Model.Resturant;
import com.FoodieStore.Utility.DBConnection;

public class ResturantDAOimpl implements ResturantDAO {

    @Override
    public void addResturant(Resturant res) {

        String INSERTQUERY = "INSERT INTO resturant(resturant_name,resturant_email,address,ratings,status,ETA,image) VALUES(?,?,?,?,?,?,?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstm = con.prepareStatement(INSERTQUERY)) {

            pstm.setString(1, res.getResturant_name());
            pstm.setString(2, res.getResturant_email());
            pstm.setString(3, res.getAddress());
            pstm.setDouble(4, res.getRatings());
            pstm.setString(5, res.getStatus());
            pstm.setString(6, res.getETA());
            pstm.setString(7, res.getImage());

            pstm.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Resturant getResturant(int resturant_id) {

        String SELECTQUERY = "SELECT * FROM resturant WHERE resturant_id=?";

        Resturant resturant = null;

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstm = con.prepareStatement(SELECTQUERY)) {

            pstm.setInt(1, resturant_id);

            try (ResultSet rs = pstm.executeQuery()) {

                if (rs.next()) {
                    resturant = extractResturant(rs);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return resturant;
    }

    @Override
    public void updateResturant(Resturant res) {

        String UPDATEQUERY = "UPDATE resturant SET resturant_name=?, resturant_email=?, address=?, ratings=?, status=?, ETA=?, image=? WHERE resturant_id=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstm = con.prepareStatement(UPDATEQUERY)) {

            pstm.setString(1, res.getResturant_name());
            pstm.setString(2, res.getResturant_email());
            pstm.setString(3, res.getAddress());
            pstm.setDouble(4, res.getRatings());
            pstm.setString(5, res.getStatus());
            pstm.setString(6, res.getETA());
            pstm.setString(7, res.getImage());
            pstm.setInt(8, res.getResturant_id());

            pstm.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteResturant(int resturant_id) {

        String DELETEQUERY = "DELETE FROM resturant WHERE resturant_id=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstm = con.prepareStatement(DELETEQUERY)) {

            pstm.setInt(1, resturant_id);

            pstm.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Resturant> getAllResturant() {

        List<Resturant> list = new ArrayList<>();

        String SELECTQUERY = "SELECT * FROM resturant";

        try (Connection con = DBConnection.getConnection();
             Statement stmt = con.createStatement();
             ResultSet rs = stmt.executeQuery(SELECTQUERY)) {

            while (rs.next()) {
                list.add(extractResturant(rs));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public static Resturant extractResturant(ResultSet rs) throws SQLException {

        int id = rs.getInt("resturant_id");
        String name = rs.getString("resturant_name");
        String email = rs.getString("resturant_email");
        String address = rs.getString("address");
        double ratings = rs.getDouble("ratings");
        String status = rs.getString("status");
        String ETA = rs.getString("ETA");
        String image = rs.getString("image");

        return new Resturant(id, name, email, address, ratings, status, ETA, image);
    }
}