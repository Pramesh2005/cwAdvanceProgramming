<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title>Contact Messages</title>
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/contact-message.css">
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
    <a href="${pageContext.request.contextPath}/dashboard">Back to Dashboard</a>
  </div>
</body>
</html>