package com.project.knock.mypage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.knock.mypage.mapper.MypageMapper;

@Service("mypageService")
public class MypageServiceImpl implements MypageService {
	
	@Autowired(required=false)
	private MypageMapper mypageMapper;

}
