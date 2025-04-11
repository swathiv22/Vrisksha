<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Registration Form</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: white; /* Light grey background for the body */
      margin: 20px;
      padding: 20px;
    }

    .container {
      max-width: 750px;
      margin: 40px auto;
      padding: 20px;
      background-color: #fff6f4;
      border: 1px solid #ddd;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
      border-radius: 8px;
      overflow-y: auto; /* Add this to allow scrolling */
    }

    .registration-form {
      width: 600px;
      margin: 20px auto;
    }

    .form-group {
      display: flex;
      flex-direction: column;
      align-items: flex-start;
      margin-bottom: 10px;
    }

    .form-group label {
      margin-bottom: 5px;
    }

    .form-group input {
      width: 100%;
      padding: 5px;
      border: 1px solid #ccc;
      border-radius: 4px;
      margin-bottom: 5px;
    }

    .error-message {
      color: red;
      font-size: 12px;
      margin-top: 5px; /* Adjust margin to separate from input */
    }

    button {
      width: 100%;
      padding: 15px;
      background-color: green;
      border: none;
      border-radius: 4px;
      color: white;
      font-size: 20px;
      cursor: pointer;
      text-transform: uppercase;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
      margin-top: 10px; /* Space between button and input groups */
    }
  </style>
</head>
<body>
  <form action="DemooServlet" method="post" onsubmit="return validateForm()">
    <div class="container">
      <div class="registration-form">
        <div>
          <img src="includes/css/logo1.jpg" alt="Logo">
        </div>
        <h2 style="text-align: center;">Signup</h2>
        <div class="form-group">
          <label>First Name:</label>
          <input type="text" name="Fname" id="fname">
          <span class="error-message" id="fnameError"></span>
        </div>
        <div class="form-group">
          <label>Last Name:</label>
          <input type="text" name="Lname" id="lname">
          <span class="error-message" id="lnameError"></span>
        </div>
        <div class="form-group">
          <label>Email:</label>
          <input type="email" name="email" id="email">
          <span class="error-message" id="emailError"></span>
        </div>
        <div class="form-group">
          <label>Pho.No:</label>
          <input type="text" name="phno" id="phno">
          <span class="error-message" id="phnoError"></span>
        </div>
        <div class="form-group">
          <label>Password:</label>
          <input type="password" name="pass" id="password">
          <span class="error-message" id="passwordError"></span>
        </div>
        <div class="form-group">
          <label>Confirm Password:</label>
          <input type="password" name="cpass" id="confirmpassword">
          <span class="error-message" id="confirmPasswordError"></span>
        </div>
        <button type="submit">SUBMIT</button>
        <center><p>Already have an account? <a href="login.jsp">click here</a> to login.</p></center>
      </div>
    </div>
  </form>

  <script>
  function validatePhoneNumber(phno) {
	  const regex = /^\(?([7-9]{1})\)?[-. ]?([0-9]{9})$/;
	  return regex.test(phno);
	}
    function validateForm() {
      var fname = document.getElementById("fname").value;
      var lname = document.getElementById("lname").value;
      var email = document.getElementById("email").value;
      var password = document.getElementById("password").value;
      var confirmPassword = document.getElementById("confirmpassword").value;
      var phno = document.getElementById("phno").value;
      var valid = true;

      // Validate first name
      if (fname.trim() === "") {
        document.getElementById("fnameError").innerHTML = "First name is required";
        valid = false;
      } else if (!validateName(fname)) {
        document.getElementById("fnameError").innerHTML = "First name must contain only letters and spaces";
        valid = false;
      } else {
        document.getElementById("fnameError").innerHTML = "";
      }

      // Validate last name
      if (lname.trim() === "") {
        document.getElementById("lnameError").innerHTML = "Last name is required";
        valid = false;
      } else if (!validateName(lname)) {
        document.getElementById("lnameError").innerHTML = "Last name must contain only letters and spaces";
        valid = false;
      } else {
        document.getElementById("lnameError").innerHTML = "";
      }

      // Validate email
      if (email.trim() === "") {
        document.getElementById("emailError").innerHTML = "Email is required";
        valid = false;
      } else if (!validateEmail(email)) {
        document.getElementById("emailError").innerHTML = "Invalid email format";
        valid = false;
      } else {
        document.getElementById("emailError").innerHTML = "";
      }

      // Validate password
      if (password.trim() === "") {
        document.getElementById("passwordError").innerHTML = "Password is required";
        valid = false;
      } else if (password.length < 8) {
        document.getElementById("passwordError").innerHTML = "Password must be at least 8 characters";
        valid = false;
      } else {
        document.getElementById("passwordError").innerHTML = "";
      }

      // Validate confirm password
      if (confirmPassword.trim() === "") {
        document.getElementById("confirmPasswordError").innerHTML = "Confirm password is required";
        valid = false;
      } else if (confirmPassword!== password) {
        document.getElementById("confirmPasswordError").innerHTML = "Passwords do not match";
        valid = false;
      } else {
        document.getElementById("confirmPasswordError").innerHTML = "";
      }

      // Validate phone number
      if (phno.trim() === "") {
        document.getElementById("phnoError").innerHTML = "Phone number is required";
        valid = false;
      } else if (!validatePhoneNumber(phno)) {
        document.getElementById("phnoError").innerHTML = "Invalid phone number format";
        valid = false;
      } else {
        document.getElementById("phnoError").innerHTML = "";
      }

      return valid;
    }

    function validateName(name) {
      var re = /^[a-zA-Z ]{2,30}$/;
      return re.test(name);
    }

    function validateEmail(email) {
      var re = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
      return re.test(email);
    }
  </script>
</body>
</html>