package com.tukorea.common.contents.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.tukorea.common.contents.domain.Contents;

@Mapper
public interface ContentsMapper {
	// 게시판 총 건수 조회
		public int selectContentsListTotalCount();
		
		// 게시판 목록 조회
		public List<Contents> selectContentsList(Map<String, Object> paramMap);
}
