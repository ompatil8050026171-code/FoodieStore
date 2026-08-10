package com.FoodieStore.Model;

import java.sql.Timestamp;

public class User {

	private int id;
	private String name;
	private String email;
	private long phone;
	private String address;
	private String role;
	private Timestamp createdDate;
	private Timestamp lastLoginDate;
	private String password;

	public User()
	{

	}
	public User(String name,String email,long phone,String address,String role,String password)
	{
		this.name=name;
		this.email=email;
		this.phone=phone;
		this.address=address;
		this.role=role;
		this.password=password;
	}
	public User(String name, String email, long phone, String address, String role, Timestamp createdDate,
			Timestamp lastLoginDate,String password) {
		super();
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.role = role;
		this.createdDate = createdDate;
		this.lastLoginDate = lastLoginDate;
		this.password=password;
	}


	public User(int id, String name, String email, long phone, String address, String role, Timestamp createdDate,
			Timestamp lastLoginDate, String password) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.role = role;
		this.createdDate = createdDate;
		this.lastLoginDate = lastLoginDate;
		this.password = password;
	}
	
	public User(String name, String email, long phone, String address, String password) {
		super();
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.password = password;
	}
	
	public int getId() {
		return id;
	}
	
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public long getPhone() {
		return phone;
	}

	public void setPhone(long phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public Timestamp getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Timestamp createdDate) {
		this.createdDate = createdDate;
	}

	public Timestamp getLastLoginDate() {
		return lastLoginDate;
	}

	public void setLastLoginDate(Timestamp lastLoginDate) {
		this.lastLoginDate = lastLoginDate;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", email=" + email + ", phone=" + phone + ", address=" + address
				+ ", role=" + role + ", createdDate=" + createdDate + ", lastLoginDate=" + lastLoginDate + "]";
	}



}
