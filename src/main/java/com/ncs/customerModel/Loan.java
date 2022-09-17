package com.ncs.customerModel;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class Loan {
	private String loanName;
	private String userName;
	private BigDecimal principal;
	private BigDecimal interestRate;
	private int duration;
	
	public String getLoanName() {
		return loanName;
	}
	public void setLoanName(String loanName) {
		this.loanName = loanName;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public BigDecimal getPrincipal() {
		return principal;
	}
	public void setPrincipal(BigDecimal principal) {
		this.principal = principal;
	}
	public BigDecimal getInterestRate() {
		return interestRate;
	}
	public void setInterestRate(BigDecimal interestRate) {
		this.interestRate = interestRate;
	}
	public int getDuration() {
		return duration;
	}
	public void setDuration(int duration) {
		this.duration = duration;
	}
	public Loan(String loanName, String userName, BigDecimal principal, BigDecimal interestRate, int duration) {
		super();
		this.loanName = loanName;
		this.userName = userName;
		this.principal = principal;
		this.interestRate = interestRate;
		this.duration = duration;
	}
	
	public static Loan createLoan(String loanName, String userName, BigDecimal principal, BigDecimal interestRate, int duration) {
		return new Loan(loanName, userName, principal, interestRate, duration);
	}
	
	public static boolean getLoan(String loanName, String userName, String principal, String interestRate, int duration) {
		Connection con = null;
		Statement stmt = null;
		ResultSet res = null;
		PreparedStatement pstmt = null;
		
		try {
			DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
			System.out.println("Driver loaded successfully");
			
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/admin","root", "admin");
			System.out.println("Connection establised successfully!!");
			
//			store sql command into s
			String s = "insert into loan(loanname, username,  principal_sum, interest_rate, duration) values(?,?,?,?,?)";
			// Allows sql to return statement
			pstmt = con.prepareStatement(s);
			// I want to return the result from s
//			res = stmt.executeQuery(s);
			pstmt.setString(1, loanName);
			pstmt.setString(2, userName);
			pstmt.setString(3, principal);
			pstmt.setString(4, interestRate);
			pstmt.setInt(5, duration);
			
			System.out.println(cusBalance);
			boolean checkExist = checkUserNameExist(userName);
			if(checkExist) {
				int rows = pstmt.executeUpdate();
				if(rows > 0) {
					return 1;
				} else {
					return 2;
				}
			} 
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
}
