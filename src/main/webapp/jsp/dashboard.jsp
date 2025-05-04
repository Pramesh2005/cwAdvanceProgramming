<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <title>Admin Dashboard</title>
 
</head>
<link rel="stylesheet" type="text/css" href="/ScholarshipManagementMVC/css/dashboard.css">
<body>

  <div class="sidebar">
    <h2>Admin Panel</h2>
    <a href="scholarship_list.jsp">🎓 Manage Scholarships</a>
    <a href="${pageContext.request.contextPath}/scholarship">📄 View Applications</a>
    <a href="contact">📨 Contact Messages</a>
    <a href="${pageContext.request.contextPath}/logout">🚪 Logout</a>
  </div>

  <div class="main-content">
    <h1>Welcome, Admin</h1>

    <div class="card">
      <h3>Dashboard Overview</h3>
      <p>This is your control center. From here, you can manage scholarships, view student applications, respond to messages, and monitor activity.</p>
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

</body>
</html>
