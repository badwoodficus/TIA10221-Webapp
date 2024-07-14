package com.member.controller;

import java.io.*;
import java.sql.*;

import javax.naming.NamingException;
import javax.naming.Context;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.sql.DataSource;
@WebServlet("/DBGifReader4")
public class DBGifReader4 extends HttpServlet {

	Connection con;

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		res.setContentType("image/gif");
		ServletOutputStream out = res.getOutputStream();

		try {
			String id = req.getParameter("account").trim();
		    System.out.println(req.getParameter("account"));

		    String query = "SELECT sticker FROM member WHERE account = ?";
		    PreparedStatement pstmt = con.prepareStatement(query);
		    pstmt.setString(1, id);

		    ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				BufferedInputStream in = new BufferedInputStream(rs.getBinaryStream("sticker"));
				byte[] buf = new byte[4 * 1024]; // 4K buffer
				int len;
				while ((len = in.read(buf)) != -1) {
					out.write(buf, 0, len);
				}
				in.close();
			} else { //這邊處理的是rs.next()回傳false，就是DataBase裡面沒有儲存的圖片(id超出3的範圍)
//				res.sendError(HttpServletResponse.SC_NOT_FOUND);
				InputStream in = getServletContext().getResourceAsStream("/NoData/none2.jpg"); // p110 method 18. 注意 / 指向於該NoData資料夾
				byte[] b = new byte[in.available()];
				in.read(b);
				out.write(b);
				in.close();
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {//這邊處理的是上方 trim()去掉空白後輸入null所發生的錯誤
			System.out.println(e);
			InputStream in = getServletContext().getResourceAsStream("/NoData/null.jpg"); // p110 method 18. 注意 / 指向於該NoData資料夾
//			byte[] b = new byte[in.available()];
//			in.read(b);
			byte[] b = in.readAllBytes();//Java 9 以後的新方法 ，但市面上公司不一定有使用Java 9
			out.write(b);
			in.close();
		}
	}

	public void init() throws ServletException {
		try {
			Context ctx = new javax.naming.InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TIA102G4");
			con = ds.getConnection();
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void destroy() {
		try {
			if (con != null) con.close();
		} catch (SQLException e) {
			System.out.println(e);
		}
	}

}
