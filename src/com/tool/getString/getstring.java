package com.tool.getString;

import java.util.ArrayList;

public class getstring {
	static int jagement = 0;
	
	public static int getTheBoss(int [][]a){
		for(int i = 0; i < a.length; i++){
			for(int j = 0; j < a.length; j++){
				if(a[i][0] == a[j][1])
					jagement = 1;
			}
			if(jagement == 0)
				return a[i][0]-1;
		}
		return -1;
	}
	
	public static boolean findSon(int[][] a, int Id){
		for(int i = 0; i < a.length; i++){
			if(Id == (a[i][0]-1)){
				return true;
			}
		}
		return false;
	}
	
	public static String InsertCode(StringBuilder Parents, StringBuilder Sons, String Id){
		int index = Parents.indexOf(Id) + 4 + Id.length();
		return Parents.insert(index, Sons).toString();
	}
	public static String setTheCode(int[][] a, int BossId, String[] b){
		String BossName =  b[BossId];
		String GrandParent = "<li>" + BossName + "<ul></ul></li>";
		if(!findSon(a,BossId)){
		}else{
			for(int i = 0; i < a.length; i++){
				if(BossId == (a[i][0]-1)){
					GrandParent = 
							InsertCode(new StringBuilder(GrandParent),
									new StringBuilder(
											setTheCode(a, a[i][1]-1, b)), b[BossId]);
				}
			}
		}return GrandParent;
	} 
}
