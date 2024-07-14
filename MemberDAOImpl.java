package com.member.model;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.apache.commons.io.IOUtils;

import com.member.model.Member;

public class MemberDAOImpl implements MemberDAO {

	// 一個應用程式中,針對一個資料庫 ,共用一個DataSource即可
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TIA102G4");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	//method to excute SQL stynax
	private static final String INSERT_STMT = "INSERT INTO member (regis_date,name, account, password, mobile_no, email, gender,captcha,status) VALUES (?,?, ?, ?, ?, ?, ?,?,?)";
	private static final String UPDATE_STMT = "UPDATE member set name=?, mobile_no=?, email=?, gender=? where account= ?";
	private static final String CHANGE_PASSWORD_STMT = "UPDATE member set password=? WHERE account =?";
	private static final String CHANGE_STICKER_STMT = "UPDATE member set sticker =? WHERE account =?";
	private static final String VALIDITY_STMT = "UPDATE member SET status = 1 WHERE captcha = ?";//SQL語法要關閉safe update,如果直接使用captcha(不是KEY值)來做where
	private static final String findByLogin_STMT = "SELECT account,password,name, email, mobile_no, gender, regis_date,status FROM member where account =? and password=?";

	// 註冊會員填上基本資料
	public void regist(Member member) {

		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setTimestamp(1, member.getRegisDate());
			pstmt.setString(2, member.getName());
			pstmt.setString(3, member.getAccount());
			pstmt.setString(4, member.getPassword());
			pstmt.setString(5, member.getMobileNo());
			pstmt.setString(6, member.getEmail());
			pstmt.setInt(7, member.getGender());
			pstmt.setString(8, member.getCaptcha());
			pstmt.setInt(9, member.getStatus());

			pstmt.executeUpdate();
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
	}

	// 修改基本資料
	public void update(Member member) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_STMT);

			pstmt.setString(1, member.getName());
			pstmt.setString(2, member.getMobileNo());
			pstmt.setString(3, member.getEmail());
			pstmt.setInt(4, member.getGender());
			pstmt.setString(5, member.getAccount());

			pstmt.executeUpdate();
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
	}

	
	//修改密碼
	public void changePassword(Member member) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(CHANGE_PASSWORD_STMT);

			pstmt.setString(1, member.getPassword());
			pstmt.setString(2, member.getAccount());

			pstmt.executeUpdate();

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		
	}


	//修改大頭貼圖片
	@Override
	public void changeSticker(Member member) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(CHANGE_STICKER_STMT);

			pstmt.setBytes(1, member.getSticker());
			pstmt.setString(2, member.getAccount());
			pstmt.executeUpdate();

		}catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		
	}

	//輸入驗證碼修改會員的status
	@Override
	public void validity(String captcha) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(VALIDITY_STMT);
			
			pstmt.setString(1, captcha);
			pstmt.executeUpdate();
			
		}catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		
		
	}

	//會員查看基本資料
	@Override
	public Member findByLogin(String account, String password) {
		Member member = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(findByLogin_STMT);
			
			pstmt.setString(1, account);
			pstmt.setString(2, password);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				member = new Member();
				member.setAccount(rs.getString("account"));
				member.setPassword(rs.getString("password"));
				member.setName(rs.getString("name"));
				member.setEmail(rs.getString("email"));
				member.setMobileNo(rs.getString("mobile_no"));
				member.setGender(rs.getInt("gender"));
				member.setRegisDate(rs.getTimestamp("regis_date"));
				member.setStatus(rs.getInt("status"));
			}
			
		}catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		
		return member;
	}



}
