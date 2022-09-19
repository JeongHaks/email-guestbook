package Guestbook;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Guestbook.GuestBookDaoImpl;
import Guestbook.GuestbookDao;
import Guestbook.GuestbookVo;


@WebServlet(description = "이메일리스트 서블릿", urlPatterns = {"/guestbook2"})
public class GuestbookServlet2 extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public GuestbookServlet2() {
      super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	//모든 일을 다한다.
      System.out.println("GuestBookServlet2.doGet() 호출");
      request.setCharacterEncoding("utf-8");

      String actionName = request.getParameter("a");
      
      if("deleteform".equals(actionName)) { //화면만 불러준다. 아무 이유 없이 
        System.out.println("actionName => " + actionName);
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/guestbook2/deleteform.jsp");
        rd.forward(request, response);
      }else if("add".equals(actionName)) {
        System.out.println("actionName => " + actionName);
        request.setCharacterEncoding("UTF-8");
        String name = request.getParameter("name");
        String pass = request.getParameter("pass");
        String content = request.getParameter("content");
        
        GuestbookVo vo = new GuestbookVo(name, pass, content);
        
        GuestbookDao dao = new GuestBookDaoImpl();
        dao.insert(vo);

        response.sendRedirect("/emaillist/guestbook2");
      }else if("delete".equals(actionName)) {
        System.out.println("actionName => " + actionName);
        request.setCharacterEncoding("utf-8");
        
        String no = request.getParameter("no");
        String pass = request.getParameter("password");
        System.out.println(request.getParameter("pass"));
        System.out.println(pass);
        GuestbookDao dao = new GuestBookDaoImpl();
        dao.delete(no,pass);                
        response.sendRedirect("/emaillist/guestbook2");
      }else {
        System.out.println("actionName => " + actionName);
        GuestbookDao dao = new GuestBookDaoImpl();
        List<GuestbookVo> list = dao.getList();

        request.setAttribute("list", list);// 담아버린다 (request)객체에 

        //jsp소스를 가지고와서 그 소스를 브라우저에 보낸다 (자바로 해석한 다음에 결과를 보내준다)
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/guestbook2/index.jsp");
        rd.forward(request, response); //해석이 끝난 상태로 html로 브라우저에 전달된다.
      }
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}