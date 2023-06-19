package com.tukorea.common.contents.controller;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.tukorea.common.contents.domain.Contents;
import com.tukorea.common.contents.dto.ContentsForm;
import com.tukorea.common.contents.dto.ContentsModifyForm;
import com.tukorea.common.contents.service.ContentsService;

@Controller
public class ContentsController {
private final ContentsService service;
	
	@Autowired
	public ContentsController(ContentsService service) {
		this.service = service;
	}

	
	 @PostMapping("/contents/new")
	public String addContents(ContentsForm dto, @RequestParam("contentsFile") MultipartFile files, HttpServletRequest request) {
		// 세션값 가져오기
		HttpSession session = request.getSession();
		
		HashMap<String, Object> paramMap = new HashMap<>();
		paramMap.put("title", dto.getTitle());
		paramMap.put("genre", dto.getGenre());
		paramMap.put("year", dto.getYear());
		paramMap.put("director",dto.getDirector());
		paramMap.put("running", dto.getRunning());
		paramMap.put("summary", dto.getSummary());
		paramMap.put("hits", dto.getHits());
		paramMap.put("kind",dto.getKind());
		paramMap.put("files", files);
		
		// 게시판 등록 메서드 호출
		service.addContents(paramMap);
		
		return "redirect:/";
	}
	
	
	

	@GetMapping("/movie")
	public String getMovieList(Model model) {
		// 게시판 목록 조회 메서드 호출
		Map<String, Object> result = service.getMovieList();
		
		model.addAllAttributes(result);
		
		return "common/contents/MoviePage";
	}
	@GetMapping("/series")
	public String getContentsList(Model model) {
		// 게시판 목록 조회 메서드 호출
		Map<String, Object> result = service.getSeriesList();
		
		model.addAllAttributes(result);
		
		return "common/contents/SeriesPage";
	}


	@GetMapping("/contents/form")
	public String addContentsForm() {
		return "admin/contents/addContentsForm";
	}


	@PostMapping("/contents/delete")
	public String deleteBoard(@RequestParam int contentsid) {
		// 게시판 등록 메서드 호출
		service.deleteBoard(contentsid);
		
		return "redirect:/";
	}
	@PostMapping("/contents/modifyForm")
	public String getBoardModifyForm(@RequestParam int contentsid, Model model) {
		// 게시판 상세정보 조회 메서드 호출
		Contents content = service.getContentsDetailForModify(contentsid);
		model.addAttribute("contents", content);
		
		return "admin/contents/modifyContentsForm";
	}
	
	@PostMapping("/contents/modify")
	public String modifyBoard(ContentsModifyForm contentForm,@RequestParam("contentsFile") MultipartFile files) {
		// 게시판 등록 메서드 호출
		service.updateBoard(contentForm,files);
		
		return "redirect:/";
	}
	
	@GetMapping("/contents/detail")
	public String getContentsDetail(@RequestParam int contents_id, Model model) {
		
		Contents content = service.getContentsDetail(contents_id);
		model.addAttribute("content", content);
		return "common/contents/ContentsDetail";
	}
	@ResponseBody
	@PostMapping("/contents/checkPassword")
	public boolean checkPassword(@RequestParam int contentid, @RequestParam String password, Model model) {
		// 게시판 등록 메서드 호출
		boolean result = service.checkBoardOwner(contentid, password);
		
		return result;
	}
	
	
	
	
}
