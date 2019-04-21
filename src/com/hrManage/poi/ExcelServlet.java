package com.hrManage.poi;

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

import com.hrManage.dao.Dao;
import com.hrManage.dao.DaoImpl;
import com.hrManage.util.Download;
import com.hrManage.util.Excel;

public class ExcelServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private Dao dao = new DaoImpl();

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("ExcelServlet服务中...");
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		String method = request.getParameter("method");
		try {
			if (method.equals("write")) {
				this.write(request, response);
			} else if (method.equals("read")) {
				this.read(request, response);
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void write(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, IOException {
		
		String sql = "SELECT manager_name AS '帐号', manager_pass AS '密码' " +
				"FROM manager " +
				"ORDER BY manager_name;";
		List<Map<String, Object>> list = this.dao.executeQueryForList(sql);
		// 生成Excel文件后保存在服务器
		Excel excel = new Excel(request.getRealPath("temp"));
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
	}
	
	public void read(HttpServletRequest request, HttpServletResponse response) {
		
		
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		System.out.println("ExcelServlet销毁中...");
	}

	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		System.out.println("ExcelServlet初始化...");
	}

}
