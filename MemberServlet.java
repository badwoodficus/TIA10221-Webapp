package com.member.controller;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

import org.apache.commons.io.IOUtils;

import com.member.model.*;
import com.member.service.*;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
@MultipartConfig
public class MemberServlet extends HttpServlet{
	
	
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
	//	doPost(req, res);
		
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
	//按下加入會員後新增資料 網頁action = register (已完成)
		if("register".equals(action)) {//來自member_register.jsp的請求
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
			//檢驗帳號
			String account = String.valueOf(req.getParameter("account").trim());
			String accountReg = "^[(a-zA-Z0-9_)]{8,16}$";
			if(account == null || account.trim().length() ==0) {
				errorMsgs.add("帳號請勿空白");
			}else if(!account.trim().matches(accountReg)) {
				errorMsgs.add("帳號規則：包含英數字混和8~16個字");
			}
			
			//檢驗密碼
			String password = String.valueOf(req.getParameter("password").trim());
			String passwordReg ="^[(a-zA-Z0-9_)]{6,12}$";
			if(password == null || password.trim().length() == 0) {
				errorMsgs.add("密碼請勿空白");
			}else if(!password.trim().matches(passwordReg)) {
				errorMsgs.add("密碼規則：包含英數字混和6~10個字");
			}
			
			//檢驗密碼確認
			String passwordCheck = String.valueOf(req.getParameter("passwordCheck").trim());
			if(passwordCheck == null || passwordCheck.trim().length() == 0) {
				errorMsgs.add("請勿空白");
			}else if(!passwordCheck.equals(password)) {
				errorMsgs.add("請再次輸入密碼");
			}
			
			//檢驗姓名
			String name = String.valueOf(req.getParameter("name"));
			String nameReg = "^[(\u4e00-\u9fa5)(a-zA-Z)]{2,10}$";
			if (name == null || name.trim().length() == 0) {
				errorMsgs.add("會員姓名: 請勿空白");
			} else if(!name.trim().matches(nameReg)) { //以下練習正則(規)表示式(regular-expression)
				errorMsgs.add("會員姓名: 只能是中、英文字母, 且長度必需在2到10之間");
            }
			
			//檢驗手機號碼
			String mobileNo = String.valueOf(req.getParameter("mobileNo"));
			String mobileNoReg = "^09[0-9]{8}$";
			if (mobileNo == null || mobileNo.trim().length() == 0) {
				errorMsgs.add("手機號碼請勿空白");
			}else if(!mobileNo.trim().matches(mobileNoReg)) {
				errorMsgs.add("請輸入正確手機格式09開頭且共十個數字");
			}
			
			//檢驗電子信箱
			String email = String.valueOf(req.getParameter("email"));
			String emailReg = 
					"^[a-z0-9!#$%&'*+\\=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+\\=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])$";
			if (email == null || email.trim().length() == 0) {
				errorMsgs.add("電子信箱請勿空白");
			}else if(!email.trim().matches(emailReg)) {
				errorMsgs.add("請輸入正確的電子信箱");
			}
			//性別使用select傳遞資料 0->男生 1->女生
//			驗證參數是否為空
//			System.out.println("-----------------------------------");
//			System.out.println(req.getParameter("gender"));
//			System.out.println("-----------------------------------");
			Integer gender = Integer.valueOf(req.getParameter("gender"));
			//註冊時間抓取按下按鈕的當下系統時間
			java.sql.Timestamp regisDate = new java.sql.Timestamp(new Date().getTime());
			
			//產生註冊時候的驗證碼
			int[] array = new int [62];
			for (int i=0; i<array.length; i++)
				if (i<10) array[i] = 48+i;	// 將數字 0-9ASCII碼(Int)放入 array[0-9]
				else if (i<36) array[i] = 55+i;	// 將大寫英文 ASCII碼(Int)放入 array[10-35]
				else  array[i] = 61+i;		// 將小寫英文 ASCII碼(Int)放入 array[36-61]
	 
			int arryBsize = 6;			// 取6個
			int[] arrayB = new int[arryBsize];
			Random r = new Random();
			for (int i=0; i<arryBsize; i++)	
				arrayB[i] = array[r.nextInt(62)];	// 從array陣列中取亂數0-62位置的元素放入arrayB陣列中
			
			StringBuffer sb = new StringBuffer();
			for (int i=0; i<arryBsize; i++) {
				sb.append((char)arrayB[i]);
			}
			String captcha = new String(sb);//StringBuffer 轉換成 String
			//封裝資料
			Member member = new Member();
			member.setAccount(account);
			member.setPassword(password);
			member.setName(name);
			member.setGender(gender);
			member.setMobileNo(mobileNo);
			member.setEmail(email);
			member.setStatus(0);//預設帳號未啟用
			member.setRegisDate(regisDate);
			member.setCaptcha(captcha);
			
			//輸入格式錯誤的時候把資料帶回去輸入框
			if(!errorMsgs.isEmpty()) {
				req.setAttribute("member", member);
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/member/member_register.jsp");
				failureView.forward(req, res);
//				System.out.println("-----------------------------------");
//				System.out.println(errorMsgs);
//				System.out.println(member.getAccount());
//				System.out.println(member.getPassword());
//				System.out.println(member.getName());
//				System.out.println(member.getGender());
//				System.out.println(member.getMobileNo());
//				System.out.println(member.getEmail());
//				System.out.println("-----------------------------------");
				return;
			}
			
			/***************************2.開始新增資料*****************************************/
			MemberService mbrSvc = new MemberService();
			member = mbrSvc.addMem(regisDate, name, account, password, email, mobileNo, gender, captcha, gender);
			
			/***************************3.註冊完成,準備轉交(Send the Success view)*************/
			req.setAttribute("member", member);
			String url = "/front-end/member/congratulations.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
		}
		
