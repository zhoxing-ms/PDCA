package com.etc.pdca.test;

import java.util.List;

import com.etc.pdca.entity.Task;
import com.etc.pdca.service.TaskService;
import com.etc.pdca.service.UserService;
import com.opensymphony.xwork2.ActionContext;
import com.tool.getString.getstring;

public class TestOrg {
	public static TaskService taskService = new TaskService();
	public static UserService userService = new UserService();
	public static void main(String[] arg){
		List<Task> idList = taskService.getTaskByUserId(1);   //项目id
//		String orgjson = "";
		ActionContext ac = ActionContext.getContext();
		for(int k =0;k<idList.size();k++){
			System.out.println(idList.size());
		int	id = idList.get(k).getProject().getId();
		System.out.println(id);
		//int id =6;
		List<Task> list = taskService.getTaskInfo(id);
		
		int[][]a = new int[list.size()][2];  
				
		for (int i = 0 ; i < list.size(); i++){		
			a[i][0] = list.get(i).getUserUpper().getId();
			
			a[i][1] = list.get(i).getUserLower().getId();	
			
		}
		
		String[] name = new String[100];              //id 对应的name
		
		for (int i = 0; i < list.size(); i++) {      //行
			for (int j = 0; j < 2; j++) {               //列
				int t = a[i][j];
				if( name[ t-1 ] == null){
					
					//String str = userService.getUserById(t).getRole().getRolename();
				
					name[ t-1 ] = /*"<a href=\"http://www.baidu.com\" >"+*/userService.getUserById(t).getRealname()/*+"</a>"*/;
				}		
			}
		}
			
		 getstring x = new getstring();
		 int BossId = x.getTheBoss(a);
		 
		 String str =  x.setTheCode(a, BossId, name);
		 System.out.println(str);
		}
		//System.out.println(json);
		//ac.getContext().getSession().put("my",orgjson );
			
	}
	
}
