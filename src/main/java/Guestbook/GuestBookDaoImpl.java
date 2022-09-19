package Guestbook;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class GuestBookDaoImpl implements GuestbookDao {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	//DB연동
	public Connection getConnection() {
		 Connection conn = null;
		    try {
		      Class.forName("oracle.jdbc.driver.OracleDriver");
		      String dburl = "jdbc:oracle:thin:@localhost:1521:xe";
		      conn = DriverManager.getConnection(dburl, "webdb", "1234");
		    } catch (ClassNotFoundException e) {
		      e.printStackTrace();
		    } catch (SQLException e) {
		      e.printStackTrace();
		    }
		    return conn;
	}

	@Override
	public List<GuestbookVo> getList() {
		List<GuestbookVo> list = new ArrayList<GuestbookVo>();
	    conn = getConnection();
	    String sql = "SELECT NO, name, password, content, TO_CHAR(reg_date,'YYYY-MM-DD') reg_date\r\n"
	    		+ "FROM GUESTBOOK g \r\n"
	    		+ "ORDER BY NO";
	    
	    try {
	    	pstmt = conn.prepareStatement(sql);
	    	rs = pstmt.executeQuery();
	    	
	    	while(rs.next()) {
	    		int no = rs.getInt(1);
	    		String name = rs.getString(2);
	    		String pass = rs.getString(3);
	    		String content = rs.getString(4);
	    		String reg = rs.getString(5);
	    		GuestbookVo vo = new GuestbookVo(no,name,pass,content,reg);
	    		list.add(vo);
	    	}
	    }catch (SQLException e) {
	    	e.printStackTrace();
	    }
		return list;
	}
//입력기능
	@Override
	public int insert(GuestbookVo vo) {
		conn = getConnection();
		String sql = "insert into GUESTBOOK  values (seq_guestbook_no.nextval,?,?,?,sysdate)";
		int count = 0;
		
		try {
			System.out.println("접속 성공");
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getPassword());
			pstmt.setString(3, vo.getContent());
			count = pstmt.executeUpdate();
			
			System.out.println(count + "건 등록 완료");
			
		}catch(SQLException e) {
			System.out.println("error : " + e);
		}
		return count;
	}

	//삭제 기능
	@Override
	public int delete(String no, String pass) {
		conn = getConnection();
		String sql = "DELETE FROM GUESTBOOK  WHERE password=? and no =?";
		
		int count = 0;
		
		try {
			System.out.println("접속 성공");
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pass);
			pstmt.setInt(2, Integer.parseInt(no));
			count = pstmt.executeUpdate();
			
			System.out.println(count + "건 삭제 완료");
			
		}catch(SQLException e) {
			System.out.println("error : " + e);
		}
		return count;
	}

}
