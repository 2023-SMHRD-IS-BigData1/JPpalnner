package com.jpPlanner.API;

import java.util.List;

public class FullTextGeoCodingInfo {
	// 1층
	private CoordinateInfo coordinateInfo;
	
	public CoordinateInfo getCoordinateInfo() {
		return coordinateInfo;
	}
	// 2층
	public static class CoordinateInfo {
		private List<Coordinate> coordinate;
		
		public List<Coordinate> getCoordinate() {
			return coordinate;
		}
		// 3층
		public static class Coordinate {
			
			private String newLat;
			private String newLon;
			
			public String getNewLat() {
				return newLat;
			}
			public String getNewLon() {
				return newLon;
			}
			
		}
		
	}
	
}
