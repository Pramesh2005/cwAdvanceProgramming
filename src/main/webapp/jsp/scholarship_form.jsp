<!-- src/main/webapp/jsp/scholarship_form.jsp -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Scholarship's Form</title>
    
</head>
<body>

<c:choose>
    <c:when test="${not empty sch}">
        <h2>Edit Scholarship's</h2>
        <form method="post" action="scholarship">
            <input type="hidden" name="id" value="${sch.scholarshipId}"/>
        </form>
    </c:when>
    <c:otherwise>
        <h2>New Scholarship!</h2>
        
    </c:otherwise>
</c:choose>
<form method="post" action="${pageContext.request.contextPath}/scholarship">
    Title: <input type="text" name="title" value="${sch.title}" /><br/>
    Description: <textarea name="description">${sch.description}</textarea><br/>
    Eligibility: <textarea name="eligibility">${sch.eligibilityCriteria}</textarea><br/>
    Amount: <input type="number" step="0.01" name="amount" value="${sch.amount}" /><br/>
    Deadline (YYYY-MM-DD): <input type="date" name="deadline" value="${sch.applicationDeadline}" /><br/>
    <button type="submit">Save</button>
</form>

<p><a href="${pageContext.request.contextPath}/scholarship">Back to list's</a></p>

</body>
</html>
