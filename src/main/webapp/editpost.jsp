<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.pp_project04_jspwebservice.dao.UsersDAO"%>
<%@ page import="com.example.pp_project04_jspwebservice.bean.UsersVO" %>
<%@ page import="java.lang.reflect.Field" %>
<%@ page import="com.example.pp_project04_jspwebservice.util.FileUpload" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>

<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="u" class="com.example.pp_project04_jspwebservice.bean.UsersVO" />
<jsp:setProperty property="*" name="u"/>

<%

//	String name = request.getParameter("name");
//	String uid = request.getParameter("uid");
//	String pw = request.getParameter("pw");
//	String email = request.getParameter("email");
//	String gender = request.getParameter("gender");
//	String birthday = request.getParameter("birthday");
//	String img = request.getParameter("img");
//
//	int id = Integer.parseInt(request.getParameter("id"));



	FileUpload uploader = new FileUpload();
	UsersDAO usersDAO = new UsersDAO();
	UsersVO usr = null;

//	usr = usersDAO.getUser(id);
	usr = uploader.uploadPhoto(request);

	/*
	System.out.println("with "+ usr.getName()+"input img is " + img);
	if(img == null || img.equals("")) img = usr.getImg();
	System.out.println("edited img is " + img);
	*/


//	usr.setName(name);
//	usr.setID(uid);
//	usr.setPW(pw);
//	usr.setEMail(email);
//	usr.setGender(gender);
//	usr.setBirthday(birthday);
//	usr.setImg(img);
//	usr.setPK(id);


	int i = usersDAO.updateUser(usr);
	//int i=userDAO.updateUser(u);

	String msg = "데이터 수정 성공 !";
	if(i == 0) msg = "[에러] 데이터 수정 실패! ";

	response.sendRedirect("posts.jsp");
%>

<script>
	alert('<%=msg%>');
	location.href='posts.jsp';
</script>