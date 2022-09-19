<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    
<%--num값으로 123을 넘겨받았을때  --%>    
<%=request.getParameter("num")%><br/> <%--123 출력 --%>
<%=request.getAttribute("num")%><%--null --%>
<hr/>
<%request.setAttribute("num","4321");%> <%--4321을 num에 넣었다. --%>
<%=request.getParameter("num")%><br/><%--123 --%>
<%=request.getAttribute("num")%><%--4321 --%>
    
</body>
</html>