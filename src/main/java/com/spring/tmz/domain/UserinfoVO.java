package com.spring.tmz.domain;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class UserinfoVO {
	
	private String user_id;
	private String user_pw;
	private String user_name;
	private Date user_birth;
	private Date user_regdate;
	private String user_tag;
	private boolean user_rate;
	private boolean user_delflag;
	private boolean enabled;
	
	
	private List<AuthorityVO> authority_list;
}
