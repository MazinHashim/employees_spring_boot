package com.employee.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Address {  
    
	@Id
	private long addressId;    
    private String addressLine1,city,state,country;    
    private int pincode;
    @OneToMany(mappedBy="addId")
    private List<Employees> empid = new ArrayList<>();
    
    public Address() {}
    
	public Address(int addressId, String addressLine1, String city, String state, String country, int pincode,
			List<Employees> empid) {
		this.addressId = addressId;
		this.addressLine1 = addressLine1;
		this.city = city;
		this.state = state;
		this.country = country;
		this.pincode = pincode;
		this.empid = empid;
	}

	public long getAddressId() {  
        return addressId;  
    }  
    public void setAddressId(long addressId) {  
        this.addressId = addressId;  
    }  
    public String getAddressLine1() {  
        return addressLine1;  
    }  
    public void setAddressLine1(String addressLine1) {  
        this.addressLine1 = addressLine1;  
    }  
    public String getCity() {  
        return city;  
    }  
    public void setCity(String city) {  
        this.city = city;  
    }  
    public String getState() {  
        return state;  
    }  
    public void setState(String state) {  
        this.state = state;  
    }  
    public String getCountry() {  
        return country;  
    }  
    public void setCountry(String country) {  
        this.country = country;  
    }  
    public int getPincode() {  
        return pincode;  
    }  
    public void setPincode(int pincode) {  
        this.pincode = pincode;  
    }
    public List<Employees> getEmpid() {
		return empid;
	}

	public void setEmpid(List<Employees> empid) {
		this.empid = empid;
	}
}