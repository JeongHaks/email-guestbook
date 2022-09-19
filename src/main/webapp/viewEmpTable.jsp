<!-- DB접속 위해 필요한 import -->
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%! //변수 선언
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String user = "hr";
	String pass = "hr";
	
	String sql = "SELECT e.EMPLOYEE_ID , e.FIRST_NAME,TO_CHAR(e.HIRE_DATE , 'YYYY-MM-DD') HIRE_DATE , d.DEPARTMENT_NAME , e2.FIRST_NAME as first , e.SALARY " 
		 + " FROM EMPLOYEES e , DEPARTMENTS d  , EMPLOYEES e2 "   
		 + " WHERE e.MANAGER_ID = e2.EMPLOYEE_ID(+)  AND  e2.DEPARTMENT_ID = d.DEPARTMENT_ID(+)" 
		 + " ORDER BY employee_id";	    
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>저자 정보 보기</title>
</head>
<body>
  <table width="800">
    <form name="insertForm" method="post" action="insertAuthor.jsp">
      사번 : <input type="text" name="author_name" />
      이름 : <input type="text" name="author_desc" />
      &nbsp;<input type="submit"/>
    </form> 
  </table>
  <br>
  <hr>
	<table width="800" border="1">
		<tr>
			<th>사번</th>
			<th>이름</th>
			<th>입사일</th>
			<th>근무부서</th>
			<th>매니저</th>
			<th>급여</th>
		</tr>
		<%
		try{
			//Class.forName("com.microsoft.jdbc.sqlserver.SQLServerDirverz");  //MS-sql
			//Class.forName("org.gjt.mm.msql.Driver");  //mySql
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, pass);
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
        out.print("<tr>\n");
				
				out.print("<td>"+rs.getInt("EMPLOYEE_ID")+"</td>\n");
				out.print("<td>"+rs.getString("FIRST_NAME")+"</td>\n");
				out.print("<td>"+rs.getString("HIRE_DATE")+"</td>\n");
				out.print("<td>"+rs.getString("DEPARTMENT_NAME")+"</td>\n");
				out.print("<td>"+rs.getString("first")+"</td>\n");
				out.print("<td>"+rs.getInt("SALARY")+"</td>\n");
				out.print("</tr>\n");
      }
			//System.out.print("12344567898765fghfds");
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(rs != null) 	 rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
	%>
	</table>
  
</body>
</html>







