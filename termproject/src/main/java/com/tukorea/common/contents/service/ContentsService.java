package com.tukorea.common.contents.service;


import java.io.File;



import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.tukorea.common.contents.dao.ContentsMapper;
import com.tukorea.common.contents.domain.Contents;
import com.tukorea.common.contents.dto.ContentsList;
import com.tukorea.common.contents.dto.ContentsModifyForm;
import com.tukorea.common.login.dao.LoginDao;




@Service
public class ContentsService {
	private final ContentsMapper mapper;

	@Value("${file.dir.save}")
	private String saveDir; // 실제 저장 디렉토리

	@Value("${file.dir.view}")
	private String viewDir; // 보여지는 저장 디렉토리


	@Autowired
	public ContentsService(ContentsMapper mapper) {
		this.mapper = mapper;
	}
	
	public HashMap<String, Object> addContents(HashMap<String, Object> paramMap) {
		// 전역변수
		HashMap<String, Object> resultMap = new HashMap<>();
		
		String result_cd = "00";
		String result_msg = "정상";
		try {
			
			// DB 저장을 위한 파라미터 설정
			MultipartFile file = (MultipartFile) paramMap.get("files");
						
						// (1) 원본파일명
						String originName = file.getOriginalFilename();
						paramMap.put("imageName", originName);
						
						// (2) 실제 파일 저장 경로
						// 저장 파일명으로 쓸 UUID를 생성
						String uuid = UUID.randomUUID().toString();
						
						// 파일 확장자 추출
						String fileExt = originName.substring(originName.lastIndexOf("."));
						
						// 저장할 파일명
						String saveFileName = uuid + fileExt;
						paramMap.put("savePath", saveFileName);
						// 프로필 이미지에 대한 정보를 DB에 저장(update)
						
						int resultCount = mapper.insertContents(paramMap);
						
						if (resultCount != 1) {
							throw new Exception("게시글 등록에 실패하였습니다.");
						}
						
						System.out.println("게시판 등록 완료 (건수 : " + resultCount + "건)");
					
						
						if (resultCount != 1) {
							throw new Exception("회원 프로필 이미지 수정에 실패하였습니다.");
						}
						
						// 프로필 이미지를 서버에 물리 저장
						String serverSavePath = saveDir + saveFileName;
						File serverSaveFile = new File(serverSavePath);
						
						file.transferTo(serverSaveFile);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			resultMap.put("result_cd", result_cd);
			resultMap.put("result_msg", result_msg);
		}
		
		return resultMap;
		
		// return;
	}
	public Map<String, Object> getMovieList() {
		// 전역변수
		Map<String, Object> result = new HashMap<String, Object>();

		try {
//			// 목록 조회용 파라미터 설정
		
//			
//			// 게시물 총 건수 조회
			int totalCount = mapper.selectContentsListTotalCount();
			result.put("totalCount", totalCount);
			System.out.println("게시물 총 건수 조회 완료(" + totalCount + "건)");
//			
	//			// 게시판 목록 조회
			
			List<Contents> dbContentsList = mapper.selectMovieList();

			List<ContentsList> contentsList = new ArrayList<ContentsList>();
			
			for (Contents content : dbContentsList) {
				ContentsList listObj = new ContentsList();
		
				listObj.setContentsid(content.getContentsid());
				listObj.setTitle(content.getTitle());
				listObj.setDirector(content.getDirector());
				listObj.setGenre(content.getGenre());
				listObj.setHits(content.getHits());
				listObj.setPosterimgname(content.getPosterimgname());
				listObj.setPosterimgsavepath(viewDir + content.getPosterimgsavepath());
				listObj.setKind(content.getKind());
				listObj.setYear(content.getYear());
				listObj.setSummary(content.getSummary());
	
				contentsList.add(listObj);
			
			}

			result.put("ContentsList", contentsList);
			
			System.out.println("게시물 목록 조회 Contents");
			
			
			
			
			System.out.println("게시판 페이징 설정 완료");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	public Map<String, Object> getSeriesList() {
		// 전역변수
		Map<String, Object> result = new HashMap<String, Object>();

		try {
//			// 목록 조회용 파라미터 설정
		
//			
//			// 게시물 총 건수 조회
			int totalCount = mapper.selectContentsListTotalCount();
			result.put("totalCount", totalCount);
			System.out.println("게시물 총 건수 조회 완료(" + totalCount + "건)");
//			
	//			// 게시판 목록 조회
			
			List<Contents> dbContentsList = mapper.selectSeriesList();

			List<ContentsList> contentsList = new ArrayList<ContentsList>();
			
			for (Contents content : dbContentsList) {
				ContentsList listObj = new ContentsList();
		
				listObj.setContentsid(content.getContentsid());
				listObj.setTitle(content.getTitle());
				listObj.setDirector(content.getDirector());
				listObj.setGenre(content.getGenre());
				listObj.setHits(content.getHits());
				listObj.setPosterimgname(content.getPosterimgname());
				listObj.setPosterimgsavepath(viewDir + content.getPosterimgsavepath());
				listObj.setKind(content.getKind());
				listObj.setYear(content.getYear());
				listObj.setSummary(content.getSummary());
				
				contentsList.add(listObj);
				System.out.println("id 는" + content.getContentsid());
			}

			
			result.put("ContentsList", contentsList);
			
			System.out.println("게시물 목록 조회 Contents");
			
			
			
			
			System.out.println("게시판 페이징 설정 완료");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	public Contents getContentsDetailForModify(int contentId) {
		// 전역변수
		Contents content = null;
		
		try {
			// 게시판 상세 정보 조회
			content = mapper.selectContentsInfo(contentId);
			
			System.out.println("게시판 상세 조회 완료");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return content;
	}
	
	/**
	 * 게시물 정보 수정 Service Method
	 * @since 2023. 4. 5.
	 * @author Ji-Won Hong
	 */
	public void updateBoard(ContentsModifyForm boardForm,MultipartFile files) {
		try {
			
			// DB 저장을 위한 파라미터 설정
					
									
									// (1) 원본파일명
									String originName = files.getOriginalFilename();
									
									
									// (2) 실제 파일 저장 경로
									// 저장 파일명으로 쓸 UUID를 생성
									String uuid = UUID.randomUUID().toString();
									
									// 파일 확장자 추출
									String fileExt = originName.substring(originName.lastIndexOf("."));
									
									// 저장할 파일명
									String saveFileName = uuid + fileExt;
							
								
									
									
									// 프로필 이미지를 서버에 물리 저장
									String serverSavePath = saveDir + saveFileName;
									File serverSaveFile = new File(serverSavePath);
									
									files.transferTo(serverSaveFile);
			// 수정용 파라미터 정제(DTO -> Domain)
			Contents content = new Contents();
		
			content.setContentsid(boardForm.getContentsid());
			content.setTitle(boardForm.getTitle());
			content.setDirector(boardForm.getDirector());
			content.setGenre(boardForm.getGenre());
			content.setKind(boardForm.getKind());
			content.setYear(boardForm.getYear());
			content.setRunning(boardForm.getRunning());
			content.setSummary(boardForm.getSummary());
			content.setKind(boardForm.getKind());
			content.setPosterimgname(originName);
			content.setPosterimgsavepath(saveFileName);
			
			// 게시판 수정
			int resultCount = mapper.updateContents(content);
			System.out.println("게시판 수정 완료 (건수 : " + resultCount + "건)");
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public Contents getContentsDetail(int ContentsId) {
		// 전역변수
		Contents content = null;
		
		try {
			// 게시판 상세 정보 조회
			content= mapper.selectContentsInfo(ContentsId);
			content.setPosterimgsavepath(viewDir+content.getPosterimgsavepath());
			System.out.println("게시판 상세 조회 완료");
			
			// 해당 게시물 조회수 1 증가
			mapper.updateContentsHits(ContentsId);
			
			System.out.println("게시물 조회수 증가 완료");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return content;
	}
	public void deleteBoard(int contentsId) {
		try {
			// 게시물 삭제
			mapper.deleteBoard(contentsId);
			
			System.out.println("게시물 삭제 완료");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public boolean checkBoardOwner(int boardSeq, String password) {
		boolean result = false;
		
		try {
			// 게시물 패스워드 일치 여부 확인
			HashMap<String, Object> paramMap = new HashMap<String,Object>();

			paramMap.put("password", password);
			
			// 일치하는 게시물 있는지 확인
			int totalCount = mapper.selectContentsPasswordForCheck(paramMap);
			System.out.println("게시물 총 건수 조회 완료(" + totalCount + "건)");
			
			if (totalCount > 0) {
				result = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
}
