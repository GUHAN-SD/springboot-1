<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.demo.Model.DModel" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Student</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #e3f2fd;
            padding: 40px;
        }

        .form-container {
            background-color: #ffffff;
            max-width: 500px;
            margin: auto;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

        h2 {
            text-align: center;
            color: #0d47a1;
            background-color: #bbdefb;
            padding: 15px;
            border-radius: 8px;
        }

        label {
            font-weight: bold;
            color: #0d47a1;
            display: block;
            margin-top: 15px;
        }

        input[type="text"],
        input[type="number"],
        input[type="email"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 2px solid #90caf9;
            border-radius: 6px;
            box-sizing: border-box;
        }

        input:focus {
            border-color: #2196f3;
            outline: none;
        }

        .submit-btn {
            display: block;
            background-color: #2196f3;
            color: #fff;
            padding: 12px 20px;
            margin: 25px auto 0;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            width: 100%;
        }

        .submit-btn:hover {
            background-color: #1565c0;
        }

        .back-link {
            text-align: center;
            margin-top: 20px;
        }

        .back-link a {
            text-decoration: none;
            color: #0d47a1;
            font-weight: bold;
        }
    </style>
</head>
<body>

<%
    DModel student = (DModel) request.getAttribute("student");
    if (student == null) {
%>
    <h2 style="text-align:center; color:red;">Student not found!</h2>
<%
    } else {
%>

<div class="form-container">
    <h2>Update Student</h2>
    <form action="updateStudent" method="post">
        <input type="hidden" name="id" value="<%= student.getId() %>" />

        <label for="name">Name:</label>
        <input type="text" id="name" name="name" value="<%= student.getName() %>" required>

        <label for="age">Age:</label>
        <input type="number" id="age" name="age" value="<%= student.getAge() %>" required>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" value="<%= student.getEmail() %>" required>

        <label for="course">Course:</label>
        <input type="text" id="course" name="course" value="<%= student.getCourse() %>" required>

        <input type="submit" class="submit-btn" value="Update Student">
    </form>

    <div class="back-link">
        <a href="/viewStudents">← Back to Student List</a>
    </div>
</div>

<% } %>

</body>
</html>
