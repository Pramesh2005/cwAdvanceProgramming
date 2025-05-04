<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Available Scholarships</title>
    <link rel="stylesheet" type="text/css" href="/try1/css/scholarshipStyle.css">
</head>
<body>
<jsp:include page="/jsp/header.jsp" />
    <section class="scholarship-section">
        <h2>Available Scholarships</h2>
        <div class="scholarship-grid">
            
            <div class="scholarship-card">
                <img src="images/merit.jpg" alt="Merit Scholarship">
                <h3>Merit-Based Scholarship</h3>
                <p>For students with outstanding academic achievements.</p>
                <a href="scholarshipForm.jsp" class="apply-btn">Apply Now</a>
            </div>

            <div class="scholarship-card">
                <img src="images/need.jpg" alt="Need-Based Scholarship">
                <h3>Need-Based Scholarship</h3>
                <p>Financial aid for students from low-income families.</p>
                <a href="scholarshipForm.jsp" class="apply-btn">Apply Now</a>
            </div>

            <div class="scholarship-card">
                <img src="images/sports.jpg" alt="Sports Scholarship">
                <h3>Sports Scholarship</h3>
                <p>Awarded to talented athletes with excellent sports records.</p>
                <a href="scholarshipForm.jsp" class="apply-btn">Apply Now</a>
            </div>

            <div class="scholarship-card">
                <img src="images/women-tech.jpg" alt="Women in Tech Scholarship">
                <h3>Women in Tech Scholarship</h3>
                <p>Encouraging women to pursue careers in technology fields.</p>
                <a href="scholarshipForm.jsp" class="apply-btn">Apply Now</a>
            </div>

            <div class="scholarship-card">
                <img src="images/community.jpg" alt="Community Service Scholarship">
                <h3>Community Service Scholarship</h3>
                <p>Recognizes students who demonstrate exceptional community involvement.</p>
                <a href="scholarshipForm.jsp" class="apply-btn">Apply Now</a>
            </div>

            <div class="scholarship-card">
                <img src="images/international.jpg" alt="International Scholarship">
                <h3>International Student Scholarship</h3>
                <p>Assists international students who wish to study abroad.</p>
                <a href="scholarshipForm.jsp" class="apply-btn">Apply Now</a>
            </div>

        </div>
    </section>
<jsp:include page="/jsp/footer.jsp" />
</body>
</html>
