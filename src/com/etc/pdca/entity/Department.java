package com.etc.pdca.entity;

/**
 * 部门类
 * 
 * @author 敏
 * 
 */
public class Department {  //部门
	private int departId;
	private String departName;
	private String departDesc;

	public int getDepartId() {
		return departId;
	}

	public void setDepartId(int departId) {
		this.departId = departId;
	}

	public String getDepartName() {
		return departName;
	}

	public void setDepartName(String departName) {
		this.departName = departName;
	}

	public String getDepartDesc() {
		return departDesc;
	}

	public void setDepartDesc(String departDesc) {
		this.departDesc = departDesc;
	}

	public Department() {
		super();
	}

	public Department(int departId, String departName, String departDesc) {
		super();
		this.departId = departId;
		this.departName = departName;
		this.departDesc = departDesc;
	}

	@Override
	public String toString() {
		return "Department [departId=" + departId + ", departName="
				+ departName + ", departDesc=" + departDesc + "]";
	}
}
