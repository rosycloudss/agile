package com.order.entity;

import org.springframework.stereotype.Component;

@Component
public class Role {
    /**
    * id
    */
    private Integer roleId;

    /**
    * 
    */
    private String name;

    /**
    * 
    */
    private String description;

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
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
}