<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Scholarship Application</title>
    <link rel="stylesheet" type="text/css" href="/try1/css/scholarshipForm.css">
</head>
<body>
<jsp:include page="/page/header.jsp" />
<div class="container">
    <h1 class="title">Apply for Scholarship</h1>
    <form action="SubmitScholarship.jsp" method="post">
        <!-- Full Name -->
        <div>
            <label for="fullName">Full Name</label>
            <input type="text" name="fullName" id="fullName"  placeholder="Enter Your Full Name" required />
        </div>

        <!-- Gender & Age -->
        <div class="row">
            <div>
                <label for="gender">Gender</label>
                <input type="text" name="gender" id="gender" placeholder="Male / Female" required />
            </div>
            <div>
                <label for="age">Age</label>
                <input type="number" name="age" id="age" placeholder= "Enter Your Age" required />
            </div>
        </div>

        <!-- Email -->
        <div>
            <label for="email">Email</label>
            <input type="email" name="email" id="email" placeholder= "Enter Your Email" required />
        </div>

        <!-- GPA -->
        <div>
            <label for="gpa">GPA</label>
            <input type="number" name="gpa" id="gpa" step="0.01" placeholder= "Enter Your GPA"required />
        </div>

        <!-- Reason -->
        <div>
            <label for="reason">Reason for Applying</label>
            <textarea name="reason" id="reason" rows="5" placeholder="Why do you want this scholarship?" required></textarea>
        </div>

        <!-- Submit -->
        <button type="submit">Apply for Scholarship</button>
    </form>
</div>

<jsp:include page="/page/footer.jsp" />
</body>
</html>
