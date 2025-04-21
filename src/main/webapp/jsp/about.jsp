<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>About Us-Scholarship Management System</title>
    <link rel="stylesheet" href="/ScholarshipManagementMVC/css/about.css">
</head>
<body>
   <jsp:include page="/jsp/header.jsp" />
<!-- Hero Section -->
<div class="hero">
    <div class="hero-overlay">
        <h1>About Us</h1>
    </div>
</div>

<!-- Main Container -->
<div class="container">

    <!-- Mission -->
    <div class="section-heading">Our Mission</div>
    <p class="section-text">
        To provide equal opportunities for deserving students by managing and distributing scholarships fairly and transparently.
    </p>

    <!-- Features -->
    <div class="features-grid">
        <div class="feature-card">
            <div class="feature-icon">🏅</div>
            <div class="feature-title">Transparent Process</div>
            <p class="feature-desc">Fair and verified system for scholarship allocation.</p>
        </div>
        <div class="feature-card">
            <div class="feature-icon">👥</div>
            <div class="feature-title">Supportive Team</div>
            <p class="feature-desc">Dedicated staff for applicant assistance and help.</p>
        </div>
        <div class="feature-card">
            <div class="feature-icon">🕒</div>
            <div class="feature-title">On-time Results</div>
            <p class="feature-desc">Timely updates and results for every applicant.</p>
        </div>
        <div class="feature-card">
            <div class="feature-icon">❤️</div>
            <div class="feature-title">Student First</div>
            <p class="feature-desc">Everything we do is centered around student needs.</p>
        </div>
    </div>

    <!-- Services -->
    <div class="section-heading">Our Services</div>
    <div class="services-grid">
        <div class="service-card">
            <div class="service-title">Student Services</div>
            <ul class="service-list">
                <li>Scholarship Application Portal</li>
                <li>Application Status Tracking</li>
                <li>Result Notifications</li>
                <li>Appeal Submissions</li>
                <li>Support & FAQs</li>
            </ul>
        </div>
        <div class="service-card">
            <div class="service-title">Admin Services</div>
            <ul class="service-list">
                <li>Manage Applications</li>
                <li>Verify Eligibility</li>
                <li>Publish Results</li>
                <li>Report Generation</li>
                <li>User Role Management</li>
            </ul>
        </div>
    </div>

    <!-- History -->
    <div class="history">
        <div class="section-heading">Our History</div>
        <p>
            The Scholarship Management System was launched in 2020 with the goal of digitizing and streamlining the scholarship process for students and institutions. What started as a simple portal now serves thousands of applicants across the region.
        </p>
        <p>
            With continuous innovation and a focus on user experience, we aim to make scholarship access easier, faster, and more transparent than ever before.
        </p>
    </div>
</div>
<jsp:include page="/jsp/footer.jsp" />
</body>
</html>
