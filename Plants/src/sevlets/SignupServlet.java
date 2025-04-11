package sevlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import plantsPackage.HangingPlantsDbCon;
import model.*;

@WebServlet("/user-signup")
public class SignupServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String name = request.getParameter("signup-name");
            String email = request.getParameter("signup-email");
            String password = request.getParameter("signup-password");

            UserDao udao = new UserDao(HangingPlantsDbCon.getConnection());
            User user = new User();
            user.setName(name);
            user.setEmail(email);
            user.setPassword(password);

            if (udao.registerUser(user)) {
                response.sendRedirect("login1.jsp");
            } else {
                out.println("Error in user registration");
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
}

