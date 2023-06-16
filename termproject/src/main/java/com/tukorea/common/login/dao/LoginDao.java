package com.tukorea.common.login.dao;

import java.util.HashMap;


import org.apache.ibatis.annotations.Mapper;

import com.tukorea.common.login.domain.Login;

@Mapper
public interface LoginDao {
	public HashMap<String,Object> selectMemberForLogin(HashMap<String,Object>paramMap);
	
	public int updateMemberRecentLoginDatetime(HashMap<String,Object>paramMap);
	
	// 게시판 글 등록
	public int insertMember(Login login);
}
