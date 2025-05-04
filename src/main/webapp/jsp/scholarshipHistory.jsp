<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Scholarship Application History</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/home.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f4f6f8;
            min-height: 100vh;
        }
        .main-content {
            padding: 40px;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
        }
        h2.section-title {
            font-size: 28px;
            color: #2c3e50;
            text-align: center;
            margin-bottom: 30px;
        }
        .history-table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
            overflow: hidden;
        }
        .history-table th, .history-table td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #eceff1;
        }
        .history-table th {
            background: #1a73e8;
            color: white;
            font-weight: 600;
        }
        .history-table tr:hover {
            background: #f9f9f9;
        }
        .action-btn {
            display: inline-block;
            padding: 6px 12px;
            margin-right: 5px;
            border-radius: 4px;
            text-decoration: none;
            font-weight: 500;
            font-size: 14px;
            transition: background 0.2s, color 0.2s;
        }
        .edit-btn {
            background: #1a73e8;
            color: white;
        }
        .edit-btn:hover {
            background: #1557b0;
        }
        .delete-btn {
            background: #dc3545;
            color: white;
        }
        .delete-btn:hover {
            background: #b02a37;
        }
        .no-applications {
            text-align: center;
            color: #555;
            font-style: italic;
            font-size: 16px;
            margin-top: 20px;
        }
        .action-links {
            margin-top: 30px;
            text-align: center;
            display: flex;
            justify-content: center;
            gap: 15px;
        }
        .action-links a {
            text-decoration: none;
            color: #2c3e50;
            font-weight: bold;
            padding: 8px 16px;
            border-radius: 4px;
            background: #eceff1;
            transition: background 0.2s, color 0.2s;
        }
        .action-links a:hover {
            background: #2c3e50;
            color: white;
        }
        .debug-info {
            background: #fff3cd;
            padding: 15px;
            margin-bottom: 20px;
            border-radius: 8px;
            font-size: 14px;
            color: #856404;
        }
        @media (max-width: 768px) {
            .main-content {
                padding: 20px;
            }
            .section-title {
                font-size: 24px;
            }
            .history-table th, .history-table td {
                padding: 10px;
                font-size: 14px;
            }
            .action-btn {
                padding: 5px 10px;
                font-size: 12px;
            }
        }
    </style>
</head>
<body>
    <jsp:include page="/jsp/header.jsp" />
    <div class="main-content">
        <div class="container">
            <h2 class="section-title">Scholarship Application History</h2>
            
            <c:if test="${not empty error}">
                <div class="debug-info">
                    Error: <c:out value="${error}" />
                </div>
            </c:if>
            
        
            
            <c:choose>
                <c:when test="${not empty applications}">
                    <table class="history-table">
                        <thead>
                            <tr>
                                <th>Full Name</th>
                                <th>Email</th>
                                <th>Scholarship Title</th>
                                <th>Submitted At</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="app" items="${applications}">
                                <tr>
                                    <td><c:out value="${app.fullname}" default="N/A" /></td>
                                    <td><c:out value="${app.email}" default="N/A" /></td>
                                    <td><c:out value="${app.scholarshipTitle}" default="Unknown" /></td>
                                    <td><c:out value="${app.submittedAt}" default="N/A" /></td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/edit-delete-application?action=edit&id=${app.id}" class="action-btn edit-btn">Edit</a>
                                        <a href="${pageContext.request.contextPath}/edit-delete-application?action=delete&id=${app.id}" class="action-btn delete-btn" onclick="return confirm('Are you sure you want to delete this application?');">Delete</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:when>
                <c:otherwise>
                    <p class="no-applications">No scholarship applications found.</p>
                </c:otherwise>
            </c:choose>
            
            <div class="action-links">
                <a href="${pageContext.request.contextPath}/available-scholarships">Back to Scholarships</a>
                <a href="${pageContext.request.contextPath}/logout">Logout</a>
            </div>
        </div>
    </div>
    <jsp:include page="/jsp/footer.jsp" />
</body>
</html>