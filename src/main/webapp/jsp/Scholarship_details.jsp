<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Scholarship Details</title>
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
        <h1>Scholarship Details</h1>
        <div class="details">
            <p><strong>ID:</strong> ${scholarship.scholarshipId}</p>
            <p><strong>Title:</strong> ${scholarship.title}</p>
            <p><strong>Description:</strong> ${scholarship.description}</p>
            <p><strong>Eligibility Criteria:</strong> ${scholarship.eligibilityCriteria}</p>
            <p><strong>Amount:</strong> ${scholarship.amount}</p>
            <p><strong>Application Deadline:</strong> ${scholarship.applicationDeadline}</p>
            <p><strong>Created By:</strong> ${scholarship.createdBy}</p>
        </div>
        <a href="/admin/scholarship?action=list" class="back-link">Back to List</a>
    </div>
</body>
</html>