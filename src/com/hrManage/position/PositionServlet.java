package com.hrManage.position;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PositionServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private PositionService positionService = new PositionService();

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("PositionServlet服务中...");
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String method = request.getParameter("method");
		try {
			if (method.equals("query")) {
				this.query(request, response);
			} else if(method.equals("add")) {
				this.add(request, response);
			} else if(method.equals("insert")) {
				this.insert(request, response);
			} else if(method.equals("edit")) {
				this.edit(request, response);
			} else if(method.equals("update")) {
				this.update(request, response);
			} else if(method.equals("delete")) {
				this.delete(request, response);
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void query(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, ServletException, IOException {
		
		List<Map<String, Object>> list = this.positionService.query();
		request.setAttribute("list", list);
		request.getRequestDispatcher("/hrManage/position/list.jsp").forward(request, response);
	}
	
	public void add(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, ServletException, IOException {
		
		List<Map<String, Object>> list = this.positionService.add();
		request.setAttribute("list", list);
		request.getRequestDispatcher("/hrManage/position/add.jsp").forward(request, response);
	}
	
	public void insert(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, ServletException, IOException {
		
		String position_id = UUID.randomUUID().toString();
		String depart_id = request.getParameter("depart_id");
		String position_name = request.getParameter("position_name");
		String position_remark = request.getParameter("position_remark");
		Object[] values = {position_id, depart_id, position_name, position_remark};
		this.positionService.insert(values);
		response.sendRedirect(request.getContextPath() + "/hrManage/position.do?method=query");
	}
	
	public void edit(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, ServletException, IOException {
		
		//	该职位信息
		String id = request.getParameter("id");
		Map<String, Object> map = this.positionService.edit(id);
		//	所有部门
		List<Map<String, Object>> list = this.positionService.add();
		request.setAttribute("map", map);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/hrManage/position/edit.jsp").forward(request, response);
	}
	
	public void update(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, FileNotFoundException, SQLException, IOException {
		
		String position_id = request.getParameter("id");
		String depart_id = request.getParameter("depart_id");
		String position_name = request.getParameter("position_name");
		String position_remark = request.getParameter("position_remark");
		Object[] values = {depart_id, position_name, position_remark, position_id};
		this.positionService.update(values);
		response.sendRedirect(request.getContextPath() + "/hrManage/position.do?method=query");
	}
	
	public void delete(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, FileNotFoundException, SQLException, IOException {
		
		String position_id = request.getParameter("id");
		this.positionService.delete(position_id);
		response.sendRedirect(request.getContextPath() + "/hrManage/position.do?method=query");
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		System.out.println("PositionServlet销毁中...");
	}

	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		System.out.println("PositionServlet初始化...");
	}

}
