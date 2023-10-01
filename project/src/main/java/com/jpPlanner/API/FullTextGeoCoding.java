package com.jpPlanner.API;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import com.google.gson.Gson;

import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import com.jpPlanner.model.LatLon;

public class FullTextGeoCoding {

	public LatLon search(String search) throws UnsupportedEncodingException {
		
		String encoded = URLEncoder.encode(search, "UTF-8");
		OkHttpClient client = new OkHttpClient();
		Request request = new Request.Builder()
		  .url("https://apis.openapi.sk.com/tmap/geo/fullAddrGeo?addressFlag=F02&coordType=WGS84GEO&version=1&fullAddr="+ encoded +"&page=1&count=20")
		  .get()
		  .addHeader("accept", "application/json")
		  .addHeader("appKey", "ZzRVCMWhEL7KOahAwoKic3LiH1DifbjH6A38By0R")
		  .build();
		try {
			Response response = client.newCall(request).execute();
						
			Gson gson = new Gson();
			String responseToString = response.body().string();
		
			FullTextGeoCodingInfo info = gson.fromJson(responseToString, FullTextGeoCodingInfo.class);

			String lat = info.getCoordinateInfo().getCoordinate().get(0).getNewLat();
			String lon = info.getCoordinateInfo().getCoordinate().get(0).getNewLon();
			
			return new LatLon(lat, lon);
			
		} catch(Exception e) {
			System.out.println(e);
		}
		
		return null;
	}

}
