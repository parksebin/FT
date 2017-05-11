package ac.kr.ft.com.service.impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import ac.kr.ft.com.dto.SalesDTO;
import ac.kr.ft.com.persistance.mapper.SalesMapper;
import ac.kr.ft.com.service.ISalesService;
import ac.kr.ft.com.util.CmmUtil;

@Service("SalesService")
public class SalesService implements ISalesService {
	
	private Logger log = Logger.getLogger(this.getClass());

	@Resource(name="SalesMapper")
	private SalesMapper salesMapper;
	
	@Override
	public SalesDTO getBusiSalesList(SalesDTO pDTO) throws Exception{
		
		SalesDTO rDTO = salesMapper.getBusiSalesListCnt(pDTO);	
		log.info("SalesMapper.getBusiSalesListCnt!!");

		rDTO.setrList(salesMapper.getBusiSalesList(pDTO));
		log.info("SalesMapper.getBusiSalesList!!");
		
		return rDTO;
	}
	
	@Override
	public JSONObject getBusiSalesDetail(SalesDTO pDTO) throws Exception{

		//차트를 그리기 위한 영역 시작!
		JSONObject jsonObject = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		List<SalesDTO> rlist = salesMapper.getBusiSalesDetail(pDTO);
		
		if (rlist==null){
			rlist = new ArrayList<SalesDTO>();
			
		}
		
		Iterator<SalesDTO> it = rlist.iterator();
		
		jsonObject.put("element", "morris-area-chart");
		jsonObject.put("xkey", "period");
		jsonObject.put("pointSize", 2);
		jsonObject.put("hideHover", "auto");
		jsonObject.put("resize", true);
		
		jsonArray.add("분식집");
		jsonArray.add("패스트푸드점");
		jsonArray.add("커피음료");
		
		jsonObject.put("ykeys", jsonArray);
		jsonObject.put("labels", jsonArray);
		
		jsonArray = new JSONArray();
		
		while(it.hasNext()){
			SalesDTO rDTO = (SalesDTO)it.next();
			
			if(rDTO == null){
				rDTO = new SalesDTO();
			}
			
			JSONObject comJson = new JSONObject();
			
			comJson.put("days", CmmUtil.nvl(rDTO.getYyyymm()));
			comJson.put("분식집", CmmUtil.nvl(rDTO.getSt_cd_cs100005()));
			comJson.put("패스트푸드점", CmmUtil.nvl(rDTO.getSt_cd_cs100006()));
			comJson.put("커피음료", CmmUtil.nvl(rDTO.getSt_cd_cs100009()));
			
			jsonArray.add(comJson);
		}
		
		jsonObject.put("data", jsonArray);
		
		//차트를 그리기 위한 영역 끝!		
		
		return jsonObject;
	}
	
	@Override
	public SalesDTO getBusiSalesDonutsChart(SalesDTO pDTO) throws Exception{
		
		log.info("SalesMapper.getBusiSalesDonutsChart!!");

		SalesDTO rDTO = salesMapper.getBusiSalesDonutsChart(pDTO);	

		return rDTO;
	}
	
	@Override
	public SalesDTO getBusiSalesNmInfo(SalesDTO pDTO) throws Exception{
		
		log.info("SalesMapper.getBusiSalesNmInfo!!");
		
		SalesDTO rDTO = salesMapper.getBusiSalesNmInfo(pDTO);	
		
		return rDTO;
	}
	
	
	//골목 상권 상세정보(점포증감률, 신규 창업 위험 지수 바차트)
	public List<SalesDTO> getBusiSalesBarChart(SalesDTO pDTO) throws Exception{
	
		return salesMapper.getBusiSalesBarChart(pDTO);
		
	}
	
	
	@Override
	public JSONObject getBusiFestivaSalesNmInfo(SalesDTO pDTO) throws Exception{

		//차트를 그리기 위한 영역 시작!
		JSONObject jsonObject = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		List<SalesDTO> rlist = salesMapper.getBusiFestivaSalesNmInfo(pDTO);
		
		if (rlist==null){
			rlist = new ArrayList<SalesDTO>();
			
		}
		
		Iterator<SalesDTO> it = rlist.iterator();
		
		jsonObject.put("element", "morris-area-chart");
		jsonObject.put("xkey", "period");
		jsonObject.put("pointSize", 2);
		jsonObject.put("hideHover", "auto");
		jsonObject.put("resize", true);
		
		jsonArray.add("분식집");
		jsonArray.add("패스트푸드점");
		jsonArray.add("커피음료");
		
		jsonObject.put("ykeys", jsonArray);
		jsonObject.put("labels", jsonArray);
		
		jsonArray = new JSONArray();
		
		while(it.hasNext()){
			SalesDTO rDTO = (SalesDTO)it.next();
			
			if(rDTO == null){
				rDTO = new SalesDTO();
			}
			
			JSONObject comJson = new JSONObject();
			
			comJson.put("days", CmmUtil.nvl(rDTO.getYyyymm()));
			comJson.put("분식집", CmmUtil.nvl(rDTO.getSt_cd_cs100005()));
			comJson.put("패스트푸드점", CmmUtil.nvl(rDTO.getSt_cd_cs100006()));
			comJson.put("커피음료", CmmUtil.nvl(rDTO.getSt_cd_cs100009()));
			
			jsonArray.add(comJson);
		}
		
		jsonObject.put("data", jsonArray);
		
		//차트를 그리기 위한 영역 끝!		
		
		return jsonObject;
	}	
	
	//축제 상권 상세정보(기본)-도넛차트
	@Override
	public SalesDTO getBusiFestivaSalesNmInfoDonuts(SalesDTO pDTO) throws Exception{
		
		log.info("SalesMapper.getBusiFestivaSalesNmInfoDonuts!!");

		SalesDTO rDTO = salesMapper.getBusiFestivaSalesNmInfoDonuts(pDTO);	

		return rDTO;
	}
	
	//축제 상권 상세정보(점포증감률, 신규 창업 위험 지수 바차트)
	public List<SalesDTO> getFestivaSalesNmInfoBarChart(SalesDTO pDTO) throws Exception{
		log.info("SalesMapper.getFestivaSalesNmInfoBarChart!!");
	
		return salesMapper.getFestivaSalesNmInfoBarChart(pDTO);
		
	}	
	
	
}
