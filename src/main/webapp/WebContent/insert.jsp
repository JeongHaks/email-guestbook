<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="email.EmaillistDao"%>
<%@ page import="email.EmaillistVo"%>

<% 
	request.setCharacterEncoding("UTF-8");
	String lastName = request.getParameter("ln");
	String firstName = request.getParameter("fn");
	String email = request.getParameter("email");
	
	EmaillistVo vo = new EmaillistVo(lastName, firstName, email);
	
	EmaillistDao dao = new EmaillistDao();
	if(dao.insert(vo)){
	  response.sendRedirect("list.jsp");  
  }else{
%>
<script type="text/javascript">
  alert("데이터 입력 실패");
  history.go(-1);
</script>

<%    
  }
%>
