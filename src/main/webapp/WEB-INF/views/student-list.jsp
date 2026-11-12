<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student List</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 30px; }
        table { border-collapse: collapse; width: 100%; }
        th, td { border: 1px solid #ccc; padding: 8px; text-align: left; }
        .success { color: #060; }
    </style>
</head>
<body>
<div class="container">
    <h1>Student Management System</h1>
    <h2>All Students</h2>

    <c:if test="${not empty successMessage}">
        <div class="success"><c:out value="${successMessage}"/></div>
    </c:if>

    <c:url var="addUrl" value="/student/add"/>
    <a class="button" href="${addUrl}">Add New Student</a>

    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>Full Name</th>
            <th>Email</th>
            <th>Mobile</th>
            <th>Age</th>
            <th>Course</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="student" items="${students}">
            <c:url var="viewUrl" value="/student/view/${student.id}"/>
            <c:url var="editUrl" value="/student/edit/${student.id}"/>
            <c:url var="deleteUrl" value="/student/delete/${student.id}"/>
            <tr>
                <td>${student.id}</td>
                <td><c:out value="${student.fullName}"/></td>
                <td><c:out value="${student.email}"/></td>
                <td><c:out value="${student.mobile}"/></td>
                <td>${student.age}</td>
                <td><c:out value="${student.course}"/></td>
                <td class="actions">
                    <a href="${viewUrl}">View</a>
                    <a href="${editUrl}">Edit</a>
                    <form class="inline-form" action="${deleteUrl}" method="post"
                          onsubmit="return confirm('Delete this student?');">
                        <button class="small" type="submit">Delete</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
        <c:if test="${empty students}">
            <tr>
                <td class="empty" colspan="7">No students found. Add your first student.</td>
            </tr>
        </c:if>
        </tbody>
    </table>
</div>
</body>
</html>