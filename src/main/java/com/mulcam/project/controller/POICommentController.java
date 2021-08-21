package com.mulcam.project.controller;

import java.util.ArrayList;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.mulcam.project.vo.POICommentVO;

public interface POICommentController {
	
	public ArrayList<POICommentVO> commentList(int bno) throws Exception;
	
	public int commentInsert(@RequestParam int bno, @RequestParam String content) throws Exception;
	
	public int commentUpdate(@RequestParam int cno, @RequestParam String content) throws Exception;
	
	public int commentDelete(@PathVariable int cno) throws Exception;

}
