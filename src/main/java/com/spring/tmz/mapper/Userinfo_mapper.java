package com.spring.tmz.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.tmz.domain.AuthorityVO;
import com.spring.tmz.domain.UserinfoVO;


public interface Userinfo_mapper {
	
	public List<UserinfoVO> select_userinfo_list(@Param("user_id")String user_id, @Param("user_pw")String user_pw);
	
	public UserinfoVO select_userinfo(String user_id);
	
	//public Integer update_user_pw(UserinfoVO userinfoVO);
	
	//public Integer insert_user_pw(UserinfoVO userinfoVO);
	
	public Integer insert_userinfo(UserinfoVO userinfoVO);
	
	//public int test_insert_userinfo(@Param("user_id") String user_id,@Param("user_pw") String user_pw); 
	
	public Integer insert_user_authority(AuthorityVO authorityVO);
}
