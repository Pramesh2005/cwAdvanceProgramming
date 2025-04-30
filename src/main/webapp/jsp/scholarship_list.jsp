<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Scholarships</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 1000px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h1 {
            text-align: center;
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table th, table td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }
        table th {
            background-color: #f2f2f2;
        }
        .actions form {
            display: inline;
        }
        .actions a, .actions button {
            background-color: #00796b;
            color: #fff;
            padding: 5px 10px;
            border: none;
            border-radius: 3px;
            text-decoration: none;
            cursor: pointer;
        }
        .actions a:hover, .actions button:hover {
            background-color: #004d40;
        }
        .create-link {
            display: block;
            text-align: center;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Manage Scholarships</h1>
        <a href="/admin/scholarship" class="create-link">Create New Scholarship</a>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Title</th>
                    <th>Amount</th>
                    <th>Deadline</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="s" items="${scholarships}">
                    <tr>
                        <td>${s.scholarshipId}</td>
                        <td>${s.title}</td>
                        <td>${s.amount}</td>
                        <td>${s.applicationDeadline}</td>
                        <td class="actions">
                            <a href="/admin/scholarship?action=view&id=${s.scholarshipId}">View</a>
                            <form action="/admin/scholarship" method="post">
                                <input type="hidden" name="action" value="delete">
                                <input type="hidden" name="scholarshipId" value="${s.scholarshipId}">
                                <button type="submit" onclick="return confirm('Are you sure?')">Delete</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <a href="/admin/dashboard">Back to Dashboard</a>
    </div>
</body>
