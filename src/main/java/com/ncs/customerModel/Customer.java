package com.ncs.customerModel;

import java.math.BigDecimal;
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
@Table(name="customer_details")
public class Customer {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;
	private String firstName;
	private String lastName;
	private String userName;
	private String password;
	private String address;
	private String number;
	private String email;
	private BigDecimal balance;
	private String occupation;
	private BigDecimal income;
	
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public BigDecimal getBalance() {
		return balance;
	}
	public void setBalance(BigDecimal balance) {
		this.balance = balance;
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
	public Customer(String firstName, String lastName, String userName, String password, String address, String number,
			String email, BigDecimal balance, String occupation, BigDecimal income) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.userName = userName;
		this.password = password;
		this.address = address;
		this.number = number;
		this.email = email;
		this.balance = balance;
		this.occupation = occupation;
		this.income = income;
	}
	@Override
	public String toString() {
		return "Customer [id=" + id + ", firstName=" + firstName + ", lastName=" + lastName + ", userName=" + userName
				+ ", password=" + password + ", address=" + address + ", number=" + number + ", email=" + email
				+ ", balance=" + balance + ", occupation=" + occupation + ", income=" + income + "]";
	}
	
	public static Customer createCustomer(String firstName, String lastName, String userName, String password, String address, String number,
			String email, BigDecimal balance, String occupation, BigDecimal income) {
		return new Customer(firstName, lastName, userName, password, address, number,
			email, balance, occupation,income);
	}
	
	public static int addCustomer(String firstName, String lastName, String userName, String password, String address, String number, String email) {
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
			String s = "insert into customer_details(firstname, lastname, username, password, address, number, email) values(?,?,?,?,?,?,?)";
			// Allows sql to return statement
			pstmt = con.prepareStatement(s);
			// I want to return the result from s
//			res = stmt.executeQuery(s);
			pstmt.setString(1, firstName);
			pstmt.setString(2, lastName);
			pstmt.setString(3, userName);
			pstmt.setString(4, password);
			pstmt.setString(5, address);
			pstmt.setString(6, number);
			pstmt.setString(7, email);
			
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
	
	public static boolean checkUserNameExist(String userName) {
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
		String s = "select * from customer_details where username=?";
		// Allows sql to return statement
		pstmt = con.prepareStatement(s);
	
		// I want to return the result from s
//		res = stmt.executeQuery(s);
		pstmt.setString(1, userName);
		res = pstmt.executeQuery();
		
		if(res.next()) {
			return false;
		}
		
	}
	catch(Exception e) {
		e.printStackTrace();
	}
		return true;
	}
}
