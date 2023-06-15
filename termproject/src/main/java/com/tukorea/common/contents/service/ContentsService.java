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



@Service
public class ContentsService {
	private final ContentsMapper mapper;

	@Value("${file.dir.save}")
	private String saveDir; // 실제 저장 디렉토리

	@Value("${file.dir.view}")
	private String viewDir; // 보여지는 저장 디렉토리


	@Autowired
	public  ContentsService(ContentsMapper mapper) {
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
	public Map<String, Object> getContentsList() {
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
			
			List<Contents> dbContentsList = mapper.selectContentsList();

			List<ContentsList> contentsList = new ArrayList<ContentsList>();
			
			for (Contents content : dbContentsList) {
				ContentsList listObj = new ContentsList();
		
				listObj.setContents_id(content.getContents_id());
				listObj.setTitle(content.getTitle());
				listObj.setDirector(content.getDirector());
				listObj.setGenre(content.getGenre());
				listObj.setHits(content.getHits());
				listObj.setPoster_img_name(content.getPoster_img_name());
				listObj.setPoster_img_save_path(viewDir+content.getPoster_img_save_path());
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
	public Contents getContentsDetail(int ContentsId) {
		// 전역변수
		Contents content = null;
		
		try {
			// 게시판 상세 정보 조회
			content= mapper.selectContentsInfo(ContentsId);
			content.setPoster_img_save_path(viewDir+content.getPoster_img_save_path());
			System.out.println("게시판 상세 조회 완료");
			
			// 해당 게시물 조회수 1 증가
			mapper.updateContentsHits(ContentsId);
			
			System.out.println("게시물 조회수 증가 완료");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return content;
	}
	
	
}
