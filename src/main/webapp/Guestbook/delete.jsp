<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="Guestbook.GuestBookDaoImpl"%>
<%@ page import="Guestbook.GuestbookVo"%>
<%@ page import="Guestbook.GuestbookDao"%>
<%@ page import="java.sql.ResultSet" %>

<%

	request.setCharacterEncoding("UTF-8");

	String no = request.getParameter("no");
	String pass = request.getParameter("pass");
		
	
	GuestbookVo vo = new GuestbookVo(pass);
	vo.setNo(Integer.parseInt(no));
	vo.setPassword(pass);
	GuestbookDao dao = new GuestBookDaoImpl();
	if(dao.delete(no,pass)>0){
		response.sendRedirect("list.jsp");
	}else{
		%>
		<script type="text/javascript">
		  alert("데이터 삭제 실패");
		  history.go(-1);
		</script>

		<%    
		  }
		%>
