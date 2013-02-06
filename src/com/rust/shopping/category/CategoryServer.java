package com.rust.shopping.category;

import java.util.*;
import java.sql.*;

import com.rust.shopping.util.DB;

public class CategoryServer {

	public  List<Category> getCategorys() {
		List<Category> categorys = new ArrayList<Category>();
		Connection conn = DB.getConn();
		String sql = "select * from category";
		Statement stmt = DB.getStmt(conn);
		ResultSet rs = DB.getRs(stmt, sql);
		try {
			while (rs.next()) {
              Category c=this.getInitForm(rs);
              categorys.add(c);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DB.close(rs);
			DB.close(stmt);
			DB.close(conn);
		}
		return categorys;
	}
	public List<Category> getChilds(int id){
		List<Category> categorys = new ArrayList<Category>();
		Connection conn = DB.getConn();
		String sql = "select * from category where pid="+id;
		Statement stmt = DB.getStmt(conn);
		ResultSet rs = DB.getRs(stmt, sql);
		try {
			while (rs.next()) {
              Category c=this.getInitForm(rs);
              categorys.add(c);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DB.close(rs);
			DB.close(stmt);
			DB.close(conn);
		}
		return categorys;
	}
	public  Category getInitForm(ResultSet rs){
		Category c=new Category();
		try {
			c.setId(rs.getInt("id"));
			c.setPid(rs.getInt("pid"));
			c.setName(rs.getString("name"));
			c.setCno(rs.getInt("cno"));
			c.setDescr(rs.getString("descr"));
			c.setGrade(rs.getInt("grade"));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return c;
	}
	public void delete(Category c){
		Connection conn=DB.getConn();
		String sql="delete from category where id=?";
		PreparedStatement prestmt=DB.preStmt(conn, sql);
		
		try {
			prestmt.setInt(1,c.getId());
			prestmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DB.close(prestmt);
			DB.close(conn);
		}
	}
	public void add(Category c){
		Connection conn=DB.getConn();
		try {
			conn.setAutoCommit(false);
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		String sql="insert into category values(null,?,?,?,?,?)";
		PreparedStatement prestmt=DB.preStmt(conn, sql);
		
		try {
			int cno=getNext(conn,c);
			prestmt.setInt(1,c.getPid());
			prestmt.setString(2,c.getName());
			prestmt.setString(3,c.getDescr());
			prestmt.setInt(4, cno);
			prestmt.setInt(5, c.getGrade());
			prestmt.executeUpdate();
			conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				conn.setAutoCommit(true);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			DB.close(prestmt);
			DB.close(conn);
		}
	}
	private int getNext(Connection conn, Category c) {
		return 0;
	}
}
