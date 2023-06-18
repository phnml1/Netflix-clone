package com.tukorea.common.contents.dao;

import java.util.HashMap;
import java.util.List;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;


import com.tukorea.common.contents.domain.Contents;

@Mapper
public interface ContentsMapper {
	// 게시판 글 등록
		public int insertContents(HashMap<String, Object> paramMap);
	// 게시판 총 건수 조회
		public int selectContentsListTotalCount();
		
		// 게시판 목록 조회
		public List<Contents> selectContentsList();

		// 게시판 상세 정보 조회
		public Contents selectContentsInfo(int ContentsSeq);
		
		// 게시물 조회수 증가
		public int updateContentsHits(int ContentsSeq);
		// 게시물 글 삭제
		public int deleteBoard(int boardSeq);
		
		public int selectContentsPasswordForCheck(HashMap<String,Object> paramMap);

}
