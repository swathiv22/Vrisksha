package sevlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import plantsPackage.*;

/**
 * Servlet implementation class DemoServlet
 */
@WebServlet("/DemmoServlet")
public class DemmoServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	//private HangingPlantsDbCon con=null;
//    public DemmoServlet() {
//        super();
//     //this.con = con;
//    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	try {
			processRequest(request, response);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	try {
			processRequest(request, response);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
    }
    private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException, SQLException {
        String email = request.getParameter("email");
        String password = request.getParameter("pass");
        users2 insUser = new users2(0,"",email, password);
//        Class.forName("com.mysql.cj.jdbc.Driver");
//        Connection con = null;
//        PreparedStatement pst = null;
//        // Establish connection
//        String mysqlUrl = "jdbc:mysql://localhost:3306/hangingplantsdata";
//        con = DriverManager.getConnection(mysqlUrl, "root", "1234");
        //mys1 cont = new mys1((HangingPlantsDbCon) con);
        mys1 cont = new mys1(HangingPlantsDbCon.getConnection());
        boolean isAuthenticated = cont.authenticateUser(insUser);

        if (isAuthenticated) {
            response.sendRedirect("index.jsp"); // Redirect to a success page
        } else {
            request.setAttribute("errorMessage", "Invalid email or password.");
            request.setAttribute("email", email); // To retain the email in the input field
            request.getRequestDispatcher("login.jsp").forward(request, response); // Forward back to login page
        }
    }

    }

