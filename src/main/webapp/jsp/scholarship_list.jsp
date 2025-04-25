<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Scholarship Management</title>
    <style>
        /* General Styles */
        body {
            font-family: 'Helvetica', 'Arial', sans-serif;
            margin: 0;
            padding: 30px;
            line-height: 1.6;
            background: linear-gradient(135deg, #f0f4f8 0%, #e0e7ff 100%);
            color: #333;
        }
        h1 {
            color: #003d82;
            font-size: 28px;
            margin-bottom: 25px;
            text-align: center;
            text-transform: uppercase;
            letter-spacing: 1px;
        }
        /* Table Styles */
        table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            margin-bottom: 25px;
            background-color: #fff;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            overflow: hidden;
        }
        th, td {
            padding: 15px 20px;
            text-align: left;
        }
        th {
            background: linear-gradient(to right, #0056b3, #007bff);
            color: #fff;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        tr:nth-child(even) {
            background-color: #f7f9fc;
        }
        tr:hover {
            background-color: #e6f0ff;
            transition: background-color 0.3s ease;
        }
        /* Link Styles */
        a {
            color: #007bff;
            text-decoration: none;
            padding: 6px 12px;
            border-radius: 4px;
            transition: all 0.3s ease;
            position: relative;
        }
        a:hover {
            background-color: #cce5ff;
            text-decoration: none;
            color: #0056b3;
            transform: translateY(-2px);
        }
        a::after {
            content: '';
            position: absolute;
            width: 0;
            height: 2px;
            bottom: 0;
            left: 50%;
            background-color: #0056b3;
            transition: all 0.3s ease;
        }
        a:hover::after {
            width: 100%;
            left: 0;
        }
        /* Navigation Styles */
        .navigation {
            margin-top: 25px;
            display: flex;
            justify-content: center;
            gap: 20px;
        }
        .navigation a {
            font-size: 16px;
            font-weight: 500;
            padding: 8px 16px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
            background-color: #fff;
        }
        .navigation a:hover {
            background-color: #007bff;
            color: #fff;
        }
        /* Container for better layout */
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 12px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.05);
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Scholarship Management</h1>
        <table>
            <thead>
                <tr>
                    <th>Scholarship Title</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="s" items="${list}">
                    <tr>
                        <td>${s.title}</td>
                        <td>
                            <a href="scholarship?action=edit&id=${s.scholarshipId}">Edit</a> |
                            <a href="scholarship?action=delete&id=${s.scholarshipId}" onclick="return confirm('Are you sure you want to delete this scholarship?');">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <div class="navigation">
            <a href="scholarship_form.jsp?action=new">Create New Scholarship</a>
            <a href="dashboard.jsp">Back to Dashboard</a>
            <a href="${pageContext.request.contextPath}/logout">Logout</a>
        </div>
    </div>
</body>
</html>