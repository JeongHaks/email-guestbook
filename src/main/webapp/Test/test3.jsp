<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.* "%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%

	Enumeration params = request.getParameterNames();
	while(params.hasMoreElements()){
		String name = (String) params.nextElement();
		out.print(name + " : " + request.getParameter(name) + "<br>");
	}



%> 
</body>
</html>