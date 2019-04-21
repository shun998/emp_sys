package com.hrManage.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginFilter implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		System.out.println("LoginFilter销毁中...");
	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		System.out.println("LoginFilter服务中...");
		
		HttpServletRequest request = (HttpServletRequest)arg0;
		HttpServletResponse response = (HttpServletResponse)arg1;
		
		HttpSession session = request.getSession();
		
		String url = request.getRequestURL().toString();
		String uri = request.getRequestURI();
		String path = request.getServletPath();
		System.out.println(" url---->：" + url);
		System.out.println(" uri---->：" + uri);
		System.out.println("path---->：" + path);
		
		if(path.equals("/login.jsp") || path.equals("/login.do") || path.equals("error.jsp")) {
			System.out.println("过滤器：path---->" + path + "（特权页面）");
			chain.doFilter(request, response);
			return;
		}
		//	验证是否已经登录
		if(session.getAttribute("userName") == null) {
			System.out.println("过滤器：path---->" + path + "（拦截）");
			request.setAttribute("error", "您还没有登录，不能访问本页面！");
			request.getRequestDispatcher("/error.jsp").forward(request, response);
			return;
		} else {
			System.out.println("过滤器：path---->" + path + "（允许通过）");
			chain.doFilter(request, response);
			return;
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		System.out.println("LoginFilter初始化...");
	}

    

}
