<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Contact Us | Scholarship Management System</title>
  <!-- Link external CSS -->
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/contactStyle.css">
</head>
<body>
   <jsp:include page="/page/header.jsp" />
  <!-- Contact Section -->
  <div class="contact-wrapper">
    <div class="contact-background">
      <div class="contact-container">
        <h1 class="contact-title">Contact Us</h1>
        <div class="contact-grid">
          <!-- Contact Information Column -->
          <div class="contact-info">
            <div class="info-card">
              <div class="info-icon">
                <!-- You can replace with a proper icon image if needed -->
                <img src="${pageContext.request.contextPath}/photo/phone.png" alt="Phone Icon">
              </div>
              <div class="info-text">
                <h3>Phone</h3>
                <p>+977 984204466</p>
              </div>
            </div>
            <div class="info-card">
              <div class="info-icon">
                <img src="${pageContext.request.contextPath}/photo/email.png" alt="Email Icon">
              </div>
              <div class="info-text">
                <h3>Email</h3>
                <p>info@scholarshipsystem.com</p>
              </div>
            </div>
            <div class="info-card">
              <div class="info-icon">
                <img src="${pageContext.request.contextPath}/photo/location.png" alt="Location Icon">
              </div>
              <div class="info-text">
                <h3>Location</h3>
                <p>123 Scholarship Ave</p>
                <p>City, Country</p>
              </div>
            </div>
          </div>
          <!-- Contact Form Column -->
          <div class="contact-form-wrapper">
            <h2>Send Us a Message</h2>
            <form action="ContactController" method="post">
              <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" placeholder="Enter Your Name" required>
              </div>
              <div class="form-group">
                <label for="email">Email: </label>
                <input type="email" id="email" name="email" placeholder="Enter Your Email" required>
              </div>
              <div class="form-group">
                <label for="message">Message:</label>
                <textarea id="message" name="message" placeholder="Enter Your Message" required></textarea>
              </div>
              <button type="submit" class="btn-submit">Send Message</button>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>


<jsp:include page="/page/footer.jsp" />
</body>
</html>
