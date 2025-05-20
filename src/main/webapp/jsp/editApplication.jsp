<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Application</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/editApplication.css">
  
</head>
<body>
    <jsp:include page="/jsp/header.jsp" />
    <div class="main-content">
        <div class="container">
            <h2 class="section-title">Edit Application</h2>
            
            <c:if test="${not empty error}">
                <div class="debug-info">
                    Error: <c:out value="${error}" />
                </div>
            </c:if>

            <form action="${pageContext.request.contextPath}/edit-delete-application" method="post" enctype="multipart/form-data">
                <input type="hidden" name="id" value="${application.id}">
                <div class="form-group">
                    <label for="fullname">Full Name</label>
                    <input type="text" id="fullname" name="fullname" value="${application.fullname}" readonly>
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" value="${application.email}" readonly>
                </div>
                <div class="form-group">
                    <label for="document">Document (PDF, max 2MB)</label>
                    <input type="file" id="document" name="document" accept=".pdf">
                    <c:if test="${not empty application.documentPath}">
                        <p>Current file: ${application.documentPath}</p>
                    </c:if>
                </div>
                <button type="submit" class="submit-btn">Update Application</button>
            </form>
            
            <a href="${pageContext.request.contextPath}/scholarship-history" class="back-link">Back to History</a>
        </div>
    </div>

</body>
</html>