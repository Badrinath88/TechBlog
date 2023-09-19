package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;

import javafx.geometry.Pos;

public class PostDao {
	Connection connection;

	public PostDao(Connection connection) {
		super();
		this.connection = connection;
	}
	
	public ArrayList<Category> getAllCategories(){
		ArrayList<Category> list = new ArrayList<>();
		try {
			String sql = "SELECT *  FROM categories";
			PreparedStatement statement = connection.prepareStatement(sql);
			ResultSet set = statement.executeQuery();
			while(set.next()) {
				int cid = set.getInt("cid");
				String name = set.getString("categories_name");
				String description = set.getString("categories_description");
				
				Category category = new Category(cid, name, description);
				list.add(category);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public boolean savePost(Post post) {
		boolean res = false;
		
		String sql = "INSERT INTO post(post_titel,post_content,post_code,Post_pic,post_date,cat_id,User_id) "
				+ "VALUES(?,?,?,?,?,?,?)";
		
		try {
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setString(1, post.getPostTitle());
			statement.setString(2, post.getPostContent());
			statement.setString(3, post.getPostCode());
			statement.setString(4, post.getPostPic());
			statement.setString(5, post.getPostDate());
			statement.setInt(6, post.getCategoryId());
			statement.setInt(7, post.getUserId());
			
			statement.executeUpdate();
			
			res = true;
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		
		return res;
	}
	
	
	public ArrayList<Post> getAllPost(){
		ArrayList<Post> list = new ArrayList<>();
		
		String sql = "SELECT * FROM POST order by post_id desc";
		try {
			PreparedStatement statement = connection.prepareStatement(sql);
			ResultSet set = statement.executeQuery();
			
			while(set.next()) {
				int pid = set.getInt("post_id");
				String pTitle = set.getString("post_titel");
				String pContent = set.getString("post_content");
				String pCode = set.getString("post_code");
				String pPic = set.getString("Post_pic");
				String date = set.getString("post_date");
				int catId = set.getInt("cat_id");
				int userId = set.getInt("User_id");
				
				Post post = new Post(pid, pTitle, pContent, pCode, pPic, date, catId, userId);
				list.add(post);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
	}
	
	public List<Post> getPostByCatId(int catId){
ArrayList<Post> list = new ArrayList<>();
		
		String sql = "SELECT * FROM POST WHERE cat_id = ?";
		try {
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setInt(1, catId);
			ResultSet set = statement.executeQuery();
			
			while(set.next()) {
				int pid = set.getInt("post_id");
				String pTitle = set.getString("post_titel");
				String pContent = set.getString("post_content");
				String pCode = set.getString("post_code");
				String pPic = set.getString("Post_pic");
				String date = set.getString("post_date");
				
				int userId = set.getInt("User_id");
				
				Post post = new Post(pid, pTitle, pContent, pCode, pPic, date, catId, userId);
				list.add(post);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
	}
	
	public Post getPostById(int postId) {
		String sql = "Select * from post where post_id = ?";
		Post post = null;
		try {
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setInt(1, postId);
			ResultSet set = statement.executeQuery();
			
			if(set.next()) {
				post = new Post();
				int pid = set.getInt("post_id");
				String pTitle = set.getString("post_titel");
				String pContent = set.getString("post_content");
				String pCode = set.getString("post_code");
				String pPic = set.getString("Post_pic");
				String date = set.getString("post_date");
				int catId = set.getInt("cat_id");
				int userId = set.getInt("User_id");
				
				post = new Post(pid, pTitle, pContent, pCode, pPic, date, catId, userId);
			}
			
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		return post;
		
	}
}









