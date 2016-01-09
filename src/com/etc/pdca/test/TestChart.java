package com.etc.pdca.test;

import java.util.ArrayList;
import java.util.List;

import javax.print.PrintService;

import com.etc.pdca.entity.Project;
import com.etc.pdca.entity.Task;
import com.etc.pdca.entity.Url;
import com.etc.pdca.entity.User;
import com.etc.pdca.service.ProjectService;
import com.etc.pdca.service.TaskService;
import com.etc.pdca.service.UrlService;

public class TestChart {
	public static ProjectService projectService = new ProjectService();
	public static UrlService urlService = new UrlService();
	private static TaskService taskService = new TaskService();
	public static void main(String[] args){
		List<Task> projectList = taskService.getTaskByUserId(1);
		//List<Task> projectList =new ArrayList<Task>();
		String json ="{\"options\":[";
		System.out.println(projectList.size()+"---------------");
		for(int i= 0;i<projectList.size();i++){
			json = json+"{\"p1\":[{";
			int spId = projectList.get(i).getProject().getId();
			System.out.println(projectList.get(i).getProject().getId()+"============");
		List<String>  userList = new ArrayList<String>();
		List<Url> allUrlByProject = urlService.getUrlUpper(spId,1);
		System.out.println(allUrlByProject.size());
		for(int j=0;j<allUrlByProject.size();j++){
			Url url = allUrlByProject.get(j);
			String p1 ="";
			p1=p1+"\"userLower\":\""+url.getTask().getUserLower().getRealname()
			+"\",\"userUpper\":\""+url.getTask().getUserUpper().getRealname()
			+"\",\"href\":\"performPage.action?projectId="+spId
			+"\"},{";
			//System.out.println(p1);
			userList.add(p1);
		}
		for(int j=0;j<userList.size();j++){
			json = json+userList.get(j);
		}
		json = json.substring(0,json.length()-2);
		json = json+"]},";
		User userHead = projectService.getProjectByID(spId).getUser();
		//System.out.println("allUrlByProject"+allUrlByProject.toString());
		}
		json = json.substring(0,json.length()-1);
		json = json+"]}";
		System.out.println(json);
	}
}
