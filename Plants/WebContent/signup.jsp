<%@page import="model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>E-Commerce Signup</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: white; /* Light grey background for the body */
            margin: 20px;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            overflow: hidden;
        }

        .container {
            max-width: 750px;
            margin: 40px auto;
            padding: 20px;
            background-color: #fff6f4;
            border: 1px solid #ddd;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            overflow-y: auto;
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

        .text-center {
            text-align: center;
        }

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

            .form-group {
                flex-direction: column;
            }

            label, input, button {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div>
            <img src="includes/css/logo1.jpg" alt="Logo">
        </div>
        <div class="card-header text-center"></div>
        <div class="card-body">
            <form action="user-signup" method="post">
                <div class="form-group">
                    <label for="name">Name</label>
                    <input type="text" id="name" name="signup-name" placeholder="Enter name" required>
                </div>
                <div class="form-group">
                    <label for="email">Email address</label>
                    <input type="email" id="email" name="signup-email" placeholder="Enter email" required>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="signup-password" placeholder="Password" required>
                </div>
                <div class="text-center">
                    <button type="submit" class="btn btn-primary">Signup</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
