<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/register" method="post">
<input type ="Email" name="email" placeholder="Enter yours email " >
<input type ="password" name="password" placeholder="Enter yours password " > 
<input type ="text" name="name" placeholder="Enter yours name " > 
<input type ="text" name="contact" placeholder="Enter yours contact number " > 
<button type="submit">Register</button>
<jsp:include page="/page/footer.jsp" />
</form>
</body>
</html>