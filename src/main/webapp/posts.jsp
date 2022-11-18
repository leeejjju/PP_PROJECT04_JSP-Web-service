<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%><%@page import="com.example.pp_project04_jspwebservice.dao.UsersDAO, com.example.pp_project04_jspwebservice.bean.UsersVO,java.util.*"%><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	UsersDAO boardDAO = new UsersDAO();
	List <UsersVO> list = boardDAO.getUserList();
	request.setAttribute("list",list);
%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>user list-leeejjju</title>
	<link rel="stylesheet" href="boot.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">


	<!--
	<style>
		#list {
			font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
			border-collapse: collapse;
			width: 100%;
		}

		#list td,
		#list th {
			border: 1px solid #ddd;
			padding: 8px;
			text-align: center;
		}

		#list tr:nth-child(even) {
			background-color: #f2f2f2;
		}

		#list tr:hover {
			background-color: #ddd;
		}

		#list th {
			padding-top: 12px;
			padding-bottom: 12px;
			text-align: center;
			background-color: darkslateblue;
			color: white;
		}
	</style>
	-->

	<script>
		function delete_ok(id) {
			var a = confirm("정말로 삭제하겠습니까?");
			if (a) location.href = 'deletepost.jsp?id=' + id;
		}
	</script>
</head>

<body>
	<!--
	<table id="list" width="90%">
		<tr>
			<th>photo</th>
			<th>name</th>
			<th>ID</th>
			<th>password</th>
			<th>E-mail</th>
			<th>gender</th>
			<th>birthday</th>
			<th>edit</th>
		</tr>
		<c:forEach items="${list}" var="u">
			<tr>
				<td><img src="./upload/${u.getImg()}" width="50"></td>
				<td>${u.getName()}</td>
				<td>${u.getID()}</td>
				<td>${u.getPW()}</td>
				<td>${u.getEMail()}</td>
				<td>${u.getGender()}</td>
				<td>${u.getBirthday()}</td>
				<td>
					<a href="editform.jsp?id=${u.getPK()}">Edit</a>
					<a href="javascript:delete_ok('${u.getPK()}')">Delete</a>
				</td>
			</tr>
		</c:forEach>
	</table>
	-->

	<!--Main Table -->
	<div class="container-xl">
		<div class="table-responsive">
			<div class="table-wrapper">
				<div class="table-title">
					<div class="row">
						<div class="col-sm-6">
							<h1>Manage <b>Users</b></h1>
						</div>
						<div class="col-sm-6" id="primeButton">
							<a href="addpostform.jsp" class="btn" style="color: #5c6e56; background-color: white; height: 60px; width: 180px; font-size: 120%; font-weight: bold; text-align: center">
								Add New User
							</a>
						</div>
					</div>
				</div>

				<table id="list" class="table table-striped table-hover">
					<thead>
						<tr>
							<th>photo</th>
							<th>name</th>
							<th>ID</th>
							<th>password</th>
							<th>E-mail</th>
							<th>gender</th>
							<th>birthday</th>
							<th>edit</th>
						</tr>
					</thead>

					<c:forEach items="${list}" var="u">
						<tr>
							<td><img src="./upload/${u.getImg()}" width="50"></td>
							<td>${u.getName()}</td>
							<td>${u.getID()}</td>
							<td>${u.getPW()}</td>
							<td>${u.getEMail()}</td>
							<td>${u.getGender()}</td>
							<td>${u.getBirthday()}</td>
							<td>
								<a href="editform.jsp?id=${u.getPK()}" class="edit"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
								<a href="javascript:delete_ok('${u.getPK()}')" class="delete"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
							</td>
						</tr>
					</c:forEach>
				</table>

				<div class="clearfix">
					<ul class="pagination">

						<li class="page-item">
							<a href="#" class="page-link">Back</a>
						</li>

						<li class="page-item">
							<a href="#" class="page-link">1</a>
						</li>
						<li class="page-item">
							<a href="#" class="page-link">2</a>
						</li>
						<li class="page-item active">
							<a href="#" class="page-link">3</a>
						</li>
						<li class="page-item">
							<a href="#" class="page-link">4</a>
						</li>
						<li class="page-item">
							<a href="#" class="page-link">5</a>
						</li>
						<li class="page-item">
							<a href="#" class="page-link">Next</a>
						</li>
					</ul>
				</div>

			</div>
		</div>
	</div>


	<br />
	<a class=button" href="file.jsp">file upload test</a><br>
	<a class=button" href="indexCRUD.jsp">go to indexCRUD</a>
</body>
</html>