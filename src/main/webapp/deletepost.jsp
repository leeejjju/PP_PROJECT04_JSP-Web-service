<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.pp_project04_jspwebservice.dao.UsersDAO, com.example.pp_project04_jspwebservice.bean.UsersVO"%>
<%@ page import="com.example.pp_project04_jspwebservice.util.FileUpload" %>
<%
	String sid = request.getParameter("id");
	if (sid != ""){
		int id = Integer.parseInt(sid);
		UsersVO u = new UsersVO();
		u.setPK(id);
		UsersDAO usersDAO = new UsersDAO();

		String filename = usersDAO.getFilename(id);
		if(filename != null){
			FileUpload.deleteFile(request, filename);
		}

		usersDAO.deleteUser(u);
	}
	response.sendRedirect("posts.jsp");
%>