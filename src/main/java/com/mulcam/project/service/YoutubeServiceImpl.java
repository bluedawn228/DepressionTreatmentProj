package com.mulcam.project.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mulcam.project.dao.YoutubeDAO;
import com.mulcam.project.vo.YoutubeVO;

@Service
public class YoutubeServiceImpl implements YoutubeService {
	
	@Autowired
	YoutubeDAO dao;
	
	// 게시글 등록 - 특수문자 치환, url 변경
	public void addYoutube(YoutubeVO vo) {
		
		int id = dao.selectMaxId();
		vo.setId(id+1);

		String title = vo.getTitle();
		String regex = ".*[\\[\\][:]\\\\/?[*]].*";

		// 제목에 특수 문자가 있는 경우 제거 
		if(title.matches(regex)){  // text에 정규식에 있는 문자가 있다면 true 없다면 false 
			//대괄호는 소괄호로
			title = title.replaceAll("\\[", "\\(");
			title = title.replaceAll("\\]", "\\)");
			//나머지 특수문자는 제거
			title = title.replaceAll("[[:]\\\\/?[*]]", "");  
		}
		vo.setTitle(title);
		
		//주소창 URL 입력시 공유하기 	URL 로 변경
		String url = vo.getUrl();
		String key = null;
		if(url.indexOf("watch") != -1 ) {
			key = vo.getUrl().substring(vo.getUrl().lastIndexOf("=")+1, vo.getUrl().length());
			vo.setUrl("https://youtu.be/"+key);
		} else {
			key = vo.getUrl().substring(vo.getUrl().lastIndexOf("/")+1, vo.getUrl().length());
		}
		vo.setKey(key);
		
		dao.insertYoutube(vo);
	}

	@Override
	public ArrayList<YoutubeVO> getAllYoutube(int startrow) {
		
		return dao.selectAllYoutube(startrow);
	}

	@Override
	public List<YoutubeVO> infiniteScrollDown(int bnoToStart) {

		return dao.selectNextPosts(bnoToStart);
	}

	@Override
	public List<YoutubeVO> infiniteScrollUp(int firstbno) {

		return dao.selectPreviousPosts(firstbno);
	}

	@Override
	public void deleteYoutube(String itemKey) {
		
		System.out.println("===============service========   youtubeDelete   =========================");
		System.out.println(itemKey);
		
		 dao.deleteItem(itemKey);
		
	}

	@Override
	public YoutubeVO getOneYoutube() {
		
		int maxNum = dao.selectMaxNum();
		double randomValue = Math.random();
		int itemNum = (int) (randomValue * maxNum ) + 1;

		return dao.selectOneYoutube(itemNum);
	}
}
