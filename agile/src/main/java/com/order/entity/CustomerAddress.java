package com.order.entity;

import org.springframework.stereotype.Component;

@Component
public class CustomerAddress {
    /**
    * 
    */
    private Integer addressId;

    /**
    * 
    */
    private Integer customerId;

    /**
    * 
    */
    private String address;

    /**
    * 
    */
    private String phone;

    /**
    * 
    */
    private String recevierName;

    public Integer getAddressId() {
        return addressId;
    }

    public void setAddressId(Integer addressId) {
        this.addressId = addressId;
    }

    public Integer getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Integer customerId) {
        this.customerId = customerId;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getRecevierName() {
        return recevierName;
    }

    public void setRecevierName(String recevierName) {
        this.recevierName = recevierName;
    }
}