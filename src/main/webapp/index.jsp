<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Scholarship Management System</title>
    <link rel="stylesheet" type="text/css" href="css/home.css">
</head>
<body>
<jsp:include page="/page/header.jsp" />


    <!-- Main content -->
    <div class="main-content">
        
        <!-- Hero Section -->
  <!-- Hero Section -->
    <section class="hero">
        <img src="photo/Scholarship3.jpg" alt="Scholarship" class="hero-image">
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
                    <img src="photo/tech.jpg" alt="Tech Scholarship">
                    <h3>Tech Innovation Scholarship</h3>
                    <p>A scholarship for students pursuing a degree in technology, fostering innovation in the tech field.</p>
                </div>

                <!-- Scholarship 2 -->
                <div class="card">
                    <img src="photo/art.png" alt="Art Scholarship">
                    <h3>Creative Arts Scholarship</h3>
                    <p>This scholarship supports students passionate about the arts, helping them further their creative endeavors.</p>
                </div>

                <!-- Scholarship 3 -->
                <div class="card">
                    <img src="photo/Scientists.jpg" alt="Science Scholarship">
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
                    <img src="photo/Engineering.jpg" alt="Engineering Scholarship">
                    <h3>Engineering Excellence Scholarship</h3>
                    <p>For exceptional students pursuing a degree in engineering, shaping the future of technology.</p>
                </div>

                <!-- Featured Scholarship 2 -->
                <div class="card">
                    <img src="photo/Medical.jpg" alt="Medical Scholarship">
                    <h3>Medical Pioneers Scholarship</h3>
                    <p>For medical students who are dedicated to advancing healthcare and medical research.</p>
                </div>

                <!-- Featured Scholarship 3 -->
                <div class="card">
                    <img src="photo/enviroment.png" alt="Environmental Scholarship">
                    <h3>Environmental Stewardship Scholarship</h3>
                    <p>For students working to combat climate change and promote sustainability efforts in environmental science.</p>
                </div>
            </div>
        </div>
    </section>

  
   
    </div>
<jsp:include page="/page/footer.jsp" />

</body>
</html>
