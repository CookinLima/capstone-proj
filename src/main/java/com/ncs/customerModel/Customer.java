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
	
	public static String checkAccountExist(String userName, String password) {
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
		pstmt.setString(1, userName);
		res = pstmt.executeQuery();
			if(res.next()) {
				String userPassword = res.getString(5);
				if(userPassword.equals(password)) {
//					System.out.println("works");
					String firstName = res.getString(2);
					return firstName;
				} else {
//					System.out.println("wrong password");
					return "wp";
				}
			}
		}
	catch(Exception e) {
		e.printStackTrace();
	}
//		System.out.println("Wrong username");
		return "wu";
	}
	
	public static Customer fetchCustomerDetails(String userName) {
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
			String s = "select * from customer_details where username=?";
			// Allows sql to return statement
			pstmt = con.prepareStatement(s);
			pstmt.setString(1, userName);
			// I want to return the result from s
			res = pstmt.executeQuery();
			System.out.println("before res.next");
			if(res.next()) {
				System.out.println("res.next working");
				String firstName = res.getString(2);
				String lastName = res.getString(3);
				String username = res.getString(4);
				String password = res.getString(5);
				String address = res.getString(6);
				String number = res.getString(7);
				String email = res.getString(8);
				BigDecimal balance = res.getBigDecimal(9);
				String occupation = res.getString(10);
				BigDecimal income = res.getBigDecimal(11);
				
				Customer fetchCustomer = Customer.createCustomer(firstName, lastName, username, password, address, number, email, balance, occupation, income);
				return fetchCustomer;
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static Customer updateCustomerDetails(String userName,String firstName, String lastName, String password, String address, String number, String email) {
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
			String s = "update customer_details set firstname=?, lastname=?, password=?, address=?, number=?, email=? where username=?";
			// Allows sql to return statement
			pstmt = con.prepareStatement(s);
			pstmt.setString(1, firstName);
			pstmt.setString(2, lastName);
			pstmt.setString(3, password);
			pstmt.setString(4, address);
			pstmt.setString(5, number);
			pstmt.setString(6, email);
			pstmt.setString(7, userName);
			// I want to return the result from s
			int row = pstmt.executeUpdate();
			System.out.println("before row");
			if(row > 0) {
				System.out.println("updated row");
//				String firstName = res.getString(2);
//				String lastName = res.getString(3);
//				String username = res.getString(4);
//				String password = res.getString(5);
//				String address = res.getString(6);
//				String number = res.getString(7);
//				String email = res.getString(8);
//				BigDecimal balance = res.getBigDecimal(9);
//				String occupation = res.getString(10);
//				BigDecimal income = res.getBigDecimal(11);
//				
//				Customer fetchCustomer = Customer.createCustomer(firstName, lastName, username, password, address, number, email, balance, occupation, income);
//				return fetchCustomer;
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
