package com.hrManage.depart;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class DepartServlet extends HttpServlet{
	
	private DepartService departService = new DepartService();

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("开始服务");
		request.setCharacterEncoding("utf-8");
		
		String method = request.getParameter("method");
		
		if("query".equals(method)){
			this.query(request,response);
			return;
			
		}else if ("addpage".equals(method)) {
			
			this.addpage(request,response);
			return;
			
		}else if ("add".equals(method)) {
			this.add(request,response);
			return;
			
		}else if ("editpage".equals(method)) {
			
			this.editpage(request,response);
			return;
			
		}else if ("edit".equals(method)) {
			this.edit(request,response);
			return;
			
		}else if ("delete".equals(method)) {
			this.delete(request,response);
			return;
		}else{
			
			request.setAttribute("error", "您没有传参数");
			request.getRequestDispatcher("manage/WebContent/error.jsp").forward(request, response);
			
		}
		
		
	}

	private void edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String depart_id = request.getParameter("depart_id");
		String depart_name = request.getParameter("depart_name");
		String depart_remark = request.getParameter("depart_remark");
		
		departService.editDepart(depart_id,depart_name,depart_remark);
		
		try {
			response.sendRedirect(request.getContextPath()+"/hrManage/depart.do?method=query");
		} catch (IOException e) {
			request.setAttribute("error", "edit重定向错误");
			request.getRequestDispatcher("manage/WebContent/error.jsp").forward(request, response);
			e.printStackTrace();
		}
		
		
	}

	private void editpage(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		String depart_id = request.getParameter("id");
		
		Map<String, Object> map = null;
		map = departService.showDepart(depart_id);
		
		request.setAttribute("map", map);
		
		try {
			request.getRequestDispatcher("/hrManage/depart/edit.jsp").forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			request.setAttribute("error", "editpage转向错误");
			request.getRequestDispatcher("manage/WebContent/error.jsp").forward(request, response);
			e.printStackTrace();
		}
		
		
		
	}

	private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String depart_id = request.getParameter("id");
		departService.deleteDepart(depart_id);
		
		try {
			response.sendRedirect(request.getContextPath()+"/hrManage/depart.do?method=query");
		} catch (IOException e) {
			request.setAttribute("error", "delete重定向错误");
			request.getRequestDispatcher("manage/WebContent/error.jsp").forward(request, response);
			e.printStackTrace();
		}
		
	}

	private void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String depart_name = request.getParameter("depart_name");
		String depart_remark = request.getParameter("depart_remark");
		
		departService.addDepart(depart_name,depart_remark);
		
		try {
			response.sendRedirect(request.getContextPath()+"/hrManage/depart.do?method=query");
		} catch (IOException e) {
			request.setAttribute("error", "add重定向错误");
			request.getRequestDispatcher("manage/WebContent/error.jsp").forward(request, response);
			e.printStackTrace();
		}
	}  

	private void addpage(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			request.getRequestDispatcher("/hrManage/depart/add.jsp").forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			request.setAttribute("error", "addpage转向错误");
			request.getRequestDispatcher("manage/WebContent/error.jsp").forward(request, response);
			e.printStackTrace();
		}
				
	}

	private void query(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<Map<String, Object>> list = null;
		
		list = departService.queryDepart();
		System.out.println("list---->>"+list.size());
		
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/hrManage/depart/list.jsp").forward(request, response);
		
		
	}

	@Override
	public void destroy() {
		System.out.println("服务停止");
	}

	@Override
	public void init() throws ServletException {
		System.out.println("DepartServlet服务");
	}
	
	

}