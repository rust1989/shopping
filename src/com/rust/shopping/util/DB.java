package com.rust.shopping.util;

import java.sql.*;

public class DB {
	public static Connection getConn() {
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost/shopping?user=root&password=123456");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}
	public static Statement getStmt(Connection conn){
		Statement stmt=null;
		try {
			if(conn!=null){
			stmt=conn.createStatement();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return stmt;
	}
	public static ResultSet getRs(Statement stmt,String sql){
		ResultSet rs=null;
		try {
			if(stmt!=null){
			rs=stmt.executeQuery(sql);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
	public static void excuteUpdate(Statement stmt,String sql){
		
		try {
			stmt.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public static PreparedStatement preStmt(Connection conn,String sql){
		PreparedStatement pstmt=null;
		try {
			if(conn!=null){
			pstmt=conn.prepareStatement(sql);
			}else{
				System.out.println("db not connect!");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return pstmt;
	}
	public static PreparedStatement preStmt(Connection conn,String sql,int autoGenerateKeys){
		PreparedStatement pstmt=null;
		try {
			pstmt=conn.prepareStatement(sql,autoGenerateKeys);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return pstmt;
	}
	public static void close(Connection conn){
		if(conn!=null){
			try {
				conn.close();
				conn=null;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	public static void close(Statement stmt){
		if(stmt!=null){
			try {
				stmt.close();
				stmt=null;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	public static void close(ResultSet rs){
		if(rs!=null){
			try {
				rs.close();
				rs=null;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
