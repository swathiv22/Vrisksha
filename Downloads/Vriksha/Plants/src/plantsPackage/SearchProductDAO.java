package plantsPackage;

import java.util.*;
import java.math.BigDecimal;

import model.Cart;

import java.sql.*;

public class SearchProductDAO {
    private Connection con;
    private String query;
    private PreparedStatement stmt;
    private ResultSet rs;

    public SearchProductDAO(Connection con) {
        this.con = con;
    }
    
    public List<HangingPlantProducts> searchProducts(String squery){
    	List<HangingPlantProducts> hangProd = new ArrayList<>();
    	
    	String query = "SELECT * FROM plants WHERE pname like ?";
    	try (PreparedStatement pst = con.prepareStatement(query)){
    		pst.setString(1, "%" + squery + "%");
    		//pst.setString(1,squery);
            System.out.println("Executing query: " + pst.toString());
            ResultSet rs = pst.executeQuery();
     
           while (rs.next()) {
               HangingPlantProducts row = new HangingPlantProducts();
               row.setPid(rs.getInt("pid"));
               row.setPname(rs.getString("pname"));
               row.setOriginalprice(rs.getBigDecimal("original_price"));
               row.setDiscountprice(rs.getBigDecimal("discount_price"));
               row.setCategory(rs.getString("category"));
               row.setRating(rs.getInt("rating"));
               row.setImage(rs.getString("image"));

               hangProd.add(row);
           }
       } catch (SQLException e) {
           e.printStackTrace(); // Replace with a proper logging mechanism
       }
       return hangProd;
   }
}