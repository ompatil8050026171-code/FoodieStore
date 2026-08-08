package com.FoodieStore.DAOimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.FoodieStore.DAO.UserDAO;
import com.FoodieStore.Model.User;
import com.FoodieStore.Utility.DBConnection;


public class UserDAOimpl implements UserDAO {	
	@Override
	public int adduser(User user) {

		String INSERT_QUERRY="INSERT INTO user(Name,Email,Phone,Address,  "
				+ " Role,CreatedDate,LastLoginDate,Password) VALUES (?,?,?,?,?,?,?,?) ";


		int i=0;
		try(Connection con=DBConnection.getConnection();
				PreparedStatement pstm=con.prepareStatement(INSERT_QUERRY);)
		{


			pstm.setString(1, user.getName());
			pstm.setString(2, user.getEmail());
			pstm.setLong(3,user.getPhone());
			pstm.setString(4,user.getAddress());
			pstm.setString(5, user.getRole());
			pstm.setTimestamp(6, new Timestamp(System.currentTimeMillis()));
			pstm.setTimestamp(7, new Timestamp(System.currentTimeMillis()));
			pstm.setString(8, user.getPassword());

			i=pstm.executeUpdate();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return i;
	}

	@Override
	public User getUser(int id) {
		String GET_QUERRY="SELECT * FROM user "
				+ "  WHERE id=?";

		User user=null;



		try(Connection con=DBConnection.getConnection();
				PreparedStatement pstm=con.prepareStatement(GET_QUERRY);
				) {


			pstm.setInt(1, id);

			try(ResultSet rs=pstm.executeQuery();)
			{
				while(rs.next())
				{
					user=extractUser(rs);

				}
			}

			
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return user;
	}

	@Override
	public int updateUser(User user) {

		String UPDATEQUERY="UPDATE user SET Name = ? , Email = ? , Phone = ? , Address = ? , "
				+ " LastLoginDate = ? , Password = ? WHERE id= ? ";

		int i=0;
		try(Connection con=DBConnection.getConnection();
				PreparedStatement pstm = con.prepareStatement(UPDATEQUERY);) {


			pstm.setString(1, user.getName());
			pstm.setString(2, user.getEmail());
			pstm.setLong(3,user.getPhone());
			pstm.setString(4,user.getAddress());			
			pstm.setTimestamp(5, new Timestamp(System.currentTimeMillis()));
			pstm.setString(6, user.getPassword());
			pstm.setInt(7, user.getId());

			 i=pstm.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return i;

	}

	@Override
	public void deleteUser(int id) {

		String DELETEQUERY="DELETE FROM user WHERE id=?";

		try(Connection con=DBConnection.getConnection();
				PreparedStatement pstm=con.prepareStatement(DELETEQUERY);) {


			pstm.setInt(1, id);

			pstm.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	@Override
	public List<User> getAllUsers() {
		String SELECT_QUERRY="SELECT * FROM user";

		List<User> list=new ArrayList<User>();
		try(Connection con=DBConnection.getConnection();
				Statement stmt=con.createStatement();
				ResultSet rs=stmt.executeQuery(SELECT_QUERRY);
				) {
			
			while(rs.next())
			{
				User user=extractUser(rs);
				list.add(user);
			}


		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}

	public  List<User> getUserByName(String name)
	{
		List<User> li=new ArrayList<User>();

		User user=null;

		String GETQUERY="SELECT * FROM user WHERE Name=?";



		try(Connection con=DBConnection.getConnection();
				PreparedStatement pstm=con.prepareStatement(GETQUERY);
				) {



			pstm.setString(1, name);

			try(ResultSet res=pstm.executeQuery();)
			{
				while(res.next())
				{
					user=extractUser(res);
					li.add(user);
				}
			}

			

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return li;
	}
	
	
	@Override
	public User getUserByEmail(String email) {
		String GET_QUERRY="SELECT * FROM user "
				+ "  WHERE Email=?";

		User user=null;



		try(Connection con=DBConnection.getConnection();
				PreparedStatement pstm=con.prepareStatement(GET_QUERRY);
				) {


			pstm.setString(1, email);

			try(ResultSet rs=pstm.executeQuery();)
			{
				while(rs.next())
				{
					user=extractUser(rs);

				}
			}

			
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return user;
	}

	public static User extractUser(ResultSet rs) throws SQLException
	{


		int u_id=rs.getInt("id");
		String name=rs.getString("Name");
		String email=rs.getString("Email");
		long phone=rs.getLong("Phone");
		String address=rs.getString("Address");
		String role=rs.getString("Role");
		Timestamp createdDate=rs.getTimestamp("CreatedDate");
		Timestamp lastLoginDate=rs.getTimestamp("LastLoginDate");
		String password=rs.getString("Password");

		User user=new User(u_id,name,email,phone,address,role,createdDate,lastLoginDate,password);
		return user;
	}

}
