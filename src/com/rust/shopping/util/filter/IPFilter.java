package com.rust.shopping.util.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class IPFilter implements Filter {
    FilterConfig fc=null;
	public void destroy() {
      System.out.println("IPFilter destroy");
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		//System.out.println("IPFlist doFilter");
		String ip=request.getRemoteAddr();
		String StrIPBlackList=fc.getInitParameter("IPBlackList");
		//System.out.println(StrIPBlackList);
		
		if(StrIPBlackList.indexOf(ip)!=-1){
			PrintWriter out=response.getWriter();
			out.write("you ip isn't welcome!");
			return;
		}
		
        chain.doFilter(request, response);
	}

	public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("IPFilter init");
        this.fc=filterConfig;
	}

}
