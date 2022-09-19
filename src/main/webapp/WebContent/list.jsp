<%@ page language="java" 
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="email.EmaillistDao"%>
<%@ page import="email.EmaillistVo"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Email 목록 </title>
</head>
<body>

	<h1>메일 리스트 가입</h1>
	<p>
		메일 리스트에 가입하려면,<br> 아래 항목을 기입하고 submit 버튼을 클릭하세요.
	</p>
	<form action="insert.jsp" method="post">
		Last name(성): <input type="text" name="ln" value=""><br>
		First name(이름): <input type="text" name="fn" value=""><br>
		Email address: <input type="text" name="email" value=""><br>
		<input type="submit" value="등록">
	</form>
	<br>
	

	<h1>메일 리스트에 가입되었습니다.</h1>
	<p>입력한 정보 내역입니다.</p>
	<!-- 메일정보 리스트 -->
	<%-- list에서 하나씩 빼서 테이블를 채운다--%>
  <%
     email.EmaillistDao dao = new email.EmaillistDao();
     ArrayList<email.EmaillistVo> list = dao.getList();
      
      for(email.EmaillistVo vo : list) {
  %>
 <form action="delete.jsp" method="post">
		
	
	
  <table border="1" cellpadding="5" cellspacing="2">
		<tr>
			<td align=right width="110">Last name:</td>
			<td width="170"><%=vo.getLast_name()%></td>			
			
		</tr>
		<tr>
			<td align=right >First name:</td>
			<td><%=vo.getFirst_name()%></td>
		</tr>
		<tr>
			<td align=right>Email address: </td>
			<td><%=vo.getEmail()%></td>
			<input type="hidden" name="email" value="<%=vo.getEmail()%>">
		</tr>
		<tr>
			<td colspan = "2"><input  type="submit" value="삭제"></td>
		</tr>
	</table>
	</form>
	<br>
  <%
  }
  %>
  
  <br>
  <p> 
  	<a href="delete.jsp">정보 삭제하러 가기</a>
  </p>
  </br>	
</body>
</html>