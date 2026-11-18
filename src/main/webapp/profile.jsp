<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <title>My Profile - Job Portal</title>

    <style>

        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f8;
        }

        .container {
            width: 500px;
            margin: 50px auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px #ccc;
        }

        h2 {
            text-align: center;
        }

        h3 {
            margin-top: 30px;
        }

        label {
            display: block;
            margin-top: 15px;
        }

        input,
        textarea {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            box-sizing: border-box;
        }

        textarea {
            height: 100px;
        }

        button {
            width: 100%;
            padding: 12px;
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

        .links {
            text-align: center;
            margin-top: 20px;
        }

        .links a {
            color: #007bff;
        }

        hr {
            margin-top: 30px;
            margin-bottom: 30px;
        }

    </style>

</head>

<body>

<div class="container">

    <h2>My Profile</h2>

    <!-- Profile Update -->

    <form action="ProfileServlet" method="post">

        <label for="name">Full Name</label>

        <input type="text"
               id="name"
               name="name"
               value="${user.name}"
               required>


        <label for="email">Email</label>

        <input type="email"
               id="email"
               name="email"
               value="${user.email}"
               readonly>


        <label for="phone">Phone</label>

        <input type="text"
               id="phone"
               name="phone"
               value="${user.phone}">


        <label for="address">Address</label>

        <textarea id="address"
                  name="address">${user.address}</textarea>


        <button type="submit">
            Update Profile
        </button>

    </form>


    <hr>


    <!-- Resume Upload -->

    <h3>Upload Resume</h3>

    <form action="ResumeUploadServlet"
          method="post"
          enctype="multipart/form-data">

        <label for="resume">Select Resume</label>

        <input type="file"
               id="resume"
               name="resume"
               accept=".pdf,.doc,.docx"
               required>

        <button type="submit">
            Upload Resume
        </button>

    </form>


    <div class="links">

        <a href="change-password.jsp">
            Change Password
        </a>

        |

        <a href="LoginServlet?action=logout">
            Logout
        </a>

    </div>

</div>


<!-- Success / Error Messages -->

<%
    String message = request.getParameter("message");
    String error = request.getParameter("error");

    if ("ProfileUpdated".equals(message)) {
%>

<script>
    alert("Profile updated successfully!");
</script>

<%
    }

    if ("ResumeUploaded".equals(message)) {
%>

<script>
    alert("Resume uploaded successfully!");
</script>

<%
    }

    if ("ResumeUploadFailed".equals(error)) {
%>

<script>
    alert("Resume upload failed!");
</script>

<%
    }

    if ("NoFileSelected".equals(error)) {
%>

<script>
    alert("Please select a resume file!");
</script>

<%
    }
%>

</body>
</html>