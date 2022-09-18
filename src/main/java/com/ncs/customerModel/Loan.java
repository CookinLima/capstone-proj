package com.ncs.customerModel;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class Loan {
	private static ArrayList<Loan> loans = new ArrayList<Loan>();
	private String loanName;
	private String userName;
	private BigDecimal principal;
	private BigDecimal totalIR;
	private BigDecimal annualIR;
	private int approve;
	private String occupation;
	private BigDecimal income;
	private int duration;
	
	
	public BigDecimal getTotalIR() {
		return totalIR;
	}
	public void setTotalIR(BigDecimal totalIR) {
		this.totalIR = totalIR;
	}
	public BigDecimal getAnnualIR() {
		return annualIR;
	}
	public void setAnnualIR(BigDecimal annualIR) {
		this.annualIR = annualIR;
	}
	public int getApprove() {
		return approve;
	}
	public void setApprove(int approve) {
		this.approve = approve;
	}
	public String getOccupation() {
		return occupation;
	}
	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}
	public BigDecimal getIncome() {
		return income;
	}
	public void setIncome(BigDecimal income) {
		this.income = income;
	}
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
		return totalIR;
	}
	public void setInterestRate(BigDecimal interestRate) {
		this.totalIR = interestRate;
	}
	public int getDuration() {
		return duration;
	}
	public void setDuration(int duration) {
		this.duration = duration;
	}
	
	public Loan(String loanName, String userName, BigDecimal principal, BigDecimal totalIR, BigDecimal annualIR,
			int approve, String occupation, BigDecimal income, int duration) {
		super();
		this.loanName = loanName;
		this.userName = userName;
		this.principal = principal;
		this.totalIR = totalIR;
		this.annualIR = annualIR;
		this.approve = approve;
		this.occupation = occupation;
		this.income = income;
		this.duration = duration;
	}
	public static Loan createLoan(String loanName, String userName, BigDecimal principal, BigDecimal totalIR, BigDecimal annualIR,
			int approve, String occupation, BigDecimal income, int duration) {
		return new Loan(loanName, userName, principal, totalIR, annualIR, approve, occupation, income, duration);
	}
	
	public static int getLoan(String cusUserName, String loanName, String principal, String duration, String annualInterest, String totalInterest, String occupation, String income) {
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
			String s = "insert into loan(loanname, username,  principal_sum, total_interest_rate, duration, yearly_interest_rate, occupation, income) values(?,?,?,?,?,?,?,?)";
			// Allows sql to return statement
			pstmt = con.prepareStatement(s);
			// I want to return the result from s
//			res = stmt.executeQuery(s);
			pstmt.setString(1, loanName);
			pstmt.setString(2, cusUserName);
			pstmt.setString(3, principal);
			pstmt.setString(4, totalInterest);
			int durationToInt = Integer.parseInt(duration);
			pstmt.setInt(5, durationToInt);
			pstmt.setString(6, annualInterest);
			pstmt.setString(7, occupation);
			pstmt.setString(8, income);
			
			boolean checkExist = Customer.checkUserNameExist(cusUserName);
			if(!checkExist) {
				int rows = pstmt.executeUpdate();
				if(rows > 0) {
					System.out.println("getLoan method loan updated successfully");
					return 1;
				} else {
					System.out.println("getLoan method fail to update loan");
					return 2;
				}
			} 
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		System.out.println("getLoan method user does not exist");
		return 0;
	}
	
	public static ArrayList<Loan> fetchAllLoans() {
		Connection con = null;
		Statement stmt = null;
		ResultSet res = null;
		PreparedStatement pstmt = null;
		try {
			DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
			System.out.println("Driver loaded successfully");
			
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/admin","root", "admin");
			System.out.println("Connection establised successfully!!");
			
			// store sql command into s
			String s = "select * from loan";
			// Allows sql to return statement
			pstmt = con.prepareStatement(s);
			// I want to return the result from s
			res = pstmt.executeQuery();
			System.out.println("fetchAllLoans before res.next");
			while(res.next()) {
				System.out.println("fetchAllLoans res.next working");
				String loanName = res.getString(2);
				String username = res.getString(3);
				String principalSum = res.getString(4);
				BigDecimal principalSumToDecimal = new BigDecimal(principalSum);
				String totalIR = res.getString(5);
				BigDecimal totalIRToDecimal = new BigDecimal(totalIR);
				int duration = res.getInt(6);
				String annualIR = res.getString(8);
				BigDecimal annualIRToDecimal = new BigDecimal(annualIR);
				int approve = res.getInt(9);
				String occupation = res.getString(10);
				String income = res.getString(11);
				BigDecimal incomeToDecimal = new BigDecimal(income);
				
				Loan fetchLoans = Loan.createLoan(loanName, username, principalSumToDecimal, totalIRToDecimal, 
						annualIRToDecimal, approve, occupation, incomeToDecimal, duration);
				loans.add(fetchLoans);
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return loans;
	}
}
