<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String firstname = (String) session.getAttribute("first_name");
String lastname = (String) session.getAttribute("last_name");
String fullname = firstname + " " + lastname;
String email = (String) session.getAttribute("email");

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        .main-content {
            padding: 40px;
            background-color:white;
            min-height: calc(100vh - 100px); /* Adjust based on header/footer heights */
        }
        .profile-container {
            background: #fff;
            padding: 40px;
            border-radius: 16px;
            box-shadow: 0px 10px 30px rgba(0,0,0,0.15);
            width: 100%;
            max-width: 450px;
            margin: 0 auto;
            text-align: center;
            transition: transform 0.3s ease;
        }
        .profile-container:hover {
            transform: translateY(-5px);
        }
        .profile-image {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            object-fit: cover;
            margin-bottom: 20px;
            border: 4px solid #4CAF50;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .profile-image:hover {
            transform: scale(1.1);
            box-shadow: 0px 8px 20px rgba(0,0,0,0.2);
        }
        .profile-container h2 {
            margin: 0;
            color: #222;
            font-size: 28px;
            font-weight: 600;
        }
        .profile-info {
            margin-top: 25px;
            text-align: left;
        }
        .profile-info ul {
            list-style: none;
            padding: 0;
        }
        .profile-info li {
            display: flex;
            align-items: center;
            margin: 15px 0;
            font-size: 16px;
            color: #555;
        }
        .profile-info i {
            margin-right: 10px;
            color: #4CAF50;
            font-size: 18px;
        }
        .profile-info label {
            font-weight: bold;
            color: #222;
            margin-right: 5px;
        }
        .action-buttons {
            margin-top: 30px;
            display: flex;
            justify-content: center;
            gap: 15px;
        }
        .action-buttons a {
            text-decoration: none;
            color: #fff;
            background: #4CAF50;
            padding: 10px 20px;
            border-radius: 25px;
            font-weight: 500;
            transition: background 0.3s ease, transform 0.3s ease;
        }
        .action-buttons a:hover {
            background: #45a049;
            transform: translateY(-3px);
        }
        @media (max-width: 500px) {
            .main-content {
                padding: 20px;
            }
            .profile-container {
                padding: 20px;
            }
            .profile-image {
                width: 100px;
                height: 100px;
            }
            .profile-container h2 {
                font-size: 24px;
            }
            .profile-info li {
                font-size: 14px;
            }
            .action-buttons a {
                padding: 8px 16px;
            }
        }
    </style>
</head>
<body>
    <jsp:include page="/jsp/header.jsp" />
    <div class="main-content">
        <div class="profile-container">
            <img src="${pageContext.request.contextPath}/photo/art.png" alt="Profile Image" class="profile-image">
            <h1><%=fullname %></h1>
            <div class="profile-info">
                <ul>
                	<li><i class="fa-solid fa-user"></i><label>First Name:</label> <%= firstname %></li>
                	<li><i class="fa-solid fa-user"></i><label>Last Name:</label> <%= lastname %></li>
                    <li><i class="fas fa-envelope"></i><label>Email:</label> <%= email %></li>
                    
                </ul>
            </div>
            <div class="action-buttons">
                <a href="#">Edit Profile</a>
                <a href="${pageContext.request.contextPath}/logout">Logout</a>
            </div>
        </div>
    </div>
    <jsp:include page="/jsp/footer.jsp" />
</body>
</html>