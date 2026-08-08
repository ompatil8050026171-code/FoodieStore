package com.FoodieStore.DAOimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.FoodieStore.DAO.OrderItemDAO;
import com.FoodieStore.Model.OrderItem;
import com.FoodieStore.Utility.DBConnection;

public class OrderItemDAOimpl implements OrderItemDAO {

	@Override
	public void addorderItem(OrderItem orderitem) {
		String INSERTQUERY="INSERT INTO order_items(order_id,menu_id,quantity,price) "
				+ " VALUES(?,?,?,?)";



		try(Connection con=DBConnection.getConnection();
				PreparedStatement pstm=con.prepareStatement(INSERTQUERY);) {

			pstm.setInt(1,orderitem.getOrder_id());
			pstm.setInt(2, orderitem.getMenu_id());
			pstm.setInt(3, orderitem.getQuantity());
			pstm.setDouble(4, orderitem.getPrice());

			pstm.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public OrderItem getOrderItemById(int orderItemId) {

		String SELECTQUERY="SELECT * FROM order_items WHERE order_item_id=?";

		OrderItem orderitem=null;
		try(Connection con =DBConnection.getConnection();
				PreparedStatement pstm=con.prepareStatement(SELECTQUERY);) {

			pstm.setInt(1, orderItemId);

			try(ResultSet res=pstm.executeQuery();)
			{
				while(res.next())
				{
					orderitem=extractOrderItem(res);
				}
			}

			

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return orderitem;
	}

	@Override
	public List<OrderItem> getAllOrderItems() {

		String SELECTQUERY="SELECT * FROM order_items";

		List<OrderItem> li=new ArrayList<OrderItem>();



		try(Connection con =DBConnection.getConnection();
				Statement stmt=con.createStatement();
				ResultSet res=stmt.executeQuery(SELECTQUERY);) {


			while(res.next())
			{
				OrderItem orderitem=extractOrderItem(res);
				li.add(orderitem);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return li;
	}
	

	@Override
	public void updateOrderItem(OrderItem orderitem) {
		String updateQuery="UPDATE order_items set quantity =  ? , price = ? "
				+ " WHERE order_item_id=?";


		try(Connection con=DBConnection.getConnection();
				PreparedStatement pstm=con.prepareStatement(updateQuery);) {

			pstm.setInt(1, orderitem.getQuantity());
			pstm.setDouble(2, orderitem.getPrice());
			pstm.setInt(3, orderitem.getOrder_item_id());

			pstm.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteOrderItem(int id) {

		String deleteQuery="DELETE FROM order_items WHERE order_item_id=?";


		try(Connection con=DBConnection.getConnection();
				PreparedStatement pstm=con.prepareStatement(deleteQuery);) {


			pstm.setInt(1, id);

			pstm.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public List<OrderItem> getOrderItemByOrderId(int orderId) {

		String SELECTQUERY="SELECT "
				+ "    oi.*, "
				+ "    m.name "
				+ "FROM order_items oi "
				+ "INNER JOIN menu  m "
				+ "ON oi.menu_id = m.menu_id "
				+ "WHERE oi.order_id = ?;";
		List<OrderItem> li=new ArrayList<>();
		 
		try(Connection con =DBConnection.getConnection();
				PreparedStatement pstm=con.prepareStatement(SELECTQUERY);) {

			pstm.setInt(1, orderId);

			try(ResultSet res=pstm.executeQuery();)
			{
				while(res.next())
				{
					OrderItem orderitem=extractOrderItem(res);
					li.add(orderitem);
				}
			}

			

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return li;
	}

	public static OrderItem extractOrderItem(ResultSet rs) throws SQLException
	{


		int id=rs.getInt("order_item_id");
		int order_id=rs.getInt("order_id");
		int menu_id=rs.getInt("menu_id");
		int quantity=rs.getInt("quantity");
		double price=rs.getDouble("price");

		OrderItem orderitem =new OrderItem(id,order_id,menu_id,quantity,price);
		
		orderitem.setName(rs.getString("name"));
		return orderitem;
	}

}
