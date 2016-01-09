package com.etc.pdca.entity;

public class User {
	private int id;
	private String username;
	private String password;
	private String realname;
	private String sex;
	private Role role;
	private Department department;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRealname() {
		return realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	public User() {
		super();
	}

	public User(int id, String username, String password, String realname,
			String sex, Role role, Department department) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.realname = realname;
		this.sex = sex;
		this.role = role;
		this.department = department;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password="
				+ password + ", realname=" + realname + ", sex=" + sex
				+ ", role=" + role + ", department=" + department + "]";
	}
}
