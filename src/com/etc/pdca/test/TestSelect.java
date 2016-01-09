package com.etc.pdca.test;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.etc.pdca.config.Countof;
import com.etc.pdca.entity.Count;
import com.etc.pdca.entity.Project;
import com.etc.pdca.entity.Task;
import com.etc.pdca.entity.Url;
import com.etc.pdca.entity.User;
import com.etc.pdca.service.ProjectService;
import com.etc.pdca.service.TaskService;
import com.etc.pdca.service.UrlService;
import com.etc.pdca.service.UserService;
import com.opensymphony.xwork2.ActionContext;

public class TestSelect {
	private static ProjectService projectService = new ProjectService();
	private static UrlService urlService = new UrlService();
	private static UserService userService = new UserService();
	private static TaskService taskService = new TaskService();
	public static void main(String[] args){
//		HttpServletResponse response = ServletActionContext.getResponse();
		//HttpServletRequest request = ServletActionContext.getRequest();
		//response.setCharacterEncoding("UTF-8");
		//ActionContext ac = ActionContext.getContext();
		//User user = (User) ac.getSession().get("user");
		User user = userService.getUserById(1);
		List<Task> projectList = taskService.getTaskByUserId(user.getId());
		String json ="{\"options\":[{";
		System.out.println(projectList.size()+"---------------");
		for(int i= 0;i<projectList.size();i++){
			if(i==0){
				json = json+"\"p1\":[";
				
			}
			else{
				json=json+"{\"p1"+"\":[";
				
			}
		int projectId = projectList.get(i).getProject().getId();
		Project project = projectService.getProjectByID(projectId);
		String projectname = project.getProjectname();
		int url_id = 0;
		Url url = new Url();
		Task task = new Task();
		task.setProject(project);
		task.setUserUpper(user);
		url.setTask(task);
		List<Url> listUrlOfLower = new ArrayList<Url>();
		if (url_id == 0) {
			listUrlOfLower = urlService.getAllListById1(url);
		} else {
			url.setId(url_id);
			listUrlOfLower = urlService.getAllListById(url);
		}
		// 获取下级详情
		//ac.put("listUrlOfLower", listUrlOfLower);
		List<Count> countList = new ArrayList<Count>();
		List<Url> urlListOfDone = urlService.getUrlOfDone(user.getId(), project.getId());
		List<Url> urlListOfFinished =urlService.getUrlOfFinished(user.getId(), project.getId());
		List<Url> urlListOfUnfinished = urlService.getUrlOfUnfinished(user.getId(), project.getId());
		List<Url> lowerofurl  = urlService.getUrlOfAllUserLower(user.getId());
		List<String> listofjson  = new ArrayList<String>();
		String p1;
		double[] num = new double[lowerofurl.size()];
		double countofnum = urlListOfDone.size()
				+urlListOfFinished.size()+urlListOfUnfinished.size();
		for(int k =0 ;k<lowerofurl.size();k++){
			String realname=lowerofurl.get(k).getTask().getUserLower().getRealname();
			double Done = Countof.Countofnum(realname,urlListOfDone);
			double Finished = Countof.Countofnum(realname,urlListOfFinished);
			double Unfinished =Countof. Countofnum(realname,urlListOfUnfinished);
			double countofProject = Done+Finished+Unfinished;
			num[i] = countofProject;
			if(Done+Finished+Unfinished!=0){
			p1="{\"projectname\":\""+projectname
				+"\",\"realname\":\""+realname+"\","+"\"per\":"+countofProject*100/countofnum
			+",\"p2\":[{\"Finished\":\""+"待完成\","+"\"per\":"+(Done*100/countofProject)
					+"},"+"{\"Finished\":\""+"完成\","+"\"per\":"+(Finished*100/countofProject)
					+"},"+"{\"Finished\":\""+"未完成\","+"\"per\":"+(Unfinished*100/countofProject)
					+"}]},";
			listofjson.add(p1);
			}
		}
		
//		json = "{\"projectname\":\""+lowerofurl.get(0).getTask().getProject().getProjectname()+"\","
//				+"\"realnameNum\":"+lowerofurl.size()+",";
		System.out.println(listofjson.size()+json);
		for(int j =0;j<listofjson.size();j++){
			json=json+listofjson.get(j);
			System.out.println(listofjson.get(j));
			System.out.println(json);
			System.out.println(j);
		}
		System.out.println("lowerofurl==="+lowerofurl.size()+",userId="+user.getId());
		System.out.println(11111);
		json=json.substring(0, json.length()-1);
		json=json+"]},";
		}
		json=json.substring(0, json.length()-1);
		json=json+"],"+"\"projectnumber\":"+projectList.size()+"}";
		System.out.println(json);
	}
}
