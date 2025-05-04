<!-- application_list.jsp -->
<%@ page contentType="text/html" %>
<html><body>
<h2>My Applications</h2>
<table border="1">
<tr><th>Scholarship</th><th>Status</th><th>Applied At</th><th>Action</th></tr>
<c:forEach var="a" items="${apps}">
  <tr>
    <td>${a.scholarshipId}</td>
    <td>${a.status}</td>
    <td>${a.appliedAt}</td>
    <td>
      <a href="application?action=delete&id=${a.applicationId}">Withdraw</a>
    </td>
  </tr>
</c:forEach>
</table>
<p><a href="${pageContext.request.contextPath}/dashboard">Back</a></p>
</body></html>
