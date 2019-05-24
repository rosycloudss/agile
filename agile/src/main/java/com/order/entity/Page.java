package com.order.entity;

import org.springframework.stereotype.Component;

/**
 * 
 * @author LIWEI
 * @time 2018年11月15日下午10:08:34
 * @description：分页信息
 *
 */
public class Page {

	private int pageStart;// 当前页起始位置

	private int pageSize = 10;// 每页长度 默认为10

	private int pageNumber;// 总页数

	private int pageCurrent;// 当前页数

	private int totalPage;// 总页数

	private int totalRecord;// 总记录数

	private String path;// 分页数据的路径

	public Page() {

	}

	public Page(int totalRecord, int pageCurrent, int pageSize) {
		this.totalRecord = totalRecord;
		this.pageCurrent = pageCurrent;
		this.pageSize = pageSize;
	}

	/**
	 * @return the pageStart
	 */
	public int getPageStart() {
		return (pageCurrent - 1) * pageSize;
	}

	/**
	 * @param pageStart the pageStart to set
	 */
	public void setPageStart(int pageStart) {
		this.pageStart = pageStart;
	}

	/**
	 * @return the pageSize
	 */
	public int getPageSize() {
		return pageSize;
	}

	/**
	 * @param pageSize the pageSize to set
	 */
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	/**
	 * @return the pageNumber
	 */
	public int getPageNumber() {
		return pageNumber;
	}

	/**
	 * @param pageNumber the pageNumber to set
	 */
	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}

	/**
	 * @return the pageCurrent
	 */
	public int getPageCurrent() {
		return pageCurrent;
	}

	/**
	 * @param pageCurrent the pageCurrent to set
	 */
	public void setPageCurrent(int pageCurrent) {
		this.pageCurrent = pageCurrent;
	}

	/**
	 * @return the totalPage
	 */
	public int getTotalPage() {
		
		if(totalRecord==0) return 1;
		totalPage = totalRecord % pageSize == 0 ? (totalRecord/pageSize) : (totalRecord / pageSize + 1);
		return totalPage;
	}

	/**
	 * @param totalPage the totalPage to set
	 */
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	/**
	 * @return the totalRecord
	 */
	public int getTotalRecord() {
		return totalRecord;
	}

	/**
	 * @param totalRecord the totalRecord to set
	 */
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}

	/**
	 * @return the path
	 */
	public String getPath() {
		return path;
	}

	/**
	 * @param path the path to set
	 */
	public void setPath(String path) {
		this.path = path;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Page [pageStart=" + pageStart + ", pageSize=" + pageSize + ", pageNumber=" + pageNumber
				+ ", pageCurrent=" + pageCurrent + ", totalPage=" + totalPage + ", totalRecord=" + totalRecord
				+ ", path=" + path + "]";
	}

}