	//修改會員資料,姓名,手機,信箱 (已完成)
		if("update".equals(action)) {//來自profile.jsp
			
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
			
			//檢驗姓名
			String name = String.valueOf(req.getParameter("name"));
			String nameReg = "^[(\u4e00-\u9fa5)(a-zA-Z)]{2,10}$";
			if (name == null || name.trim().length() == 0) {
				errorMsgs.add("會員姓名: 請勿空白");
			} else if(!name.trim().matches(nameReg)) { //以下練習正則(規)表示式(regular-expression)
				errorMsgs.add("會員姓名: 只能是中、英文字母, 且長度必需在2到10之間");
            }
			
			//檢驗手機號碼
			String mobileNo = String.valueOf(req.getParameter("mobileNo"));
			String mobileNoReg = "^09[0-9]{8}$";
			if (mobileNo == null || mobileNo.trim().length() == 0) {
				errorMsgs.add("手機號碼請勿空白");
			}else if(!mobileNo.trim().matches(mobileNoReg)) {
				errorMsgs.add("請輸入正確手機格式09開頭且共十個數字");
			}
			
			//檢驗電子信箱
			String email = String.valueOf(req.getParameter("email"));
			String emailReg = 
					"^[a-z0-9!#$%&'*+\\=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+\\=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])$";
			if (email == null || email.trim().length() == 0) {
				errorMsgs.add("電子信箱請勿空白");
			}else if(!email.trim().matches(emailReg)) {
				errorMsgs.add("請輸入正確的電子信箱");
			}
			//性別使用select傳遞資料 0->男生 1->女生
			Integer gender = Integer.valueOf(req.getParameter("gender"));
			//輸入帳號
			String account = String.valueOf(req.getParameter("account"));
			
			//封裝資料
			Member member = new Member();
			
			member.setName(name);
			member.setGender(gender);
			member.setMobileNo(mobileNo);
			member.setEmail(email);
			member.setAccount(account);
			
			//輸入格式錯誤的時候把資料帶回去輸入框 還不確定要用哪個網頁
			if(!errorMsgs.isEmpty()) {
				req.setAttribute("member", member);
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/member/member_register.jsp");
				failureView.forward(req, res);
				return;
			}
			/***************************2.開始修改資料*****************************************/
			MemberService mbrSvc = new MemberService();
			member = mbrSvc.updateMem(name, mobileNo, email, gender,account);
			/***************************3.註冊完成,準備轉交(Send the Success view)*************/
			req.setAttribute("member", member);
			String url = "/front-end/member/congratulations.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
			
		}
		
