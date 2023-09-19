package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.tech.blog.entities.User;

public class UserDao {
	private Connection connection;

	public UserDao(Connection connection) {
		super();
		this.connection = connection;
	}

	// method to insert user data into database
	// we return boolean value from this method if it return true then data will
	// inserted successfully otherwise there is problem
	public boolean saveUser(User user) {
		String sql = "INSERT INTO user(name,email,password,gender,about,RegisterDate,profile) VALUES(?,?,?,?,?,?,?)";
		boolean res = false;
		try {
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setString(1, user.getName());
			statement.setString(2, user.getEmail());
			statement.setString(3, user.getPassword());
			statement.setString(4, user.getGender());
			statement.setString(5, user.getAbout());
			statement.setString(6, user.getCurrentTime());
			statement.setString(7, user.getProfile());

			int row = statement.executeUpdate();
			res = true;

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return res;
	}

	// get user by email and password
	public User getEmailAndPassword(String email, String password) {
		User user = null;

		String sql = "SELECT * FROM user WHERE EMAIL=? AND PASSWORD = ?";
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, email);
			preparedStatement.setString(2, password);

			ResultSet set = preparedStatement.executeQuery();

			if (set.next()) {
				user = new User();
				user.setId(set.getInt("id"));
				user.setName(set.getString("name"));
				user.setEmail(set.getString("email"));
				user.setPassword(set.getString("password"));
				user.setGender(set.getString("gender"));
				user.setAbout(set.getString("about"));
				user.setCurrentTime(set.getString("RegisterDate"));
				user.setProfile(set.getString("profile"));

			}
		} catch (SQLException e) {

			e.printStackTrace();
		}

		return user;
	}
	
	public boolean updateUser(User user) {
		String sql = "Update user set name=?, email=?, password=?,gender=?,about=?,profile=? where id =?";
		boolean res = false;
		try {
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setString(1, user.getName());
			statement.setString(2, user.getEmail());
			statement.setString(3, user.getPassword());
			statement.setString(4, user.getGender());
			statement.setString(5, user.getAbout());
			statement.setString(6, user.getProfile());
			statement.setInt(7, user.getId());
			
			statement.executeUpdate();
			res = true;
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return res;
	}
	
	public User getUserByUserId(int userId) {
		User user = null;
		String sql = "select * from user where id = ?";
		try {
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setInt(1, userId);
			ResultSet set = statement.executeQuery();
			
			if(set.next()) {
				user = new User();
				user.setId(set.getInt("id"));
				user.setName(set.getString("name"));
				user.setEmail(set.getString("email"));
				user.setPassword(set.getString("password"));
				user.setGender(set.getString("gender"));
				user.setAbout(set.getString("about"));
				user.setCurrentTime(set.getString("RegisterDate"));
				user.setProfile(set.getString("profile"));
			}
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		
		return user;
	}

}
