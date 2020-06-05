package com.hqyj.crm.customer.entity;

public class Dict {
	private String id;
	private String name;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Dict(String id, String name) {
		super();
		this.id = id;
		this.name = name;
	}
	
}
