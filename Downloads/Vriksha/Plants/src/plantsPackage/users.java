package plantsPackage;

public class users {
	
		public users()
		{
			
		}
		public users(String Fname, String Lname, String email, String phno,String pass,String cpass ) {
			super();
			this.Fname = Fname;
			this.Lname = Lname;
			this.email = email;
			this.phno = phno;
			this.pass = pass;
			this.cpass = cpass;
		}
		
			public String getFname() {
				return Fname;
			}
			public void setFname(String Fname) {
				this.Fname = Fname;
			}
			public String getLname() {
				return Lname;
			}
			public void setLname(String Lname) {
				this.Lname = Lname;
			}
			public String getEmail() {
				return email;
			}
			public void setEmail(String email) {
				this.email = email;
			}
			public String getPhno() {
				return phno;
			}
			public void setPhno(String phno) {
				this.phno = phno;
			}
			public String getPass() {
				return pass;
			}
			public void setPass(String pass) {
				this.pass = pass;
			}
			public String getCpass() {
				return cpass;
			}
			public void setCpass(String cpass) {
				this.cpass = cpass;
			}
			public static void main(String[] args) {
				// TODO Auto-generated method stub

			}

			private String Fname;
			private String Lname;
			private String email;
			private String phno;
			private String pass;
			private String cpass;
	}


