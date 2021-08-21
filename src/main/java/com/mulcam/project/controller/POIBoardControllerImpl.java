package com.mulcam.project.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.support.AbstractMultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.mulcam.project.service.POIBoardService;
import com.mulcam.project.service.POICommentService;
import com.mulcam.project.vo.POIBoardVO;
import com.mulcam.project.vo.POIFileVO;
import com.mulcam.project.vo.PageInfo;

@Controller
public class POIBoardControllerImpl implements POIBoardController {
	
	@Autowired
	POIBoardService service;
	@Autowired
	POICommentService cService;
	
	// 소개페이지
	@Override
	@GetMapping("/poi")
	public String recmIntroduce() {
		
		return "poi-introduce";
	}
	
	
	//게시글 리스트 화면 호출
	@Override
	@RequestMapping(value="/POIBoardSort/{type}", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView poiBoardSort(@PathVariable(value="type") String type, @RequestParam(value="sortId", required=false, defaultValue="bno") String sortId, @RequestParam(value="sortOrder",required=false, defaultValue="asc") String sortOrder, @RequestParam(value="page",required=false, defaultValue="1") int page,
			@RequestParam(value="colSortId", required=false, defaultValue="bno") String colSortID, @RequestParam(value="colSortOrder",required=false, defaultValue="asc") String colSortOrder,
			@RequestParam(value="filterDivision", required=false)  String filterDivision, @RequestParam(value="filterProvince", required=false)  String filterProvince, @RequestParam(value="filterRate", required=false)  String filterRate) throws Exception{
		
			System.out.println("POIBoardSort " + sortId + " " + sortOrder + " " + page);
			
			if (type.isEmpty() || type.equals("")) type = "listAll";
			
			PageInfo pageInfo = new PageInfo();	
			ModelAndView mv = new ModelAndView();
			String colSortId = colSortID.replace("HEAD","");
			String nextOrder = "";
			if(sortId != null && sortOrder != null){	

				// 동적 쿼리 구현을 위해 SQL Injection 처리
				// sortID 는 컬럼명으로 한정한다.
				// sortOrder 는 desc 또는 asc 이다.

				//
				try {
					if (colSortOrder.equals("asc") ) {
						nextOrder = "desc";
					} else {
						nextOrder = "asc" ;
					}
					mv.addObject("provinceList", service.provinceList());
					mv.addObject("rateList", service.rateList());
					mv.addObject("sortId", sortId);
					mv.addObject("sortOrder", sortOrder);
					mv.addObject("colSortId", colSortId);
					mv.addObject("colSortOrder", nextOrder);
					mv.addObject("filterDivision", filterDivision);
					mv.addObject("filterProvince", filterProvince);
					mv.addObject("filterRate", filterRate);
					mv.addObject("page", page);
					mv.addObject("pageInfo", pageInfo);
					
					System.out.println("type " + type);
				    if (type.equals("columnSort") ) {
						System.out.println("columnSort");
						mv.addObject("list", service.columnSortPOIBoard(colSortId, colSortOrder, page, pageInfo));
						
					} else if (type.equals("filter") ) {
						System.out.println("filter");
						mv.addObject("list", service.filterPOIBoard(sortId, sortOrder, filterDivision, filterProvince, filterRate, page, pageInfo));
					}	else {
						System.out.println("listAll");
						mv.addObject("list", service.sortPOIBoard(sortId, sortOrder, page, pageInfo));
					}
					mv.setViewName("poiboardlist");
				} catch(Exception e) {
					e.printStackTrace();
					mv.addObject("err",e.getMessage());
					mv.setViewName("error");
				}
		}
		return mv;

	}
	
	//게시글 리스트 컬럼 정렬 호출
	@Override
	@PostMapping(value="/POIBoardColumnSort")
	public ModelAndView poiBoardColumnSort(@RequestParam(value="sortId", required=false, defaultValue="bno") String sortId, @RequestParam(value="sortOrder",required=false, defaultValue="asc") String sortOrder, @RequestParam(value="colSortId", required=false, defaultValue="bno") String colSortID, @RequestParam(value="colSortOrder",required=false, defaultValue="asc") String colSortOrder, @RequestParam(value="page",required=false, defaultValue="1") int page) throws Exception{
		
			System.out.println("POIBoardColumnSort " + colSortID + " " + colSortOrder + " " + page);
//			if(colSortID == null || colSortID =="") colSortID = "bno";
//			if(colSortOrder == null || colSortOrder =="") colSortOrder = "asc";
			
			PageInfo pageInfo = new PageInfo();	
			ModelAndView mv = new ModelAndView();
			String colSortId = colSortID.replace("HEAD","");
			if(colSortId != null && colSortOrder != null){	
				String nextOrder = "";
				// 동적 쿼리 구현을 위해 SQL Injection 처리
				// sortID 는 컬럼명으로 한정한다.
				// sortOrder 는 desc 또는 asc 이다.

				//
				try {
					if (colSortOrder.equals("asc") ) {
						nextOrder = "desc";
					} else {
						nextOrder = "asc" ;
					}
					System.out.println("final nextOrder " + nextOrder);
					mv.addObject("sortId", sortId);
					mv.addObject("sortOrder", sortOrder);
					mv.addObject("colSortId", colSortId);
					mv.addObject("colSortOrder", nextOrder);
					mv.addObject("page", page);
					mv.addObject("pageInfo", pageInfo);
					mv.addObject("list", service.columnSortPOIBoard(colSortId, colSortOrder, page, pageInfo));
					mv.setViewName("poiboardlist");
				} catch(Exception e) {
					e.printStackTrace();
					mv.addObject("err",e.getMessage());
					mv.setViewName("error");
				}
		}
		return mv;

	}
	
	//게시글 필터링 호출
	@Override
	@PostMapping(value="/POIBoardFilter")
	public ModelAndView poiBoardFilter(@RequestParam(value="sortId", required=false, defaultValue="bno") String sortId, @RequestParam(value="sortOrder", required=false, defaultValue="asc")  String sortOrder, @RequestParam(value="filterDivision", required=false)  String filterDivision, @RequestParam(value="filterProvince", required=false)  String filterProvince, @RequestParam(value="filterRate", required=false)  String filterRate, @RequestParam(value="page",required=false, defaultValue="1") int page) throws Exception{
		
		System.out.println("poiBoardFilter " + filterDivision + " " + filterProvince + " " + filterRate);

		PageInfo pageInfo = new PageInfo();	
		ModelAndView mv = new ModelAndView();

			// 동적 쿼리 구현을 위해 SQL Injection 처리
			// sortID 는 컬럼명으로 한정한다.
			// sortOrder 는 desc 또는 asc 이다.
			try {
				mv.addObject("provinceList", service.provinceList());
				mv.addObject("rateList", service.rateList());
				mv.addObject("sortId", sortId);
				mv.addObject("sortOrder", sortOrder);
				mv.addObject("filterDivision", filterDivision);
				mv.addObject("filterProvince", filterProvince);
				mv.addObject("filterRate", filterRate);
				mv.addObject("page", page);
				mv.addObject("pageInfo", pageInfo);
				mv.addObject("list", service.filterPOIBoard(sortId, sortOrder, filterDivision, filterProvince, filterRate, page, pageInfo));
				mv.setViewName("poiboardlist");
			} catch(Exception e) {
				e.printStackTrace();
				mv.addObject("err",e.getMessage());
				mv.setViewName("error");
			}

	return mv;
	}
	
	
	// 게시글 상세 페이지 
	@Override
	@GetMapping("/POIBoardDetail")
	public ModelAndView poiBoardDetail(@RequestParam int bno, @RequestParam(value="page",required=false, defaultValue="1") int page) throws Exception {
		ModelAndView mv = new ModelAndView();	
		try {
			mv.addObject("detail", service.boardDetail(bno));
			mv.addObject("files", service.fileDetail(bno));
			mv.addObject("page", page);
			mv.setViewName("poiboarddetail");
		} catch(Exception e) {
			e.printStackTrace();
			mv.addObject("err", "글 조회 실패");
			mv.setViewName("error");
		}
		return mv;
	}
	
	// 게시글 상세 첨부파일 다운로드
	@Override
	@GetMapping("/fileDown/{bno}")
	public void fileDown(@PathVariable int bno, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
			request.setCharacterEncoding("UTF-8");
			POIFileVO fileVo = service.fileDetail(bno);
			
			//업로드된 파일 경로
			try {
				String fileUrl = fileVo.getFileurl();
				
				//실제 내보낼 파일명
				String oriFileName = fileVo.getFileoriname();
				InputStream in = null;
				OutputStream os = null;
				File file = null;
				boolean skip = false;
				String client = "";
				
				//파일을 읽어 스트림에 담기
				try {
					file = new File(fileUrl);
					in = new FileInputStream(file);
				} catch (FileNotFoundException fe) {
					fe.printStackTrace();
					skip = true;
				}
				
				client = request.getHeader("User-Agent");
				
				//파일 다운로드 헤더 지정
				response.reset();
				response.setContentType("application/octet-stream");
				response.setHeader("Content-Description", "JSP Generated Data");
				
				if (!skip) {
					//IE
					if (client.indexOf("MSIE") != -1) {
						response.setHeader("Content-Disposition", "attachment; filename=\""
								+ java.net.URLEncoder.encode(oriFileName, "UTF-8").replaceAll("\\+", "\\ ") + "\"" );
					//IE 11이상
					} else if (client.indexOf("Trident") != -1 ) {
						response.setHeader("Content-Disposition", "attachment; filename=\""
								+ java.net.URLEncoder.encode(oriFileName, "UTF-8").replaceAll("\\+", "\\ ") + "\"" );
					//그외 	
					} else {
						//한글 파일명 처리
						response.setHeader("Content-Disposition", "attachment; filename=\""
								+new String(oriFileName.getBytes("UTF-8"), "ISO8859_1") + "\"" );
						response.setHeader("Content-Type", "application/octet-stream; charset=utf-8");
					}
					
					response.setHeader("Content-Length", "" + file.length());
					os = response.getOutputStream();
					byte b[] = new byte[(int) file.length()];
					int leng = 0;
					while (( leng = in.read(b)) > 0 ) {
						os.write(b, 0, leng);
					}
				// skip is true	
				} else {
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter writer = response.getWriter();
					writer.println("<script language='javascript'> alert('파일을 찾을 수 없습니다.');history.back();</script>");

				}
				in.close();
				os.close();
				
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("ERROR : " + e.getMessage());
			}
			
	}
	
	//게시글 작성폼 호출
	@Override
	@GetMapping("/POIBoardInsert")
	public String poiBoardInsertForm() {
		return "poiboardinsert";
	}
	

	//게시글 작성

	@Override
	@PostMapping("/POIBoardInsert")
	public ModelAndView poiBoardInsert(@ModelAttribute POIBoardVO vo, AbstractMultipartHttpServletRequest multi) throws Exception{
		ModelAndView mv = new ModelAndView();
		String path =new File("src/main/resources/static/uploadFiles/POIFiles").getAbsolutePath();
		try {
			
			service.boardInsert(vo);  //게시글 입력
			
			List<MultipartFile> sourceFiles = multi.getFiles("files");
			
			int cbno = service.currentBno();
			//여러 파일 반복 입력 
			for(MultipartFile file : sourceFiles) {
				POIFileVO  fileVo = new POIFileVO();
				String sourceFileName = file.getOriginalFilename(); 
				String sourceFileNameExtension = FilenameUtils.getExtension(sourceFileName).toLowerCase(); 
				String randomFileName = RandomStringUtils.randomAlphanumeric(32) + "." + sourceFileNameExtension; 
				System.out.println("sourceFileName : " + sourceFileName);
				System.out.println("sourceFileNameExtension : " + sourceFileNameExtension);
				System.out.println("randomFileName : " + randomFileName);
				
				fileVo.setBno(cbno);
				fileVo.setFilename(randomFileName);
				fileVo.setFileoriname(file.getOriginalFilename());
				fileVo.setFileurl(path+"/"+randomFileName);
				File destinationFile = new File(path+"/"+randomFileName);
				
				//서버 파일 저장 (오리지널 파일 이름이 없으면 저장 안함)
				if ( file.getOriginalFilename() != null && file.getOriginalFilename() !="" ) {
					file.transferTo(destinationFile);
					
					//DB 파일 저장
					service.fileUpload(fileVo);
					
				}
				
			}

			mv.setViewName("redirect:/POIBoardList");
		} catch(Exception e) {
			e.printStackTrace();
			mv.addObject("err", "새 글 등록 실패");
			mv.setViewName("./error");
		}
		return mv;

	}
	
	//게시글 수정 폼 호출
	@Override
	@GetMapping("/POIBoardUpdate/{bno}")
	public String poiBoardUpdateForm(@PathVariable int bno, Model model) throws Exception{
		POIBoardVO vo = service.boardDetail(bno);
		System.out.println("게시글 수정 폼 호출");
		System.out.println(vo.getBno());
		System.out.println(vo.getSubject());
		System.out.println(vo.getContent());
		System.out.println(vo.getWriter());
		
		
		model.addAttribute("detail", service.boardDetail(bno));
		return "poiboardupdate";
	}
	
	@Override
	@PostMapping("/POIBoardUpdate")
	public String poiBoardUpdate(HttpServletRequest request) throws Exception {
			POIBoardVO vo = new POIBoardVO();
			vo.setSubject(request.getParameter("subject"));
			vo.setContent(request.getParameter("content"));
			vo.setBno(Integer.parseInt(request.getParameter("bno")));
			service.boardUpdate(vo);
			
		return "redirect:./POIBoardDetail/"+request.getParameter("bno");
	}
	

	//게시글 삭제

	@Override
	@GetMapping("/POIBoardDelete/{bno}")
	public ModelAndView poiBoardDelete(@PathVariable int bno, @RequestParam(value="page",required=false, defaultValue="1") int page) throws Exception{
		ModelAndView mv = new ModelAndView();
		try {
			service.boardDelete(bno);
			mv.addObject("page",page);
			mv.setViewName("redirect:/POIBoardList");
		} catch(Exception e) {
			e.printStackTrace();
			mv.addObject("err", e.getMessage());
			mv.setViewName("error");
		}
		return mv;
	}


	//게시글 검색
	@Override
	@GetMapping("/POIBoardSearch")
	public ModelAndView boardSearch(@RequestParam("searchText") String searchText, @RequestParam(value="page",required=false, defaultValue="1") int page) throws Exception{
		System.out.println("searchText : " + searchText);
		PageInfo pageInfo = new PageInfo();	
		ModelAndView mv = new ModelAndView();
	
		try {
			ArrayList<POIBoardVO> list = service.searchPOIBoard(searchText,page,pageInfo);
			for (POIBoardVO vo : list) {
				//System.out.println(vo.getBno());
				vo.setCno(cService.commentCount(vo.getBno()));
				vo.setProvince(vo.getAddress().trim().substring(0, vo.getAddress().trim().indexOf(" ")).trim());
			}
			mv.addObject("pageInfo", pageInfo);
			mv.addObject("list", list);
			mv.setViewName("poiboardlist");
		} catch(Exception e) {
			e.printStackTrace();
			mv.addObject("err",e.getMessage());
			mv.setViewName("error");
		}
		return mv;
	}
	
	@Override
	@RequestMapping("/jusoPopup")
	public String juso(HttpServletRequest request, Model model) throws Exception {
		request.setCharacterEncoding("UTF-8");
		String inputYn = request.getParameter("inputYn"); 
		String roadFullAddr = request.getParameter("roadFullAddr"); 
		String roadAddrPart1 = request.getParameter("roadAddrPart1"); 
		String roadAddrPart2 = request.getParameter("roadAddrPart2"); 
		String engAddr = request.getParameter("engAddr"); 
		String jibunAddr = request.getParameter("jibunAddr"); 
		String zipNo = request.getParameter("zipNo"); 
		String addrDetail = request.getParameter("addrDetail"); 
		String admCd    = request.getParameter("admCd");
		String rnMgtSn = request.getParameter("rnMgtSn");
		String bdMgtSn  = request.getParameter("bdMgtSn");
		String detBdNmList  = request.getParameter("detBdNmList");	

		String bdNm  = request.getParameter("bdNm");
		String bdKdcd  = request.getParameter("bdKdcd");
		String siNm  = request.getParameter("siNm");
		String sggNm  = request.getParameter("sggNm");
		String emdNm  = request.getParameter("emdNm");
		String liNm  = request.getParameter("liNm");
		String rn  = request.getParameter("rn");
		String udrtYn  = request.getParameter("udrtYn");
		String buldMnnm  = request.getParameter("buldMnnm");
		String buldSlno  = request.getParameter("buldSlno");
		String mtYn  = request.getParameter("mtYn");
		String lnbrMnnm  = request.getParameter("lnbrMnnm");
		String lnbrSlno  = request.getParameter("lnbrSlno");
		String emdNo  = request.getParameter("emdNo");
		
		model.addAttribute("inputYn",inputYn);
		model.addAttribute("roadFullAddr",roadFullAddr);
		model.addAttribute("roadAddrPart1",roadAddrPart1);
		model.addAttribute("roadAddrPart2",roadAddrPart2);
		model.addAttribute("engAddr",engAddr);
		model.addAttribute("jibunAddr",jibunAddr);
		model.addAttribute("zipNo",zipNo);
		model.addAttribute("addrDetail",addrDetail);
		model.addAttribute("admCd",admCd);
		model.addAttribute("rnMgtSn",rnMgtSn);
		model.addAttribute("bdMgtSn",bdMgtSn);
		model.addAttribute("detBdNmList",detBdNmList);

		model.addAttribute("bdNm",bdNm);
		model.addAttribute("bdKdcd",bdKdcd);
		model.addAttribute("siNm",siNm);
		model.addAttribute("sggNm",sggNm);
		model.addAttribute("emdNm",emdNm);
		model.addAttribute("liNm",liNm);
		model.addAttribute("rn",rn);
		model.addAttribute("udrtYn",udrtYn);
		model.addAttribute("buldMnnm",buldMnnm);
		model.addAttribute("buldSlno",buldSlno);
		model.addAttribute("mtYn",mtYn);
		model.addAttribute("lnbrMnnm",lnbrMnnm);
		model.addAttribute("lnbrSlno",lnbrSlno);
		model.addAttribute("emdNo",emdNo);
		return "jusoPopup";

	}
	
	
	

} // class





















