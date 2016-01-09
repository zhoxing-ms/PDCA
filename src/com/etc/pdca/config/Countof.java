package com.etc.pdca.config;

import java.util.List;

import com.etc.pdca.entity.Task;
import com.etc.pdca.entity.Url;

public class Countof {
	public static double Countofnum(String realname,List<Url> urlListOfDone){
		double count=0;
		for(int i=0;i<urlListOfDone.size();i++){
			if(realname.equals(urlListOfDone.get(i).getTask().getUserLower().getRealname()))
				count++;
		}
		return count;
	}
	public static boolean isHaveproject(List<Task> tasks,Task task){
		for(int i =0;i<tasks.size();i++){
			if(tasks.get(i).getProject().getId()==task.getProject().getId())
				return false;
		}
		return true;
	}
}
