<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="/ScholarshipManagementMVC/css/contact.css">
<html>
<head>
  <title>Contact Us</title>

</head>
<body>
  <jsp:include page="/jsp/header.jsp" />

  <div class="container">
    <div class="contact-container">
      <h2>Contact Us</h2>
      <c:if test="${not empty success}">
        <p class="success-message">${success}</p>
      </c:if>
      <form method="post" action="contact">
        <input type="text" name="name" placeholder="Your Name" required />
        <input type="email" name="email" placeholder="Your Email" required />
        <input type="text" name="subject" placeholder="Subject" required />
        <textarea name="message" placeholder="Write your message here..." required></textarea>
        <button type="submit">Send</button>
      </form>
    </div>
  </div>

  <jsp:include page="/jsp/footer.jsp" />
</body>
</html>
