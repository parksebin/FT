package ac.kr.ft.com.service;

import java.util.List;

import org.json.simple.JSONObject;

import ac.kr.ft.com.dto.SalesDTO;

public interface ISalesService {
	
	//골목 상권 순위 리스트 조회  하기
	SalesDTO getBusiSalesList(SalesDTO pDTO) throws Exception;
	
	//골목 상권 순위 상세정보
	JSONObject getBusiSalesDetail(SalesDTO pDTO) throws Exception;
	
	//골목 상권 상세정보-도넛 차트
	SalesDTO getBusiSalesDonutsChart(SalesDTO pDTO) throws Exception;
	
	//골목 상권 상세정보(상권 이름가져오기)
	SalesDTO getBusiSalesNmInfo(SalesDTO pDTO) throws Exception;
	
	//골목 상권 상세정보(점포증감률, 신규 창업 위험 지수 바차트)
	List<SalesDTO> getBusiSalesBarChart(SalesDTO pDTO)	throws Exception;		
	
	
	
	
	//축제 상권 상세정보(기본)-분식집, 패스트푸드점, 커피음료 상권정보 가져오기
	JSONObject getBusiFestivaSalesNmInfo(SalesDTO pDTO) throws Exception;
	
	//축제 상권 상세정보(기본)-도넛차트
	SalesDTO getBusiFestivaSalesNmInfoDonuts(SalesDTO pDTO) throws Exception;	
	
	//축제 상권 상세정보(기본)-바차트
	List<SalesDTO> getFestivaSalesNmInfoBarChart(SalesDTO pDTO) throws Exception;
}
