package sevlets;


import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import plantsPackage.HangingPlantsDbCon;
import plantsPackage.mys1;
import plantsPackage.users;

/**
 * Servlet implementation class DemoServlet
 */
@WebServlet("/DemooServlet")
public class DemooServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	processRequest(request, response);
        
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	processRequest(request, response);
        
    }
    private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String Fname = request.getParameter("Fname");
        String Lname = request.getParameter("Lname");
        String email = request.getParameter("email");
        String phno = request.getParameter("phno");
        String pass = request.getParameter("pass");
        String cpass = request.getParameter("cpass");
        users insUser = new users(Fname, Lname, email, phno, pass, cpass);
        mys1 cont = null;
		try {
			cont = new mys1(HangingPlantsDbCon.getConnection());
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        cont.setStudent(insUser);
        response.sendRedirect("login.jsp");
//        response.sendRedirect("login.jsp");
//        List<users> listUser = cont.getStudents();
//        if (listUser != null && !listUser.isEmpty()) {
//            request.setAttribute("listUser", listUser);
//            request.setAttribute("myname", "sowmya");
            //RequestDispatcher rd = request.getRequestDispatcher("Ulist1.jsp");
           // rd.forward(request, response);
     //   }
    }
}
