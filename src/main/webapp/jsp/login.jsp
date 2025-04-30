<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title>Login</title>
  <link rel="stylesheet" href="/ScholarshipManagementMVC/css/login.css">
</head>
<body>
  <div class="login-container">
    <h2>Login</h2>
    <form method="post" action="${pageContext.request.contextPath}/login">
      <input type="text" name="email" placeholder="Enter your Email" required />
      <input type="password" name="password" placeholder="Enter your Password" required />
      <button type="submit">Login</button>
    </form>
    <c:if test="${not empty error}">
      <p class="error">${error}</p>
    </c:if>
    <div class="register-link">
      <p>Don't have an account? <a href=${pageContext.request.contextPath}/register>Register</a></p>
      
    </div>
  </div>
</body>
</html>