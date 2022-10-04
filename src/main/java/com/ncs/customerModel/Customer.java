package com.ncs.customerModel;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

public class Customer {
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
	private String recipient;
	private String recipientUserName;
	private Date datetime;
	private BigDecimal amount;
	
	
	public Date getDatetime() {
		return datetime;
	}
	public void setDatetime(Date datetime) {
		this.datetime = datetime;
	}
	public BigDecimal getAmount() {
		return amount;
	}
	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}
	public String getRecipient() {
		return recipient;
	}
	public void setRecipient(String recipient) {
		this.recipient = recipient;
	}
	public String getRecipientUserName() {
		return recipientUserName;
	}
	public void setRecipientUserName(String recipientUserName) {
		this.recipientUserName = recipientUserName;
	}
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
	
	public Customer(String userName, String recipientUserName, Date datetime, BigDecimal amount) {
		super();
		this.userName = userName;
		this.recipientUserName = recipientUserName;
		this.datetime = datetime;
		this.amount = amount;
	}
	
	public Customer(String recipientUserName, String recipient) {
		super();
		this.recipientUserName = recipientUserName;
		this.recipient = recipient;
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
	
	public static Customer createRecipient(String recipientUserName, String recipient) {
		return new Customer(recipientUserName, recipient);
	}
	
	public static Customer createTransaction(String userName, String rUserName, Date datetime, BigDecimal amount) {
		return new Customer(userName, rUserName, datetime, amount);
	}
	
	public static int addCustomer(String firstName, String lastName, String userName, String password, String address, String number, String email, String cusBalance) {
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
			String s = "insert into customer_details(firstname, lastname, username, password, address, number, email, balance) values(?,?,?,?,?,?,?,?)";
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
			pstmt.setString(8, cusBalance);
			
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
	
	public static Customer CustomerDetails(String userName) {
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
//				Need to convert string to bigdecimal first
				String balance = res.getString(9);
				BigDecimal balanceToDecimal = new BigDecimal(balance);
				String occupation = res.getString(10);
				BigDecimal income = res.getBigDecimal(11);
				
				Customer fetchCustomer = Customer.createCustomer(firstName, lastName, username, password, address, number, email, balanceToDecimal, occupation, income);
				return fetchCustomer;
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static Customer updateCustomerDetails(String userName,String firstName, String lastName, String address, String number, String email) {
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
			String s = "update customer_details set firstname=?, lastname=?, address=?, number=?, email=? where username=?";
			// Allows sql to return statement
			pstmt = con.prepareStatement(s);
			pstmt.setString(1, firstName);
			pstmt.setString(2, lastName);
			pstmt.setString(3, address);
			pstmt.setString(4, number);
			pstmt.setString(5, email);
			pstmt.setString(6, userName);
			// I want to return the result from s
			int row = pstmt.executeUpdate();
			System.out.println("before row");
			if(row > 0) {
				System.out.println("updated row");
				
				Customer fetchCustomer = Customer.CustomerDetails(userName);
				return fetchCustomer;
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static int transfer(String cusUserName, String rUserName, String transferAmount) {
		Connection con = null;
		Statement stmt = null;
		ResultSet res = null;
		PreparedStatement pstmt = null;
		try {
			DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
			System.out.println("Driver loaded successfully");
			
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/admin","root", "admin");
			System.out.println("Connection establised successfully in transfer method");
			
			// store sql command into s
			String sender = "update customer_details set balance=? where username=?";
			String recipient = "update customer_details set balance=? where username=?";
			// Allows sql to return statement
			pstmt = con.prepareStatement(sender);
			
//			fetch balance from both accounts
			System.out.println("cusUserName " + cusUserName);
			BigDecimal senderBalance = Customer.fetchBalance(cusUserName);
			System.out.println("rUserName " + rUserName);
			BigDecimal recipientBalance = Customer.fetchBalance(rUserName);
			
//			change datatype to bigdecimal
			BigDecimal transferAmountToDecimal = new BigDecimal(transferAmount);
			
			// Check to see if transfer amount exceeds balance
			if(transferAmountToDecimal.compareTo(senderBalance) > 0) {
				System.out.println("transfer amount greater than sender balance");
				return 3;
			}
//			calculate new balance on both accounts
			BigDecimal newSenderBalance = senderBalance.subtract(transferAmountToDecimal);
			BigDecimal newRecipientBalance = recipientBalance.add(transferAmountToDecimal);
			
			pstmt.setString(1, newSenderBalance.toString());
			pstmt.setString(2, cusUserName);
			
			int row1 = pstmt.executeUpdate();
			if(row1 > 0) {
				System.out.println("balance update success");
				pstmt = con.prepareStatement(recipient);
				pstmt.setString(1, newRecipientBalance.toString());
				pstmt.setString(2, rUserName);
				int row2 = pstmt.executeUpdate();
				if(row2 > 0) {
					// Update transaction table
					boolean addTransaction = Customer.addTransaction(cusUserName, rUserName, transferAmount);
					if(addTransaction) {
						return 1;
					}
				}
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public static BigDecimal fetchBalance(String userName) {
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
//				Need to convert string to bigdecimal first
				String balance = res.getString(9);
				BigDecimal balanceToDecimal = new BigDecimal(balance);
				System.out.println("in fetchBalance method: " + balance);
				return balanceToDecimal;
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static boolean addTransaction(String cusUserName, String rUserName, String amount) {
		Connection con = null;
		Statement stmt = null;
		ResultSet res = null;
		PreparedStatement pstmt = null;
		
		try {
			DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
			System.out.println("Driver loaded successfully");
			
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/admin","root", "admin");
			System.out.println("Connection establised successfully!!");
			
			String s = "insert into transaction(sender, sendee, amount, datetime) values(?,?,?,?)";

			pstmt = con.prepareStatement(s);
			pstmt.setString(1, cusUserName);
			pstmt.setString(2, rUserName);
			pstmt.setString(3, amount);
			pstmt.setTimestamp(4, Timestamp.valueOf(LocalDateTime.now()));
			int rows = pstmt.executeUpdate();
			if(rows > 0) {
				System.out.println("In addTransaction: success");
				return true;
			} 
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		System.out.println("In addTransaction: failed");
		return false;
	}
	
	public static boolean deleteCustomer(String userName, String password) {
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
			String s = "delete from customer_details where username=? and password=?";
			// Allows sql to return statement
			pstmt = con.prepareStatement(s);
			// I want to return the result from s
//			res = stmt.executeQuery(s);
			pstmt.setString(1, userName);
			pstmt.setString(2, password);
			
			int rows = pstmt.executeUpdate();
			System.out.println("before row");
			if(rows > 0) {
				System.out.println("after rows");
				return true;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public static boolean addRecipient(String name, String rUserName, String userName) {
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
			String s = "insert into recipient(sender_username, recipient_username, name) values (?,?,?)";
			// Allows sql to return statement
			pstmt = con.prepareStatement(s);
			// I want to return the result from s
//			res = stmt.executeQuery(s);
			pstmt.setString(1, userName);
			pstmt.setString(2, rUserName);
			pstmt.setString(3, name);
			
			boolean checkUserName = Customer.checkUserNameExist(userName);
//			System.out.println("username exist:" + checkUserName);
			boolean checkRUserName = Customer.checkUserNameExist(rUserName);
//			System.out.println("rUsername exist:" + checkRUserName);
			
			if(!checkUserName && !checkRUserName) {
				int rows = pstmt.executeUpdate();
				if(rows > 0) {
					return true;
				}
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public static ArrayList<Customer> fetchAllRecipient(String username) {

		Connection con = null;
		Statement stmt = null;
		ResultSet res = null;
		PreparedStatement pstmt = null;
		ArrayList<Customer> recipients = new ArrayList<Customer>();
		try {
			DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
			System.out.println("Driver loaded successfully");
			
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/admin","root", "admin");
			System.out.println("Connection establised successfully!!");
			
			// store sql command into s
			String s = "select * from recipient where sender_username=?";
			// Allows sql to return statement
			pstmt = con.prepareStatement(s);
			pstmt.setString(1, username);
			// I want to return the result from s
			res = pstmt.executeQuery();
			while(res.next()) {
				String rUserName = res.getString(2);
				String name = res.getString(3);
				
				Customer fetchCustomer = Customer.createRecipient(rUserName, name);
				recipients.add(fetchCustomer);
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return recipients;
	}
	
	public static ArrayList<Customer> fetchAllTransaction(String username) {

		Connection con = null;
		Statement stmt = null;
		ResultSet res = null;
		PreparedStatement pstmt = null;
		ArrayList<Customer> transactions = new ArrayList<Customer>();
		try {
			DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
			System.out.println("Driver loaded successfully");
			
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/admin","root", "admin");
			System.out.println("Connection establised successfully!!");
			
			// store sql command into s
			String s = "select * from transaction where sender=? or sendee=?";
			// Allows sql to return statement
			pstmt = con.prepareStatement(s);
			pstmt.setString(1, username);
			pstmt.setString(2, username);
			// I want to return the result from s
			res = pstmt.executeQuery();
			while(res.next()) {
				Timestamp datetime = res.getTimestamp(2);
				Date date = datetime;
				String sender = res.getString(3);
				String sendee = res.getString(4);
				String balance = res.getString(5);
				BigDecimal balanceToDecimal = new BigDecimal(balance);
				
				Customer fetchTransaction = Customer.createTransaction(sender, sendee, date, balanceToDecimal);
				transactions.add(fetchTransaction);
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return transactions;
	}
	
	public static boolean updateLoanProfile(String cusUserName, String occupation, String income) {
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
			String s = "update customer_details set occupation=?, income=? where username=?";
			// Allows sql to return statement
			pstmt = con.prepareStatement(s);
			// I want to return the result from s
//			res = stmt.executeQuery(s);
			pstmt.setString(1, occupation);
			pstmt.setString(2, income);
			pstmt.setString(3, cusUserName);
			
			int rows = pstmt.executeUpdate();
			if(rows > 0) {
				return true;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}
