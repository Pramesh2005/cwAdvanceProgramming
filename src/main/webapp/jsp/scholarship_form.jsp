<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Scholarship Form</title>
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/scholarship_form.css">
</head>
<body>
    <div class="container">
        <c:choose>
            <c:when test="${not empty sch}">
                <h2>Edit Scholarship</h2>
                <form method="post" action="${pageContext.request.contextPath}/scholarship">
                    <input type="hidden" name="id" value="${sch.scholarshipId}"/>
                    <label for="title">Title</label>
                    <input type="text" id="title" name="title" value="${sch.title}" required />
                    <label for="description">Description</label>
                    <textarea id="description" name="description" required>${sch.description}</textarea>
                    <label for="eligibility">Eligibility</label>
                    <textarea id="eligibility" name="eligibility" required>${sch.eligibilityCriteria}</textarea>
                    <label for="amount">Amount</label>
                    <input type="number" id="amount" step="0.01" name="amount" value="${sch.amount}" required />
                    <label for="deadline">Deadline (YYYY-MM-DD)</label>
                    <input type="date" id="deadline" name="deadline" value="${sch.applicationDeadline}" required />
                    <button type="submit">Update</button>
                </form>
            </c:when>
            <c:otherwise>
                <h2>New Scholarship</h2>
                <form method="post" action="${pageContext.request.contextPath}/scholarship">
                    <label for="title">Title</label>
                    <input type="text" id="title" name="title" required />
                    <label for="description">Description</label>
                    <textarea id="description" name="description" required></textarea>
                    <label for="eligibility">Eligibility</label>
                    <textarea id="eligibility" name="eligibility" required></textarea>
                    <label for="amount">Amount</label>
                    <input type="number" id="amount" step="0.01" name="amount" required />
                    <label for="deadline">Deadline (YYYY-MM-DD)</label>
                    <input type="date" id="deadline" name="deadline" required />
                    <button type="submit">Save</button>
                </form>
            </c:otherwise>
        </c:choose>
        <p class="back-link"><a href="${pageContext.request.contextPath}/scholarship">Back to List</a></p>
    </div>
</body>
</html>