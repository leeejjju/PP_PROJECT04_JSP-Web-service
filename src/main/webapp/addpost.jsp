<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.pp_project04_jspwebservice.dao.UsersDAO"%>
<%@ page import="com.example.pp_project04_jspwebservice.bean.UsersVO" %>
<%@ page import="com.example.pp_project04_jspwebservice.util.FileUpload" %>

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
//	UsersVO usr = new UsersVO();
//	usr.setName(name);
//	usr.setID(uid);
//	usr.setPW(pw);
//	usr.setEMail(email);
//	usr.setGender(gender);
//	usr.setBirthday(birthday);
//
//	if(img == null || img.equals("")) img = "null.png"; //기본프사(?)설정
//	usr.setImg(img);

	UsersDAO usersDAO = new UsersDAO();
	FileUpload uploader = new FileUpload();
	UsersVO usr = null;
	usr = uploader.uploadPhoto(request);

	//FileUpload upload = new FileUpload();
	//UsersVO u = upload.uploadPhoto(request);
	//int i = userDAO.insertUser(u);

	int i = usersDAO.insertUser(usr);

	String msg = "데이터 추가 성공 !";
	if(i == 0) msg = "[에러] 데이터 추가 실패! ";
%>

<script>
	alert('<%=msg%>');
	location.href='posts.jsp';
</script>