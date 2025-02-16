package com.itwill.mapper;

import java.util.List;

import com.itwill.dto.Transport;

public interface TransportMapper {
	//전체검색
	List<Transport> selectTransprotList();
	//동적쿼리
	List<Transport> selectDynamicTransprotList(Transport transport);
	
	int insertTransport(Transport transport);
	Transport selectTransprotDoubleCheck(String tpNo);
	int updateTransport(Transport transport);
}
