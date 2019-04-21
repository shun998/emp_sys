package com.hrManage.checkl;
/**
 * 验证
 */
import java.io.ByteArrayOutputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
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
public class ChecklServelt extends HttpServlet{
	ChecklService checklService = new ChecklService();
	
	/*********
	 * 入口
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		System.out.println("checklServelt服务");
		String method = request.getParameter("method");
		try {
		if ("query".equals(method)) {
				this.query(request, response);
			return;
		} else if ("addpage".equals(method)) {
			this.addpage(request, response);
			return;
		} else if ("add".equals(method)) {
			this.add(request, response);
			return;
		}else if ("save".equals(method)) {
			this.save(request, response);
			return;
		}
		else if ("delete".equals(method)) {
			this.delete(request, response);
			return;
		}
		else if ("excel".equals(method)) {
			this.excel(request, response);
			return;
		}{
			request.setAttribute("error",
					"您没有传参数。<br/>例如：/hrManage/checkl.do?method=query");
				request.getRequestDispatcher("/manage/error.jsp").forward(
						request, response);	
		}} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
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

	private void save(HttpServletRequest request, HttpServletResponse response) throws FileNotFoundException, ClassNotFoundException, SQLException, IOException, ServletException {
		try {
		
		String []checkl_id=request.getParameterValues("checkl_id");
		String []checkl_state=request.getParameterValues("checkl_state");
		String []checkl_remark= request.getParameterValues("checkl_remark");
		this.checklService.savestate(checkl_id,checkl_state,checkl_remark);
		response.sendRedirect(request.getContextPath()
				+ "/hrManage/checkl.do?method=addpage");
		} catch (NullPointerException e) {
			request.setAttribute("error",
					"无今日考勤请点击生成本日考勤<br/>");
				request.getRequestDispatcher("/error.jsp").forward(
						request, response);			}
		
	}
	private void delete(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ClassNotFoundException, SQLException {
		// 接收参数
		String[] delIdArray = request.getParameterValues("delIdArray");
		// 调用模型层 方法delete
		this.checklService.delete(delIdArray);
		// 重定向
		response.sendRedirect(request.getContextPath()
				+ "/hrManage/checkl.do?method=query");

	}

	private void addpage(HttpServletRequest request,
			HttpServletResponse response) throws ClassNotFoundException, SQLException {
		String checkl_date = nowtime();
		List<?> checkl = this.checklService.querycheckl(checkl_date);
		request.setAttribute("checkl", checkl);
		try {
			request.getRequestDispatcher("/hrManage/checkl/addpage.jsp").forward(
					request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void add(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, FileNotFoundException, IOException {
		String checkl_date = nowtime();
		this.checklService.creat(checkl_date);
		response.sendRedirect(request.getContextPath()
				+ "/hrManage/checkl.do?method=addpage");
	
	}
	/**
	 * 查询列表
	 * @param request
	 * @param response
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	private void query(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException {
		//接值
		String select = request.getParameter("select");
		String key = request.getParameter("key");
		//调用模型层     根据参数查询（select,key）
		List<Map<String, Object>> list = this.checklService.querycheckl(select,key);
		//保存到request中
		request.setAttribute("list", list);
		request.setAttribute("select", select);
		request.setAttribute("key", key);
		HttpSession session = request.getSession();
		session.setAttribute("list", list);
		//转向
		try {
			request.getRequestDispatcher("/hrManage/checkl/list.jsp").forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	private String nowtime() {
		SimpleDateFormat time = new SimpleDateFormat("yyyy年MM月dd日");
		Date curDate = Calendar.getInstance().getTime();
		String nowtime = time.format(curDate);
		return nowtime;
	}

}
