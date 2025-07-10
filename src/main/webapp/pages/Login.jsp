<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>

<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(to right, #667eea, #764ba2);
        margin: 0;
        padding: 0;
    }

    .outerDiv {
        width: 380px;
        margin: 100px auto;
        padding: 40px 30px;
        background-color: #ffffff;
        border-radius: 10px;
        box-shadow: 0 5px 25px rgba(0, 0, 0, 0.2);
    }

    .tit h2 {
        text-align: center;
        color: #5a3f87;
        margin-bottom: 30px;
    }

    .inner1 label {
        font-weight: 600;
        color: #333;
    }

    .inner1 input[type="text"],
    .inner1 input[type="password"] {
        width: 100%;
        padding: 12px;
        margin-top: 5px;
        margin-bottom: 20px;
        border: 1px solid #ddd;
        border-radius: 5px;
        box-sizing: border-box;
        font-size: 15px;
    }

    .inner2 {
        text-align: center;
    }

    .inner-button {
        background-color: #5a3f87;
        color: white;
        padding: 12px 25px;
        border: none;
        border-radius: 5px;
        font-size: 16px;
        cursor: pointer;
        transition: 0.3s;
    }

    .inner-button:hover {
        background-color: #4e3676;
    }

    .error-message {
        color: red;
        text-align: center;
        margin-bottom: 15px;
        font-size: 14px;
    }

    .success-message {
        color: green;
        text-align: center;
        margin-bottom: 15px;
        font-size: 14px;
    }
</style>
</head>
<body>

<%
    String message = (String) request.getAttribute("message");
    String messageType = (String) request.getAttribute("messageType");
%>

<div class="outerDiv">
    <div class="tit">
        <h2>Login Page</h2>
    </div>
    <% if (message != null) { %>
        <div class="<%= "error".equals(messageType) ? "error-message" : "success-message" %>">
            <%= message %>
        </div>
    <% } %>
    <form action="index" method="post">
        <div class="inner1">
            <label for="uname">User Name</label><br/>
            <input type="text" id="uname" name="uname" required><br/>

            <label for="password">Password</label><br/>
            <input type="password" id="password" name="password" required><br/>
        </div>
        <div class="inner2">
            <input type="submit" value="Login" class="inner-button">
        </div>
    </form>
</div>
</body>
</html>
