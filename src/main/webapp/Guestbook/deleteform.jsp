<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="Guestbook.GuestBookDaoImpl"%>
<%@ page import="Guestbook.GuestbookVo"%>
<%@ page import="Guestbook.GuestbookDao"%>
<%@ page import="java.sql.ResultSet" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>방명록</title>
</head>
<%
	String no = request.getParameter("no");

%>

<body>
	<form method="post" action="delete.jsp">	
	<input type='hidden' name="no" value="<%=no%>">
	<table>
		<tr>
			<td>비밀 번호</td>
			<td><input type="password" name="pass" values = "" ></td>
			<td><input type="submit" value="확인"></td>		
			<td><a href="list.jsp">메인으로 돌아가기</a></td>			
		</tr>
	</table>
	</form>
</body>
</html>