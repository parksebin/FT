package ac.kr.ft.com.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

/**
 * 날짜 관련 함수 모음
 */
public class DateUtil {

	//날짜 표시 형식으로 데이터 가져오기
	public static String getDate(String str) {
		SimpleDateFormat formatter = new SimpleDateFormat(str, Locale.KOREA);
		Date currentTime = new Date();
		String res = formatter.format(currentTime);

		return res;
	}
	
	//오늘 년 가져오기
	public static String getTodayYYYY() {
		return getDate("yyyy");
		
	}
	
	//오늘 월 가져오기
	public static String getTodayMM() {
		return getDate("MM");
		
	}
	
	//오늘 날 가져오기
	public static String getTodayDD() {
		return getDate("dd");
		
	}
	
	

}
