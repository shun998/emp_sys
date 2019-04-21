package com.hrManage.manager;

import java.io.ByteArrayOutputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hrManage.util.Download;
import com.hrManage.util.Excel;

public class ManagerServlet extends HttpServlet {
	ManagerService managerService=new ManagerService();

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("ManagerServlet正在服务");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String method = request.getParameter("method");
		
		try {
			if ("query".equals(method)) {
				this.query(request, response);
				return;
			} else if("queryById".equals(method)){
				this.queryById(request, response);
				return;
			}
			else if ("addpage".equals(method)) {
				this.addpage(request, response);
				return;
			}
			else if ("add".equals(method)) {
				this.add(request, response);
				return;
			} 
			else if ("editpage".equals(method)) {

				this.editpage(request, response);
				return;
			} 
			else if ("edit".equals(method)) {
				this.edit(request, response);
				return;
			}
			else if("delete".equals(method)){
				this.delete(request, response);
				return;
			}else if("excel".equals(method)){
				this.excel(request, response);
				return;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			request.setAttribute("error",
					"出错了-.-<br/>");
			request.getRequestDispatcher("/error.jsp").forward(request, response);
			
		}
		return;

	}
		
	private void delete(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		// 1.接值
				String manager_id = request.getParameter("manager_id");

				this.managerService.delete(manager_id);
				 //重定向
				response.sendRedirect(request.getContextPath()+"/hrManage/manager.do?method=query");
		
	}

	private void edit(HttpServletRequest request, HttpServletResponse response) throws FileNotFoundException, ClassNotFoundException, SQLException, IOException {
		// TODO Auto-generated method stub
		//接值
		System.out.println("这是1");
		String manager_id = request.getParameter("manager_id");
		String manager_name = request.getParameter("manager_name");
		String manager_pass = request.getParameter("manager_pass");
		System.out.println(manager_name+"         "+manager_pass);
		// 2.调用模型层保存
		System.out.println("这是2");
		this.managerService.edit(manager_id,manager_name, manager_pass);
		// 3.重定向
		System.out.println("这是3");
		response.sendRedirect(request.getContextPath()
				+ "/hrManage/manager.do?method=query");
		
	}

	private void editpage(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		//接值
		System.out.println("这是1");
		String manager_id = request.getParameter("manager_id");
		//2.根据id，查询一条数据
		System.out.println("这是2");
		Map<String,Object> map = this.managerService.queryManageById( manager_id );
		//3.保存到request中
		System.out.println("这是3");
		request.setAttribute("map", map);
		//4.转向
		System.out.println("这是4");
		request.getRequestDispatcher("/hrManage/manager/edit.jsp").forward(request, response);
		
	}

	private void add(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		// 1.接值
				String manager_id = request.getParameter("manager_id");
				String manager_name = request.getParameter("manager_name");
				String manager_pass = request.getParameter("manager_pass");
				System.out.println(manager_name+"         "+manager_pass);
				// 2.调用模型层保存
				this.managerService.add(manager_id,manager_name, manager_pass);
				// 3.重定向
				response.sendRedirect(request.getContextPath()
						+ "/hrManage/manager.do?method=query");
		
	}

	private void addpage(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//转向
		System.out.println("添加页面");
		request.getRequestDispatcher("/hrManage/manager/add.jsp").forward(request, response);
		
		
	}

	private void queryById(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		//按一条查询   存值  转向
		String manager_id=request.getParameter("manager_id");
		Map<String,Object> map=managerService.queryManageById(manager_id);
		request.setAttribute("map", map);
		request.getRequestDispatcher("/hrManage/manager/checkpage.jsp").forward(request, response);
		
	}

	private void query(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		//接值
		String queryname=request.getParameter("queryname");
		//查询    存储    转向
		HttpSession session = request.getSession();
		session.setAttribute("queryName", queryname);
		List<Map<String,Object>> list=managerService.queryManage(queryname);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/hrManage/manager/list.jsp").forward(request, response);
		
	}
	
	private void excel(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		try {
		Excel excel = new Excel(request.getRealPath("temp"));
		HttpSession session = request.getSession();
		List<Map<String, Object>> list = this.managerService.excel((String)session.getAttribute("queryName"));
		System.out.println(list);
		String name = excel.write(list);
		//获取文件名
		int last = name.lastIndexOf("\\");
		String fileName = name.substring(last + 1, name.length());
		//	下载到用户端
		response.setContentType("application/x-msdownload");
		response.setContentType("octet-stream");
		response.setHeader("Content-Disposition", "attachment;filename=" + fileName);
		Download download = new Download(name);
		ByteArrayOutputStream baos = download.downFile();
		ServletOutputStream sos = response.getOutputStream();
		baos.writeTo(sos);
		sos.flush();
		sos.close();
		baos.close();
		download.deleteFile();	
		} catch (Exception e) {
			request.setAttribute("error",
					"无查询列表<br/>");
				request.getRequestDispatcher("/error.jsp").forward(
						request, response);			}
	}

	

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		System.out.println("ManagerServlet销毁");
	}

	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		System.out.println("ManagerServlet初始化");
	}
	

}
