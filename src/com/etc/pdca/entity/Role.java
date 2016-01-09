package com.etc.pdca.entity;

/*
 * ��ɫ��
 */
public class Role {  //角色类
	private int id;                
	private String rolename;
	private int grade;

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public Role() {
		super();
	}
	
	public Role(int id, String rolename, int grade) {
		super();
		this.id = id;
		this.rolename = rolename;
		this.grade = grade;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getRolename() {
		return rolename;

	}
	public void setRolename(String rolename) {
		this.rolename = rolename;
	}
	@Override
	public String toString() {
		return "Role [id=" + id + ", rolename=" + rolename + ", grade=" + grade
				+ "]";
	}           
	

}
