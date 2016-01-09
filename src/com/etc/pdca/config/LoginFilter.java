package com.etc.pdca.config;


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

import org.omg.CORBA.Request;


public class LoginFilter implements Filter {

	public void doFilter(ServletRequest arg0, ServletResponse arg1,FilterChain arg2) throws IOException, ServletException {
		HttpServletRequest r = (HttpServletRequest) arg0;
		HttpServletResponse p = (HttpServletResponse) arg1;
		
		String request_uri = r.getRequestURI(); 
		String ctx_path = r.getContextPath(); 

		if (r.getRequestURI().endsWith("login.jsp")) 
		{
			arg2.doFilter(arg0, arg1);	
			return;
		
		}
		
		HttpSession session = r.getSession();
		if (null==session.getAttribute("user")) {
		System.out.println("uuuuuuuuuuuuuuuuuu");
			p.sendRedirect("login.jsp");
		} 
		else 
		{	
			arg2.doFilter(arg0, arg1);
		}

	}

	public void destroy() {
		
		
	}

	public void init(FilterConfig arg0) throws ServletException {
	
		
	}

	

}
