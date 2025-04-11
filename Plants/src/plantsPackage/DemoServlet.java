package plantsPackage;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
  
/**
 * Servlet implementation class DemoServlet
 */
@WebServlet("/DemoServlet")
public class DemoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public DemoServlet() {
        // TODO Auto-generated constructor stub
    }

   	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	System.out.println("    Do Get   ");
	add cont = new add();
	String FName = request.getParameter("firstName");
	String LName = request.getParameter("lastName");
	String Address = request.getParameter("address");
	String city = request.getParameter("city");
	String state = request.getParameter("state");
	String pincode = request.getParameter("pincode");
	//int id = Integer.valueOf(request.getParameter("stdid"));
	User insUser = new User();
	
	insUser.setFName(FName);
	insUser.setLName(LName);
	insUser.setAddress(Address);
	insUser.setCity(city);
	insUser.setState(state);
	insUser.setPincode(pincode);
	cont.setStudent(insUser);
	
	
	/*List<User> listUser=null;
	/*User usr=new User();
	usr.setName("BVRIT");
	usr.setComm(100);
	usr.setJob("S/W");
	usr.setSalary(100000);
	listUser=new ArrayList<User>();
	listUser.add(usr);*/
	
	/*listUser=cont.getStudents();
	if(listUser!=null && !listUser.isEmpty()) {
		request.setAttribute("listUser",listUser);
		request.setAttribute("myname","sowmya");
		RequestDispatcher rd=request.getRequestDispatcher("UserList1.jsp");
		rd.include(request,response);
	}*/
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//System.out.println("Email " + request.getParameter("email"));
		doGet(request, response);
	}

}
