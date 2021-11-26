package com.employee.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity(name="Emp2019")
public class Employees {
	
	@Id
	private long id;
	private String name;
	private String jop;
	private String phone;
	@ManyToOne
	private Address addId;

	public Employees() {}

	public Employees(long id, String name, String jop, String phone, Address addId) {
		this.id = id;
		this.name = name;
		this.addId = addId;
		this.jop = jop;
		this.phone = phone;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Address getAddId() {
		return addId;
	}

	public void setAddId(Address addId) {
		this.addId = addId;
	}

	public String getJop() {
		return jop;
	}

	public void setJop(String jop) {
		this.jop = jop;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

}
