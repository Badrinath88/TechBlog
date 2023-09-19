
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.helper.DatabaseConnection"%>
<%@page import="com.tech.blog.dao.PostDao"%>

<div class="row ml-2 text-center">
	<% 
	PostDao postDao = new PostDao(DatabaseConnection.getConnection());
	int cId = Integer.parseInt(request.getParameter("cid"));
	List<Post> list = null;
	if(cId==0){
	 	list = postDao.getAllPost();
	}else{
		list = postDao.getPostByCatId(cId);
	}
	
	if(list.size() == 0){
		out.println("<h3 class='display-3 text center'>No post in this category..</h3>");
		return;
	}
	
	
	for(Post p : list){
		%>
		<div class="col-md-6 mt-2">
			<div class="card">
			<img class="card-img-top" src="Blog_pics/<%= p.getPostPic()%>" alt="Card image cap">
				<div class="card-body">
					<b><%= p.getPostTitle() %></b>
					<p><%= p.getPostContent() %></p>
					<pre><%= p.getPostCode() %></pre>
					<p>Date of post : <%= p.getPostDate() %></p>
				</div>
				
				<div class="card-footer primary-background text-center">
					<a href="showBlog_08.jsp?post_id=<%=p.getPostId() %>
					" class="btn btn-outline-light btn-sm">Read More...</a>
					
					<a href="#" class="btn btn-outline-light btn-sm">
						<i class="fa fa-thumbs-o-up"> <span>10</span> </i>
					</a>
					
					<a href="#" class="btn btn-outline-light btn-sm">
						<i class="fa fa-commenting-o"> <span>20</span></i>
					</a>
				</div>
			</div>
		</div>
		<%
	}
	%>

</div>