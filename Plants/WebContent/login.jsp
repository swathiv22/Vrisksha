<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <style>
        /* General styles */
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            overflow: hidden;
            background-color:white; 
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            animation: animatedBackground 10s linear infinite;
        }
]

        /* Background container */
        .background-container {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            overflow: hidden;
        }

        /* Semi-transparent overlay for the form */
        .overlay {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            background-size: cover;
            background-position: center;
        }

        /* Container styles */
        .container {
            display: flex;
            background-color: #fff6f4;
            border: 2px solid rgba(255, 255, 255, 0.3);
            border-radius: 10px;
            overflow: hidden;
            max-width: 650px;
            width: 60%;
            max-width: 650px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            backdrop-filter: blur(10px);
        }

        /* Form section */
        .form-container {
            padding: 30px;
            width: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }

        h1 {
            margin-bottom: 20px;
            font-size: 24px;
            text-align: center;
            color: #000;
        }

        form {
            display: flex;
            flex-direction: column;
            width: 100%;
        }

        .input-group {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
            width: 100%;
        }

        .input-group label {
            flex: 1;
            font-weight: bold;
            color: #000;
            padding-right: 10px;
        }

        .input-group input {
            flex: 2;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            outline: none;
            background: rgba(255, 255, 255, 0.8);
            color: #000;
        }

        input.error {
            border: 2px solid red;
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
        }

        button:hover {
            background-color: #009d66;
        }

        /* Responsive design */
        @media (max-width: 768px) {
            .container {
                flex-direction: column;
            }

            .form-container {
                padding: 20px;
            }

            form {
                width: 100%;
            }

            .input-group {
                flex-direction: column;
            }

            label, input, button {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="background-container">
        <div class="overlay">
            <div class="container">
                <div class="form-container">
                <img src="includes/css/logo1.jpg">
                    <h1>Login</h1>
                    <form action="DemmoServlet">
                                                <div class="input-group">
                            <label for="email">Email</label>
                            <input type="email" id="email" name="email" placeholder="hello@vriksha.com" value="${email}" class="${errorMessage != null ? 'error' : ''}">
                        </div>
                        <div class="input-group">
                            <label for="password">Password</label>
                            <input type="password" id="password" name="pass" placeholder="" class="${errorMessage != null ? 'error' : ''}">
                        </div>
                        <button type="submit">Submit</button>
                        <c:if test="${errorMessage != null}">
                            <p style="color:red; text-align:center">${errorMessage}</p>
                        </c:if>
                        <center>
          <p>If you haven't signed up yet, <a href="Register.jsp">click here</a> to sign up.</p>
        </center>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
