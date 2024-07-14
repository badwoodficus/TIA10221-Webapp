package com.member.service;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Timestamp;
import java.util.List;

import org.apache.commons.io.IOUtils;

import com.member.model.Member;
import com.member.model.MemberDAO;
import com.member.model.MemberDAOImpl;

public class MemberService {

	private MemberDAO dao;

	public MemberService() {
		dao = new MemberDAOImpl();
	}
	//註冊會員使用
	public Member addMem(Timestamp regisDate ,String name, String account, String password, String email, String mobileNo, Integer gender,String captcha, Integer status) {
		Member member = new Member();

		member.setRegisDate(regisDate);
		member.setName(name);
		member.setAccount(account);
		member.setPassword(password);
		member.setMobileNo(mobileNo);
		member.setEmail(email);
		member.setGender(gender);
		member.setCaptcha(captcha);
		member.setStatus(status);
		dao.regist(member);

		return member;

	}

	// 修改基本資料使用
	public Member updateMem(String name, String mobileNo, String email, Integer gender,String account) {
		Member member = new Member();

		member.setName(name);
		member.setMobileNo(mobileNo);
		member.setEmail(email);
		member.setGender(gender);
		member.setAccount(account);
		dao.update(member);

		return member;
	}

	// 修改密碼使用
	public Member changePassword(String password,String account) {
		Member member = new Member();
		member.setPassword(password);
		member.setAccount(account);
		dao.changePassword(member);
		return member;

	}
	
	// 修改大頭貼使用
	public Member changeSticker(String account, byte[] sticker) {
		Member member = new Member();
		member.setAccount(account);
		member.setSticker(sticker);
		dao.changeSticker(member);
		
		return member;
	}

	// 驗證信箱並且啟用帳號
	public Member validity(String captcha) {
		Member member = new Member();
		member.setCaptcha(captcha);
		dao.validity(captcha);
		return member;
	}
	// 會員檢視基本資料
	public Member findByLogin(String account, String password) {
		return dao.findByLogin(account, password);
	}
}
