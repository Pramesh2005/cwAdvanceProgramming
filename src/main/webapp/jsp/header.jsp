<!-- header.jsp -->
<link rel="stylesheet" type="text/css" href="/ScholarshipManagementMVC/css/headerStyle.css">



<div class="main-header">
    <div class="container">
        <h1>Scholarship Management System</h1>
        <nav>
            <ul class="nav-links">
                <li><a href="${pageContext.request.contextPath}/jsp/home.jsp">Home</a></li>
                <li><a href="${pageContext.request.contextPath}/page/AvailableScholarship.jsp">Available Scholarship</a></li> <!-- Page doesnt exists need to change -->
                <li><a href="${pageContext.request.contextPath}/page/applyScholarship.jsp">Apply Scholarship</a></li><!-- Page doesnt exists need to change -->
                <li><a href="${pageContext.request.contextPath}/jsp/contact.jsp">Contact Us</a></li>
                <li><a href="${pageContext.request.contextPath}/jsp/about.jsp">About Us</a></li>
                <li><a href="${pageContext.request.contextPath}/page/registerUser.jsp">Register User</a></li><!-- Page doesnt exists need to change -->
               <li> <a href="${pageContext.request.contextPath}/logout">Logout</a></li>
            </ul>
        </nav>
    </div>
</div>
