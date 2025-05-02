<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <title> Admin Dashboard</title>
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background: #f4f6f8;
      display: flex;
      min-height: 100vh;
    }

    .sidebar {
      width: 240px;
      background: linear-gradient(to bottom, #2c3e50, #34495e);
      color: #ecf0f1;
      padding: 30px 20px;
      display: flex;
      flex-direction: column;
      box-shadow: 2px 0 8px rgba(0, 0, 0, 0.1);
    }

    .sidebar h2 {
      font-size: 22px;
      margin-bottom: 40px;
      text-align: center;
      color: #ecf0f1;
    }

    .sidebar a {
      text-decoration: none;
      color: #ecf0f1;
      background-color: transparent;
      padding: 12px 20px;
      margin: 8px 0;
      border-radius: 8px;
      transition: background-color 0.3s ease;
      display: block;
    }

    .sidebar a:hover {
      background-color: rgba(255, 255, 255, 0.1);
    }

    .main-content {
      flex: 1;
      padding: 40px;
    }

    .main-content h1 {
      font-size: 32px;
      color: #2c3e50;
      margin-bottom: 20px;
    }

    .card {
      background: white;
      padding: 25px;
      border-radius: 12px;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
      margin-bottom: 20px;
    }

    @media (max-width: 768px) {
      .sidebar {
        display: none;
      }
      .main-content {
        padding: 20px;
      }
    }
  </style>
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

</body>
</html>