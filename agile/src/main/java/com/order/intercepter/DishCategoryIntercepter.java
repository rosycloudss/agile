package com.order.intercepter;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.order.entity.DishCategory;
import com.order.service.DishCategoryService;


public class DishCategoryIntercepter implements HandlerInterceptor {
	
	@Autowired
	private DishCategoryService dishCategoryService;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		List<DishCategory> dishCategorys = (List<DishCategory>) session.getAttribute("dishCategorys");
		if(dishCategorys == null) {
			dishCategorys = dishCategoryService.getAll();
			session.setAttribute("dishCategorys", dishCategorys);
		}
		System.out.println(dishCategorys);
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		
		
	}

}
