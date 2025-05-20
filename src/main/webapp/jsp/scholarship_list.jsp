<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title>Manage Scholarships</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/scholarship_list.css">
</head>
<body>
  <div class="container">
    <h1>Manage Scholarships</h1>
    <c:choose>
      <c:when test="${empty list}">
        <p class="no-scholarships">No scholarships found.</p>
      </c:when>
      <c:otherwise>
        <c:forEach var="s" items="${list}">
          <div class="scholarship-item">
            <span class="scholarship-title">${s.title}</span>
            <div class="scholarship-actions">
              <a href="scholarship?action=edit&id=${s.scholarshipId}" class="edit">Edit</a>
              <a href="scholarship?action=delete&id=${s.scholarshipId}" class="delete">Delete</a>
            </div>
          </div>
        </c:forEach>
      </c:otherwise>
    </c:choose>
    <div class="action-links">
      <a href="${pageContext.request.contextPath}/jsp/scholarship_form.jsp?action=new" class="create">Create New</a>
      <a href="${pageContext.request.contextPath}/dashboard" class="dashboard">Dashboard</a>
      <a href="${pageContext.request.contextPath}/logout" class="logout">Logout</a>
    </div>
  </div>
</body>
</html>