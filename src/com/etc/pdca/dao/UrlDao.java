package com.etc.pdca.dao;

import java.util.List;
import java.util.Map;

import com.etc.pdca.entity.Task;
import com.etc.pdca.entity.Url;

public interface UrlDao {
	public int addUrl(Url url);
	public List<Url> getUrlSH(Url url);
	public void updateStates(Url url);
	public void updataUrlstates(Url url);
	public List<Url> getUrlByPDCA(Url url);
	public int getUrlOfCount(Url url);
	public List<Url> getUrlOfAllList(Url url);
	//通过自己ID获取分配任务信息
	public List<Url> getAllListById(Url url);
	public List<Url> getAllListById1(Url url);
	//获取最上级领导统计信息
	public int getUrlCountOfPDCA(Url url);
	public void updateAdvanceD(int id);
	public Url getUrlByUrlId(int id);
	//统计C
	public int getCountByC(int id);
	//更新数据
	
	public void updateNum(Map<String,Object> map);
	//计算1级某个项目所有要提交的D项目个数
	public int getUrlCountOfDNum(Url url);
	//更改执行人（上级关系）
	public void updateUrlByTask(Url url);
	//  通过url_id获取URL
	public List<Url> getUrlByUrl_Id(int id);
	public List<Url> getUrlByUrl_Id_PDCA(int id);
	public List<Url> getUrlByUrl_Id_NoPDCA(int id);
	public void deleteUrl(int id);
	public void deleteUrlByProjectId(int id);
	//通过项目获取所有有关的URL
	public List<Url> getUrlByProject(int id);
	public int getCountByUpNum(int id);
	public void updateUrlDoc(Url url);
	public List<Url> getUrlByUserAndProject(Map<String,Object> map);
	public List<Url> getUrlByUserAndProjectAndTime(Map<String,Object> map);
	//报表统计
	//所有任务
	public int getCountOfExecution(int id);
	//提前完成
	public int getCountOfEarlier(int id);
	// 未及时完成
	public int getCountOfUnfinished(int id);
	//及时完成
	public int getCountOfTimely(int id);
	//正在进行
	public int getCountOfUnderway(int id);
	//
	
	//待完成任务
	public  List<Url> getUrlOfDone(Map<String,Object> map);
	// 已完成任务
	public  List<Url> getUrlOfFinished(Map<String,Object> map);
	// 未完成任务
	public  List<Url> getUrlOfUnfinished(Map<String,Object> map);
	public int getCountUrlByUserAndProjectAndTimeOfOver(Map<String,Object> map);
	//获取所有下级
	public  List<Url> getUrlOfAllUserLower(int id);
	//下级提前完成任务个数
	public int getUrlOfAllUserLowerByEarlier(int id);
	//下级及时完成任务个数
	public int getUrlOfAllUserLowerByTimely(int id);
	//下级未完成任务个数
	public int getUrlOfAllUserLowerByUnfinished(int id);
	public  List<Url> urlPage(Map<String,Object> map);
	public  List<Url> getUrlByPDCAPage(Map<String,Object> map);
	public  List<Url> getWork(int id);
	public  List<Url> getOfUnfinished(int id);
	public  List<Url> getOfUnfinished2(int id);
	public  List<Url> getOfUnderway(int id);
	public  List<Url> getUrlByProjectID(int id);
	public  List<Url> getUrlUpper(Map<String,Object> map);
	public List<Url> getOfEarlier(int id);
	public List<Url> getOfTimely(int id);
}
