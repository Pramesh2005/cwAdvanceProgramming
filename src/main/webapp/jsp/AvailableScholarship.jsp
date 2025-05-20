<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Available Scholarships</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/AvailableScholarship.css">
   
</head>
<body>
    <jsp:include page="/jsp/header.jsp" />
    <div class="main-content">
        <div class="container">
            <h2 class="section-title">Available Scholarships</h2>
            
            <!-- Search Form -->
            <div class="search-form">
                <form action="${pageContext.request.contextPath}/available-scholarships" method="get">
                    <input type="text" name="keyword" placeholder="Search by title" value="${param.keyword}" />
                    <button type="submit">Search</button>
                </form>
            </div>
            
            <c:if test="${not empty error}">
                <div class="debug-info">
                    Error: <c:out value="${error}" />
                </div>
            </c:if>
            <c:choose>
                <c:when test="${not empty list}">
                    <div class="scholarship-cards">
                        <c:forEach var="s" items="${list}">
                            <div class="card">
                                <h3><c:out value="${s.title}" /></h3>
                                <p><strong>Description:</strong> <c:out value="${s.description}" /></p>
                                <p><strong>Eligibility:</strong> <c:out value="${s.eligibilityCriteria}" /></p>
                                <p><strong>Amount:</strong> $<c:out value="${s.amount}" /></p>
                                <p><strong>Deadline:</strong> <c:out value="${s.applicationDeadline}" /></p>
                                <a href="${pageContext.request.contextPath}/apply?scholarshipId=${s.scholarshipId}">Apply</a>
                            </div>
                        </c:forEach>
                    </div>
                </c:when>
                <c:otherwise>
                    <c:choose>
                        <c:when test="${not empty param.keyword}">
                            <p class="no-scholarships">No scholarships found for "${param.keyword}"</p>
                        </c:when>
                        <c:otherwise>
                            <p class="no-scholarships">No scholarships available</p>
                        </c:otherwise>
                    </c:choose>
                </c:otherwise>
            </c:choose>

        </div>
    </div>
    <jsp:include page="/jsp/footer.jsp" />
</body>
</html>