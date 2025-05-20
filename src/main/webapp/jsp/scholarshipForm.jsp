<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String firstname = (String) session.getAttribute("first_name");
    String lastname = (String) session.getAttribute("last_name");
    String fullname = firstname + " " + lastname;
    String email = (String) session.getAttribute("email");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Scholarship Application Form</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/scholarshipForm.css">
</head>
<body>
    <header>
        <jsp:include page="/jsp/header.jsp" />
    </header>

    <main>
        <div class="form-container">
            <h2>Apply for <c:out value="${scholarship.title}" /></h2>
            <form action="${pageContext.request.contextPath}/SubmitScholarshipServlet" method="post" enctype="multipart/form-data">
                <input type="hidden" name="scholarshipId" value="${scholarship.scholarshipId}">
                <div class="form-group">
                    <label for="fullname">Full Name</label>
                    <input type="text" name="fullname" id="fullname" value="<%= fullname %>" readonly>
                </div>
                <div class="form-group">
                    <label for="email">Email Address</label>
                    <input type="email" name="email" id="email" value="<%= email %>" readonly>
                </div>
                <div class="form-group">
                    <label for="file">Upload Document (PDF, Max 2MB)</label>
                    <input type="file" name="document" id="file" accept=".pdf" required>
                </div>
                <button type="submit">Submit Application</button>
            </form>
        </div>
    </main>

    <footer>
        <jsp:include page="/jsp/footer.jsp" />
    </footer>
</body>
</html>