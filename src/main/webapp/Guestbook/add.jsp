<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="Guestbook.GuestBookDaoImpl"%>
<%@ page import="Guestbook.GuestbookVo"%>
<%@ page import="Guestbook.GuestbookDao"%>

<%

	request.setCharacterEncoding("UTF-8");
	
	String Name = request.getParameter("name");
	String Pass = request.getParameter("pass");
	String Content = request.getParameter("content");
	
	GuestbookVo vo = new GuestbookVo(Name,Pass,Content);
	GuestbookDao dao = new GuestBookDaoImpl();
	if(dao.insert(vo)>0){
		response.sendRedirect("list.jsp");  
	}else{
		%>
		<script type="text/javascript">
		  alert("데이터 등록 실패");
		  history.go(-1);
		</script>

		<%    
		  }
		%>