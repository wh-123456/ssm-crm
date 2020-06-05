package com.hqyj.crm.common.config;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

/**
 * Servlet Filter implementation class DateFormateFilter
 */
@WebFilter
public class DateFormateFilter implements Filter {

    /**
     * Default constructor. 
     */
    public DateFormateFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyy-MM-dd HH:mm:ss");
		String orderDate = request.getParameter("orderDate");
		String deliveryDate = request.getParameter("deliveryDate");
		if (orderDate!=null) {
			String timeFormat;
			try {
				timeFormat = sdf.format(sdf.parse(orderDate));
				request.setAttribute("orderDate", sdf.parse(timeFormat));
			} catch (ParseException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
		}
		if (deliveryDate!=null) {
			try {
				request.setAttribute("deliveryDate", sdf.parse(sdf.format(sdf.parse(deliveryDate))));
			} catch (ParseException e) {
				
				e.printStackTrace();
			}
		}
		
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
