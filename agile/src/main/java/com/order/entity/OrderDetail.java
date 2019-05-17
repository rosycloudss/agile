package com.order.entity;

public class OrderDetail {
    private String name;
    public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public float getSinglePrice() {
		return singlePrice;
	}
	public void setSinglePrice(float singlePrice) {
		this.singlePrice = singlePrice;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	private float singlePrice;
    private int number;
}
