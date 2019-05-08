package com.order.util;

import javax.servlet.http.HttpServletRequest;

public class WebUtil {
	//获取页面路径
	public static String getPath(HttpServletRequest request) {
		String requestURI = request.getRequestURI();
		String queryString = request.getQueryString();
		String URL = requestURI + "?" + queryString;
		System.out.println(queryString);
		if (URL.contains("&currentPage")) {
			URL = URL.substring(0, URL.indexOf("&currentPage"));
		}
		return URL;
	}
}