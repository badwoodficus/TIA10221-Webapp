package com.member.model;

import java.sql.Timestamp;

public class Member implements java.io.Serializable{
    private Integer memberId;//會員編號 自增PK
    private Timestamp regisDate;//註冊日期 系統給予
    private String name;//會員姓名 NOT NULL
    private String account;//會員帳號 NOT NULL
    private String password; //會員密碼 NOT NULL
    private String mobileNo;//手機號碼 NOT NULL
    private String email;//電子信箱 NOT NULL
    private Integer gender;//性別 NOT NULL
    private String captcha;//驗證碼 NOT NULL
    private byte[] sticker;//大頭貼
    private Integer status;//會員帳號是否啟用或停權

	public Member() {
		super();
	}

	public Member(Integer memberId, Timestamp regisDate, String name, String account, String password, String mobileNo,
			String email, Integer gender, String captcha, byte[] sticker) {
		super();
		this.memberId = memberId;
		this.regisDate = regisDate; 
		this.name = name; 
		this.account = account; 
		this.password = password;
		this.mobileNo = mobileNo; 
		this.email = email; 
		this.gender = gender; 
		this.captcha = captcha; 
		this.sticker = sticker; 
	}

	public Integer getMemberId() {
        return memberId;
    }

    public void setMemberId(Integer memberId) {
        this.memberId = memberId;
    }

    public Timestamp getRegisDate() {
        return regisDate;
    }

    public void setRegisDate(Timestamp regisDate) {
        this.regisDate = regisDate;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getMobileNo() {
        return mobileNo;
    }

    public void setMobileNo(String mobileNo) {
        this.mobileNo = mobileNo;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getGender() {
        return gender;
    }

    public void setGender(Integer gender) {
        this.gender = gender;
    }

    public String getCaptcha() {
        return captcha;
    }

    public void setCaptcha(String captcha) {
        this.captcha = captcha;
    }

    public byte[] getSticker() {
        return sticker;
    }

    public void setSticker(byte[] sticker) {
        this.sticker = sticker;
    }
    
    public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}
}

