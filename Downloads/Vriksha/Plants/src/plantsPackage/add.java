package plantsPackage;
import java.sql.*;
	import java.util.ArrayList;
	import java.util.List;  

	class add{  
		//public static void main(String args[]){  
		public List<User> getStudents() { 
			List<User> listUser=new ArrayList<User>();
			try{   
				System.out.println("Started..");  
				Class.forName("com.mysql.cj.jdbc.Driver");// installing driver
				System.out.println("installed driver...");
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hangingplantsdata","root","1234");  
				System.out.println("Connection established...");
				//here sonoo is database name, root is username and password  
				Statement stmt=con.createStatement();  
			/* stmt.execute("Insert into students values(666,'krishna', 1234)"); 
			 stmt.execute("Insert into students values(662,'swapna', 923)"); 
			 stmt.execute("Insert into students values(660,'janu', 567)"); 
				System.out.println("Records inserted");*/
				
				ResultSet rs=stmt.executeQuery("select * from address");  //  where address ='qqq' and dept = 'FInance' 
				while(rs.next())  {
					User usr = new User();
					usr.setFName(rs.getString("firstName"));
					usr.setLName(rs.getString("lastName"));
					usr.setAddress(rs.getString("address"));
					usr.setCity(rs.getString("city"));
					usr.setState(rs.getString("state"));
					usr.setPincode(rs.getString("pincode"));
					
					listUser.add(usr);
				
					//String name = rs.getString(2);
					   // System.out.println(rs.getInt(1)+"  "+rs.getString(2)+"  "+rs.getString(3)+ "  ");  
					    }
				//con.close();  
	}catch(Exception e)
			{ System.out.println("Exception"+ e.getLocalizedMessage());}  
			return listUser;
	} 
		
		public void setStudent(User usr)    {
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
			 
			System.out.println("installed driver...");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hangingplantsdata","root","1234"); 
			Statement stmt=con.createStatement();  
			stmt.execute("Insert into address(fname, lname, addr, city, state, pincode) values('" + usr.getFName() + "','" + usr.getLName() + "','" + 
			usr.getAddress() + "','" + usr.getCity() + "','" + usr.getState() + "','" + usr.getPincode() + "');");		
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
	}

