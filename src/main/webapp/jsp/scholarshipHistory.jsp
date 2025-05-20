<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Scholarship Application History</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/scholarshipHistory.css">
</head>
<body>
    <jsp:include page="/jsp/header.jsp" />
    <div class="main-content">
        <div class="container">
            <h2 class="section-title">Scholarship Application History</h2>
            
            <c:if test="${not empty error}">
                <div class="debug-info">
                    Error: <c:out value="${error}" />
                </div>
            </c:if>
            
        
            
            <c:choose>
                <c:when test="${not empty applications}">
                    <table class="history-table">
                        <thead>
                            <tr>
                                <th>Full Name</th>
                                <th>Email</th>
                                <th>Scholarship Title</th>
                                <th>Submitted At</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="app" items="${applications}">
                                <tr>
                                    <td><c:out value="${app.fullname}" default="N/A" /></td>
                                    <td><c:out value="${app.email}" default="N/A" /></td>
                                    <td><c:out value="${app.scholarshipTitle}" default="Unknown" /></td>
                                    <td><c:out value="${app.submittedAt}" default="N/A" /></td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/edit-delete-application?action=edit&id=${app.id}" class="action-btn edit-btn">Edit</a>
                                        <a href="${pageContext.request.contextPath}/edit-delete-application?action=delete&id=${app.id}" class="action-btn delete-btn" onclick="return confirm('Are you sure you want to delete this application?');">Delete</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:when>
                <c:otherwise>
                    <p class="no-applications">No scholarship applications found.</p>
                </c:otherwise>
            </c:choose>
            
            <div class="action-links">
                <a href="${pageContext.request.contextPath}/available-scholarships">Back to Scholarships</a>
                <a href="${pageContext.request.contextPath}/logout">Logout</a>
            </div>
        </div>
    </div>
    <jsp:include page="/jsp/footer.jsp" />
</body>
</html>