<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>

<%@ page import="Guestbook.GuestbookVo"%>
<%@ page import="java.util.List"%>

<%

   List<GuestbookVo> list = (List<GuestbookVo>)request.getAttribute("list");
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
  <form action="/emaillist/guestbook2" method="post">
  <input type="hidden" name="a" value="add">
    <table border='1'>
      <tr>
        <td>이름</td>
        <td><input type="text" name="name" size="30px"></td>
        <td>비밀번호</td>
        <td><input type="password" name="pass" size="20px"></td>
      </tr>
      <tr>
        <td colspan="4"><textarea name="content" cols="60" rows="10"></textarea></td>
      </tr>
      <tr>
        <td colspan="4"><input type="submit" value="확인" id="bt"></td>
      </tr>

    </table>
  </form>
  <br>
  <br>


  <% if(list != null){
      for (GuestbookVo vo: list) {
  %>
  <form method="post" action = "">
  <input type = "hidden" name = "no" value = <%=vo.getNo()%>>
    <input type="hidden" name="a" value="deleteform">
  
    <table border='1'>
      <tr>
        <td width="10px"><%= vo.getNo() %></td>
        <td width="30px"><%= vo.getName() %></td>
        <td width="50px"><%= vo.getReg_date() %></td>
        
<!--    <td width="20px"><a href="/emaillist/guestbook2?a=deleteform&no=<%=vo.getNo()%>&password=<%=vo.getPassword()%>">삭제</a></td>-->
      </tr>
      <tr>
        <td colspan="4">
          <textarea name="content" cols="60" rows="4"><%= vo.getContent() %></textarea>
                  <td colspan="4"><input type="submit" value="삭제" id="bt"></td>
          
        </td>
      </tr>
    </table>    
    
  </form>

  <%
      }
   %>
<%
      }
   %>
</body>
</html>