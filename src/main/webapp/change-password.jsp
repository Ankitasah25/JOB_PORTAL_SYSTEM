<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Change Password - Job Portal</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f8;
        }

        .container {
            width: 400px;
            margin: 80px auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px #ccc;
        }

        h2 {
            text-align: center;
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
            background-color: #dc3545;
            color: white;
            border: none;
            cursor: pointer;
        }

        button:hover {
            background-color: #c82333;
        }

        .back {
            text-align: center;
            margin-top: 15px;
        }
    </style>
</head>

<body>

<div class="container">

    <h2>Change Password</h2>

    <form action="ChangePasswordServlet" method="post">

        <label>Current Password</label>
        <input type="password"
               name="currentPassword"
               required>

        <label>New Password</label>
        <input type="password"
               name="newPassword"
               required>

        <label>Confirm New Password</label>
        <input type="password"
               name="confirmPassword"
               required>

        <button type="submit">Change Password</button>

    </form>

    <div class="back">
        <a href="profile.jsp">Back to Profile</a>
    </div>

</div>

</body>
</html>