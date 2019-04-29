package com.order.entity;

import org.springframework.stereotype.Component;

@Component
public class DishCollection {
	/**
	* 
	*/
	private Integer collectionId;

	/**
	* 
	*/
	private Integer customerId;

	/**
	* 
	*/
	private Integer dishId;

	public Integer getCollectionId() {
		return collectionId;
	}

	public void setCollectionId(Integer collectionId) {
		this.collectionId = collectionId;
	}

	public Integer getCustomerId() {
		return customerId;
	}

	public void setCustomerId(Integer customerId) {
		this.customerId = customerId;
	}

	public Integer getDishId() {
		return dishId;
	}

	public void setDishId(Integer dishId) {
		this.dishId = dishId;
	}

	@Override
	public String toString() {
		return "DishCollection [collectionId=" + collectionId + ", customerId=" + customerId + ", dishId=" + dishId
				+ "]";
	}

	
}