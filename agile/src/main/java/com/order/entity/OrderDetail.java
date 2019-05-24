package com.order.entity;

public class OrderDetail {
    private String name;
	private float singlePrice;
    private int number;
    
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
	
	@Override
	public String toString() {
    	StringBuffer sb = new StringBuffer();
		sb.append("{ ");
		sb.append("\"name\":\"").append(getName()).append("\",");
		sb.append("\"singlePrice\":\"").append(getSinglePrice()).append("\",");
		sb.append("\"number\":\"").append(getNumber()).append("\"");
		sb.append("}");
		return sb.toString();
	}
}
