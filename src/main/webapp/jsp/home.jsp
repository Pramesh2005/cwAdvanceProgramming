<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <link rel="stylesheet" type="text/css" href="/ScholarshipManagementMVC/css/home.css">
<html><body>
<jsp:include page="/jsp/header.jsp" />
   <!-- Main content -->
    <div class="main-content">
        
        <!-- Hero Section -->
  <!-- Hero Section -->
    <section class="hero">
        <img src="/ScholarshipManagementMVC/photo/Scholarship3.jpg" alt="Scholarship" class="hero-image">
        <div class="hero-content">
            <h1>Your Future Begins with a Scholarship</h1>
            <p>"Empowering Students to Achieve Their Dreams."</p>
        </div>
    </section>

    <!-- Available Scholarships Section -->
    <section class="scholarships">
        <div class="container">
            <h2 class="section-title">Available Scholarships</h2>
            <div class="scholarship-cards">
                <!-- Scholarship 1 -->
                <div class="card">
                    <img src="/ScholarshipManagementMVC/photo/tech.jpg" alt="Tech Scholarship">
                    <h3>Tech Innovation Scholarship</h3>
                    <p>A scholarship for students pursuing a degree in technology, fostering innovation in the tech field.</p>
                </div>

                <!-- Scholarship 2 -->
                <div class="card">
                    <img src="/ScholarshipManagementMVC/photo/art.png" alt="Art Scholarship">
                    <h3>Creative Arts Scholarship</h3>
                    <p>This scholarship supports students passionate about the arts, helping them further their creative endeavors.</p>
                </div>

                <!-- Scholarship 3 -->
                <div class="card">
                    <img src="/ScholarshipManagementMVC/photo/Scientists.jpg" alt="Science Scholarship">
                    <h3>Future Scientists Scholarship</h3>
                    <p>A scholarship for students pursuing degrees in scientific fields, promoting research and innovation in science.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Featured Scholarships Section -->
    <section class="featured-scholarships">
        <div class="container">
            <h2 class="section-title">Featured Scholarships</h2>
            <div class="scholarship-cards">
                <!-- Featured Scholarship 1 -->
                <div class="card">
                    <img src="/ScholarshipManagementMVC/photo/Engineering.jpg" alt="Engineering Scholarship">
                    <h3>Engineering Excellence Scholarship</h3>
                    <p>For exceptional students pursuing a degree in engineering, shaping the future of technology.</p>
                </div>

                <!-- Featured Scholarship 2 -->
                <div class="card">
                    <img src="/ScholarshipManagementMVC/photo/Medical.jpg" alt="Medical Scholarship">
                    <h3>Medical Pioneers Scholarship</h3>
                    <p>For medical students who are dedicated to advancing healthcare and medical research.</p>
                </div>

                <!-- Featured Scholarship 3 -->
                <div class="card">
                    <img src="/ScholarshipManagementMVC/photo/enviroment.png" alt="Environmental Scholarship">
                    <h3>Environmental Stewardship Scholarship</h3>
                    <p>For students working to combat climate change and promote sustainability efforts in environmental science.</p>
                </div>
            </div>
        </div>
    </section>

  
   
    </div>

<h2>Available Scholarships</h2>
<c:choose>
    <c:when test="${not empty list}">
        <table border="1">
            <tr><th>Title</th><th>Deadline</th><th>Action</th></tr>
            <c:forEach var="s" items="${list}">
                <tr>
                    <td>${s.title}</td>
                    <td>${s.applicationDeadline}</td>
                    <td><a href="apply?scholarshipId=${s.scholarshipId}">Apply</a></td>
                </tr>
            </c:forEach>
        </table>
    </c:when>
    <c:otherwise>
        <p>No scholarships available</p>
    </c:otherwise>
</c:choose>
<p><a href="application_list.jsp">My Applications</a> | <a href="${pageContext.request.contextPath}/logout">Logout</a></p>
<jsp:include page="/jsp/footer.jsp" />
</body></html>