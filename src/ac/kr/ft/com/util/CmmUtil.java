package ac.kr.ft.com.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.DecimalFormat;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import ac.kr.ft.com.dto.PositionDTO;

public class CmmUtil {
	public static String nvl(String str, String chg_str) {
		String res;

		if (str == null) {
			res = chg_str;
		} else if (str.equals("")) {
			res = chg_str;
		} else {
			res = str;
		}
		return res;
	}

	public static String nvl(String str) {
		return nvl(str, "");
	}

	public static String checked(String str, String com_str) {
		if (str.equals(com_str)) {
			return " checked";
		} else {
			return "";
		}
	}

	public static String checked(String[] str, String com_str) {
		for (int i = 0; i < str.length; i++) {
			if (str[i].equals(com_str))
				return " checked";
		}
		return "";
	}

	public static String select(String str, String com_str) {
		if (str.equals(com_str)) {
			return " selected";
		} else {
			return "";
		}
	}

	public static String viewComma(String str) {

		Double dStr = Double.parseDouble(str);
		DecimalFormat df = new DecimalFormat("#,##0");

		return df.format(dStr);
	}

	public static PositionDTO getPos(String full_addr) throws Exception {

		System.out.println("full_addr : "+ full_addr);
		String res = ""; 
		String clientId = "VWiK2HOmrEBqn2f11FM7";
		String clientSecret = "zWOXLodZVp";
		String addr = URLEncoder.encode(full_addr, "UTF-8");
		String apiURL = "https://openapi.naver.com/v1/map/geocode?query=" + addr;
		URL url = new URL(apiURL);
		HttpURLConnection con = (HttpURLConnection) url.openConnection();
		con.setRequestMethod("GET");
		con.setRequestProperty("X-Naver-Client-Id", clientId);
		con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
		int responseCode = con.getResponseCode();
		BufferedReader br;
		if (responseCode == 200) { 
			br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		} else { 
			br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		}
		String inputLine;
		StringBuffer response = new StringBuffer();
		while ((inputLine = br.readLine()) != null) {
			response.append(inputLine);
		}
		br.close();
		System.out.println("!!!"+ response.toString());

		res = response.toString();

		return getJSONpos(res);

	}

	public static PositionDTO getJSONpos(String res) throws ParseException {
		PositionDTO pDto = new PositionDTO();

		JSONParser jsonParser = new JSONParser();

		JSONObject jsonObject = (JSONObject) jsonParser.parse(res);

		JSONObject result = (JSONObject) jsonObject.get("result");
		if(result == null)
			result = new JSONObject();

		JSONArray items = (JSONArray) result.get("items");
		if(items != null){
			
			JSONObject items_sub = (JSONObject) (items.get(0));
			if(items_sub == null)
				items_sub = new JSONObject();
			
			JSONObject point = (JSONObject) (items_sub.get("point"));
			if(point == null)
				point = new JSONObject();
			
			System.out.println("%%%% " + CmmUtil.nvl(""+point.get("x")));

			System.out.println("%%%% " + CmmUtil.nvl(""+point.get("y")));

			pDto.setLat(CmmUtil.nvl("" + point.get("y")));

			pDto.setLng(CmmUtil.nvl("" + point.get("x")));
		}
		return pDto;

	}

	public static JSONObject weather() throws IOException, ParseException {
		String res = "";
		String apiURL = "http://apis.skplanetx.com/weather/forecast/6days?lon=126.991007&village=&county=&foretxt=&lat=37.579301&city=%EC%84%9C%EC%9A%B8&version=1&appKey=3fafc3a9-0c7a-3101-8d5b-1ebca252b0c1";
		URL url = new URL(apiURL);
		System.out.println(url);
		HttpURLConnection con = (HttpURLConnection) url.openConnection();
		con.setRequestMethod("GET");
		int responseCode = con.getResponseCode();
		BufferedReader br;
		if (responseCode == 200) { 
			br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
		} else { 
			br = new BufferedReader(new InputStreamReader(con.getErrorStream(), "UTF-8"));
		}
		String inputLine;	
		StringBuffer response = new StringBuffer();
		while ((inputLine = br.readLine()) != null) {
			response.append(inputLine);
		}
		br.close();

		res = response.toString();
		JSONParser jsonParser = new JSONParser();

		JSONObject jsonObject = (JSONObject) jsonParser.parse(res);

		JSONObject weather = (JSONObject) jsonObject.get("weather");

		JSONArray forecast6days = (JSONArray) weather.get("forecast6days");

		JSONObject zero = (JSONObject) forecast6days.get(0);

		JSONObject jobj = (JSONObject) jsonParser.parse(zero.toString());

		System.out.println(jobj);

		JSONObject sky = (JSONObject) jobj.get("sky");

		JSONObject temp = (JSONObject) jobj.get("temperature");

		return jobj;

	}
}
