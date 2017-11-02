package com.test1234.dao;

import org.apache.ibatis.annotations.Mapper;

import com.test1234.vo.UserVO;

@Mapper
public interface TestDao {

	public int checkId(String id);

	public void snsInsert(String sns);

	public void insertTest(UserVO vo);

	public void updateTest(UserVO vo);

	public UserVO getUserData(String id);

}
