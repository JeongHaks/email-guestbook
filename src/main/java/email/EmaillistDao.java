package email;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class EmaillistDao {
	  private DBConnectionMgr pool;
	  private PreparedStatement pstmt = null;
	  private ResultSet rs = null;
  
	  
	  public EmaillistDao() {
		  try {
			  pool = DBConnectionMgr.getInstance();
			  
		  }catch(Exception e) {
			  e.printStackTrace();
		  }
	  }
	  
	  
	  // 조회
	  public ArrayList<EmaillistVo> getList(){
		  Connection conn = null;
		  PreparedStatement pstmt = null;
		  ResultSet rs = null;
		  
		  ArrayList<EmaillistVo> list = new ArrayList<>();
		  
		  try {
			  conn = pool.getConnection();
			  String sql = "select * from emaillist";
			  pstmt = conn.prepareStatement(sql);
			  rs = pstmt.executeQuery();
			  
			  while(rs.next()) {
				  EmaillistVo vo = new EmaillistVo();
				  vo.setNo(rs.getInt("no"));
				  vo.setFirst_name(rs.getString("first_name"));
				  vo.setLast_name(rs.getString("last_name"));
				  vo.setEmail(rs.getString("email"));
				  
				  list.add(vo);
			  }
		  }catch(Exception e) {
			  e.printStackTrace();
		  }finally {
			  try {
				  if(pstmt != null) { pstmt.close();}
				  
			  }catch (Exception e) {
				  System.out.println("error : " + e);
			  }
		  }
		  
		  return list;
	  }


//입력 
	public boolean insert(EmaillistVo vo) {
		  Connection conn = null;
		  PreparedStatement pstmt = null;
		  
		  Scanner sc1 = new Scanner(System.in);
		  String lastname;
		  String firstname;
		  String email;
		  int count = 0;
		  try {
			  conn = pool.getConnection();
			  
			  String sql = "insert into emaillist values (seq_emaillist_no.nextval,?,?,?)";
			  pstmt = conn.prepareStatement(sql);			  
			  

//			  System.out.print("lastname을 입력해주세요 : ");
//	          lastname = sc1.nextLine();
//	          System.out.print("firstname을 입력해주세요 : ");
//	          firstname = sc1.nextLine();
//	          //pstmt.setString(1, "성은정");     

			  //바인딩
	          pstmt.setString(1, vo.getLast_name());
	          pstmt.setString(2, vo.getFirst_name());
	          pstmt.setString(3, vo.getEmail());
	

	          count = pstmt.executeUpdate();
	
	          // 4.결과처리
	          System.out.println(count + "건의 정보가 입력되었습니다.");
			
		  }catch(Exception e) {
			  e.printStackTrace();
		  }finally {
			  try {
				  if(pstmt != null) { pstmt.close();}
				  
			  }catch (Exception e) {
				  System.out.println("error : " + e);
			  }
		  }
		  
		return (count>0)?true:false;
	}
	
	//삭제 
	
	public boolean Delete(EmaillistVo vo) {
		  Connection conn = null;
		  PreparedStatement pstmt = null;
		  int count =0;
		  try {
			  conn = pool.getConnection();
			  String sql = "DELETE FROM emaillist WHERE email =?";
			  pstmt = conn.prepareStatement(sql);			  			  			  
			  
			  pstmt.setString(1, vo.getEmail());
			  count = pstmt.executeUpdate();
	            
			  System.out.println(count + "건 삭제가 완료되었습니다.");
			  
		  }catch(Exception e){
			  e.printStackTrace();
		  }finally {
			  try {
				  if(pstmt != null) { pstmt.close();}
				  
			  }catch (Exception e) {
				  System.out.println("error : " + e);
			  }
		  }
		 return (count>0)?true:false; 
		  
	}
	
	//수정
	public boolean Update(EmaillistVo vo) {
		  Connection conn = null;
		  PreparedStatement pstmt = null;
		  int count =0;
		  try {
			  conn = pool.getConnection();
			  String sql = "UPDATE emaillist "
			  		+ "SET last_name = ?,"
			  		+ "first_name = ? "
			  		+ " WHERE email=?";
			  pstmt = conn.prepareStatement(sql);			  			  			  
			  
			  pstmt.setString(1, vo.getLast_name());
			  pstmt.setString(2, vo.getFirst_name());
			  pstmt.setString(3, vo.getEmail());
			  count = pstmt.executeUpdate();
	            
			  System.out.println(count + "건 삭제가 완료되었습니다.");
			  
		  }catch(Exception e){
			  e.printStackTrace();
		  }finally {
			  try {
				  if(pstmt != null) { pstmt.close();}
				  
			  }catch (Exception e) {
				  System.out.println("error : " + e);
			  }
		  }
		 return (count>0)?true:false; 
		  
	}
}