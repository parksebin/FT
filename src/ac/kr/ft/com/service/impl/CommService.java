package ac.kr.ft.com.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import ac.kr.ft.com.dto.ComDTO;
import ac.kr.ft.com.dto.EventDTO;
import ac.kr.ft.com.dto.NoticeDTO;
import ac.kr.ft.com.dto.VisitorDTO;
import ac.kr.ft.com.persistance.mapper.CommMapper;
import ac.kr.ft.com.service.ICommService;

@Service("CommService")
public class CommService implements ICommService{
	@Resource(name="CommMapper")
	private CommMapper commMapper;
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Override
	public void setVisitor() throws Exception {
		VisitorDTO visitorDto = commMapper.getTodayVisitor();
		if(visitorDto == null){
			visitorDto = new VisitorDTO();
		}
		if(visitorDto.getTo_code() == null){
			visitorDto.setTo_code("0");
		}
		// to_code가 1이면 today에 오늘이 존재함
		if(visitorDto.getTo_code().equals("1")){
			// update구문
			int visitor_cnt = (Integer.parseInt(visitorDto.getVisitor_cnt()))+1;
			visitorDto.setVisitor_cnt(""+visitor_cnt);
			// 0이 아니면 에러 발생
			if(commMapper.visitorUpdate(visitorDto) !=0){
				log.info("방문자수 상승");
			}else{
				log.info("방문자수 상승실패");
			}
		}else{
			// to_code가 0이면 insert
			if(commMapper.visitorInsert() != 0){
				log.info("TODAY 생성");
			}else{
				log.info("TODAY 생성 실패");
			}
		}
	}

	@Override
	public VisitorDTO getVisitorDto() throws Exception {
		return commMapper.getVisitorDto();
	}

	@Override
	public ComDTO getComDto() throws Exception {
		ComDTO resultCom = new ComDTO();
		
		ComDTO ctrRDto = commMapper.getCtrR_cnt();
		// null 오류처리
		if(ctrRDto == null){
			ctrRDto = new ComDTO();
		}
		if(ctrRDto.getCtrR_cnt() == null){
			ctrRDto.setCtrR_cnt("0");
		}
		log.info("ctrR_cnt:"+ctrRDto.getCtrR_cnt());
		
		ComDTO cntDto = commMapper.getCommunityCnt();
		if(cntDto == null){
			cntDto = new ComDTO();
		}
		if(cntDto.getCommunity_cnt() == null){
			cntDto.setCommunity_cnt("0");
		}
		log.info("ctrComm_cnt:"+cntDto.getCommunity_cnt());
		
		resultCom.setCtrR_cnt(ctrRDto.getCtrR_cnt());
		resultCom.setCommunity_cnt(cntDto.getCommunity_cnt());
		
		return resultCom;
	}

	@Override
	public List<ComDTO> getCommentList() throws Exception {
		return commMapper.getCommentList();
	}

	@SuppressWarnings("unchecked")
	@Override
	public JSONObject getJsonObject() throws Exception {
		JSONObject jsonObject = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		List<ComDTO> list = commMapper.getJsonList();
		Iterator<ComDTO> it = list.iterator();
		
		jsonObject.put("element", "morris-area-chart");
		jsonObject.put("xkey", "period");
		jsonObject.put("pointSize", 2);
		jsonObject.put("hideHover", "auto");
		jsonObject.put("resize", true);
		
		jsonArray.add("방문자 수");
		jsonArray.add("새로운 문의");
		jsonArray.add("새로운 주문");
		
		jsonObject.put("ykeys", jsonArray);
		jsonObject.put("labels", jsonArray);
		
		jsonArray = new JSONArray();
		
		while(it.hasNext()){
			ComDTO comDto = (ComDTO)it.next();
			
			if(comDto == null){
				comDto = new ComDTO();
			}
			
			JSONObject comJson = new JSONObject();
			
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
			Date reg_date = dateFormat.parse(comDto.getReg_dt());
			dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			comJson.put("days", dateFormat.format(reg_date));
			comJson.put("방문자 수", comDto.getVisitor_cnt());
			comJson.put("새로운 문의", comDto.getCommunity_cnt());
			comJson.put("새로운 주문", comDto.getCtrR_cnt());
			
			jsonArray.add(comJson);
		}
		
		jsonObject.put("data", jsonArray);
		
		return jsonObject;
	}

	@Override
	public List<ComDTO> getNewList() throws Exception {
		// TODO Auto-generated method stub
		return commMapper.getNewList();
	}


}
