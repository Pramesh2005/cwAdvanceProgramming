<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title>Register</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/register.css">
</head>
<body>
  <div class="register-container">
    <h2>Register Now</h2>
    <form method="POST" action="${pageContext.request.contextPath}/register">
      <input type="text" name="firstName" placeholder="Enter your First Name" required />
      <input type="text" name="lastName" placeholder="Enter your Last Name" required />
      <input type="email" name="email" placeholder="Enter your Email" required />
      <input type="password" name="password" placeholder="Enter your Password" required />
      <button type="submit">Sign Up</button>
    </form>
    <div class="back-login">
      <p>Already have an account? <a href="${pageContext.request.contextPath}/login">Login</a></p>
    </div>
  </div>
</body>
</html>
