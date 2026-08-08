package com.FoodieStore.DAOimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.FoodieStore.DAO.OrdersDAO;
import com.FoodieStore.Model.Orders;
import com.FoodieStore.Utility.DBConnection;

public class OrdersDAOimpl implements OrdersDAO{

	@Override
	public int addOrder(Orders orders) {
		String INSERTQUERY="INSERT INTO orders(resturant_id,user_id,total_amount,order_date,delivery_address,payment_mode) "
				+ " VALUES(?,?,?,?,?,?)";
		
		
		
			int orderId=0;
			try (Connection con=DBConnection.getConnection();
				PreparedStatement pstm=con.prepareStatement(INSERTQUERY,Statement.RETURN_GENERATED_KEYS);){
				
				
				pstm.setInt(1,orders.getResturant_id());
				pstm.setInt(2, orders.getUser_id());
				pstm.setDouble(3, orders.getTotal_amount());
				pstm.setTimestamp(4, new Timestamp(System.currentTimeMillis()));
				pstm.setString(5, orders.getDelivery_address());
				pstm.setString(6, orders.getPayment_mode());
				
				
				pstm.executeUpdate();
				
				try(ResultSet res=pstm.getGeneratedKeys();)
				{
					if(res.next())
					{
						orderId=res.getInt(1);
					}
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		return orderId;
	}

	@Override
	public Orders getOrder(int id) {
		
		String SELECTQUERY="SELECT * FROM orders WHERE order_id=?";
		Orders order=null;
		
		
		try(Connection con=DBConnection.getConnection();
				PreparedStatement pstm=con.prepareStatement(SELECTQUERY);) {
			
			
			pstm.setInt(1, id);
			
			try(ResultSet res=pstm.executeQuery();)
			{
				while(res.next())
				{
					order=extractOrder(res);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return order;
	}
	@Override
	public List<Orders> getOrderByUserId(int userId) {

	    String SELECTQUERY = "SELECT o.*, r.resturant_name "
	            + "FROM orders o "
	            + "INNER JOIN resturant r "
	            + "ON o.resturant_id = r.resturant_id "
	            + "WHERE o.user_id = ? "
	            + "ORDER BY o.order_id DESC";

	    List<Orders> li = new ArrayList<>();

	    try (Connection con = DBConnection.getConnection();
	            PreparedStatement pstm = con.prepareStatement(SELECTQUERY)) {

	        pstm.setInt(1, userId);

	        try (ResultSet res = pstm.executeQuery()) {

	            while (res.next()) {

	                Orders order = extractOrder(res);
	                order.setResturantName(res.getString("resturant_name"));
	                li.add(order);
	            }
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return li;
	}

	@Override
	public List<Orders> getAllOrders() {
		List<Orders> li=new ArrayList<Orders>();
		
	
		
		String SELECTQUERY="SELECT * FROM orders";
		
		
		
		try(Connection con=DBConnection.getConnection();
				Statement stmt=con.createStatement();
				ResultSet res=stmt.executeQuery(SELECTQUERY);){
			
			
			while(res.next())
			{
				Orders order=extractOrder(res);
				li.add(order);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return li;
	}

	@Override
	public void updateOrders(Orders order) {
		String UPDATEQUERY="UPDATE orders SET delivery_address = ? , payment_mode = ? "
				+ " WHERE order_id=?";
		
		
		try(Connection con=DBConnection.getConnection();
				PreparedStatement pstm=con.prepareStatement(UPDATEQUERY);) {
			
			
			pstm.setString(1, order.getDelivery_address());
			pstm.setString(2, order.getPayment_mode());
			pstm.setInt(3, order.getOrder_id());
			
			pstm.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteOrder(int id) {
		String deleteQuery="DELETE FROM orders WHERE order_id=?";
		
		
		
		try(Connection con=DBConnection.getConnection();
				PreparedStatement pstm=con.prepareStatement(deleteQuery);) {
			
			
			pstm.setInt(1, id);
			
			pstm.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static Orders extractOrder(ResultSet rs) throws SQLException
	{


		int id=rs.getInt("order_id");
		int resturant_id=rs.getInt("resturant_id");
		int user_id=rs.getInt("user_id");
		double total_amount=rs.getDouble("total_amount");
		Timestamp order_date=rs.getTimestamp("order_date");
		String delivery_address=rs.getString("delivery_address");
		String payment_mode=rs.getString("payment_mode");
		
		Orders order=new Orders(id,resturant_id,user_id,total_amount,order_date,delivery_address,payment_mode);
		
		return order;

	}

}
