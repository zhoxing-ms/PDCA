package com.etc.pdca.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.etc.pdca.entity.Department;
import com.etc.pdca.service.DepartmentService;
import com.etc.pdca.util.JsonUtil;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class DepartmentAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2274245335137275638L;

	private DepartmentService departmentService = new DepartmentService();

	private Department department;

	private String condition;

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	public DepartmentAction() {
		super();
	}

	public void addDepartment() {
		departmentService.addDepartment(department);
	}
	
	public void updateDepartment() {
		System.out.println(department);
		departmentService.updateDepartment(department);
		/*
		 * 获得response对象
		 */
		HttpServletResponse response = ServletActionContext.getResponse();
		/*
		 * 设置HTTP协议接受的内容类型及编码
		 */
		response.setContentType("text/html;charset=utf-8");
		String msg = JsonUtil.toJson("更新成功");
		PrintWriter pw = null;
		try {
			pw = response.getWriter();
			pw.println(msg);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void deleteDepartment() {
		departmentService.deleteDepartment(department.getDepartId());
	}

	public void findDeparmentsByCondition() {
		List<Department> departments = departmentService.findDepartmentsByCondition(condition);
		/*
		 * 使用JsonUtil将departments集合转为json字符串
		 */
		String jsonStr = JsonUtil.toJson(departments);
		/*
		 * 获得response对象
		 */
		HttpServletResponse response = ServletActionContext.getResponse();
		/*
		 * 设置HTTP协议接受的内容类型及编码
		 */
		response.setContentType("text/html;charset=utf-8");
		/*
		 * 输出json字符串到前台
		 */
		PrintWriter pw = null;
		try {
			pw = response.getWriter();
			pw.println(jsonStr);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public String execute() throws Exception {
		return SUCCESS;
	}
	
	public String list() {
		return SUCCESS;
	}
}
