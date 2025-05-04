<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String firstname = (String) session.getAttribute("first_name");
    String lastname = (String) session.getAttribute("last_name");
    String fullname = firstname + " " + lastname;
    String email = (String) session.getAttribute("email");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Scholarship Application Form</title>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            background: linear-gradient(135deg, #e0f7fa, #ffffff);
        }

        header, footer {
            background-color: #4CAF50;
            color: white;
            text-align: center;
            padding: 15px 0;
        }

        main {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 40px 20px;
        }

        .form-container {
            background: #ffffff;
            padding: 40px;
            border-radius: 16px;
            box-shadow: 0 12px 25px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 450px;
            transition: transform 0.3s ease;
        }

        .form-container:hover {
            transform: scale(1.01);
        }

        .form-container h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #2c3e50;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #34495e;
        }

        input[type="text"],
        input[type="email"],
        input[type="hidden"],
        select,
        input[type="file"] {
            width: 100%;
            padding: 10px 14px;
            border-radius: 8px;
            border: 1px solid #ccc;
            font-size: 15px;
            transition: border-color 0.3s ease;
        }

        input:focus,
        select:focus {
            border-color: #4CAF50;
            outline: none;
        }

        input[type="file"] {
            padding: 8px;
            background: #f9f9f9;
        }

        button {
            width: 100%;
            padding: 12px;
            background: #4CAF50;
            color: white;
            font-weight: bold;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #43a047;
        }

        .form-group input[readonly] {
            color: grey;
        }
    </style>
</head>
<body>
    <header>
        <jsp:include page="/jsp/header.jsp" />
    </header>

    <main>
        <div class="form-container">
            <h2>Apply for <c:out value="${scholarship.title}" /></h2>
            <form action="${pageContext.request.contextPath}/SubmitScholarshipServlet" method="post" enctype="multipart/form-data">
                <input type="hidden" name="scholarshipId" value="${scholarship.scholarshipId}">
                <div class="form-group">
                    <label for="fullname">Full Name</label>
                    <input type="text" name="fullname" id="fullname" value="<%= fullname %>" readonly>
                </div>
                <div class="form-group">
                    <label for="email">Email Address</label>
                    <input type="email" name="email" id="email" value="<%= email %>" readonly>
                </div>
                <div class="form-group">
                    <label for="file">Upload Document (PDF, Max 2MB)</label>
                    <input type="file" name="document" id="file" accept=".pdf" required>
                </div>
                <button type="submit">Submit Application</button>
            </form>
        </div>
    </main>

    <footer>
        <jsp:include page="/jsp/footer.jsp" />
    </footer>
</body>
</html>