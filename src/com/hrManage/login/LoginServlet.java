package com.hrManage.login;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	private LoginService loginService = new LoginService();

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("LoginServlet服务中...");
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String method = request.getParameter("method");
		try {
			if(method.equals("login")) {
				this.login(request, response);
			} else if(method.equals("logout")) {
				this.logout(request, response);
			} else if(method.equals("close")) {
				this.close(request, response);
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * 校验验证码
	 * @throws IOException 
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	public void login(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException {
		
		String img = request.getParameter("txtSN");
		HttpSession session = request.getSession();
		if(!session.getAttribute("sessionImg").equals(img)) {	//	验证码错误
			response.sendRedirect("login.jsp?result=img");
		} else {	//	验证码正确
			this.query(request, response);
		}
	}
	
	public void logout(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, FileNotFoundException, SQLException, IOException {
		
		HttpSession session = request.getSession();
		this.loginService.updateStatus((String)session.getAttribute("userId"), "logout");
		session.invalidate();
		response.sendRedirect("login.jsp");
	}
	
	public void close(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, FileNotFoundException, SQLException, IOException {
		
		HttpSession session = request.getSession();
		this.loginService.updateStatus((String)session.getAttribute("userId"), "logout");
		session.invalidate();
	}
	
	/**
	 * 校验登录信息
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 * @throws IOException 
	 */
	public void query(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, IOException {

		String usr = request.getParameter("txtUserName");
		String pwd = request.getParameter("txtUserPassword");
		Map<String, Object> map = this.loginService.query(usr, pwd);
		if(map == null) {	//	密码错误
			response.sendRedirect("login.jsp?result=pwd");
		} else {	//密码正确
			if(map.get("manager_on").equals("1")) {	//	当前用户在线
				response.sendRedirect("login.jsp?result=on");
			} else {	//	当前用户不在线
				HttpSession session = request.getSession();
				session.setAttribute("userId", map.get("manager_id"));
				session.setAttribute("userName", usr);
				this.loginService.updateStatus((String)map.get("manager_id"), "login");
				response.sendRedirect("main.html");
			}
		}
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		System.out.println("LoginServlet销毁中...");
	}

	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		System.out.println("LoginServlet初始化...");
	}
       
    
}
