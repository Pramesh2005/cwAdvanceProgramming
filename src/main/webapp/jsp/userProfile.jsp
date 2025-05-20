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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/userProfile.css">
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