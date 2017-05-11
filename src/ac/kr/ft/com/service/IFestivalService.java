package ac.kr.ft.com.service;

import java.util.List;

import ac.kr.ft.com.dto.FestivalDTO;

public interface IFestivalService {
	List<FestivalDTO> getFestList() throws Exception;
	
	FestivalDTO getfestDetail(FestivalDTO festivalDTO) throws Exception;
	
	
	
	boolean createfestInfo(FestivalDTO festivalDTO) throws Exception;
	
	boolean festupdateform(FestivalDTO festivalDTO) throws Exception;
	
	boolean deletefestInfo(FestivalDTO festivalDTO) throws Exception;
	 
	/* 
	#############################################################################
	#							사업자 서비스 시작									#
	#############################################################################
	 */
	
	
	FestivalDTO getBusiListAjax(FestivalDTO pDTO) throws Exception;

	FestivalDTO getbusiFestDetail(FestivalDTO festivalDTO) throws Exception;
	/*
	#############################################################################
	#							사업자 서비스 끝									#
	#############################################################################
	 */
	
}