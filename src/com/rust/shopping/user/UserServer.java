package com.rust.shopping.user;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.rust.shopping.util.DB;

public class UserServer {
	public static void save(User u) {
		Connection conn = DB.getConn();
		String sql = "insert user values(null,?,?,?,?,?)";
		PreparedStatement pstmt = DB.preStmt(conn, sql);
	
		try {
			pstmt.setString(1, u.getUsername());
			pstmt.setString(2, u.getPassword());
			pstmt.setString(3, u.getPhone());
			pstmt.setString(4, u.getAddr());
		    pstmt.setTimestamp(5, new Timestamp(u.getRdate().getTime()));
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(pstmt);
			DB.close(conn);
		}
	}

	public static List<User> getUsers() {
		List<User> users = new ArrayList<User>();
		Connection conn = DB.getConn();
		String sql = "select * from user";
		Statement stmt = DB.getStmt(conn);
		ResultSet rs = DB.getRs(stmt, sql);
		try {
			while (rs.next()) {
				User u = new User();
				u.setId(rs.getInt("id"));
				u.setUsername(rs.getString("username"));
				u.setPassword(rs.getString("password"));
				u.setPhone(rs.getString("phone"));
				u.setAddr(rs.getString("addr"));
				u.setRdate(rs.getDate("rdate"));
				users.add(u);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(rs);
			DB.close(stmt);
			DB.close(conn);
		}
		return users;
	}

	/**
	 * 
	 * @param users
	 * @param pageNo
	 * @param pageSize
	 * @return 总共有多少纪录
	 */
	public static int getUsers(List<User> users, int pageNo, int pageSize) {
		int total = -1;

		Connection conn = DB.getConn();
		String sql = "select * from user limit " + (pageNo - 1) * pageSize
				+ "," + pageSize;
		Statement stmt = DB.getStmt(conn);
		ResultSet rs = DB.getRs(stmt, sql);
		ResultSet count = DB.getRs(stmt, "select count(*) from user");

		try {
			count.next();
			total = count.getInt(1);
			while (rs.next()) {
				User u = new User();
				u.setId(rs.getInt("id"));
				u.setUsername(rs.getString("username"));
				u.setPassword(rs.getString("password"));
				u.setPhone(rs.getString("phone"));
				u.setAddr(rs.getString("addr"));
				u.setRdate(rs.getDate("rdate"));
				users.add(u);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(rs);
			DB.close(count);
			DB.close(stmt);
			DB.close(conn);
		}

		return total;
	}

	public static boolean delete(int id) {
		boolean rs = false;
		Connection conn = DB.getConn();
		Statement stmt = DB.getStmt(conn);
		String sql = "delete * from user where id=" + id;
		try {
			DB.excuteUpdate(stmt, sql);
			rs = true;
		} finally {
			DB.close(stmt);
			DB.close(conn);
		}
		return rs;
	}

	public static User check(String username, String pass)
			throws PasswordNotCorrectException, UserNotFindException,
			SQLException {
		Connection conn = DB.getConn();
		Statement stmt = DB.getStmt(conn);
		String sql = "select * from user where username='"+username+"'";
		ResultSet rs = DB.getRs(stmt, sql);
		User u = null;
		try {
			if (!rs.next()) {
				throw new UserNotFindException("用户不存在" + username);
			} else {
				if (!pass.equals(rs.getString("password"))) {
					throw new PasswordNotCorrectException("密码不正确");
				}
				u = new User();
				u.setId(rs.getInt("id"));
				u.setUsername(rs.getString("username"));
				u.setPassword(rs.getString("password"));
				u.setPhone(rs.getString("phone"));
				u.setAddr(rs.getString("addr"));
				u.setRdate(rs.getDate("rdate"));
			}
		} finally {
			DB.close(rs);
			DB.close(stmt);
			DB.close(conn);
		}
		return u;
	}
	public static void update(User u){
		UserServer us=new UserServer();
		Connection conn=DB.getConn();
		String sql="update user set phone=?,addr=? where id=?";
		PreparedStatement prestmt=DB.preStmt(conn, sql);
		
		try {
			prestmt.setString(1,u.getPhone());
			prestmt.setString(2, u.getAddr());
			prestmt.setInt(3, u.getId());
			prestmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DB.close(prestmt);
			DB.close(conn);
		}
	}
	
}
