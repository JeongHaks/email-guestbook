<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="Guestbook.GuestBookDaoImpl"%>
<%@ page import="Guestbook.GuestbookVo"%>
<%@ page import="java.util.*"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>방명록</title>
</head>
<body>
	<h1>방명록 정보 등록</h1>
	<p>기입 후 submit 버튼 클릭</p>
	
	<form action="add.jsp" method="post">
	<table border=1 width=500>
		<tr>
			<td>이름</td><td><input type="text" name="name"></td>
			<td>비밀번호</td><td><input type="password" name="pass"></td>
		</tr>
		<tr>
			<td colspan=4><textarea name="content" cols=60 rows=5></textarea></td>
		</tr>
		<tr>
			<td colspan=4 align=right><input type="submit" VALUE=" 확인 "></td>
		</tr>
	</table>
	</form>
	<br/>
<!--데이터 리스트 출력 -->
	<%
		Guestbook.GuestbookDao dao = new Guestbook.GuestBookDaoImpl();
		List<Guestbook.GuestbookVo> list = dao.getList();
		
		for(GuestbookVo vo : list){
	%>
	<form action="deleteform.jsp" method="post">
	<table width=510 border=1>
		<tr>
			<td><%=vo.getNo()%></td>
			<td><%=vo.getName() %></td>						
			<td><%=vo.getReg_date() %></td>
			<td colspan=4><%=vo.getContent()%></td>			
				
		<td><a href="deleteform.jsp?no=<%=vo.getNo()%>">삭제</a></td> 
			
		</tr>
		
	</table>
  </form>
	
        <br/>
        <%
  }
      
  %>
</body>
</html>