package com.kosta;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HelloServlets
 */
@WebServlet(description = "처음 만드는 서블릿", // 컨테이너에 서블릿임을 알리는 애너테이션
urlPatterns = { "/HelloServlets" }) //서블릿 실행을 위한 요청 URL
public class HelloServlets extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		response.setContentType("text/html;charset=UTF-8");
		
		//웹브라우저 출력을 위한 printwriter 객체 확보
		PrintWriter out = response.getWriter();
		//HTML 형식으로 브라우저 출력 컨텐츠 작성
		out.println("<!DOCTYPE html");
		out.println("<HTML>"); //html 열기
		out.println("<HEAD><TITLE>hello World</TITLE>"); //head부분 열고
		out.println("<meta charset='UTF-8'></HEAD>");//head부분 닫고
		
		out.println("<BODY><H1>Hello World !!! 헬로월드</H1>"); //body / h1
		out.println("</BODY></HTML>"); //body / html 닫기
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
