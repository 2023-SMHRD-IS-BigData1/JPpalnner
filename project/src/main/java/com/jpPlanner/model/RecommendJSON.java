package com.jpPlanner.model;

import com.google.gson.Gson;
import java.util.List;


public class RecommendJSON {

	private List<Poi> poi;

	// Constructor
	public RecommendJSON(List<Poi> poi) {
          this.poi = poi;
      }

	// Getter
	public List<Poi> getPoi() {
		return poi;
	}

	public class Poi {

		private String name;
		private String tag;
		private String naverUrl;
		private List<String> imgList;

		// Constructor
		public Poi(String name, String tag, String naverUrl, List<String> imgList) {
			this.name = name;
			this.tag = tag;
			this.naverUrl = naverUrl;
			this.imgList = imgList;
		}

		// Getter
		public String getName() {
			return name;
		}

		public String getTag() {
			return tag;
		}

		public String getNaverUrl() {
			return naverUrl;
		}

		public List<String> getImgList() {
			return imgList;
		}
		
		

		// Setter
		public void setImgList(List<String> imgList) {
			this.imgList = imgList;
		}

	}
}
