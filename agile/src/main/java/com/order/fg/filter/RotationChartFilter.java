package com.order.fg.filter;

import java.io.IOException;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.order.entity.RotationChart;
import com.order.service.RotationChartService;

/**
 * Servlet Filter implementation class RotationChartFilter
 */
@Component
//@WebFilter(filterName = "RotationChartFilter",urlPatterns = "/foreground/home.jsp")
public class RotationChartFilter implements Filter {

	@Autowired
	private RotationChartService rotationChartService;
	
    /**
     * Default constructor. 
     */
    public RotationChartFilter() {
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
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) resp;
		HttpSession session = request.getSession();
		
		List<RotationChart> rotationCharts =(List<RotationChart>) session.getAttribute("rotationCharts");
		
		if(rotationCharts == null || rotationCharts.isEmpty()) {
			rotationCharts = rotationChartService.selectAll();
			session.setAttribute("rotationCharts", rotationCharts);
		}
		System.out.println(rotationCharts);
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
