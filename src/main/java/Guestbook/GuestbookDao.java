package Guestbook;

import java.util.List;



public interface GuestbookDao {
  
	public List<GuestbookVo> getList();

	public int insert(GuestbookVo vo);

	public int delete(String no,String pass);

}
