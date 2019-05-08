package com.order.entity;

import org.springframework.stereotype.Component;

@Component
public class Website {
    /**
    * 
    */
    private Integer websiteId;

    /**
    * 
    */
    private String webName;

    /**
    * 
    */
    private String logoPath;

    /**
    * 
    */
    private String title;

    /**
    * 
    */
    private String description;

    /**
    * 
    */
    private String webUrl;

    /**
    * 
    */
    private String aboutUsImgUrl;

    /**
    * 
    */
    private String aboutUsContent;

    public Integer getWebsiteId() {
        return websiteId;
    }

    public void setWebsiteId(Integer websiteId) {
        this.websiteId = websiteId;
    }

    public String getWebName() {
        return webName;
    }

    public void setWebName(String webName) {
        this.webName = webName;
    }

    public String getLogoPath() {
        return logoPath;
    }

    public void setLogoPath(String logoPath) {
        this.logoPath = logoPath;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getWebUrl() {
        return webUrl;
    }

    public void setWebUrl(String webUrl) {
        this.webUrl = webUrl;
    }

    public String getAboutUsImgUrl() {
        return aboutUsImgUrl;
    }

    public void setAboutUsImgUrl(String aboutUsImgUrl) {
        this.aboutUsImgUrl = aboutUsImgUrl;
    }

    public String getAboutUsContent() {
        return aboutUsContent;
    }

    public void setAboutUsContent(String aboutUsContent) {
        this.aboutUsContent = aboutUsContent;
    }
}