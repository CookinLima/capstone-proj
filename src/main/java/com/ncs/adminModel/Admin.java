package com.ncs.adminModel;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="details")
public class Admin {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;

	private String username;
	private String password;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public String toString() {
		return "Admin [id=" + id + ", username=" + username + ", password=" + password + "]";
	}
	public Admin(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}
	
	public static int checkAccountExist(String userName, String password) {
		Connection con = null;
		Statement stmt = null;
		ResultSet res = null;
		PreparedStatement pstmt = null;
		try {
		DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
		System.out.println("Driver loaded successfully");
		
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/admin","root", "admin");
		System.out.println("Connection establised successfully!!");
		
//		 store sql command into s
		String s = "select * from details where username=?";
		// Allows sql to return statement
		pstmt = con.prepareStatement(s);
	
		// I want to return the result from s
		pstmt.setString(1, userName);
		res = pstmt.executeQuery();
			if(res.next()) {
				String userPassword = res.getString(3);
				if(userPassword.equals(password)) {
//					System.out.println("works");
					return 1;
				} else {
//					System.out.println("wrong password");
					return 2;
				}
			}
		}
	catch(Exception e) {
		e.printStackTrace();
	}
//		System.out.println("Wrong username");
		return 2;
	}
}
