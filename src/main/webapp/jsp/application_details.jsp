<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Application Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h1 {
            text-align: center;
            color: #333;
        }
        .details p {
            margin: 10px 0;
            color: #333;
        }
        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Application Details</h1>
        <div class="details">
            <p><strong>ID:</strong> ${application.applicationId}</p>
            <p><strong>User ID:</strong> ${application.userId}</p>
            <p><strong>Scholarship ID:</strong> ${application.scholarshipId}</p>
            <p><strong>Applied At:</strong> ${application.appliedAt}</p>
            <p><strong>Status:</strong> ${application.status}</p>
            <p><strong>Remarks:</strong> ${application.remarks}</p>
        </div>
        <a href="/admin/applications" class="back-link">Back to List</a>
    </div>
</body>
</html>