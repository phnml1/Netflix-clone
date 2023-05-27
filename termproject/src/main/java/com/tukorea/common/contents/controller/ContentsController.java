package com.tukorea.common.contents.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.tukorea.common.contents.service.ContentsService;

@Controller
public class ContentsController {
private final ContentsService service;
	
	@Autowired
	public ContentsController(ContentsService service) {
		this.service = service;
	}
	
	
	

	@GetMapping("/contents")
	public String getContentsList(@RequestParam(required = false, defaultValue = "1") int pageNum, Model model) {
		// 게시판 목록 조회 메서드 호출
		Map<String, Object> result = service.getContentsList(pageNum);
		
		model.addAttribute("pageNum", pageNum);
		
		// Service 결과 모두 model에 설정
		model.addAllAttributes(result);
		
		return "common/contents/ContentsPage";
	}
	@GetMapping("/contents/detail")
	public String getContentsDetail() {
		return "common/contents/ContentsDetail";
	}

	
	
	
	
}
