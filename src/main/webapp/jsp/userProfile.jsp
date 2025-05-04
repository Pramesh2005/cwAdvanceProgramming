<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Example user data (in a real project, get from session/database)
    String username = "John Doe";
    String email = "johndoe@example.com";
    String phone = "123-456-7890";
    String address = "123 Main Street, City, Country";
    String profileImage = "https://imgv3.fotor.com/images/slider-image/A-clear-close-up-photo-of-a-woman.jpg"; // Example profile image URL
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Profile</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f8;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .profile-container {
            background: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0px 4px 12px rgba(0,0,0,0.1);
            width: 400px;
            text-align: center;
        }
        .profile-container img {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            object-fit: cover;
            margin-bottom: 20px;
            border: 3px solid #4CAF50;
        }
        .profile-container h2 {
            margin: 0;
            color: #333;
        }
        .profile-info {
            margin-top: 20px;
            text-align: left;
        }
        .profile-info p {
            margin: 10px 0;
            color: #555;
            font-size: 16px;
        }
        .profile-info label {
            font-weight: bold;
            color: #222;
        }
    </style>
</head>
<body>

<div class="profile-container">
    <!-- Only one profile image -->
    <img src="<%= profileImage %>" alt="Profile Image">

    <h2><%= username %></h2>

    <div class="profile-info">
        <p><label>Email:</label> <%= email %></p>
        <p><label>Phone:</label> <%= phone %></p>
        <p><label>Address:</label> <%= address %></p>
    </div>
</div>

</body>
</html>
