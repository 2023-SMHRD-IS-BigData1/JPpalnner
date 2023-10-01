package com.jpPlanner.API;

import java.util.List;

public class NaverSearchInfo {
	//1층
	private List<Items> items;
	
	public List<Items> getItems() {
		return items;
	}
	
	public static class Items {
		//2층 
		private String roadAddress;
		
		public String getRoadAddress() {
			return roadAddress;
		}
		
	}
	
}
