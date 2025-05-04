<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Success</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin-top: 50px;
        }
        .success-message {
            color: green;
        }
    </style>
</head>
<body>
    <h1>Success!</h1>
    <div class="success-message">
        <%= request.getAttribute("successMessage") != null ? request.getAttribute("successMessage") : "Application submitted successfully." %>
    </div>
    <a href="/ScholarshipManagementMVC/jsp/ScholarshipApplicationForm.jsp">Apply Again</a>
</body>
</html>