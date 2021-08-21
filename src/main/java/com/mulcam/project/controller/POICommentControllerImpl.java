package com.mulcam.project.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mulcam.project.service.POICommentService;
import com.mulcam.project.vo.POICommentVO;

@Controller
public class POICommentControllerImpl implements POICommentController {

		@Autowired
		POICommentService service;
		
		@Override
		@GetMapping("/CommentList")
		@ResponseBody
		public ArrayList<POICommentVO> commentList(int bno) throws Exception{
			
			return service.commentList(bno);
		}
		
		@Override
		@PostMapping("/CommentInsert")
		@ResponseBody
		public int commentInsert(@RequestParam int bno, @RequestParam String content) throws Exception {
			POICommentVO vo = new POICommentVO();
			vo.setBno(bno);
			vo.setContent(content);
			//로그인 기능 구현시 댓글 사용자 수정
			vo.setWriter("test");
			
			return service.commentInsert(vo);
		}
		
		@Override
		@PostMapping("/CommentUpdate")
		@ResponseBody
		public int commentUpdate(@RequestParam int cno, @RequestParam String content) throws Exception {
			POICommentVO vo = new POICommentVO();
			vo.setCno(cno);
			vo.setContent(content);
			
			return service.commentUpdate(vo);
		}
		
		@Override
		@PostMapping("/CommentDelete/{cno}")
		@ResponseBody
		public int commentDelete(@PathVariable int cno) throws Exception{
			return service.commentDelete(cno);
		}

}
