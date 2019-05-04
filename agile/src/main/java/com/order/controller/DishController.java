package com.order.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.order.entity.Dish;
import com.order.service.DishCategoryService;
import com.order.service.DishService;

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
	public String dishDisplay(Model model) {
        List<Dish> dishList = dishService.getAll();
        model.addAttribute("dishList", dishList);
		return "/foreground/dishDisplay";
	}
	
}