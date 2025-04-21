<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Contact Us</title>
<style>
  * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
  }

  body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: url('../photo/contact1.jpg') no-repeat center center fixed;
    background-size: cover;
    min-height: 100vh;
    display: flex;
    flex-direction: column;
  }

  .container {
    flex: 1;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 40px 20px;
  }

.contact-container {
  background: rgba(255, 255, 255, 0.3); /* semi-transparent white */
  backdrop-filter: blur(10px);          /* this applies the blur */
  -webkit-backdrop-filter: blur(10px);  /* for Safari */
  padding: 30px;
  border-radius: 10px;
  box-shadow: 0 8px 24px rgba(0, 0, 0, 0.2);
  max-width: 500px;
  width: 100%;
}


  h2 {
    text-align: center;
    margin-bottom: 20px;
    color: #333;
  }

  input[type="text"],
  input[type="email"],
  textarea {
    width: 100%;
    padding: 10px;
    margin: 10px 0;
    border: 1px solid #ccc;
    border-radius: 6px;
    font-size: 14px;
    resize: vertical;
  }

  textarea {
    height: 120px;
  }

  button {
    width: 100%;
    padding: 12px;
    background-color: #007bff;
    color: white;
    font-size: 16px;
    border: none;
    border-radius: 6px;
    cursor: pointer;
    transition: background-color 0.3s ease;
  }

  button:hover {
    background-color: #0056b3;
  }

  .success-message {
    color: green;
    margin-bottom: 15px;
    text-align: center;
  }

 

  @media (max-width: 600px) {
    .contact-container {
      padding: 20px;
    }
  }
</style>

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