		//修改密碼從登入頁面之後(已完成)
		if("change_password".equals(action)) {//來自changepassword.jsp
			
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
			//檢驗密碼
			String account = String.valueOf(req.getParameter("account").trim());
			String password = String.valueOf(req.getParameter("password").trim());
			String passwordReg ="^[(a-zA-Z0-9_)]{6,12}$";
			if(password == null || password.trim().length() == 0) {
				errorMsgs.add("密碼請勿空白");
			}else if(!password.trim().matches(passwordReg)) {
				errorMsgs.add("密碼規則：包含英數字混和6~10個字");
			}
			
			//檢驗密碼確認
			String passwordCheck = String.valueOf(req.getParameter("passwordCheck").trim());
			if(passwordCheck == null || passwordCheck.trim().length() == 0) {
				errorMsgs.add("請勿空白");
			}else if(!passwordCheck.equals(password)) {
				errorMsgs.add("請再次輸入密碼");
			}
//			
			
			Member member = new Member();
			member.setAccount(account);
			member.setPassword(password);
//			輸入格式錯誤的時候把資料帶回去輸入框
			if(!errorMsgs.isEmpty()) {
				req.setAttribute("member", member);
				RequestDispatcher failureView = req.getRequestDispatcher("changepassword.jsp");
				failureView.forward(req, res);
				return;
			}
			
			/***************************2.開始修改資料*****************************************/
			MemberService mbrSvc = new MemberService();
			member = mbrSvc.changePassword(password,account);
			
			/***************************3.註冊完成,準備轉交(Send the Success view)*************/
			req.setAttribute("member", member);
			String url = "congratulations.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
			
		}
		
	//修改會員頭貼圖片(已完成)
		if("change_sticker".equals(action)) { //從upload_sticker.jsp
			
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			/***************************1.接收請求參數**********************************************/
			String account = req.getParameter("account");
			Part sticker = req.getPart("sticker");
			if(sticker == null) { 	
				errorMsgs.add("請上傳圖片");
			}
			
			InputStream inputStream = null;
			if(sticker != null) {
				inputStream = sticker.getInputStream();
			}
			
			byte[] data = IOUtils.toByteArray(inputStream);
			Member member = new Member();
			member.setAccount(account);
			member.setSticker(data);
			
			
			/***************************2.打包資料傳輸********************************************/
			MemberService mbrSvc = new MemberService();
			member = mbrSvc.changeSticker(account,data);
			/***************************3.上傳完成***********************************************/
			req.setAttribute("member",member);
			String url = "show_sticker.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); //導向show_sticker.jsp
			successView.forward(req, res);
		}
		
	//信箱驗證並且啟用帳號
		if("validity".equals(action)) {
			
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			/*************************1.接收輸入資料*************************************/
			String captcha = String.valueOf(req.getParameter("captcha"));
			String captchaReg = "^[(a-zA-Z0-9_)]{6,6}$";
			if(captcha == null || captcha.trim().length() == 0) {
				errorMsgs.add("驗證碼請勿空白");
			}else if(!captcha.trim().matches(captchaReg)) {
				errorMsgs.add("驗證碼規則：包含英數字混和6個字");
			}
			Member member = new Member();
			member.setCaptcha(captcha);
//			輸入格式錯誤的時候把資料帶回去輸入框
			if(!errorMsgs.isEmpty()) {
				req.setAttribute("member", member);
				RequestDispatcher failureView = req.getRequestDispatcher("validity.jsp");
				failureView.forward(req, res);
				return;
			}
			/*************************2.傳送驗證碼去執行驗證*************************************/
			MemberService mbrSvc = new MemberService();
			mbrSvc.validity(captcha);
			/*************************3.通過驗證之後導向登入成功畫面*************************************/
			String url = "account_activated.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
			
		}
		
	//查看會員基本資料 (已完成)
		if("find_by_login".equals(action)) { //來自login.jsp
			
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			/*************************1.接收輸入資料*************************************/
			String account = String.valueOf(req.getParameter("account"));
			String password = String.valueOf(req.getParameter("password"));
			/*************************2.開始查詢資料*************************************/
			MemberService mbrSvc = new MemberService();
			Member member = mbrSvc.findByLogin(account, password);
			/***************************3.查詢完成,準備轉交(Send the Success view)************/
			req.setAttribute("member", member);
			String url ="/front-end/member/profile.jsp";
//			System.out.println("-----------------------------------");
//			System.out.println(member.getAccount());
//			System.out.println(member.getPassword());
//			System.out.println(member.getName());
//			System.out.println(member.getGender());
//			System.out.println(member.getMobileNo());
//			System.out.println(member.getEmail());
//			System.out.println("-----------------------------------");
			RequestDispatcher successView = req.getRequestDispatcher(url);//導向profile.jsp
			successView.forward(req, res);
		}
	}

}
