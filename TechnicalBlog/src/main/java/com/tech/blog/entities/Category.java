package com.tech.blog.entities;

public class Category {
	private int cid;
	private String category_name;
	private String description;
	
	public Category(int cid, String category_name, String description) {
		super();
		this.cid = cid;
		this.category_name = category_name;
		this.description = description;
	}
	public Category() {
		super();
	}
	public Category(String category_name, String description) {
		super();
		this.category_name = category_name;
		this.description = description;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	@Override
	public String toString() {
		return "Category [cid=" + cid + ", category_name=" + category_name + ", description=" + description + "]";
	}
	
	
}
