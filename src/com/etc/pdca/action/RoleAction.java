package com.etc.pdca.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.etc.pdca.entity.Role;
import com.etc.pdca.service.RoleService;
import com.etc.pdca.util.JsonUtil;
import com.opensymphony.xwork2.ActionSupport;

public class RoleAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6717650643982505906L;

	private RoleService roleService = new RoleService();
	
	private Role role;
	
	private String condition;

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	public RoleAction() {
		super();
	}
	
	public void addRole() {
		roleService.addRole(role);
	}
	
	public void updateRole() {
		System.out.println(role);
		roleService.updateRole(role);
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

	public void deleteRole() {
		roleService.deleteRole(role.getId());
	}

	public void findRolesByCondition() {
		List<Role> Roles = roleService.findRolesByCondition(condition);
		/*
		 * 使用JsonUtil将Roles集合转为json字符串
		 */
		String jsonStr = JsonUtil.toJson(Roles);
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
