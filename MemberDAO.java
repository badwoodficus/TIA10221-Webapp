package com.member.model;

import java.io.InputStream;
import java.util.*;

public interface MemberDAO {

	//一個表格的操作對應一個方法，方法定義在這裡

	public void regist(Member member);//註冊會員

	public void update(Member member);//更新會員資料

	public void changePassword(Member member);//修改密碼
	
	public void changeSticker(Member member);//修改大頭貼
	
	public void validity(String captcha);//驗證信箱並且啟動帳號
	
	public Member findByLogin(String account, String password);//會員查看基本資料


}
