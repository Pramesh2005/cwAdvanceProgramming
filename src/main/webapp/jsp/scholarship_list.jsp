<!-- scholarship_list.jsp (admin) -->
<%@ page contentType="text/html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:forEach var="s" items="${list}">
  <div>
    <b>${s.title}</b>
    [<a href="scholarship?action=edit&id=${s.scholarshipId}">Edit</a>]
    [<a href="scholarship?action=delete&id=${s.scholarshipId}">Delete</a>]
  </div>
</c:forEach>
<p><a href="scholarship_form.jsp?action=new">Create New</a></p>
<p><a href="dashboard.jsp">Dashboard</a> | <a href="${pageContext.request.contextPath}/logout">Logout</a></p>
