package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.math.BigDecimal;

import plantsPackage.HangingPlantProducts;
import plantsPackage.HangingPlantProductsDAO;

public class OrderDao {
    private Connection con;
    private String query;
    private PreparedStatement pst;
    private ResultSet rs;

    public OrderDao(Connection con) {
        super();
        this.con = con;
    }

    // Insert an order into the database
    public boolean insertOrder(Order model) {
        boolean result = false;
        try {
            query = "INSERT INTO orders (p_id, u_id, o_quantity, o_date) VALUES (?, ?, ?, ?)";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, model.getId());
            pst.setInt(2, model.getUid());
            pst.setInt(3, model.getQunatity());
            pst.setString(4, model.getDate());
            pst.executeUpdate();
            result = true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return result;
    }

    // Retrieve orders for a specific user
    public List<Order> userOrders(int id) {
        List<Order> list = new ArrayList<>();
        try {
            query = "SELECT * FROM orders WHERE u_id=? ORDER BY orders.o_id DESC";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {
                Order order = mapResultSetToOrder(rs);
                list.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return list;
    }

    // Retrieve all orders
    public List<Order> getAllOrders() {
        List<Order> list = new ArrayList<>();
        try {
            query = "select * from plants join orders on  orders.p_id = plants.pid;";
            pst = this.con.prepareStatement(query);
            rs = pst.executeQuery();
            while (rs.next()) {
                Order order = mapResultSetToOrder(rs);
                list.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return list;
    }

    // Retrieve orders by product ID
    public List<Order> getOrdersByProductId(int productId) {
        List<Order> list = new ArrayList<>();
        try {
            query = "SELECT * FROM orders WHERE p_id=? ORDER BY o_id DESC";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, productId);
            rs = pst.executeQuery();
            while (rs.next()) {
                Order order = mapResultSetToOrder(rs);
                list.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return list;
    }

    // Cancel an order by ID
    public void cancelOrder(int id) {
        try {
            query = "DELETE FROM orders WHERE o_id=?";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, id);
            pst.execute();
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.print(e.getMessage());
        }
    }

    // Helper method to map result set to Order object
    private Order mapResultSetToOrder(ResultSet rs) throws SQLException {
        Order order = new Order();
        HangingPlantProductsDAO productDao = new HangingPlantProductsDAO(this.con);
        int pId = rs.getInt("p_id");
        HangingPlantProducts product = productDao.getHangingPlantProductsById(pId);
        order.setOrderId(rs.getInt("o_id"));
        order.setId(pId);
        order.setName(product.getPname());
        order.setCategory(product.getCategory()); 
        BigDecimal discountPrice = product.getDiscountprice();
        BigDecimal quantity = new BigDecimal(rs.getInt("o_quantity"));
        BigDecimal totalDiscountPrice = discountPrice.multiply(quantity);
        order.setSubprice(discountPrice);
        order.setPrice(totalDiscountPrice);
        order.setQunatity(rs.getInt("o_quantity"));
        order.setDate(rs.getString("o_date"));
        return order;
    }

}
