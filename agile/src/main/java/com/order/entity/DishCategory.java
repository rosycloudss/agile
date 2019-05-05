package com.order.entity;

import org.springframework.stereotype.Component;

@Component
public class DishCategory {
    /**
    * 
    */
    private Integer categoryId;

    /**
    * 
    */
    private String name;

    /**
    * 
    */
    private String description;

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

	@Override
	public String toString() {
		return "DishCategory [categoryId=" + categoryId + ", name=" + name + ", description=" + description + "]";
	}
    
}