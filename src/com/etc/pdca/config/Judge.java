package com.etc.pdca.config;

public class Judge {

	public int getJudgeFruit(int earlier,int timely,int unfinished){
		//1优秀2良好3合格4差
		int sum=earlier+timely+unfinished;
		if(sum==0){
			return 0;
		}else{
			int earlierPercent = (earlier*100)/sum;
			int unfinishedPercent = (unfinished*100)/sum;
			if(unfinishedPercent==0){
				return 1;
			}else if(unfinishedPercent>0&&unfinishedPercent<=10){
				if(earlierPercent>=30){
					return 1;
				}else{
					return 2;
				}
			}else if(unfinishedPercent>10&&unfinishedPercent<=20){
				if(earlierPercent>=30){
					return 2;
				}else{
					return 3;
				}
			}else if(unfinishedPercent>20){
				return 4;
			}
		}
		return 0;
	}
}
