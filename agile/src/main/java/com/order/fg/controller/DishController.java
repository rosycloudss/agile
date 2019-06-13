package com.order.fg.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.order.entity.Dish;
import com.order.entity.DishCategory;
import com.order.entity.Page;
import com.order.service.DishCategoryService;
import com.order.service.DishService;
import com.order.util.WebUtil;

/**
 * @author muwei
 * @date 2019/5/3
 */
@RequestMapping(value = "/foreground/dish")
@Controller
public class DishController {

	private final DishService dishService;

	private final DishCategoryService dishCategoryService;

	@Autowired
	public DishController(DishService dishService, DishCategoryService dishCategoryService) {

		this.dishService = dishService;
		this.dishCategoryService = dishCategoryService;
	}

	@RequestMapping(value = "dishDisplay.action", method = RequestMethod.GET)
	public String dishDisplay(Integer categoryId,Integer currentPage,Model model,HttpServletRequest request, HttpSession session) {
		List<Dish> dishList = new ArrayList<>();
		
		currentPage = (currentPage == null ? 1 : currentPage);
		System.out.println("currentPage===" + currentPage);
		Page page = new Page(dishService.countDish(categoryId),currentPage,9);
		page.setPath(WebUtil.getPath(request));
		dishList = dishService.getDishByCategoryId(categoryId, page);
		model.addAttribute("page",page);
		model.addAttribute("categoryId", categoryId == null ? 0 : categoryId);
		model.addAttribute("dishList", dishList);
		return "/foreground/dishDisplay";
	}
	/**
	 * 菜品详情
	 * @return
	 */
	@RequestMapping("dishDetail.action")
	public String dishDetial(Integer dishId,Model model) {
		Dish dish = dishService.selectByPrimaryKey(dishId);
		
		List<Dish> dishList = dishService.getAll(null);
		for(int i = 0;i < dishList.size();i++) {
			if(dishList.get(i).getDishId() == dish.getDishId()) {
				dishList.remove(i);
			}
		}
		dishList = dishList.subList(0, 4);
		DishCategory category = dishCategoryService.selectByPrimaryKey(dish.getCategoryId());
		
		model.addAttribute("dish",dish);
		model.addAttribute("dishList",dishList);
		model.addAttribute("category",category);
		System.out.println(dishList);
		return "/foreground/dishDetail";
	}
	
	

}