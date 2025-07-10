<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Student</title>
<style>
    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(-20px); }
        to { opacity: 1; transform: translateY(0); }
    }

    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #e3f2fd;
        padding: 40px;
        margin: 0;
    }

    .form-container {
        background-color: #ffffff;
        max-width: 500px;
        margin: auto;
        padding: 30px 40px;
        border-radius: 12px;
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        animation: fadeIn 0.8s ease-in-out;
    }

    h2.form-title {
        text-align: center;
        margin-bottom: 25px;
        color: #0d47a1;
        background-color: #bbdefb;
        padding: 15px;
        border-radius: 8px;
        font-size: 24px;
    }

    .inner1 label {
        font-weight: 600;
        color: #0d47a1;
        display: block;
        margin-bottom: 5px;
    }

    .inner1 input[type="text"],
    .inner1 input[type="number"],
    .inner1 input[type="email"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 20px;
        border: 2px solid #90caf9;
        border-radius: 6px;
        transition: border-color 0.3s, box-shadow 0.3s;
    }

    .inner1 input:focus {
        border-color: #2196f3;
        box-shadow: 0 0 8px rgba(33, 150, 243, 0.3);
        outline: none;
    }

    .inner2 {
        text-align: center;
    }

    .inner-button {
        background-color: #2196f3;
        color: #fff;
        padding: 12px 25px;
        border: none;
        border-radius: 8px;
        font-size: 16px;
        font-weight: bold;
        cursor: pointer;
        transition: background-color 0.3s ease, transform 0.2s ease;
    }

    .inner-button:hover {
        background-color: #1565c0;
        transform: scale(1.05);
    }

    .inner-button:active {
        transform: scale(0.98);
    }
</style>
</head>
<body>
    <div class="form-container">
        <h2 class="form-title">Student Information Form</h2>
        <form action="viewStudent" method="post">
            <div class="inner1">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" required>

                <label for="age">Age:</label>
                <input type="number" id="age" name="age" required>

                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>

                <label for="course">Course:</label>
                <input type="text" id="course" name="course" required>
            </div>
            <div class="inner2">
                <input type="submit" id="submit" value="Add Student" class="inner-button">
            </div>
        </form>
    </div>
</body>
</html>
