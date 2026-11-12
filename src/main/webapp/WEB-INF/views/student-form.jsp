<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Form</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 30px; }
        .field { margin-bottom: 12px; }
        label { display: block; margin-bottom: 4px; }
        .error { color: #c00; }
    </style>
</head>
<body>
<div class="container">
    <h1>Student Management System</h1>

    <c:choose>
        <c:when test="${not empty student.id}">
            <h2>Edit Student</h2>
        </c:when>
        <c:otherwise>
            <h2>Add New Student</h2>
        </c:otherwise>
    </c:choose>

    <c:choose>
        <c:when test="${not empty student.id}">
            <c:url var="formAction" value="/student/update"/>
        </c:when>
        <c:otherwise>
            <c:url var="formAction" value="/student/save"/>
        </c:otherwise>
    </c:choose>

    <form:form modelAttribute="student" method="post" action="${formAction}">
        <form:hidden path="id"/>

        <div class="field">
            <label for="fullName">Full Name</label>
            <form:input path="fullName" id="fullName"/>
            <form:errors path="fullName" cssClass="error"/>
        </div>

        <div class="field">
            <label for="email">Email</label>
            <form:input path="email" id="email" type="email"/>
            <form:errors path="email" cssClass="error"/>
        </div>

        <div class="field">
            <label for="mobile">Mobile</label>
            <form:input path="mobile" id="mobile"/>
            <form:errors path="mobile" cssClass="error"/>
        </div>

        <div class="field">
            <label for="age">Age</label>
            <form:input path="age" id="age" type="number"/>
            <form:errors path="age" cssClass="error"/>
        </div>

        <div class="field">
            <label for="course">Course</label>
            <form:input path="course" id="course"/>
            <form:errors path="course" cssClass="error"/>
        </div>

        <div class="form-actions">
            <button type="submit">Save Student</button>
            <c:url var="cancelUrl" value="/student/list"/>
            <a class="button secondary" href="${cancelUrl}">Cancel</a>
        </div>
    </form:form>
</div>
</body>
</html>