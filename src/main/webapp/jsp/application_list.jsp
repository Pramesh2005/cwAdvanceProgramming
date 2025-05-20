<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Applications</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/application_list.css">
    </head>
<body>
    <jsp:include page="/jsp/header.jsp" />
    <div class="main-content">
        <div class="container">
            <c:if test="${not isAdmin}">
                <c:redirect url="/dashboard"/>
            </c:if>
            
            <h2 class="section-title">All Applications</h2>
            
            <c:if test="${not empty error}">
                <div class="debug-info">
                    Error: <c:out value="${error}" />
                </div>
            </c:if>
            
            <c:choose>
                <c:when test="${not empty apps}">
                    <table class="history-table">
                        <thead>
                            <tr>
                                <th>Full Name</th>
                                <th>Email</th>
                                <th>Scholarship</th>
                                <th>Submitted At</th>
                                <th>Document</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="app" items="${apps}">
                                <tr>
                                    <td><c:out value="${app.fullname}" default="N/A" /></td>
                                    <td><c:out value="${app.email}" default="N/A" /></td>
                                    <td><c:out value="${app.scholarshipTitle}" default="Unknown" /></td>
                                    <td><c:out value="${app.submittedAt}" default="N/A" /></td>
                                    <td>
                                        <c:if test="${not empty app.documentPath}">
                                            <a href="${pageContext.request.contextPath}/download?file=${app.documentPath}" class="action-btn view-btn">View</a>
                                        </c:if>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:when>
                <c:otherwise>
                    <p class="no-applications">No applications found.</p>
                </c:otherwise>
            </c:choose>
            
            <div class="action-links">
                <a href="${pageContext.request.contextPath}/dashboard">Back to Dashboard</a>
                <a href="${pageContext.request.contextPath}/logout">Logout</a>
            </div>
        </div>
    </div>
    <jsp:include page="/jsp/footer.jsp" />
</body>
</html>