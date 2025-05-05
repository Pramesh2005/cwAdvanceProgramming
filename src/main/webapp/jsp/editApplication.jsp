<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Application</title>
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
            max-width: 600px;
            margin: 0 auto;
            background: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
        }
        h2.section-title {
            font-size: 28px;
            color: #2c3e50;
            text-align: center;
            margin-bottom: 20px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            display: block;
            font-weight: 600;
            color: #2c3e50;
            margin-bottom: 8px;
        }
        .form-group input[type="text"],
        .form-group input[type="email"],
        .form-group input[type="file"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #d1d5db;
            border-radius: 4px;
            font-size: 16px;
        }
        .form-group input[type="file"] {
            padding: 3px;
        }
        .form-group input:focus {
            outline: none;
            border-color: #1a73e8;
            box-shadow: 0 0 0 2px rgba(26, 115, 232, 0.2);
        }
        .submit-btn {
            display: block;
            width: 100%;
            padding: 12px;
            background: #1a73e8;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: background 0.2s;
        }
        .submit-btn:hover {
            background: #1557b0;
        }
        .debug-info {
            background: #fff3cd;
            padding: 15px;
            margin-bottom: 20px;
            border-radius: 8px;
            font-size: 14px;
            color: #856404;
        }
        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #1a73e8;
            text-decoration: none;
            font-weight: 500;
        }
        .back-link:hover {
            text-decoration: underline;
        }
        @media (max-width: 768px) {
            .main-content {
                padding: 20px;
            }
            .container {
                padding: 20px;
            }
            .section-title {
                font-size: 24px;
            }
        }
    </style>
</head>
<body>
    <jsp:include page="/jsp/header.jsp" />
    <div class="main-content">
        <div class="container">
            <h2 class="section-title">Edit Application</h2>
            
            <c:if test="${not empty error}">
                <div class="debug-info">
                    Error: <c:out value="${error}" />
                </div>
            </c:if>

            <form action="${pageContext.request.contextPath}/edit-delete-application" method="post" enctype="multipart/form-data">
                <input type="hidden" name="id" value="${application.id}">
                <div class="form-group">
                    <label for="fullname">Full Name</label>
                    <input type="text" id="fullname" name="fullname" value="${application.fullname}" readonly>
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" value="${application.email}" readonly>
                </div>
                <div class="form-group">
                    <label for="document">Document (PDF, max 2MB)</label>
                    <input type="file" id="document" name="document" accept=".pdf">
                    <c:if test="${not empty application.documentPath}">
                        <p>Current file: ${application.documentPath}</p>
                    </c:if>
                </div>
                <button type="submit" class="submit-btn">Update Application</button>
            </form>
            
            <a href="${pageContext.request.contextPath}/scholarship-history" class="back-link">Back to History</a>
        </div>
    </div>
    <jsp:include page="/jsp/footer.jsp" />
</body>
</html>