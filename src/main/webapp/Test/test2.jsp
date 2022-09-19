<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String colorParam = request.getParameter("color");
	out.println("<br>colorParam:" + colorParam);
	
	String[] colorParamval = request.getParameterValues("color");
		for(String c : colorParamval){
			out.println("<br>colorParamVal: " + c);
		}
		
	String one = request.getParameterValues("choice")[0];
	out.println("<br>choice[0]:" + one);
	
	String[] choice = request.getParameterValues("choice");
	
	for(String c : choice){
		out.println("<br>choice: " + c);
	}


%>    
</body>
</html>