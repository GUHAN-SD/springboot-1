<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.demo.Model.DModel" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Student List</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #e3f2fd;
    }
    table {
      width: 90%;
      margin: 40px auto;
      border-collapse: collapse;
      background-color: #ffffff;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    th, td {
      padding: 12px;
      border: 1px solid #ccc;
      text-align: center;
    }
    th {
      background-color: #1976d2;
      color: white;
    }
    h1 {
      text-align: center;
      margin-top: 30px;
      color: #0d47a1;
    }
    .button {
      display: block;
      width: 200px;
      margin: 20px auto;
      padding: 10px;
      background-color: #4CAF50;
      color: white;
      text-align: center;
      text-decoration: none;
      border-radius: 5px;
      font-weight: bold;
    }
    .action-button {
      padding: 8px 12px;
      margin: 0 4px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      font-weight: bold;
    }
    .update-btn {
      background-color: #0288d1;
      color: white;
    }
    .delete-btn {
      background-color: #d32f2f;
      color: white;
    }
    .action-button:hover {
      opacity: 0.9;
    }
    .button {
  display: block;
  width: 200px;
  margin: 20px auto;
  padding: 10px;
  background-color: #4CAF50;
  color: white;
  text-align: center;
  text-decoration: none;
  border-radius: 5px;
  font-weight: bold;
}
    
    
  </style>
</head>
<body>

<h1>All Students</h1>
<div style="text-align: center; margin-top: 20px;">
    <form action="searchStudent" method="get">
        <input type="text" name="keyword" placeholder="Search by name..." 
               style="padding: 8px; width: 250px; border-radius: 6px; border: 1px solid #ccc;" required>
        <input type="submit" value="Search" 
               style="padding: 8px 16px; background-color: #1976d2; color: white; border: none; border-radius: 6px; cursor: pointer;">
    </form>
</div>


<table>
  <thead>
    <tr>
      <th>ID</th>
      <th>Name</th>
      <th>Age</th>
      <th>Email</th>
      <th>Course</th>
      <th>Actions</th>
    </tr>
  </thead>
  <tbody>
    <%
      List<?> rawList = (List<?>) request.getAttribute("student1");
      List<DModel> students = new ArrayList<>();

      if (rawList != null) {
        for (Object obj : rawList) {
          if (obj instanceof DModel) {
            students.add((DModel) obj);
          }
        }
      }

      if (!students.isEmpty()) {
        for (DModel student : students) {
    %>
    <tr>
      <td><%= student.getId() %></td>
      <td><%= student.getName() %></td>
      <td><%= student.getAge() %></td>
      <td><%= student.getEmail() %></td>
      <td><%= student.getCourse() %></td>
      <td>
        <form action="updateStudent" method="get" style="display:inline;">
          <input type="hidden" name="id" value="<%= student.getId() %>"/>
          <input type="submit" class="action-button update-btn" value="Update"/>
        </form>
        <form action="deleteStudent" method="post" style="display:inline;" onsubmit="return confirm('Are you sure you want to delete this student?');">
          <input type="hidden" name="id" value="<%= student.getId() %>"/>
          <input type="submit" class="action-button delete-btn" value="Delete"/>
        </form>
      </td>
    </tr>
    <%
        }
      } else {
    %>
    <tr>
      <td colspan="6">No student records found.</td>
    </tr>
    <% } %>
  </tbody>
</table>

<a href="/addStudentForm" class="button">➕ Add New Student</a>

</body>
</html>
