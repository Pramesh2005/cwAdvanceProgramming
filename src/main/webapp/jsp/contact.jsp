<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String firstname = (String) session.getAttribute("first_name");
    String lastname = (String) session.getAttribute("last_name");
    String fullname = firstname + " " + lastname;
    String email = (String) session.getAttribute("email");
%>
<html>
<head>
  <title>Contact Us</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/contact.css">
</head>
<body>
  <jsp:include page="/jsp/header.jsp" />

  <div class="container">
    <div class="contact-container">
      <h2>Contact Us</h2>
      <c:if test="${not empty success}">
        <p class="success-message">${success}</p>
      </c:if>
      <form method="post" action="${pageContext.request.contextPath}/contact">
        <input type="text" name="name" placeholder="Your Name" value="<%= fullname %>" readonly  />
        <input type="email" name="email" placeholder="Your Email" value="<%= email %>" readonly />
        <input type="text" name="subject" placeholder="Subject" required />
        <textarea name="message" placeholder="Write your message here..." required></textarea>
        <button type="submit">Send</button>
      </form>
    </div>
  </div>

  <jsp:include page="/jsp/footer.jsp" />
</body>
</html>
