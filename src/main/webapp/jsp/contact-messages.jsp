<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title>Contact Messages</title>
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
      max-width: 1200px;
      margin: 0 auto;
    }
    h1 {
      font-size: 32px;
      color: #2c3e50;
      margin-bottom: 20px;
    }
    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
    }
    th, td {
      padding: 12px;
      text-align: left;
      border-bottom: 1px solid #ddd;
    }
    th {
      background: #2c3e50;
      color: white;
    }
    tr:hover {
      background: #f5f5f5;
    }
    .no-messages {
      color: #555;
      font-style: italic;
      margin-top: 20px;
    }
    a {
      display: inline-block;
      margin-top: 20px;
      text-decoration: none;
      color: #2c3e50;
      font-weight: bold;
    }
    a:hover {
      color: #34495e;
    }
    @media (max-width: 768px) {
      body {
        padding: 20px;
      }
      .container {
        padding: 15px;
      }
      h1 {
        font-size: 24px;
      }
    }
  </style>
</head>
<body>
  <div class="container">
    <h1>Contact Messages</h1>
    <c:choose>
      <c:when test="${empty messages}">
        <p class="no-messages">No messages found.</p>
      </c:when>
      <c:otherwise>
        <table>
          <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Subject</th>
            <th>Message</th>
          </tr>
          <c:forEach var="message" items="${messages}">
            <tr>
              <td>${message.messageId}</td>
              <td>${message.name}</td>
              <td>${message.email}</td>
              <td>${message.subject}</td>
              <td>${message.message}</td>
            </tr>
          </c:forEach>
        </table>
      </c:otherwise>
    </c:choose>
    <a href="${pageContext.request.contextPath}/jsp/dashboard.jsp">Back to Dashboard</a>
  </div>
</body>
</html>