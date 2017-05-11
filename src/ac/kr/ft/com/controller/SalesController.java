package ac.kr.ft.com.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import ac.kr.ft.com.dto.PositionDTO;
import ac.kr.ft.com.dto.SalesDTO;
import ac.kr.ft.com.service.ISalesService;
import ac.kr.ft.com.util.CmmUtil;

@Controller
public class SalesController {
	private Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "SalesService")
	private ISalesService salesService;

	/*
	 * ##########################################################################
	 * #							사업자용 시작 									#
	 * ##########################################################################
	 * 
	 */

	/**
	 * 골목 상권 순위 리스트 조회 하기
	 */
	@RequestMapping("sales/busiSalesDetail")
	public String getBusiSalesDetail(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		
		log.info("Welcome getBusiSalesDetail !!");
		
		String auth = (String) request.getSession().getAttribute("AUTH");
		if (auth == null || auth.equals("") || auth.equals("U")) {
			return "/noAuth";
		}

		log.info(CmmUtil.nvl(request.getParameter("sales_cd")));
		log.info(CmmUtil.nvl(request.getParameter("cal")));
		
		SalesDTO pDTO = new SalesDTO();

		pDTO.setSales_cd(CmmUtil.nvl(request.getParameter("sales_cd")));
		
		//메인 차트 관련
		JSONObject json = salesService.getBusiSalesDetail(pDTO);
		model.addAttribute("json",json); //차트 추가
		
		//도넛 차트 관련
		SalesDTO rDTO = salesService.getBusiSalesDonutsChart(pDTO);

		if (rDTO == null){
			rDTO = new SalesDTO();
			
		}

		model.addAttribute("rDTO",rDTO); //도넛 차트 추가
		
		//상권 이름 가져오기
		rDTO = salesService.getBusiSalesNmInfo(pDTO);
		
		if (rDTO == null){
			rDTO = new SalesDTO();
			
		}
		
		model.addAttribute("SalesNmDTO", rDTO); //도넛 차트 추가
		
		
		//바차트 가져오기
		List<SalesDTO> rList = salesService.getBusiSalesBarChart(pDTO);
		
		if (rList == null){
			rList = new ArrayList<SalesDTO>();
			
		}
		
		model.addAttribute("rList", rList); //바 차트 추가
		
		//날씨 가져오기
		JSONObject days6 = CmmUtil.weather();
		log.info(days6);
		  
		JSONObject sky = (JSONObject) days6.get("sky");
		
		JSONObject temp = (JSONObject) days6.get("temperature");
		
		log.info(sky.get("amName2day"));
		log.info(sky.get("amCode2day"));
		log.info(temp.get("tmin2day"));
		log.info(temp.get("tmax2day"));
		  
		for (int i=2; i<11; i++){
			String amNameiday = (String)sky.get("amName"+i+"day");
			String amCodeiday = (String)sky.get("amCode"+i+"day");
			String tminiday = (String)temp.get("tmin"+i+"day");
			String tmaxiday = (String)temp.get("tmax"+i+"day");
			  
			model.addAttribute("amCode"+i+"day", amCodeiday);
			model.addAttribute("amName"+i+"day", amNameiday);
			model.addAttribute("tmin"+i+"day", tminiday);
			model.addAttribute("tmax"+i+"day", tmaxiday);
	      		
		}
		
		model.addAttribute("cal", CmmUtil.nvl(request.getParameter("cal"))); //판매 예정일
		
		
		PositionDTO positionDto = CmmUtil.getPos(CmmUtil.nvl(rDTO.getSales_nm()));
	    model.addAttribute("positionDto",positionDto);
	    log.info(CmmUtil.nvl(positionDto.getLat()));
	    log.info(CmmUtil.nvl(positionDto.getLng()));
	    
		log.info("End getBusiSalesDetail !!");
		
		rDTO = null;
		pDTO = null;
		
		return "/busi/sales/SalesDetail";
	}
	
	/**
	 * 골목 상권 순위 리스트 조회 하기
	 */
	@RequestMapping("sales/busiSalesList")
	public String getBusiSalesList(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {

		log.info("Welcome getBusiSalesList !!");

		String auth = (String) request.getSession().getAttribute("AUTH");
		if (auth == null || auth.equals("") || auth.equals("U")) {
			return "/noAuth";
		}

		request.setCharacterEncoding("UTF-8");

		log.info("start_page : " + CmmUtil.nvl(request.getParameter("start_page"), "1"));
		log.info("end_page : " + CmmUtil.nvl(request.getParameter("end_page"), "6"));

		SalesDTO pDTO = new SalesDTO();

		pDTO.setStart_page(CmmUtil.nvl(request.getParameter("start_page"), "1"));
		pDTO.setEnd_page(CmmUtil.nvl(request.getParameter("end_page"), "6"));

		SalesDTO rDTO = salesService.getBusiSalesList(pDTO);
		
		if (rDTO==null){
			rDTO =  new SalesDTO();
			
		}

		model.addAttribute("rDTO", rDTO);

		pDTO = null;
		
		log.info("End getBusiSalesList !!");

		return "/busi/sales/SalesListJSON";
	}
	
	

	/**
	 * 골목 상권 순위 리스트 화면 들어가기
	 */
	@RequestMapping("sales/busiSalesInfo")
	public String getBusiSalesInfo(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {

		log.info("Welcome getBusiSalesInfo !!");

		String auth = (String) request.getSession().getAttribute("AUTH");
		if (auth == null || auth.equals("") || auth.equals("U")) {
			return "/noAuth";
		}

		log.info("End getBusiSalesInfo !!");

		return "/busi/sales/SalesList";
	}

	
	/*
	 * ##########################################################################
	 * #							사업자용 끝	 									#
	 * ##########################################################################
	 * 
	 */	
}
