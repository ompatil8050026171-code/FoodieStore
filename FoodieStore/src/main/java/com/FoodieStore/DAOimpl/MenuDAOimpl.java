package com.FoodieStore.DAOimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.FoodieStore.DAO.MenuDAO;
import com.FoodieStore.Model.Menu;
import com.FoodieStore.Utility.DBConnection;

public class MenuDAOimpl implements MenuDAO {

	@Override
	public void addMenu(Menu menu) {

		String INSERTQUERY = "INSERT INTO menu(name,description,price,isAvailable,food_type,resturant_id) "
				+ "VALUES(?,?,?,?,?,?)";

		try (Connection con = DBConnection.getConnection();
				PreparedStatement pstm = con.prepareStatement(INSERTQUERY);) {

			pstm.setString(1, menu.getName());
			pstm.setString(2, menu.getDescription());
			pstm.setDouble(3, menu.getPrice());
			pstm.setString(4, menu.getIsAvailable());
			pstm.setString(5, menu.getFoodType());
			pstm.setInt(6, menu.getResturant_id());

			pstm.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateMenu(Menu menu) {

		String UPDATEQUERY = "UPDATE menu SET name=?, description=?, price=?, isAvailable=?, food_type=? "
				+ "WHERE menu_id=?";

		try (Connection con = DBConnection.getConnection();
				PreparedStatement pstm = con.prepareStatement(UPDATEQUERY);) {

			pstm.setString(1, menu.getName());
			pstm.setString(2, menu.getDescription());
			pstm.setDouble(3, menu.getPrice());
			pstm.setString(4, menu.getIsAvailable());
			pstm.setString(5, menu.getFoodType());
			pstm.setInt(6, menu.getMenu_id());

			pstm.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteMenu(int menu_id) {

		String DELETEQUERY = "DELETE FROM menu WHERE menu_id=?";

		try (Connection con = DBConnection.getConnection();
				PreparedStatement pstm = con.prepareStatement(DELETEQUERY);) {

			pstm.setInt(1, menu_id);

			pstm.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public Menu getMenu(int menu_id) {

		String SELECTQUERY = "SELECT * FROM menu WHERE menu_id=?";

		Menu menu = null;

		try (Connection con = DBConnection.getConnection();
				PreparedStatement pstm = con.prepareStatement(SELECTQUERY);) {

			pstm.setInt(1, menu_id);

			try(ResultSet res = pstm.executeQuery();)
			{
				while (res.next()) {
					menu = extractMenu(res);
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return menu;
	}

	@Override
	public List<Menu> getAllMenu() {

		List<Menu> li = new ArrayList<>();

		String GETQUERY = "SELECT * FROM menu";

		

		try (Connection con = DBConnection.getConnection();
				Statement stm = con.createStatement();
				ResultSet res = stm.executeQuery(GETQUERY);) {

			while (res.next()) {

				li.add(extractMenu(res));

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return li;
	}

	@Override
	public List<Menu> getAllMenuByResturant(int resturant_id) {

		List<Menu> li = new ArrayList<>();

		String SELECTQUERY = "SELECT * FROM menu WHERE resturant_id=?";

		try (Connection con = DBConnection.getConnection();
				PreparedStatement pstm = con.prepareStatement(SELECTQUERY);) {

			pstm.setInt(1, resturant_id);

			try(ResultSet res = pstm.executeQuery();)
			{
				while (res.next()) {

					li.add(extractMenu(res));

				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return li;
	}

	@Override
	public List<Menu> getMenuByFoodType(int resturant_id, String foodType) {

		List<Menu> li = new ArrayList<>();

		String SELECTQUERY = "SELECT * FROM menu WHERE resturant_id=? AND food_type=?";

		try (Connection con = DBConnection.getConnection();
				PreparedStatement pstm = con.prepareStatement(SELECTQUERY);) {

			pstm.setInt(1, resturant_id);
			pstm.setString(2, foodType);

			try(ResultSet res = pstm.executeQuery();)
			{
				while (res.next()) {

					li.add(extractMenu(res));

				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return li;
	}

	public static Menu extractMenu(ResultSet res) throws SQLException {

		int id = res.getInt("menu_id");
		String name = res.getString("name");
		String desc = res.getString("description");
		double price = res.getDouble("price");
		String isAvailable = res.getString("isAvailable");
		String foodType = res.getString("food_type");
		int resturant_id = res.getInt("resturant_id");
		String image=res.getString("image");

		Menu menu = new Menu(id, name, desc, price, isAvailable, foodType, resturant_id,image);

		return menu;
	}
}