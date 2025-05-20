<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <title> Admin Dashboard</title>
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/dashboard.css">
</head>
<body>

  <div class="sidebar">
    <h2>Admin Panel</h2>
    <a href="${pageContext.request.contextPath}/scholarship">🎓 Manage A Scholarships</a>
    <a href="${pageContext.request.contextPath}/application">📄 View Applications</a>
    <a href="${pageContext.request.contextPath}/admin/contact-messages">📨 Contact Messages</a>
    <a href="${pageContext.request.contextPath}/logout">🚪 Logout</a>
  </div>

  <div class="main-content">
    <h1>Welcome, Admin</h1>

    <div class="card">
      <h3>Dashboard Overview</h3>
      <p>This is your control center. From here, you can manage/access scholarships, view student applications, respond to messages, and monitor activity.</p>
    </div>

    <div class="card">
      <h3>Tips</h3>
      <ul>
        <li>Check applications regularly</li>
        <li>Update scholarships before deadlines</li>
        <li>Respond to messages promptly</li>
      </ul>
    </div>
  </div>
<div class="card">
  <h3>Scholarship Created Till Now.</h3>
  <p>Scholarship Created is: <strong><span><%= request.getAttribute("totalScholarships") %></span></strong></p>
</div>


</body>
</html>