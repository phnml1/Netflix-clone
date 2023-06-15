package com.tukorea.common.login.dao;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LoginDao {
	public HashMap<String,Object> selectMemberForLogin(HashMap<String,Object>paramMap);
	
	public int updateMemberRecentLoginDatetime(HashMap<String,Object>paramMap);
	
}
