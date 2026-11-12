<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Application Error</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 30px; }
        h1 { color: #c00; }
    </style>
</head>
<body>
<div class="container">
    <h1><c:out value="${empty errorTitle ? 'Application Error' : errorTitle}"/></h1>
    <p><c:out value="${empty errorMessage ? 'An unexpected error occurred.' : errorMessage}"/></p>
    <c:url var="listUrl" value="/student/list"/>
    <a class="button" href="${listUrl}">Back to Student List</a>
</div>
</body>
</html>
