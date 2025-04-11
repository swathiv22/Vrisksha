package plantsPackage;

public class users2 {
	private int id;
	private String name;
	private String email;
	private String password;


		public users2()
		{
			
		}
		public users2(int id ,String name, String email,String password) {
			super();
			this.id = id;
			this.name = name;
			this.email=email;
			this.password=password;
			
		}
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		public String getPassword() {
			return password;
		}
		public void setPassword(String password) {
			this.password = password;
		}
		public static void main(String[] args) {
			// TODO Auto-generated method stub

		}
		

}