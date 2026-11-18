<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register - Job Portal</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f8;
        }

        .container {
            width: 400px;
            margin: 60px auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px #ccc;
        }

        h2 {
            text-align: center;
            color: #333;
        }

        label {
            display: block;
            margin-top: 15px;
        }

        input {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            box-sizing: border-box;
        }

        button {
            width: 100%;
            padding: 10px;
            margin-top: 20px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #0056b3;
        }

        .login-link {
            text-align: center;
            margin-top: 15px;
        }

        .login-link a {
            color: #007bff;
            text-decoration: none;
        }
    </style>
</head>

<body>

    <div class="container">

        <h2>Create Account</h2>

        <form action="RegisterServlet" method="post">

            <label for="name">Full Name</label>
            <input type="text"
                   id="name"
                   name="name"
                   placeholder="Enter your full name"
                   required>

            <label for="email">Email</label>
            <input type="email"
                   id="email"
                   name="email"
                   placeholder="Enter your email"
                   required>

            <label for="password">Password</label>
            <input type="password"
                   id="password"
                   name="password"
                   placeholder="Enter your password"
                   required>

            <label for="phone">Phone</label>
            <input type="text"
                   id="phone"
                   name="phone"
                   placeholder="Enter your phone number"
                   required>

            <button type="submit">Register</button>

        </form>

        <div class="login-link">
            Already have an account?
            <a href="login.jsp">Login</a>
        </div>

    </div>

</body>
</html>