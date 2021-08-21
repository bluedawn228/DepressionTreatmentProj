package com.mulcam.project.service;

import com.mulcam.project.vo.ConsolationVO;

public interface ConsolationService {
	
	public int boardCount() throws Exception;
	
	public ConsolationVO randomSelection() throws Exception;

}
