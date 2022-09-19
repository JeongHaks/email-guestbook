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
	<h1>메일 리스트 등록</h1>
	<p>
		메일 리스트에 등록하려면,<br> 아래 항목을 기입하고 submit(등록) 버튼을 클릭하세요.
	</p>
	<form action="insert.jsp" method="post">
		Last name(성): <input type="text" name="ln" value=""><br>
		First name(이름): <input type="text" name="fn" value=""><br>
		Email address: <input type="text" name="email" value=""><br>
		<input type="submit" value="등록">
	</form>
	<br>
	<br>
	<h1>메일 리스트 수정</h1>
	<p>
		메일 리스트를 수정하려면,<br> 아래 항목을 기입하고 submit(수정) 버튼을 클릭하세여.
	</p>
	<form action="update.jsp" method="post">
		Last name(성): <input type="text" name="lnn" value=""><br>
		First name(이름): <input type="text" name="fnn" value=""><br>
		Email address: <input type="text" name="email1" value=""><br>
		<input type="submit" value="수정">
	</form>
	
	
	
	<br>
	
	<h1>메일 리스트</h1>
	<p>입력한 정보 내역입니다.</p>
	<!-- 메일정보 리스트 -->
	<%-- list에서 하나씩 빼서 테이블를 채운다--%>
  <%
    	email.EmaillistDao dao = new email.EmaillistDao();
      	List<email.EmaillistVo> list = dao.getList();
      
      for(email.EmaillistVo vo : list) {
  %>
 
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
			<td><a href="delete.jsp?email=<%=vo.getEmail()%>"><%=vo.getEmail()%></a></td>
		</tr>
	</table>
	<br>
  <%
  }
  %>
  
	<br>
	<p>
		<a href="check.jsp">나의 메일 조회</a>
	</p>
	<br>
</body>
</html>