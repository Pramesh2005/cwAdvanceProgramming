<!-- apply.jsp -->
<%@ page contentType="text/html" %>
<html><body>
<h2>Respond for Scholarship</h2>
<form method="post" action="application">
  <input type="hidden" name="scholarshipId" value="${param.scholarshipId}"/>
  Remarks:<br/>
  <textarea name="remarks"></textarea><br/>
  <button>Submit Application</button>
</form>
<p><a href="home.jsp">Back</a></p>
</body></html>
