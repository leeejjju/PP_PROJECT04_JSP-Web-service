<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="com.example.pp_project04_jspwebservice.dao.UsersDAO, com.example.pp_project04_jspwebservice.bean.UsersVO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Form</title>
</head>
<body style="justify-content: center">

<%
	UsersDAO userDAO = new UsersDAO();
	String id = request.getParameter("id");
	UsersVO u = userDAO.getUser(Integer.parseInt(id));
%>

<div style="border: 2px dotted darkolivegreen; padding: 20px; margin: 30px; width: 40%; display: block">
	<h1>Edit User</h1>
	<form action="editpost.jsp" method="post" enctype="multipart/form-data">
		<input type="hidden" name="id" value="<%=u.getPK() %>"/>
		<table>
			<tr><td>Name:</td><td><input type="text" name="name" value="<%= u.getName()%>"/></td></tr>
			<tr><td>User ID:</td><td><input type="text" name="uid" value="<%= u.getID()%>" /></td></tr>
			<tr><td>Password:</td><td><input type="text" name="pw" value="<%= u.getPW()%>"/></td></tr>
			<tr><td>E-mail:</td><td><input type="text" name="email" value="<%= u.getEMail()%>"/></td></tr>
			<tr><td>Gender: </td><td>
				Male<input type="radio" name="gender" value="Male" checked style="margin: 5px">
				Female<input type="radio" name="gender" value="Female" style="margin: 5px;">
			</td></tr>
			<tr><td>Birthday: </td><td><input type="date" name="birthday" value="<%= u.getBirthday()%>"/></td></tr>
			<tr><td>Photo:</td><td><img src="./upload/<%= u.getImg()%>" width="100"/><input type="file" name="img" value="<%= u.getImg()%>"/></td></tr>
			<tr><td colspan="2"><input type="submit" value="Edit User"/>
				<input type="button" value="Cancel" onclick="history.back()"/></td></tr>
		</table>
	</form>
</div>

</body>
</html>