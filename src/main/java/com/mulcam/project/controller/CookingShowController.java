package com.mulcam.project.controller;

import java.io.File;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.support.AbstractMultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.mulcam.project.service.CookingShowServiceImpl;
import com.mulcam.project.vo.CookingShowCommentsVO;
import com.mulcam.project.vo.CookingShowDetailVO;
import com.mulcam.project.vo.CookingShowVO;

@Controller
public class CookingShowController {

	@Autowired
	CookingShowServiceImpl cookService;

	// 요리자랑 목록 페이지 
	@RequestMapping(value = "/chore-cooking", method = RequestMethod.GET)
	ModelAndView cookingshow() throws Exception {

		ModelAndView modelAndView = new ModelAndView();

		System.out.println("CookingShowController start");

		List<CookingShowVO> csList = null;

		try {
			csList = cookService.searchAllArticle();

			modelAndView.addObject("csList", csList);

		} catch (Exception e) {

			modelAndView.addObject("err", "오류 발생");

			modelAndView.setViewName("error");
		}

		modelAndView.addObject("csList", csList);
		modelAndView.setViewName("chore-cooking");

		return modelAndView;
	}

	// 요리 자랑 상세 페이지 ( 목록페이지 > 상세페이지 )
	@RequestMapping(value = "/CookingShowDetail", method = RequestMethod.GET)
	ModelAndView cookingshow_detail(@RequestParam(value = "idx", required = true) String idx,
			HttpServletResponse response) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		System.out.println("cookingshow_detail start" + idx);

		try {

			// 게시글 정보 가져오기
			CookingShowVO cs = cookService.searchCookingShowById(idx);

			// 본문 추천이유 가져오기
			List<CookingShowDetailVO> csdList = cookService.searchCookingShowDetailById(idx);

			// 커멘트 가져오기
			List<CookingShowCommentsVO> cscList = cookService.searchCookingShowCommentsById(idx);

			modelAndView.addObject("cs", cs);

			modelAndView.addObject("csdList", csdList);

			modelAndView.addObject("cscList", cscList);

			modelAndView.setViewName("cookingshow_detail");

		} catch (Exception e) {
			e.printStackTrace();
			
			modelAndView.addObject("err", "오류 발생");

			modelAndView.setViewName("error");
		}
		return modelAndView;
	}

	// 요리 자랑 상세 페이지 하단 댓글달기 (목록 페이지 > 상세페이지 = 댓글달기 )
	@RequestMapping(value = "/addCookingShowComments", method = RequestMethod.POST)
	ModelAndView addCookingShowComments(@ModelAttribute("csc") CookingShowCommentsVO csc) throws Exception {

		System.out.println("addCookingShowComments start");
		ModelAndView modelAndView = new ModelAndView();

		try {
			cookService.addCookingShowComments(csc);
			modelAndView.addObject("csc", csc);
			modelAndView.setViewName("redirect:./CookingShowDetail?idx=" + csc.getIdx());

		} catch (Exception e) {
			e.printStackTrace();
			modelAndView.addObject("err", "오류 발생");
			modelAndView.setViewName("error");

		}
		return modelAndView;
	}
	
	
	// 요리 자랑 	글 게시하기 링크 	
	@RequestMapping(value="/chore-add-cooking", method = RequestMethod.GET)
    public String addCookingShowArticle() throws Exception {
    	
    	return "chore-add-cooking";
    }
    
	// 요리 자랑 글 게시하기 (submit)
	@RequestMapping(value = "/chore-add-cooking", method = RequestMethod.POST)
	ModelAndView addCookingShowArticle(@ModelAttribute CookingShowVO cs, AbstractMultipartHttpServletRequest multi) throws Exception {
		
		System.out.println("===========================addCookingShowArticle start===========================");
		
		ModelAndView modelAndView = new ModelAndView();

		// 게시글의 마지막 index 번호를 조회해 온다.
		int currentIdx = cookService.searchCurrentIdx();

		cs.setIdx(currentIdx+1);

		// 추천 이유 리슽트에 게시글 번호와 추천이유 인덱스 번호 추가

		for (int i = 0; i < cs.getReasonsVOList().size() ; i++) {
			cs.getReasonsVOList().get(i).setIdx(currentIdx+1);
			cs.getReasonsVOList().get(i).setRidx(i + 1);
		}

		// 익명 게시인 경우 임의의 id 값으로 저장
		if ( cs.getAuthorid() == null || cs.getAuthorid().isEmpty()) {
			cs.setAuthorid("anonymous");
			System.out.println("addCookingShowArticle ====" + cs.getAuthorid());
		}

		try {
			
			if ( multi != null ) {
						// 1. 이미지파일 서버 업로드 처리
						//서버 업로드 폴더의 실제경로 구하기 (static path 로 변경)
						//String path = new File("src/main/resources/static/uploads/cookingshow").getAbsolutePath();
						String path = "/usr/data/uploads/cooking";
						 
						System.out.println(path);
						//클라이언트에서 가져온 파일구하기
						MultipartFile originfile = multi.getFile("file");
						
						String sourceFileName = originfile.getOriginalFilename(); 
						String sourceFileNameExtension = FilenameUtils.getExtension(sourceFileName).toLowerCase(); 
						String randomFileName = RandomStringUtils.randomAlphanumeric(32) + "." + sourceFileNameExtension; 
			
						//서버에 저장할 파일 생성하기
						File destFile = new File(path+"/"+randomFileName);
			
						//클라이언트 파일을 서버 파일에 옮기기
						if ( originfile.getOriginalFilename() != null && originfile.getOriginalFilename() !="" ) {
							originfile.transferTo(destFile);
							cs.setFilename(randomFileName);
							cs.setFileoriname(sourceFileName);
						}

			}
			// 3. 게시글 메인 먼저 입력
			cookService.addCookingShowMain(cs);

			// 4. 게시글 상세 나중에 입력
			cookService.addCookingShowDetail(cs);

			modelAndView.setViewName("redirect:./chore-cooking");

		} catch (Exception e) {
			e.printStackTrace();
			modelAndView.addObject("err", "오류 발생");
			modelAndView.setViewName("error");

		}

		return modelAndView;
	}

	// 요리 자랑 추천하기 ( 목록 페이지 및 상세페이지, ajax 처리)	
	@RequestMapping(value = "/CookingShowRecommendation", method = RequestMethod.GET)
	void cookignshowrecommendation(@RequestParam(value = "idx", required = true) String idx,
			HttpServletResponse response) throws Exception {

		cookService.addRecommendation(idx);

		String recommendationCnt = cookService.searchRecommendation(idx);

		PrintWriter out = response.getWriter();

		DecimalFormat decFormat = new DecimalFormat("###,###");

		String recommendationCntStr = decFormat.format(Integer.parseInt(recommendationCnt));

		out.append(recommendationCntStr);

		out.flush();
		out.close();
		System.out.println("CookingShowRecommendation start" + idx);

	}

}
