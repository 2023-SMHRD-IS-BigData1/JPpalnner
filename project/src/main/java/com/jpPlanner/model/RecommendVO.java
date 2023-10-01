package com.jpPlanner.model;

public class RecommendVO {

	private String location_category;
	private String location_name;
	private String kewWords;
	private String nameLink;
	
	
	
	public RecommendVO(String location_category, String location_name, String kewWords, String nameLink) {
		super();
		this.location_category = location_category;
		this.location_name = location_name;
		this.kewWords = kewWords;
		this.nameLink = nameLink;
	}

	public RecommendVO(String location_name, String kewWords, String nameLink) {
		this.location_name = location_name;
		this.kewWords = kewWords;
		this.nameLink = nameLink;
	}

	public String getLocation_category() {
		return location_category;
	}

	public String getLocation_name() {
		return location_name;
	}

	public String getKewWords() {
		return kewWords;
	}

	public String getNameLink() {
		return nameLink;
	}
}
