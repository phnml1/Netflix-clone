package com.tukorea.common.contents.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.tukorea.common.contents.domain.Contents;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tukorea.common.contents.dao.ContentsMapper;
import com.tukorea.common.contents.dto.ContentsList;



@Service
public class ContentsService {
private final ContentsMapper mapper;
	
	@Autowired
	public ContentsService(ContentsMapper mapper) {
		this.mapper = mapper;
	}

	public Map<String, Object> getContentsList(int pageNum) {
		// 전역변수
		Map<String, Object> result = new HashMap<String, Object>();

		try {
//			// 목록 조회용 파라미터 설정
			int listNum = 10; // 게시판 페이지 별 건수 설정
			int startNum = (pageNum - 1) * listNum; // 게시판 목록 조회 시작점 설정
			
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("startNum", startNum);
			paramMap.put("listNum", listNum);
//			
//			// 게시물 총 건수 조회
			int totalCount = mapper.selectContentsListTotalCount();
			result.put("totalCount", totalCount);
			System.out.println("게시물 총 건수 조회 완료(" + totalCount + "건)");
//			
	//			// 게시판 목록 조회
			
			List<Contents> dbContentsList = mapper.selectContentsList(paramMap);

			List<ContentsList> contentsList = new ArrayList<ContentsList>();
			int listStartNum = ((pageNum - 1) * listNum) + 1;
			
			for (Contents content : dbContentsList) {
				ContentsList listObj = new ContentsList();
				
				listObj.setNo(listStartNum++);
				listObj.setContents_id(content.getContents_id());
				listObj.setTitle(content.getTitle());
				listObj.setDirector(content.getDirector());
				listObj.setGenre(content.getGenre());
				listObj.setHits(content.getHits());
				listObj.setPoster(content.getPoster());
				listObj.setKind(content.getKind());
				listObj.setYear(content.getYear());
				listObj.setSummary(content.getSummary());
				
				contentsList.add(listObj);
			}

			result.put("ContentsList", contentsList);
			
			System.out.println("게시물 목록 조회 Contents");
			
			// 게시판 페이징 생성
			// 1. 페이징 계산용 변수 설정
			int pageUnitNum = 5;
			
			// 2. 총 페이징 계산
			int totalPagingNum = (totalCount / listNum) + (totalCount % listNum == 0 ? 0 : 1);
			
			// 3. 배열 값 비교하여 페이징 시작 번호 return
			int totalPagingUnitNum = (totalPagingNum / pageUnitNum) + (totalPagingNum % pageUnitNum == 0 ? 0 : 1);
			for (int i=0; i<totalPagingUnitNum; i++) {
				// 단위 별 시작 페이지 번호와 종료 페이지 번호를 구한 뒤 비교하여 포함되는 페이징 그룹 return
				int startUnitNum = (i * pageUnitNum) + 1;
				int endUnitNum = (i + 1) * pageUnitNum;
				
				// 페이징 단위 종료 번호가 총 페이징 번호보다 클 경우 총 페이징 번호가 마지막이 됨
				if (endUnitNum > totalPagingNum) {
					endUnitNum = totalPagingNum;
				}
				
				if (pageNum >= startUnitNum && pageNum <= endUnitNum) {
					result.put("startUnitNum", startUnitNum);
					result.put("endUnitNum", endUnitNum);
					result.put("totalPagingNum", totalPagingNum);
					
					break;
				}
			}
			
			System.out.println("게시판 페이징 설정 완료");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
}
