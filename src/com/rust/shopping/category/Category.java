package com.rust.shopping.category;

import com.rust.shopping.util.DB;
import java.sql.*;

public class Category {
	private int id;
	private int pid;
	private String name;
	private String descr;
	private int cno;
	private int grade;
	
	private static final int MAX_GRADE=3;
	private static final int LEVEL_LENGTH=2;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescr() {
		return descr;
	}

	public void setDescr(String descr) {
		this.descr = descr;
	}

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}
	public void update(){
		
		Connection conn=DB.getConn();
		String sql="update category set name=?,descr=? where id=?";
		PreparedStatement prestmt=DB.preStmt(conn, sql);
		
		try {
			prestmt.setString(1,name);
			prestmt.setString(2, descr);
			prestmt.setInt(3, id);
			prestmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
