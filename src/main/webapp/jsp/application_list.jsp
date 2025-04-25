<!-- application_list.jsp -->
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My Scholarship Applications</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 30px;
            background-color: #f4f4f4;
        }	
        h2 {
            color: #333;
        }
        table {
            width: 80%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: #fff;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 10px 15px;
            text-align: left;
        }
        th {
            background-color: #0073e6;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        a.button-link {
            color: #d9534f;
            text-decoration: none;
            font-weight: bold;
        }
        a.button-link:hover {
            text-decoration: underline;
        }
        .back-link {
            margin-top: 20px;
            display: inline-block;
        }
    </style>
</head>
<body>

    <h2>My Scholarship Applications</h2>

    <table>
        <thead>
            <tr>
                <th>Scholarship</th>
                <th>Status</th>
                <th>Applied At</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="a" items="${apps}">
                <tr>
                    <td>${a.scholarshipId}</td>
                    <td>${a.status}</td>
                    <td>${a.appliedAt}</td>
                    <td>
                        <a class="button-link" href="application?action=delete&id=${a.applicationId}">Withdraw</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <p class="back-link">
        <a href="${pageContext.request.contextPath}/jsp/home.jsp">← Back to Home</a>
    </p>

</body>
</html>
