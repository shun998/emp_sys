package com.hrManage.employee;

import java.io.ByteArrayOutputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
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


@SuppressWarnings("serial")
public class EmployeeServlet extends HttpServlet {
	EmployeeService employeeService = new EmployeeService();
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		String method = request.getParameter("method");
		try {
			if ("query".equals(method)) {
				this.query(request,response);
				return;
			} else if ("queryById".equals(method)) {
				this.queryById(request,response);
				return;
			} else if ("addpage".equals(method)) {
				this.addpage(request,response);
				return;
			} else if ("add".equals(method)) {
				this.add(request,response);
				return;
		
			} else if ("edit".equals(method)) {
				this.edit(request,response);
				return;
			} else if ("editpage".equals(method)) {
				this.editpage(request,response);
				return;
			}else if ("delete".equals(method)) {
				this.delete(request,response);
				return;
			} else if ("excel".equals(method)) {
				this.excel(request,response);
				return;
			}{
				request.setAttribute("error", "您没有传参数");
				request.getRequestDispatcher("/error.jsp").forward(request, response);
			}
		} catch (ServletException e) {
			request.getRequestDispatcher("/error.jsp").forward(request, response);

		} catch (IOException e) {
			request.getRequestDispatcher("/error.jsp").forward(request, response);

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			request.getRequestDispatcher("/error.jsp").forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			request.setAttribute("error", e.getMessage());
			request.getRequestDispatcher("/error.jsp").forward(request, response);

		}
	}
	private void excel(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		try {
			
		
		Excel excel = new Excel(request.getRealPath("temp"));
		HttpSession session = request.getSession();
		List<Map<String, Object>> list = (List<Map<String, Object>>) session.getAttribute("list");
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

	

	

private void addpage(HttpServletRequest request,
			HttpServletResponse response) throws ClassNotFoundException, SQLException, ServletException, IOException {

	List<Map<String, Object>> list = this.employeeService.queryPosition();
	request.setAttribute("list", list);
	request.getRequestDispatcher("/hrManage/employee/add.jsp").forward(request, response);
		
	}





private void queryById(HttpServletRequest request,
			HttpServletResponse response) throws ClassNotFoundException, SQLException, ServletException, IOException {
		// TODO Auto-generated method stub
	System.out.println("get in queryById");
	String id = request.getParameter("id");
	Map<String, Object> map = employeeService.queryemployeeById(id);
	System.out.println("EmployeeServlet-->list"+map.size());
	
	request.setAttribute("map", map);
	request.getRequestDispatcher("/hrManage/employee/details.jsp").forward(request, response);
	}





 private void editpage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
	String id = request.getParameter("id");
	List<Map<String, Object>> list = this.employeeService.queryPosition();
	Map<String, Object> map = employeeService.queryemployeeById(id);
	request.setAttribute("list", list);
	request.setAttribute("map", map);
	request.getRequestDispatcher("/hrManage/employee/edit.jsp").forward(request,response);
	}





private void delete(HttpServletRequest request, HttpServletResponse response) throws FileNotFoundException, ClassNotFoundException, SQLException, IOException {
	// TODO Auto-generated method stub
	System.out.println("delete get in");
	String id = request.getParameter("id");
	System.out.println(id);
	this.employeeService.delete(id);
	
	response.sendRedirect(request.getContextPath()+"/hrManage/employee.do?method=query");
}

private void edit(HttpServletRequest request, HttpServletResponse response) throws FileNotFoundException, ClassNotFoundException, SQLException, IOException {
	// TODO Auto-generated method stub
	Date currentTimeDate = new Date();
	SimpleDateFormat formatterDateFormat = new SimpleDateFormat("yyyy年MM月dd日 hh:mm:ss");
	String state_time = formatterDateFormat.format(currentTimeDate);
	String id = request.getParameter("id");
	String name = request.getParameter("employee_name");
	String sex = request.getParameter("employee_sex");
	String brith = request.getParameter("employee_brith");
	String date = request.getParameter("employee_date");
	String strTemp = request.getParameter("position_id");
	int count = strTemp.indexOf(".");
	String depart_id = strTemp.substring(0, count);
	String position_id = strTemp.substring(count + 1, strTemp.length());
	String state = request.getParameter("employee_state");
	
	String address = request.getParameter("employee_address");
	String tel = request.getParameter("employee_tel");
	String remark = request.getParameter("employee_remark");
	this.employeeService.edit(id,name,sex,brith,position_id,depart_id,date,state,state_time,address,tel,remark);
	response.sendRedirect(request.getContextPath()+"/hrManage/employee.do?method=query");
}



private void add(HttpServletRequest request, HttpServletResponse response) throws FileNotFoundException, ClassNotFoundException, SQLException, IOException {
	// TODO Auto-generated method stub
	System.out.println("addpage get in");
	Date currentTimeDate = new Date();
	SimpleDateFormat formatterDateFormat = new SimpleDateFormat("yyyy年MM月dd日 hh:mm:ss");
	String state_time = formatterDateFormat.format(currentTimeDate);
	
	String name = request.getParameter("employee_name");
	String sex = request.getParameter("employee_sex");
	String brith = request.getParameter("employee_brith");
	String date = request.getParameter("employee_date");
	String strTemp = request.getParameter("position_id");
	int count = strTemp.indexOf(".");
	String depart_id = strTemp.substring(0, count);
	String position_id = strTemp.substring(count + 1, strTemp.length());
	String state = request.getParameter("employee_state");
	 
	String address = request.getParameter("employee_address");
	String tel = request.getParameter("employee_tel");
	String remark = request.getParameter("employee_remark");
	this.employeeService.add(name,sex,brith,date,position_id,depart_id,state,state_time,address,tel,remark);
	response.sendRedirect(request.getContextPath()+"/hrManage/employee.do?method=query");
}

private void query(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException, SQLException {
	
	System.out.println("get in");
	List<Map<String, Object>> list = employeeService.queryEmployee();
	System.out.println("EmployeeServlet-->list"+list.size());
	HttpSession session = request.getSession();
	session.setAttribute("list", list);
	request.setAttribute("list", list);
	request.getRequestDispatcher("/hrManage/employee/list.jsp").forward(request, response);
}
private void querydepart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException, SQLException {
	
	System.out.println("get in");
	List<Map<String, Object>> list = employeeService.queryPosition();
	System.out.println("EmployeeServlet-->list"+list.size());
	
	request.setAttribute("list", list);
	request.getRequestDispatcher("/hrManage/employee/list.jsp").forward(request, response);
}
}