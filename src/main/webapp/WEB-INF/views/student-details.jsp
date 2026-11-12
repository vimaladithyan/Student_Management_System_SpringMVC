<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Details</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 30px; }
        table { border-collapse: collapse; }
        th, td { border: 1px solid #ccc; padding: 8px; text-align: left; }
        th { width: 180px; }
    </style>
</head>
<body>
<div class="container">
    <h1>Student Management System</h1>
    <h2>Student Details</h2>

    <table>
        <tr>
            <th>ID</th>
            <td>${student.id}</td>
        </tr>
        <tr>
            <th>Full Name</th>
            <td><c:out value="${student.fullName}"/></td>
        </tr>
        <tr>
            <th>Email</th>
            <td><c:out value="${student.email}"/></td>
        </tr>
        <tr>
            <th>Mobile</th>
            <td><c:out value="${student.mobile}"/></td>
        </tr>
        <tr>
            <th>Age</th>
            <td>${student.age}</td>
        </tr>
        <tr>
            <th>Course</th>
            <td><c:out value="${student.course}"/></td>
        </tr>
        <tr>
            <th>Created At</th>
            <td>${student.createdAt}</td>
        </tr>
        <tr>
            <th>Updated At</th>
            <td>${student.updatedAt}</td>
        </tr>
    </table>

    <div class="actions">
        <c:url var="editUrl" value="/student/edit/${student.id}"/>
        <c:url var="listUrl" value="/student/list"/>
        <a class="button" href="${editUrl}">Edit Student</a>
        <a class="button secondary" href="${listUrl}">Back to List</a>
    </div>
</div>
</body>
</html>
