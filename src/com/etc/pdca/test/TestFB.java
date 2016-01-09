package com.etc.pdca.test;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.etc.pdca.entity.Count;
import com.etc.pdca.entity.Project;
import com.etc.pdca.entity.Task;
import com.etc.pdca.entity.Url;
import com.etc.pdca.entity.User;
import com.etc.pdca.service.ProjectService;
import com.etc.pdca.service.UrlService;
import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;

public class TestFB {
	public static ProjectService projectService = new ProjectService();
	public static int pageSize = 2 ;
	public static UrlService urlService = new UrlService();
	public static void main(String[] args){
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request = ServletActionContext.getRequest();
		int pageNum = 0;
		pageNum = Integer.parseInt(request.getParameter("pageNum"));
		response.setCharacterEncoding("UTF-8");
		User user = (User) ActionContext.getContext().getSession().get("user");
		ActionContext ac = ActionContext.getContext();
		List<Project> projectList = new ArrayList<Project>();
		List<Url> urlPDCA = new ArrayList<Url>();
		// 针对无上级领导
		List<Count> countList = new ArrayList<Count>();
		double s1 = projectService.getProjectList(user.getId()).size();
		double d = s1 / pageSize;
		System.out.println("size======================"+projectService.getProjectList(user.getId()).size());
		int endPage = (int) Math.ceil(d);
		projectList = projectService.projectPage(user.getId(), (pageNum - 1)
				* pageSize, pageSize);
		System.out.println("project========"+projectList.get(0));
		for (int i = 0; i < projectList.size(); i++) {
			Count count = new Count();
			Task task = new Task();
			task.setProject(projectList.get(i));
			task.setUserUpper(user);
			Url url = new Url();
			url.setTask(task);
			// 获取下属的详情
			List<Url> listUrlOfLower = urlService.getAllListById1(url);
			int s = listUrlOfLower.size();
			if (listUrlOfLower.size() > 0) {
				// 获取进度
				String advance = listUrlOfLower.get(0).getAdvance();
				count.setProject(projectList.get(i));
				count.setAdvance(advance);
				count.setP(pageNum);
				count.setD(endPage);
				countList.add(i, count);
			} else {
				count.setAdvance("P");
				count.setProject(projectList.get(i));
				count.setP(pageNum);
				count.setD(endPage);
				countList.add(i, count);
			}
		}
		Gson gson = new Gson();
		String json = gson.toJson(countList);
		System.out.println("json"+countList);
	}
}
