package plantsPackage;

import java.util.*;

import model.Cart;

import java.math.BigDecimal;
import java.sql.*;

public class HangingPlantProductsDAO {
    private Connection con;
    private String query;
    private PreparedStatement stmt;
    private ResultSet rs;

    public HangingPlantProductsDAO(Connection con) {
        this.con = con;
    }

    public List<HangingPlantProducts> getAllHangingPlantProducts(String pcategory, String priceRange) {
        List<HangingPlantProducts> hangProd = new ArrayList<>();

        String query = "SELECT * FROM plants WHERE category = ?";
        if (priceRange != null && !priceRange.isEmpty()) {
            query += " AND discount_price BETWEEN ? AND ?";
        }

        try (PreparedStatement pst = con.prepareStatement(query)) {
            pst.setString(1, pcategory);
            if (priceRange != null && !priceRange.isEmpty()) {
                String[] prices = priceRange.split("-");
                double minPrice = Double.parseDouble(prices[0]);
                double maxPrice = Double.parseDouble(prices[1]);
                pst.setDouble(2, minPrice);
                pst.setDouble(3, maxPrice);
            }
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

    public HangingPlantProducts getHangingPlantProductsById(int id) {
        HangingPlantProducts product = null;
        String query = "SELECT * FROM plants WHERE pid = ?";

        try (PreparedStatement pst = con.prepareStatement(query)) {
            pst.setInt(1, id);
            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    product = new HangingPlantProducts();
                    product.setPid(rs.getInt("pid"));
                    product.setPname(rs.getString("pname"));
                    product.setOriginalprice(rs.getBigDecimal("original_price"));
                    product.setDiscountprice(rs.getBigDecimal("discount_price"));
                    product.setRating(rs.getInt("rating"));
                    product.setImage(rs.getString("image"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Replace with a proper logging mechanism
        }
        return product;
    }

    public HangingPlantsDescription getHangingPlantsDescriptionById(int id) {
        HangingPlantsDescription description = null;
        String query = "SELECT pd.plants_id, pd.description " +
                       "FROM plants p " +
                       "JOIN plants_description pd ON p.pid = pd.plants_id " +
                       "WHERE p.pid = ?";

        try (PreparedStatement pst = con.prepareStatement(query)) {
            pst.setInt(1, id);
            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    description = new HangingPlantsDescription();
                    description.setHangplants_id(rs.getInt("plants_id"));
                    description.setDescription(rs.getString("description"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Replace with a proper logging mechanism
        }
        return description;
    }

    public double getTotalCartPrice(ArrayList<Cart> cartList) {
        double sum = 0;
        try {
            if (cartList.size() > 0) {
                for (Cart item : cartList) {
                    String query = "select discount_price from plants where pid=?";
                    PreparedStatement pst = this.con.prepareStatement(query);
                    pst.setInt(1, item.getPid());
                    ResultSet rs = pst.executeQuery();
                    while (rs.next()) {
                        sum += rs.getDouble("discount_price") * item.getQuantity();
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return sum;
    }

    public List<Cart> getCartProducts(ArrayList<Cart> cartList) {
        List<Cart> book = new ArrayList<>();
        try {
            if (cartList.size() > 0) {
                for (Cart item : cartList) {
                    String query = "select * from plants where pid=?";
                    PreparedStatement pst = this.con.prepareStatement(query);
                    pst.setInt(1, item.getPid());
                    ResultSet rs = pst.executeQuery();
                    while (rs.next()) {
                        Cart row = new Cart();
                        row.setPid(rs.getInt("pid"));
                        row.setPname(rs.getString("pname"));
                        row.setCategory(rs.getString("category"));
                        BigDecimal discountPrice = BigDecimal.valueOf(rs.getDouble("discount_price"));
                        BigDecimal quantity = BigDecimal.valueOf(item.getQuantity());

                        // Calculate the total discount price
                        BigDecimal totalDiscountPrice = discountPrice.multiply(quantity);

                        // Set the total discount price to the row
                        row.setDiscountprice(totalDiscountPrice);

                        row.setQuantity(item.getQuantity());
                        book.add(row);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return book;
    }

    public List<HangingPlantProducts> getBestSellingHangingPlantProducts() {
        List<HangingPlantProducts> bestSelling = new ArrayList<>();
        String query = "SELECT * FROM plants WHERE rating = 5";
        try (PreparedStatement pst = con.prepareStatement(query)) {
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

                bestSelling.add(row);
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Replace with a proper logging mechanism
        }
        return bestSelling;
    }
}
