package plantsPackage;

import java.io.Closeable;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import plantsPackage.HangingPlantsDbCon.*;

public class mys1 {
    private Connection con;
    private String query;
    private PreparedStatement pst;
    private ResultSet rs;

    public mys1(Connection con) {
        this.con = con;
    }

    public List<users> getStudents() {
        List<users> listUser = new ArrayList<>();
        try (  // Ensure this returns a valid Connection
             Statement stmt = ((Connection) con).createStatement();
             ResultSet rs = stmt.executeQuery("SELECT * FROM users")) {

            while (rs.next()) {
                users usr = new users();
                usr.setLname(rs.getString(1));
                usr.setFname(rs.getString(2));
                usr.setEmail(rs.getString(3));
                usr.setPhno(rs.getString(4));
                usr.setPass(rs.getString(5));
                usr.setCpass(rs.getString(6));
                listUser.add(usr);
            }
        } catch (Exception e) {
            System.out.println("Exception: " + e.getLocalizedMessage());
        }
        return listUser;
    }

    public boolean authenticateUser(users2 insUser) {
        String query = "SELECT * FROM users WHERE email = ? AND passwor = ?";
        try (
             PreparedStatement pstmt = ((Connection) con).prepareStatement(query)) {

            pstmt.setString(1, insUser.getEmail());
            pstmt.setString(2, insUser.getPassword());

            try (ResultSet rs = pstmt.executeQuery()) {
                return rs.next();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public void setStudent(users usr) {
        String query = "INSERT INTO users (Fname, Lname, email, phno, passwor, cpassword) VALUES (?, ?, ?, ?, ?, ?)";
        try (
             PreparedStatement pstmt = ((Connection) con).prepareStatement(query)) {

            pstmt.setString(1, usr.getFname());
            pstmt.setString(2, usr.getLname());
            pstmt.setString(3, usr.getEmail());
            pstmt.setString(4, usr.getPhno());
            pstmt.setString(5, usr.getPass());
            pstmt.setString(6, usr.getCpass());
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public users2 userLogin(String email, String password) throws ClassNotFoundException {
        users2 user = null;
        String query = "SELECT * FROM users WHERE email=? AND password=?";
        try (
             PreparedStatement pst = ((Connection) con).prepareStatement(query)) {

            pst.setString(1, email);
            pst.setString(2, password);
            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    user = new users2();
                    user.setId(rs.getInt("id"));
                    user.setName(rs.getString("name"));
                    user.setEmail(rs.getString("email"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }
}
