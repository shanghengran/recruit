package com.recruit.entity;

import java.util.ArrayList;
import java.util.List;
/**
 * 分页实体
 * @author Heng Ran Shang
 *
 * @param <T>
 */
public class Pager<T> {
	//当前页
	private int pageNow;
	//每页条数
	private int pageSize = 10;
	//页数
	private int pageCount;
	//总条数
	private int totalCount;
	//每页集合
	private List<T> lists = new ArrayList<>();
	
	public int getPageNow() {
		return pageNow;
	}
	public void setPageNow(int pageNow) {
		this.pageNow = pageNow;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public List<T> getLists() {
		return lists;
	}
	public void setLists(List<T> lists) {
		this.lists = lists;
	}
}
