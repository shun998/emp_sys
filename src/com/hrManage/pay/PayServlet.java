package com.hrManage.pay;

import java.io.ByteArrayOutputStream;
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

@SuppressWarnings("serial")
public class PayServlet extends HttpServlet {
	@Override
	/*************
	 * 初始化
	 */
	public void init() throws ServletException {
		System.out.println("PayServlet初始化");
	}

	/**********
	 * 入口方法
	 */
	private PayService payService = new PayService();

	@Override
	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("PayServlet提供服务");
		request.setCharacterEncoding("utf-8");
		String method = request.getParameter("method");
		try {
			if ("query".equals(method)) {
				this.query(request, response);
				return;
			} else if ("delete".equals(method)) {
				this.delete(request, response);
			} else if ("addpage".equals(method)) {
				this.addpage(request, response);
			} else if ("add".equals(method)) {
				this.add(request, response);
			} else if ("editpage".equals(method)) {
				this.editpage(request, response);
			} else if ("edit".equals(method)) {
				this.edit(request, response);
			} else if ("excel".equals(method)) {
				this.excel(request, response);

			} else {
				request.setAttribute("error",
						"您没有传参数。<br/>例如：/pay.do?method=query");
				request.getRequestDispatcher("/manage/error.jsp").forward(
						request, response);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			request.setAttribute("error",
					"没有MySql驱动包！mysql-connector-java-3.1.13-bin.jar");
			request.getRequestDispatcher("/manage/error.jsp").forward(request,
					response);
		} catch (SQLException e) {
			e.printStackTrace();
			request.setAttribute("error", "SQL异常！");
			request.getRequestDispatcher("/manage/error.jsp").forward(request,
					response);
		}

	}

	/*********
	 * 生成excel
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 * @throws ServletException
	 */
	private void excel(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		try {
			// 生成Excel文件后保存在服务器
			Excel excel = new Excel(request.getRealPath("temp"));
			HttpSession session = request.getSession();
			List<Map<String, Object>> list = (List<Map<String, Object>>) session
					.getAttribute("list_employee");
			System.out.println(list);
			String name = excel.write(list);
			// 获取文件名
			int last = name.lastIndexOf("\\");
			String fileName = name.substring(last + 1, name.length());
			// 下载到用户端
			response.setContentType("application/x-msdownload");
			response.setContentType("octet-stream");
			response.setHeader("Content-Disposition", "attachment;filename="
					+ fileName);
			Download download = new Download(name);
			ByteArrayOutputStream baos = download.downFile();
			ServletOutputStream sos = response.getOutputStream();
			baos.writeTo(sos);
			sos.flush();
			sos.close();
			baos.close();
			download.deleteFile();
		} catch (Exception e) {
			request.setAttribute("error", "无查询列表<br/>");
			request.getRequestDispatcher("/error.jsp").forward(request,
					response);
		}
	}

	/*****************
	 * 查询
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	private void query(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ClassNotFoundException,
			SQLException {

		// 1.调用模型查询列表

		List<?> list_employee = this.payService.queryEmployee();

		System.out.println("-------->>>>>>>>" + list_employee.size());

		// 2.保存到request中
		HttpSession session = request.getSession();
		session.setAttribute("list_employee", list_employee);
		request.setAttribute("list_employee", list_employee);

		// 3.转向
		request.getRequestDispatcher("/hrManage/pay/list.jsp").forward(request,
				response);

	}

	/*******************
	 * 添加界面
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 * @throws ServletException
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	private void addpage(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException,
			ClassNotFoundException, SQLException {
		// 调用模型查询列表
		List<Map<String, Object>> employeelist = this.payService
				.queryEmployeelist();
		// 保存到request中
		request.setAttribute("employeelist", employeelist);
		// 转向
		request.getRequestDispatcher("/hrManage/pay/add.jsp").forward(request,
				response);

	}

	private void add(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ClassNotFoundException, SQLException {
		// 1.接值
		String pay_id = request.getParameter("pay_id");
		String employee_id = request.getParameter("employee_id");
		String pay_basic = request.getParameter("pay_basic");
		String pay_perf = request.getParameter("pay_perf");
		String pay_reapu = request.getParameter("pay_reapu");
		String pay_sub = request.getParameter("pay_sub");
		String pay_remark = request.getParameter("pay_remark");
		// 2.调用模型层保护
		this.payService.add(pay_id, employee_id, pay_basic, pay_perf,
				pay_reapu, pay_sub, pay_remark);
		// 3.重定向
		response.sendRedirect(request.getContextPath()
				+ "/hrManage/pay.do?method=query");

	}

	/******************
	 * 修改
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 * @throws ServletException
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	private void editpage(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException,
			ClassNotFoundException, SQLException {
		// 1.接值
		String id = request.getParameter("id");
		// 2.根据id，查询一条数据
		Map<String, Object> map = this.payService.querypayById(id);
		// 3.保存到request中
		request.setAttribute("map", map);
		request.getRequestDispatcher("/hrManage/pay/edit.jsp").forward(request,
				response);
	}

	private void edit(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ClassNotFoundException, SQLException {
		// 1.接值
		String pay_id = request.getParameter("pay_id");
		String employee_id = request.getParameter("employee_id");
		String pay_basic = request.getParameter("pay_basic");
		String pay_perf = request.getParameter("pay_perf");
		String pay_reapu = request.getParameter("pay_reapu");
		String pay_sub = request.getParameter("pay_sub");
		String pay_remark = request.getParameter("pay_remark");
		// 2.调用模型层保护
		this.payService.edit(pay_id, employee_id, pay_basic, pay_perf,
				pay_reapu, pay_sub, pay_remark);
		// 3.重定向
		response.sendRedirect(request.getContextPath()
				+ "/hrManage/pay.do?method=query");

	}

	/****************
	 * 删除
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	private void delete(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ClassNotFoundException, SQLException {
		// 接值
		String id = request.getParameter("id");
		// 调用
		this.payService.deletePay(id);
		// 重定向
		response.sendRedirect(request.getContextPath()
				+ "/hrManage/pay.do?method=query");

	}

	@Override
	public void destroy() {
		System.out.println("PayServlet销毁");
	}

}
