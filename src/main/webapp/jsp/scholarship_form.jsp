<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Scholarship Form</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f4f6f8;
            padding: 40px;
            min-height: 100vh;
        }
        .container {
            background: white;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
            max-width: 700px;
            margin: 0 auto;
        }
        h2 {
            font-size: 28px;
            color: #2c3e50;
            margin-bottom: 20px;
            text-align: center;
        }
        form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }
        label {
            font-weight: 500;
            color: #2c3e50;
            margin-bottom: 5px;
            display: block;
        }
        input[type="text"],
        input[type="number"],
        input[type="date"],
        textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
            color: #2c3e50;
            background: #f9f9f9;
            transition: border-color 0.2s;
        }
        input[type="text"]:focus,
        input[type="number"]:focus,
        input[type="date"]:focus,
        textarea:focus {
            border-color: #1a73e8;
            outline: none;
            background: white;
        }
        textarea {
            resize: vertical;
            min-height: 100px;
        }
        button[type="submit"] {
            background: #1a73e8;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: background 0.2s;
            align-self: flex-start;
        }
        button[type="submit"]:hover {
            background: #1557b0;
        }
        .back-link {
            margin-top: 20px;
            text-align: center;
        }
        .back-link a {
            text-decoration: none;
            color: #2c3e50;
            font-weight: bold;
            padding: 8px 16px;
            border-radius: 4px;
            background: #eceff1;
            transition: background 0.2s, color 0.2s;
        }
        .back-link a:hover {
            background: #2c3e50;
            color: white;
        }
        @media (max-width: 768px) {
            body {
                padding: 20px;
            }
            .container {
                padding: 15px;
            }
            h2 {
                font-size: 24px;
            }
            button[type="submit"] {
                width: 100%;
                align-self: stretch;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <c:choose>
            <c:when test="${not empty sch}">
                <h2>Edit Scholarship</h2>
                <form method="post" action="${pageContext.request.contextPath}/scholarship">
                    <input type="hidden" name="id" value="${sch.scholarshipId}"/>
                    <label for="title">Title</label>
                    <input type="text" id="title" name="title" value="${sch.title}" required />
                    <label for="description">Description</label>
                    <textarea id="description" name="description" required>${sch.description}</textarea>
                    <label for="eligibility">Eligibility</label>
                    <textarea id="eligibility" name="eligibility" required>${sch.eligibilityCriteria}</textarea>
                    <label for="amount">Amount</label>
                    <input type="number" id="amount" step="0.01" name="amount" value="${sch.amount}" required />
                    <label for="deadline">Deadline (YYYY-MM-DD)</label>
                    <input type="date" id="deadline" name="deadline" value="${sch.applicationDeadline}" required />
                    <button type="submit">Save</button>
                </form>
            </c:when>
            <c:otherwise>
                <h2>New Scholarship</h2>
                <form method="post" action="${pageContext.request.contextPath}/scholarship">
                    <label for="title">Title</label>
                    <input type="text" id="title" name="title" required />
                    <label for="description">Description</label>
                    <textarea id="description" name="description" required></textarea>
                    <label for="eligibility">Eligibility</label>
                    <textarea id="eligibility" name="eligibility" required></textarea>
                    <label for="amount">Amount</label>
                    <input type="number" id="amount" step="0.01" name="amount" required />
                    <label for="deadline">Deadline (YYYY-MM-DD)</label>
                    <input type="date" id="deadline" name="deadline" required />
                    <button type="submit">Save</button>
                </form>
            </c:otherwise>
        </c:choose>
        <p class="back-link"><a href="${pageContext.request.contextPath}/scholarship">Back to List</a></p>
    </div>
</body>
</html>